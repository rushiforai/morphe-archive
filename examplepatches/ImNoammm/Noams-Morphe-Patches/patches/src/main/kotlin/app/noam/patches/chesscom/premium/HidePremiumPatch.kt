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
import app.noam.patches.chesscom.shared.fieldForLabel
import app.noam.patches.chesscom.shared.fieldReference
import app.noam.patches.chesscom.shared.filterStores
import app.noam.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PREMIUM = "${Constants.EXTENSION_PACKAGE}/premium/Premium;"

/** Where the method casts one of its (object) parameters to the premium offer type, or -1. */
private fun Method.offerCast(offerType: String): Int {
    val code = implementation?.instructions?.toList() ?: return -1
    val firstParameter = implementation!!.registerCount - parameterTypes.size
    return code.indexOfFirst {
        it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == offerType &&
            (it as OneRegisterInstruction).registerA >= firstParameter
    }
}

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
        "bots are not listed, and the Home diamond and sale banner, the More banner and Membership " +
        "row and the Settings Upgrade row are gone. Nothing is unlocked.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("hidePremiumPatched")

        // The premium banner: one of its offers (Sale or WinbackSpringSale, what Home's sale banner
        // shows) or a plain upsell. More's banner is made from either.
        val offerBannerType = WinbackBannerToStringFingerprint.originalClassDef.interfaces.single()
        val bannerType = classDefBy(offerBannerType).interfaces.single()

        // Settings: the Upgrade row leaves the rows list the settings adapter builds, before its
        // constructor stores it.
        val rowType = SettingsRowToStringFingerprint.originalClassDef.type
        fun Method.buildsRows() = implementation?.instructions?.any {
            it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == rowType
        } == true
        fun Instruction.storesRows(owner: String) = opcode == Opcode.IPUT_OBJECT &&
            fieldReference?.let { it.definingClass == owner && it.type == "Ljava/util/ArrayList;" } == true
        findMethod("settings list builder") { classDef, method ->
            method.buildsRows() && method.implementation!!.instructions.any { it.storesRows(classDef.type) }
        }.apply {
            val store = instructions.indexOfLast { it.storesRows(definingClass) }
            val list = getInstruction<TwoRegisterInstruction>(store).registerA
            addInstructions(store, "invoke-static/range { v$list .. v$list }, $PREMIUM->filterSettingsRows(Ljava/util/List;)V")
        }

        // More: the menu's builder (combining the account, counts and the banner) gets no banner.
        findMethod("More menu builder") { classDef, method ->
            classDef.type.startsWith("Lcom/chess/home/more/") && method.parameterTypes.size == 6 &&
                method.offerCast(bannerType) >= 0
        }.apply {
            val cast = offerCast(bannerType)
            nullOffer(cast + 1, "v${getInstruction<OneRegisterInstruction>(cast).registerA}", bannerType)
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

        // Home: no diamond in its toolbar and no sale banner in its content.
        mutableClassDefBy(HomeToolbarStateToStringFingerprint.originalClassDef).apply {
            filterStores(fieldForLabel(", shouldShowPaywallIcon=", "Z"), "$PREMIUM->showDiamond(Z)Z")
        }
        mutableClassDefBy(HomeContentToStringFingerprint.originalClassDef).methods.filter { constructor ->
            constructor.name == "<init>" && constructor.parameterTypes.any { it.toString() == offerBannerType }
        }.single().apply {
            val offer = parameterTypes.indexOfFirst { it.toString() == offerBannerType }
            nullOffer(0, "p${offer + 1}", offerBannerType)
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
