package app.noam.patches.chesscom.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
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
private fun findMethodOrNull(predicate: (ClassDef, Method) -> Boolean): Pair<ClassDef, Method>? {
    val found = mutableListOf<Pair<ClassDef, Method>>()
    context.classDefForEach { classDef ->
        classDef.methods.forEach { method -> if (predicate(classDef, method)) found += classDef to method }
    }
    return found.singleOrNull()
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
        val settingsBuilder = findMethodOrNull { _, method ->
            method.returnType == "Ljava/util/List;" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == rowType
                } == true
        }
        if (settingsBuilder != null) {
            mutableClassDefBy(settingsBuilder.first).methods.first {
                it.name == settingsBuilder.second.name && it.parameterTypes == settingsBuilder.second.parameterTypes &&
                    it.returnType == settingsBuilder.second.returnType
            }.apply {
                val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
                if (returnIndex < 0) throw PatchException("The settings list builder has no return")
                val list = getInstruction<OneRegisterInstruction>(returnIndex).registerA
                addInstructions(returnIndex, "invoke-static { v$list }, $PREMIUM->filterSettingsRows(Ljava/util/List;)V")
            }
        } else {
            // 4.10.23 builds the settings rows in a constructor and keeps them in List fields.
            val builder = findMethodOrNull { classDef, method ->
                method.name == "<init>" && method.implementation?.instructions?.any {
                    it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == rowType
                } == true && classDef.fields.any { it.type == "Ljava/util/List;" }
            } ?: throw PatchException("The settings list builder was not found")
            val constructor = mutableClassDefBy(builder.first).methods.single {
                it.name == "<init>" && it.parameterTypes == builder.second.parameterTypes
            }
            // Only the list fields this constructor actually writes, and never a static one.
            val written = constructor.implementation!!.instructions.mapNotNull {
                ((it as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference)
                    ?.takeIf { field -> field.definingClass == builder.first.type }?.name
            }.toSet()
            val listFields = builder.first.fields.filter { field ->
                (field.type == "Ljava/util/List;" || field.type == "Ljava/util/ArrayList;") &&
                    !com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(field.accessFlags) &&
                    field.name in written
            }
            if (listFields.isEmpty()) throw PatchException("The settings list fields were not found")
            // The constructor's `this` sits above v15, and iget-object (22c) only addresses
            // v0-v15; smali silently drops such an access. Copy it into v0 first.
            val self = constructor.implementation!!.registerCount - constructor.parameterTypes.size - 1
            // The rows live in immutable lists, and the adapter also copies them into a combined
            // ArrayList during construction. Replace each field with a mutable copy
            // (the constructor may write its own final fields) and filter that.
            val filter = listFields.joinToString("\n") { field ->
                val cast = if (field.type == "Ljava/util/ArrayList;") "check-cast v2, Ljava/util/ArrayList;\n" else ""
                """
                    move-object/from16 v0, v$self
                    iget-object v1, v0, ${builder.first.type}->${field.name}:${field.type}
                    invoke-static { v1 }, $PREMIUM->copyFilteredSettingsRows(Ljava/util/List;)Ljava/util/List;
                    move-result-object v2
                    $cast
                    iput-object v2, v0, ${builder.first.type}->${field.name}:${field.type}
                """
            }
            constructor.apply {
                instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.reversed()
                    .forEach { addInstructions(it, filter) }
            }
        }

        // Home: HomePlayAdapter.setPremiumOffer(offer, animate). 4.10.23 removed the older Home.
        findMethodOrNull { classDef, method ->
            classDef.type == "Lcom/chess/home/play/HomePlayAdapter;" &&
                method.returnType == "V" && method.parameterTypes.map { it.toString() } == listOf(offerType, "Z")
        }?.let { (classDef, method) ->
            mutableClassDefBy(classDef).methods.first {
                it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == "V"
            }.nullOffer(0, "p1", offerType)
        }

        // More: buildMenu(int, int, boolean, boolean, offer, continuation). Gone in 4.10.23.
        findMethodOrNull { classDef, method ->
            classDef.type.startsWith("Lcom/chess/home/more/") && method.implementation != null &&
                method.parameterTypes.map { it.toString() }.let {
                    it.size == 6 && it.take(5) == listOf("I", "I", "Z", "Z", offerType)
                }
        }?.let { (classDef, method) ->
            mutableClassDefBy(classDef).methods.first {
                it.name == method.name && it.parameterTypes == method.parameterTypes
            }.nullOffer(0, "p5", offerType)
        }

        // 4.10.23: the More screen draws a fixed "Try Premium" banner from
        // com.chess.home.premium.c; skip drawing it.
        mutableClassDefByOrNull("Lcom/chess/home/premium/c;")?.methods
            ?.filter { method ->
                method.name == "b" && method.returnType == "V" &&
                    method.parameterTypes.map(CharSequence::toString) == listOf(
                        "Lkotlin/jvm/functions/Function0;", "Landroidx/compose/ui/b;", "Z",
                        "Lkotlin/jvm/functions/Function0;", "Landroidx/compose/runtime/a;", "I",
                    )
            }
            ?.forEach { method ->
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static { }, $PREMIUM->hideBanner()Z
                        move-result v0
                        if-eqz v0, :morphe_banner
                        return-void
                    """,
                    ExternalLabel("morphe_banner", method.getInstruction(0)),
                )
            }

        // Home toolbar: the placement collector; null = no Premium icon (what members get).
        // 4.10.23 dropped the icon.
        ToolbarPremiumIconFingerprint.matchOrNull()?.method?.apply {
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
            // 4.10.18 has one boolean; 4.10.23 adds shouldShowLogo after the diamond, so the
            // diamond is still the first boolean parameter.
            val diamond = parameterTypes.indexOfFirst { it.toString() == "Z" }
            if (diamond < 0) throw PatchException("Unexpected Home toolbar state")
            addInstructions(
                0,
                """
                    invoke-static/range { p${diamond + 1} .. p${diamond + 1} }, $PREMIUM->showDiamond(Z)Z
                    move-result p${diamond + 1}
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
