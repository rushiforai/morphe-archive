package app.template.patches.tiktok.scroll

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun checkShape(value: Boolean, message: String) {
    if (!value) throw PatchException("Keep TikTok DM scroll position: $message")
}

@Suppress("unused")
val keepTikTokDmScrollPositionPatch = bytecodePatch(
    name = "Keep TikTok DM scroll position",
    description = "Keeps your position while reading older messages, including after sending messages and replies. Compatible with kveld9 patches.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "TikTok", packageName = "com.zhiliaoapp.musically",
        apkFileType = ApkFileType.APK, appIconColor = 0xFE2C55,
        targets = listOf(AppTarget(version = "47.0.3")),
    ))
    extendWith("extensions/tiktok.mpe")

    execute {
        val commit = CommitScrollFingerprint.method
        val instructions = commit.instructions.toList()
        val stop = instructions.indexOfFirst {
            (it as? Instruction35c)?.reference.let { ref ->
                ref is MethodReference && ref.name == "stopScroll" &&
                    ref.definingClass == "Landroidx/recyclerview/widget/RecyclerView;"
            }
        }
        checkShape(stop >= 1, "missing commit-time RecyclerView scroll")
        val scroll = instructions.indexOfFirst {
            (it as? Instruction35c)?.reference.let { ref ->
                ref is MethodReference && ref.name == "scrollToPositionWithOffset"
            }
        }
        // The next native assignment provides a dead temporary for our result,
        // preserving the RecyclerView register on the original fallthrough.
        val listRegister = commit.getInstruction<Instruction35c>(stop).registerC
        val next = commit.getInstruction<TwoRegisterInstruction>(scroll + 1)
        checkShape(scroll == stop + 4 && instructions[scroll + 1].opcode == Opcode.IGET_OBJECT &&
            next.registerA != listRegister &&
            instructions[stop + 1].opcode == Opcode.IGET_OBJECT &&
            (instructions[stop + 1] as TwoRegisterInstruction).registerA == listRegister,
            "unexpected commit-time scroll block")
        val temporary = next.registerA
        val originalScroll = commit.getInstruction<Instruction35c>(scroll)
        checkShape(temporary != originalScroll.registerC && temporary != originalScroll.registerD &&
            temporary != originalScroll.registerE && next.registerB != temporary,
            "temporary overlaps a live scroll argument")
        commit.addInstructionsWithLabels(stop,
            """
                invoke-static {v$listRegister}, $HOOK->shouldSkipAutoScroll(Landroidx/recyclerview/widget/RecyclerView;)Z
                move-result v$temporary
                if-nez v$temporary, :dudeks_after_scroll
            """.trimIndent(),
            ExternalLabel("dudeks_after_scroll", commit.getInstruction(scroll + 1)),
        )

        val attach = AttachListFingerprint.method
        val returns = attach.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
        returns.reversed().forEach { attach.addInstructions(it,
            "invoke-static {p1}, $HOOK->attach(Landroidx/recyclerview/widget/RecyclerView;)V") }
        DetachListFingerprint.method.addInstructions(0,
            "invoke-static {p1}, $HOOK->detach(Landroidx/recyclerview/widget/RecyclerView;)V")
        LatestButtonFingerprint.method.addInstructions(0, "invoke-static {}, $HOOK->requestLatest()V")

        // Direct message-ID/position navigation (tap a quote, search result, etc.)
        // is distinct from dataset auto-scroll and retires the resize anchor.
        val navigation = mutableClassDefBy("Lcom/ss/android/ugc/aweme/im/messagelist/api/ability/MessageListScrollAbilityImpl;")
        val methods = navigation.methods.filter { method ->
            method.returnType == "V" && method.parameterTypes.firstOrNull() in listOf("I", "J") &&
                method.parameterTypes.any { it == "Ljava/lang/String;" || it.toString().startsWith("Lkotlin/jvm/functions/Function") }
        }
        checkShape(methods.size == 5, "unexpected message navigation API")
        methods.forEach { it.addInstructions(0, "invoke-static {}, $HOOK->navigateToMessage()V") }

        val recycler = classDefBy("Landroidx/recyclerview/widget/RecyclerView;")
        listOf("getScrollState", "getLayoutManager", "getChildAdapterPosition", "getChildItemId").forEach { name ->
            checkShape(recycler.methods.any { it.name == name }, "missing RecyclerView API: $name")
        }
    }
}
