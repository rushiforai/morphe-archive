package app.noam.patches.chesscom.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.noam.patches.chesscom.home.HomeContentToStringFingerprint
import app.noam.patches.chesscom.misc.settings.MoreMenuStateToStringFingerprint
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.indexOfFirstOrThrow
import app.noam.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PREMIUM = "${Constants.EXTENSION_PACKAGE}/premium/Premium;"

context(context: BytecodePatchContext)
private fun findMethod(description: String, predicate: (ClassDef, Method) -> Boolean): MutableMethod {
    val found = mutableListOf<Pair<ClassDef, Method>>()
    context.classDefForEach { classDef ->
        classDef.methods.forEach { method -> if (predicate(classDef, method)) found += classDef to method }
    }
    val (classDef, method) = found.singleOrNull()
        ?: throw PatchException("Expected one $description, found ${found.size}")
    return context.mutableClassDefBy(classDef).methods.first {
        it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
    }
}

/**
 * Replaces register [register] (a parameter or local) with Premium.offer(it), keeping its type.
 * The range form reaches registers above v15 (large methods keep their parameters up there).
 */
private fun MutableMethod.nullOffer(index: Int, register: String, offerType: String) = addInstructions(
    index,
    """
        invoke-static/range { $register .. $register }, $PREMIUM->offer(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object $register
        check-cast $register, $offerType
    """,
)

@Suppress("unused")
val hidePremiumPatch = bytecodePatch(
    name = "Hide Premium-only content",
    description = "Free accounts no longer see what only Premium members can use: Premium-only " +
        "bots are not listed, and the Premium toolbar button, the Home and More banners and the " +
        "Settings Upgrade row, the Home diamond, the sale banner and More's Membership row are " +
        "gone. Nothing is unlocked.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("hidePremiumPatched")

        val offerType = SaleOfferToStringFingerprint.originalClassDef.superclass
            ?: throw PatchException("The premium offer type was not found")

        // Settings: the Upgrade row leaves the list the only row-building method returns.
        val rowType = SettingsRowToStringFingerprint.originalClassDef.type
        findMethod("settings list builder") { _, method ->
            method.returnType == "Ljava/util/List;" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == rowType
                } == true
        }.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (returnIndex < 0) throw PatchException("The settings list builder has no return")
            val list = getInstruction<OneRegisterInstruction>(returnIndex).registerA
            addInstructions(returnIndex, "invoke-static { v$list }, $PREMIUM->filterSettingsRows(Ljava/util/List;)V")
        }

        // Home: HomePlayAdapter.setPremiumOffer(offer, animate).
        findMethod("Home premium card setter") { classDef, method ->
            classDef.type == "Lcom/chess/home/play/HomePlayAdapter;" &&
                method.returnType == "V" && method.parameterTypes.map { it.toString() } == listOf(offerType, "Z")
        }.nullOffer(0, "p1", offerType)

        // More: buildMenu(int, int, boolean, boolean, offer, continuation).
        findMethod("More menu builder") { classDef, method ->
            classDef.type.startsWith("Lcom/chess/home/more/") && method.implementation != null &&
                method.parameterTypes.map { it.toString() }.let {
                    it.size == 6 && it.take(5) == listOf("I", "I", "Z", "Z", offerType)
                }
        }.nullOffer(0, "p5", offerType)

        // Home toolbar: the placement collector; null = no Premium icon (what members get).
        ToolbarPremiumIconFingerprint.method.apply {
            val castIndex = indexOfFirstOrThrow(description = "the icon placement") {
                it.opcode == Opcode.CHECK_CAST &&
                    ((it as ReferenceInstruction).reference as TypeReference).type.endsWith("\$ToolbarPremiumIconPlacement;")
            }
            val placementRegister = getInstruction<OneRegisterInstruction>(castIndex).registerA
            val placementType = (getInstruction<ReferenceInstruction>(castIndex).reference as TypeReference).type
            addInstructions(
                castIndex + 1,
                """
                    invoke-static { v$placementRegister }, $PREMIUM->toolbarIcon(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$placementRegister
                    check-cast v$placementRegister, $placementType
                """,
            )
        }

        // Bots: the bot groups loader drops Premium-only bots, then groups left empty.
        val groupType = BotGroupToStringFingerprint.originalClassDef.type
        findMethod("bot groups loader") { classDef, method ->
            classDef.type.startsWith("Lcom/chess/features/versusbots/groups/BotsGroupsLoaderImpl") &&
                method.name == "emit" &&
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((it as ReferenceInstruction).reference as MethodReference).name == "getBot_personalities"
                } == true
        }.apply {
            // Bottom-up: 1) group add -> addBotGroup(groups, group, bots).
            val constructorIndex = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_DIRECT &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.definingClass == groupType && ref.name == "<init>"
                    }
            }
            if (constructorIndex < 0) throw PatchException("The bot group constructor call was not found")
            val constructor = getInstruction<FiveRegisterInstruction>(constructorIndex)
            val addIndex = constructorIndex + 1
            val add = getInstruction<FiveRegisterInstruction>(addIndex)
            val addReference = (getInstruction<ReferenceInstruction>(addIndex).reference as MethodReference)
            if (addReference.name != "add" || add.registerD != constructor.registerC) {
                throw PatchException("Unexpected bot group insertion: $addReference")
            }
            // <init>(this, uuid, name, bots, event): bots is the fourth register.
            val bots = constructor.registerF
            if (listOf(add.registerC, add.registerD, bots).any { it > 15 }) {
                throw PatchException("Bot group registers out of range")
            }
            replaceInstruction(
                addIndex,
                "invoke-static { v${add.registerC}, v${add.registerD}, v$bots }, " +
                    "$PREMIUM->addBotGroup(Ljava/util/Collection;Ljava/lang/Object;Ljava/util/List;)V",
            )

            // 2) personalities -> playableBots(personalities), at every read in this method.
            instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).name == "getBot_personalities"
            }.map { it.index }.reversed().forEach { index ->
                if (getInstruction(index + 1).opcode != Opcode.MOVE_RESULT_OBJECT) return@forEach
                val register = getInstruction<OneRegisterInstruction>(index + 1).registerA
                addInstructions(
                    index + 2,
                    """
                        invoke-static/range { v$register .. v$register }, $PREMIUM->playableBots(Ljava/util/List;)Ljava/util/List;
                        move-result-object v$register
                    """,
                )
            }
        }

        // The redesigned Home: no diamond in its toolbar (LoggedIn(avatar, streak, friend
        // requests, connection, shouldShowDiamond, ...)) and no sale banner in its content.
        mutableClassDefBy(HomeToolbarStateToStringFingerprint.originalClassDef).methods.single {
            it.name == "<init>" && it.parameterTypes.size == 8
        }.apply {
            if (parameterTypes[4].toString() != "Z") throw PatchException("Unexpected Home toolbar state")
            addInstructions(
                0,
                """
                    invoke-static/range { p5 .. p5 }, $PREMIUM->showDiamond(Z)Z
                    move-result p5
                """,
            )
        }
        mutableClassDefBy(HomeContentToStringFingerprint.originalClassDef).methods
            .filter { it.name == "<init>" }.maxByOrNull { it.parameterTypes.size }!!.apply {
                val offer = parameterTypes.indexOfFirst { it.toString() == "Lcom/chess/features/paywall/Offer;" }
                if (offer < 0) throw PatchException("The Home sale banner was not found")
                nullOffer(0, "p${offer + 1}", "Lcom/chess/features/paywall/Offer;")
            }

        // More: no Membership row.
        mutableClassDefBy(MoreMenuStateToStringFingerprint.originalClassDef).methods.single {
            it.name == "<init>" && it.parameterTypes.firstOrNull()?.toString() == "Ljava/util/List;"
        }.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $PREMIUM->moreItems(Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """,
        )
    }
}
