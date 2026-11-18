package app.template.patches.instagram.scroll

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi.ARM64_V8A
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private fun checkShape(value: Boolean, message: String) {
    if (!value) throw PatchException("Keep DM scroll position: $message")
}

@Suppress("unused")
val keepDmScrollPositionPatch = bytecodePatch(
    name = "Keep DM scroll position",
    description = "Prevents Instagram Direct from jumping to the newest message after replying to an older message. Requires Piko Add settings in the same patching run.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Instagram",
        packageName = "com.instagram.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFC483C,
        targets = listOf(AppTarget(
            version = "447.0.0.55.81",
            versionCodes = mapOf(ARM64_V8A to 385311895),
            isExperimental = true,
        ), AppTarget(
            version = "439.0.0.37.89",
            versionCodes = mapOf(ARM64_V8A to 384510827),
            isExperimental = true,
        )),
    ))
    dependsOn(keepDmScrollPositionResources)
    extendWith("extensions/instagram.mpe")

    execute {
        val senderCallbacks = DirectTextSendFingerprint.method.calls().filter {
            it.returnType == "V" && it.parameterTypes.size == 4 && it.parameterTypes.last() == "I"
        }
        val completedFingerprint = DirectSendCompletedFingerprint(senderCallbacks)
        checkShape(completedFingerprint.matchAll().size == 1,
            "expected exactly one send-completed callback with a delayed scroll")
        val completed = completedFingerprint.method
        val callback = senderCallbacks.filter {
            it.name == completed.name && it.returnType == "V" &&
                it.parameterTypes == completed.parameterTypes
        }.distinctBy { it.toString() }.single()
        checkShape(callback.definingClass in completedFingerprint.classDef.interfaces,
            "the send-completed method no longer implements the sender's callback")

        val postIndex = completed.instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                ref.definingClass == "Landroid/view/View;" && ref.name == "postDelayed"
            } == true
        }
        checkShape(postIndex >= 2, "missing delayed send scroll")
        val post = completed.getInstruction<Instruction35c>(postIndex)
        val delay = completed.getInstruction<TwoRegisterInstruction>(postIndex - 1)
        checkShape(completed.getInstruction(postIndex - 1).opcode == Opcode.INT_TO_LONG,
            "unexpected delay conversion")
        val constructorInstruction = completed.getInstruction<Instruction35c>(postIndex - 2)
        val constructor = constructorInstruction.reference as MethodReference
        checkShape(constructorInstruction.opcode == Opcode.INVOKE_DIRECT && constructor.name == "<init>" &&
            constructor.parameterTypes.size == 1 && constructorInstruction.registerC == post.registerD,
            "unexpected delayed scroll runnable")
        val controllerType = constructor.parameterTypes.single().toString()
        val controllerRegister = constructorInstruction.registerD
        val runnable = classDefBy(constructor.definingClass)
        checkShape("Ljava/lang/Runnable;" in runnable.interfaces, "send callback is not a Runnable")
        val run = runnable.methods.single { it.name == "run" && it.parameterTypes.isEmpty() }
        val scrollCall = run.calls().single {
            it.definingClass == controllerType && it.parameterTypes == listOf("Z") && it.returnType == "V"
        }
        checkShape(run.calls().any { it.name == "isResumed" }, "missing thread lifecycle guard")

        val controller = classDefBy(controllerType)
        val scroll = controller.methods.single { it.name == scrollCall.name && it.parameterTypes == listOf("Z") }
        checkShape(scroll.calls().count {
            it.definingClass == "Landroidx/recyclerview/widget/RecyclerView;" && it.parameterTypes == listOf("I")
        } == 2, "scroll controller no longer has immediate/smooth RecyclerView paths")
        val atLatest = controller.methods.single { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.calls().any { it.name == "findFirstCompletelyVisibleItemPosition" } &&
                method.calls().any { it.name == "findFirstVisibleItemPosition" }
        }

        // This public, unobfuscated AndroidX API is used only on the supplied Direct list.
        checkShape(classDefBy("Landroidx/recyclerview/widget/RecyclerView;").methods.any {
            it.name == "getScrollState" && it.parameterTypes.isEmpty() && it.returnType == "I"
        }, "RecyclerView scroll-state API changed")

        // Reuse only the two registers about to be overwritten by int-to-long.
        // No added registers, reflection, obfuscated names or global scroll interception.
        val low = delay.registerA
        val high = low + 1
        checkShape(low == post.registerE && high == post.registerF &&
            high <= 15 && controllerRegister <= 15 &&
            setOf(low, high).intersect(setOf(post.registerC, post.registerD, delay.registerB)).isEmpty(),
            "delay registers cannot safely hold the guard")
        checkShape(completed.getInstruction(postIndex + 1).opcode != Opcode.MOVE_RESULT,
            "postDelayed result is now consumed")
        completed.addInstructionsWithLabels(
            postIndex - 1,
            """
                invoke-virtual {v$controllerRegister}, $atLatest
                move-result v$low
                move-object/from16 v$high, p3
                invoke-static {v$high, v$low}, $HOOK->shouldKeepPosition(Ljava/lang/Object;Z)Z
                move-result v$low
                if-eqz v$low, :dudeks_normal_scroll
                invoke-static {v${post.registerC}}, $HOOK->preserveReplyLayout(Landroid/view/View;)V
                goto :dudeks_keep_position
            """.trimIndent(),
            ExternalLabel("dudeks_normal_scroll", completed.getInstruction(postIndex - 1)),
            ExternalLabel("dudeks_keep_position", completed.getInstruction(postIndex + 1)),
        )

        val layout = DirectViewportLayoutFingerprint.method
        val layoutInstructions = layout.instructions.toList()
        val section = layoutInstructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                "DirectThreadScrollBottomIntoViewportLayoutHelper.afterLayoutChildren"
        }
        val visibleIndex = (section + 1 until layoutInstructions.size).first { index ->
            ((layoutInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference)?.name ==
                "findFirstVisibleItemPosition"
        }
        val scratchIndex = visibleIndex + 2
        val constant = layoutInstructions[scratchIndex]
        val branchIndex = scratchIndex + 1
        val branch = layoutInstructions[branchIndex]
        checkShape(layoutInstructions[visibleIndex + 1].opcode == Opcode.MOVE_RESULT &&
            constant.opcode == Opcode.CONST_4 &&
            (constant as? NarrowLiteralInstruction)?.narrowLiteral == -1 && branch.opcode == Opcode.IF_EQ,
            "viewport helper's missing-item gate changed")
        val scratch = (constant as OneRegisterInstruction).registerA
        val visible = (layoutInstructions[visibleIndex + 1] as OneRegisterInstruction).registerA
        val operands = branch as TwoRegisterInstruction
        checkShape(scratch != visible && setOf(operands.registerA, operands.registerB) == setOf(scratch, visible),
            "viewport helper has no dead scratch register")
        val addresses = layoutInstructions.runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
        val exitAddress = addresses[branchIndex] + (branch as OffsetInstruction).codeOffset
        val exitIndex = addresses.indexOf(exitAddress)
        checkShape(exitIndex > branchIndex && exitIndex < layoutInstructions.size,
            "viewport helper exit is invalid")
        val sectionCalls = layoutInstructions.subList(branchIndex, exitIndex).mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)
        }
        checkShape(sectionCalls.count { it.name == "scrollVerticallyBy" } == 1 &&
            sectionCalls.any { it.name == "getPaddingBottom" } && sectionCalls.any { it.name == "getTag" },
            "viewport helper no longer contains the expected tagged-item nudge")
        val exitCall = (layoutInstructions[exitIndex] as? ReferenceInstruction)?.reference as? MethodReference
        checkShape(exitCall?.definingClass == "Lcom/facebook/systrace/Systrace;" && exitCall.returnType == "Z",
            "viewport helper exit no longer preserves trace cleanup")
        val listReference = DirectViewportLayoutFingerprint.classDef.fields.single {
            it.type == "Ljava/lang/ref/WeakReference;"
        }
        // Reuse the register overwritten by the original const -1. The native
        // missing-item branch exits just this bottom-nudge helper, balancing tracing.
        layout.addInstructionsWithLabels(scratchIndex, """
            move-object/from16 v$scratch, p0
            iget-object v$scratch, v$scratch, $listReference
            invoke-static {v$scratch}, $HOOK->shouldSkipReplyLayoutScroll(Ljava/lang/ref/WeakReference;)Z
            move-result v$scratch
            if-nez v$scratch, :dudeks_skip_viewport_nudge
        """.trimIndent(), ExternalLabel("dudeks_skip_viewport_nudge", layout.getInstruction(exitIndex)))
    }

    // Cross-bundle integration must run after Piko has merged its extensions.
    // A clean Instagram without Piko settings fails explicitly, never with a
    // successfully produced APK containing unresolved runtime references.
    finalize {
        val builder = mutableClassDefByOrNull(SCREEN_BUILDER)
            ?: throw PatchException("Keep DM scroll position requires Piko 'Add settings'. Select it in the same Morphe patching run.")
        checkShape(classDefBy("Lapp/morphe/extension/instagram/utils/IgStr;").methods.any {
            it.name == "str" && it.parameterTypes == listOf("Ljava/lang/String;") &&
                it.returnType == "Ljava/lang/String;"
        }, "Piko string resource API changed")
        val screen = builder.fields.single { it.type == "Landroid/preference/PreferenceScreen;" }
        val helper = builder.fields.single { it.type == HELPER }
        val dm = builder.methods.single { it.name == "dmSection" && it.parameterTypes.isEmpty() && it.returnType == "V" }
        checkShape(dm.implementation!!.registerCount >= 3, "Piko DM settings has insufficient local registers")
        checkShape(classDefBy(HELPER).methods.any {
            it.name == "switchPreference" && it.returnType == "Landroid/preference/Preference;" &&
                it.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lapp/morphe/extension/crimera/settings/BooleanSetting;")
        }, "Piko preference API changed")
        dm.addInstructions(0, """
            move-object/from16 v0, p0
            iget-object v1, v0, $helper
            iget-object v0, v0, $screen
            invoke-static {v0, v1}, $HOOK->addPreference(Landroid/preference/PreferenceScreen;$HELPER)V
        """.trimIndent())

        val visibility = mutableClassDefBy("$PIKO_SETTINGS/SettingsStatus;").methods.single {
            it.name == "dmSection" && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }
        checkShape(visibility.implementation!!.registerCount >= 1, "Piko DM visibility has no scratch register")
        visibility.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
