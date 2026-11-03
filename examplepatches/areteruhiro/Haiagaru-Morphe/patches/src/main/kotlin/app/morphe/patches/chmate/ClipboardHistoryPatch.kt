package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.util.findMutableMethodOf
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal fun BytecodePatchContext.patchClipboardHistory(version: String) {
    var count = 0
    boundClassForEach("ClipboardHistoryPatch:1") { cls ->
        if (cls.type == "Lapp/morphe/extension/chmate/ClipboardHistory;" ||
            !(cls.type.startsWith("Lo/") || cls.type.startsWith("Ljp/") || cls.type.startsWith("Lapp/morphe/extension/chmate/"))) return@boundClassForEach
        val mutableClass by lazy { mutableClassDefBy(cls) }
        cls.methods.forEach { method ->
            val calls = method.implementation?.instructions?.toList() ?: return@forEach
            calls.forEachIndexed { index, instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                if (ref?.definingClass == "Landroid/content/ClipboardManager;" && ref.name == "setPrimaryClip"
                    && ref.parameterTypes == listOf("Landroid/content/ClipData;")) {
                    val hook = "Lapp/morphe/extension/chmate/ClipboardHistory;->setPrimaryClip(Landroid/content/ClipboardManager;Landroid/content/ClipData;)V"
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    when (instruction) {
                        is FiveRegisterInstruction -> mutableMethod.replaceInstruction(index, "invoke-static {v${instruction.registerC}, v${instruction.registerD}}, $hook")
                        is RegisterRangeInstruction -> mutableMethod.replaceInstruction(index, "invoke-static/range {v${instruction.startRegister} .. v${instruction.startRegister + 1}}, $hook")
                        else -> error("Unsupported clipboard invocation")
                    }
                    count++
                }
            }
        }
    }
    check(count > 0) { "No ChMate copy calls found" }
    patchPostingOverflowMenu(version, "ClipboardHistory", "clipboard")
    println("Clipboard history: $version, $count copy calls")
}
