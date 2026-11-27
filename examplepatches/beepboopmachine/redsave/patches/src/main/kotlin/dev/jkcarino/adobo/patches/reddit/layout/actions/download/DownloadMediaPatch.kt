package dev.jkcarino.adobo.patches.reddit.layout.actions.download

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jkcarino.adobo.patches.reddit.shared.COMPATIBILITY_REDDIT

private fun MutableMethod.parameterRegisterCount(): Int {
    var count = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    for (p in parameterTypes) {
        val desc = p.toString()
        count += if (desc == "J" || desc == "D") 2 else 1
    }
    return count
}

private fun MutableMethod.localRegisterCount(): Int {
    val impl = implementation ?: return 0
    return (impl.registerCount - parameterRegisterCount()).coerceAtLeast(0)
}

private fun MutableMethod.paramRegisterSlot(javaParamIndex: Int): Int {
    var slot = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    for (i in 0 until javaParamIndex) {
        val desc = parameterTypes[i].toString()
        slot += if (desc == "J" || desc == "D") 2 else 1
    }
    return slot
}

/**
 * Inserts [hookLines] BEFORE [index] while preserving all dexlib2 branch labels (:cond_X, :goto_X)
 * that target [index]. Uses a fresh [origSmali] string instead of re-adding an attached BuilderInstruction,
 * and safely handles index == instructions.lastIndex via the no-index addInstructions overload.
 */
private fun MutableMethod.insertBeforePreservingLabels(
    index: Int,
    origSmali: String,
    hookLines: List<String>
) {
    require(hookLines.isNotEmpty())
    val isLast = index == instructions.lastIndex
    replaceInstruction(index, hookLines.first())
    val tailLines = hookLines.drop(1) + origSmali
    if (isLast) {
        for (line in tailLines) {
            addInstruction(line)
        }
    } else {
        addInstructions(index + 1, tailLines.joinToString("\n"))
    }
}

private fun matchesActionBarRenderCall(
    ref: MethodReference?,
    actionBarClassType: String,
    expectedObjectArgs: Int,
    expectedIntArgs: Int
): Boolean {
    if (ref == null) return false
    if (ref.definingClass != actionBarClassType) return false
    if (ref.returnType != "V") return false
    val params = ref.parameterTypes
    if (params.size != expectedObjectArgs + expectedIntArgs) return false
    for (i in 0 until expectedObjectArgs) {
        val d = params[i].toString()
        if (!d.startsWith("L") && !d.startsWith("[")) return false
    }
    for (i in expectedObjectArgs until params.size) {
        if (params[i].toString() != "I") return false
    }
    return true
}

private const val ACTION_BAR_SCAN_WINDOW = 120

private fun MutableMethod.hookActionBarRow(
    groupKey: Int,
    actionBarClassType: String,
    expectedObjectArgs: Int,
    expectedIntArgs: Int,
    extensionMethod: String,
    extensionSignature: String
) {
    val shareGroupIndex = instructions.indexOfFirst {
        (it as? WideLiteralInstruction)?.wideLiteral == groupKey.toLong() ||
            (it as? NarrowLiteralInstruction)?.narrowLiteral == groupKey
    }
    if (shareGroupIndex == -1) {
        throw IllegalStateException("Could not find Compose Share group key $groupKey in $definingClass->$name")
    }

    val expectedRegCount = expectedObjectArgs + expectedIntArgs
    val scanEnd = minOf(shareGroupIndex + ACTION_BAR_SCAN_WINDOW, instructions.size)
    // Pick the first verified ActionBar render call immediately following the Share Compose group key.
    // Subsequent buttons in the same row (e.g. Awards/Overflow) may also appear within the window.
    val callIndex = (shareGroupIndex until scanEnd).firstOrNull { idx ->
        val inst = instructions[idx]
        if (inst.opcode != Opcode.INVOKE_STATIC_RANGE) return@firstOrNull false
        val range = inst as? RegisterRangeInstruction ?: return@firstOrNull false
        if (range.registerCount != expectedRegCount) return@firstOrNull false
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        matchesActionBarRenderCall(ref, actionBarClassType, expectedObjectArgs, expectedIntArgs)
    } ?: throw IllegalStateException(
        "Could not find verified $expectedRegCount-register ActionBar render call within $ACTION_BAR_SCAN_WINDOW instructions after group $groupKey in $definingClass->$name"
    )

    val call = instructions[callIndex] as RegisterRangeInstruction
    val ref = (instructions[callIndex] as ReferenceInstruction).reference as MethodReference
    val startReg = call.startRegister
    val endReg = startReg + expectedRegCount - 1
    val origSmali =
        "invoke-static/range {v$startReg .. v$endReg}, ${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}"

    insertBeforePreservingLabels(
        index = callIndex,
        origSmali = origSmali,
        hookLines = listOf(
            "invoke-static/range {v$startReg .. v$endReg}, $EXTENSION_CLASS_DESCRIPTOR->$extensionMethod$extensionSignature"
        )
    )
}

@Suppress("unused")
val downloadMediaPatch = patch(
    name = "Download media",
    description = "Adds a native-styled download pill between Repost and Share in the feed action bar, and overrides native media download."
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    extendWith("extensions/reddit/frontpage.mpe")

    execute {
        val actionBarClassType = ActionBarClassFingerprint.classDef.type

        // 1. Data binding: Hook so30.b to associate post presentation model (zj60) with action bar model (ro30 / qo30)
        PostActionBarModelFingerprint.method.apply {
            val locals = localRegisterCount()
            val p1Abs = locals + 1
            val returnIndices = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_OBJECT }
            require(returnIndices.isNotEmpty()) { "No return-object instructions found in $definingClass->$name" }

            for (retIdx in returnIndices.asReversed()) {
                val returnRegister = (instructions[retIdx] as OneRegisterInstruction).registerA
                val hookLines = if (returnRegister < 16 && p1Abs < 16) {
                    listOf(
                        "invoke-static {v$returnRegister, p1}, $EXTENSION_CLASS_DESCRIPTOR->registerPost(Ljava/lang/Object;Ljava/lang/Object;)V"
                    )
                } else {
                    require(locals >= 2) { "Insufficient local registers ($locals) to marshal high register in $definingClass->$name" }
                    val lines = mutableListOf(
                        "move-object/from16 v0, v$returnRegister",
                        "move-object/from16 v1, p1",
                        "invoke-static/range {v0 .. v1}, $EXTENSION_CLASS_DESCRIPTOR->registerPost(Ljava/lang/Object;Ljava/lang/Object;)V"
                    )
                    if (returnRegister == 1) {
                        lines.add("move-object/from16 v1, v0")
                    }
                    lines
                }
                insertBeforePreservingLabels(
                    index = retIdx,
                    origSmali = "return-object v$returnRegister",
                    hookLines = hookLines
                )
            }
        }

        // 2. Action Bar Model Dispatcher: Hook ttd0.a to track current post action bar
        PostActionBarDispatchFingerprint.method.apply {
            addInstructions(
                index = 0,
                smaliInstructions = """
                    invoke-static/range {p0 .. p0}, $EXTENSION_CLASS_DESCRIPTOR->onPostActionBar(Ljava/lang/Object;)V
                """
            )
        }

        // 3. Hook A: Classic Action Bar Row Layout (h30.f) - Render Download Pill before Share
        ActionBarClassicRowFingerprint.method.hookActionBarRow(
            groupKey = SHARE_GROUP_CLASSIC,
            actionBarClassType = actionBarClassType,
            expectedObjectArgs = 7,
            expectedIntArgs = 1,
            extensionMethod = "renderDownloadPillB",
            extensionSignature = "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V"
        )

        // 4. Hook A: Plain Action Bar Row Layout (h30.d) - Render Download Pill before Share
        ActionBarPlainRowFingerprint.method.hookActionBarRow(
            groupKey = SHARE_GROUP_PLAIN,
            actionBarClassType = actionBarClassType,
            expectedObjectArgs = 7,
            expectedIntArgs = 1,
            extensionMethod = "renderDownloadPillB",
            extensionSignature = "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V"
        )

        // 5. Hook A: Refresh Action Bar Row Layout (h30.q) - Render Download Pill before Share
        ActionBarRefreshRowFingerprint.method.hookActionBarRow(
            groupKey = SHARE_GROUP_REFRESH,
            actionBarClassType = actionBarClassType,
            expectedObjectArgs = 8,
            expectedIntArgs = 2,
            extensionMethod = "renderDownloadPillC",
            extensionSignature = "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V"
        )

        // 6. Hook B: Override Native Lightbox Download Action (LightboxScreen.M5) with fallback
        LightboxDownloadFingerprint.method.apply {
            val locals = localRegisterCount()
            require(locals >= 1) { "LightboxDownloadFingerprint method has .locals $locals; need >= 1" }
            addInstructions(
                index = 0,
                smaliInstructions = """
                    invoke-static/range {p0 .. p0}, $EXTENSION_CLASS_DESCRIPTOR->onNativeDownload(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :morphe_lightbox_continue
                    return-void
                    :morphe_lightbox_continue
                    nop
                """
            )
        }

        // 7. Hook B: Override Native Video/GIF Download Action (VideoPlayerScreen.N5) with fallback
        VideoPlayerDownloadFingerprint.method.apply {
            val locals = localRegisterCount()
            require(locals >= 1) { "VideoPlayerDownloadFingerprint method has .locals $locals; need >= 1" }
            addInstructions(
                index = 0,
                smaliInstructions = """
                    invoke-static/range {p0 .. p0}, $EXTENSION_CLASS_DESCRIPTOR->onNativeDownload(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :morphe_video_continue
                    return-void
                    :morphe_video_continue
                    nop
                """
            )
        }

        // 8. Hook B: Override Native SaveMediaScreen download execution (SaveMediaScreen.o5) with fallback
        SaveMediaDownloadFingerprint.method.apply {
            val locals = localRegisterCount()
            val linkSlot = paramRegisterSlot(2) // instance method: p0=this, p1=uri(String), p2=Z, p3=Link
            val linkAbs = locals + linkSlot
            val invokeBlock = if (linkAbs < 16) {
                require(locals >= 1) { "SaveMediaDownloadFingerprint method has .locals $locals; need >= 1" }
                """
                    invoke-static {p0, p1, p$linkSlot}, $EXTENSION_CLASS_DESCRIPTOR->onSaveMedia(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z
                """
            } else {
                require(locals >= 3) { "SaveMediaDownloadFingerprint method has .locals $locals; need >= 3 for high param slot $linkAbs" }
                """
                    move-object/from16 v0, p0
                    move-object/from16 v1, p1
                    move-object/from16 v2, p$linkSlot
                    invoke-static/range {v0 .. v2}, $EXTENSION_CLASS_DESCRIPTOR->onSaveMedia(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z
                """
            }
            addInstructions(
                index = 0,
                smaliInstructions = """
                    $invokeBlock
                    move-result v0
                    if-eqz v0, :morphe_savemedia_continue
                    return-void
                    :morphe_savemedia_continue
                    nop
                """
            )
        }

        // 9. Hook C: Setup Long-Click on Lightbox Toolbar Download Button (LightboxScreen.G4)
        LightboxToolbarFingerprint.method.apply {
            val returnIndices = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }
            require(returnIndices.isNotEmpty()) { "No return-void instructions found in $definingClass->$name" }
            for (retIdx in returnIndices.asReversed()) {
                insertBeforePreservingLabels(
                    index = retIdx,
                    origSmali = "return-void",
                    hookLines = listOf(
                        "invoke-static/range {p0 .. p1}, $EXTENSION_CLASS_DESCRIPTOR->hookLightboxToolbar(Ljava/lang/Object;Ljava/lang/Object;)V"
                    )
                )
            }
        }

        // 10. Hook C: Setup Long-Click on VideoPlayer Toolbar Download Button (VideoPlayerScreen.G4)
        VideoPlayerToolbarFingerprint.method.apply {
            val returnIndices = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }
            require(returnIndices.isNotEmpty()) { "No return-void instructions found in $definingClass->$name" }
            for (retIdx in returnIndices.asReversed()) {
                insertBeforePreservingLabels(
                    index = retIdx,
                    origSmali = "return-void",
                    hookLines = listOf(
                        "invoke-static/range {p0 .. p1}, $EXTENSION_CLASS_DESCRIPTOR->hookLightboxToolbar(Ljava/lang/Object;Ljava/lang/Object;)V"
                    )
                )
            }
        }

        // 11. Home Feed ActionBar Dispatcher: Hook m5s0.c to bind shareM20 (param 3) -> Link via to30 (param 0)
        // Computes exact Dalvik parameter slot dynamically (accounts for wide J/D params).
        FeedActionBarDispatchFingerprint.method.apply {
            val locals = localRegisterCount()
            val shareSlot = paramRegisterSlot(3)
            val shareAbs = locals + shareSlot
            val smali = if (shareAbs < 16) {
                """
                    invoke-static {p0, p$shareSlot}, $EXTENSION_CLASS_DESCRIPTOR->onFeedActionBar(Ljava/lang/Object;Ljava/lang/Object;)V
                """
            } else {
                require(locals >= 2) { "Insufficient locals ($locals) in $definingClass->$name" }
                """
                    move-object/from16 v0, p0
                    move-object/from16 v1, p$shareSlot
                    invoke-static/range {v0 .. v1}, $EXTENSION_CLASS_DESCRIPTOR->onFeedActionBar(Ljava/lang/Object;Ljava/lang/Object;)V
                """
            }
            addInstructions(index = 0, smaliInstructions = smali)
        }

        // 13. Override Full Bleed Player (FBP) Native Download Event Handler (com.reddit.fullbleedplayer.data.events.c.a)
        // Resolves kotlin.Unit singleton field dynamically from the target method's own sget-object (throws if missing).
        FbpDownloadEventHandlerFingerprint.method.apply {
            val locals = localRegisterCount()
            if (locals < 1) {
                throw IllegalStateException("FbpDownloadEventHandlerFingerprint method has .locals 0; cannot safely use v0")
            }
            val unitFieldName = instructions.firstNotNullOfOrNull { inst ->
                if (inst.opcode == Opcode.SGET_OBJECT) {
                    val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference
                    if (ref != null && ref.definingClass == "Lkotlin/Unit;" && ref.type == "Lkotlin/Unit;") {
                        ref.name
                    } else null
                } else null
            } ?: throw IllegalStateException("Could not resolve Lkotlin/Unit; singleton field name")

            addInstructions(
                index = 0,
                smaliInstructions = """
                    invoke-static/range {p1 .. p1}, $EXTENSION_CLASS_DESCRIPTOR->onFbpDownloadEvent(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :continue_fbp
                    sget-object v0, Lkotlin/Unit;->$unitFieldName:Lkotlin/Unit;
                    return-object v0
                    :continue_fbp
                    nop
                """
            )
        }

        // 14. Global Link Registration: Index EVERY constructed com.reddit.domain.model.Link by post ID (t3_...)
        LinkPrimaryConstructorFingerprint.method.apply {
            val returnIndices = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }
            require(returnIndices.isNotEmpty()) { "No return-void instructions found in $definingClass->$name" }
            for (retIdx in returnIndices.asReversed()) {
                insertBeforePreservingLabels(
                    index = retIdx,
                    origSmali = "return-void",
                    hookLines = listOf(
                        "invoke-static/range {p0 .. p0}, $EXTENSION_CLASS_DESCRIPTOR->registerLink(Ljava/lang/Object;)V"
                    )
                )
            }
        }

        // 15. Home Feed Element Registration: Index every mtj feed element (image, gallery, video, etc.) by linkId (t3_...)
        FeedElementConstructorFingerprint.method.apply {
            val returnIndices = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }
            require(returnIndices.isNotEmpty()) { "No return-void instructions found in $definingClass->$name" }
            for (retIdx in returnIndices.asReversed()) {
                insertBeforePreservingLabels(
                    index = retIdx,
                    origSmali = "return-void",
                    hookLines = listOf(
                        "invoke-static/range {p0 .. p1}, $EXTENSION_CLASS_DESCRIPTOR->registerFeedElement(Ljava/lang/Object;Ljava/lang/String;)V"
                    )
                )
            }
        }
    }
}
