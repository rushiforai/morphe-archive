package app.template.patches.messenger

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchFirst
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Messenger 575.0.0.0.1 — classes4.dex, LX/5zw;->BrT(Landroid/content/Intent;I)V
 * (cài đặt duy nhất của interface "launch intent for result" mà khay media dùng khi bấm nút Photos).
 *
 * Gốc:
 *   iget-object v1, p0, A00            // Fragment host của khay media
 *   ... lấy SecureContextHelper ...
 *   invoke-virtual {launcher, p1, v1, p2}, ->A0D(Intent, Fragment, I)Z
 *
 * Launcher của Facebook lọc intent qua các "IntentScope" (AnyApp / FamilyAccessibleByAnyApp ...).
 * Khi cấu hình từ server chuyển từ fail-open sang chặn thật, intent mở Photos bản Morphe bị
 * trả về null và bỏ qua âm thầm (không log, không crash) → icon vẫn hiện nhưng bấm không có gì.
 *
 * Patch: gọi thẳng Fragment.startActivityForResult(intent, requestCode) ngay sau khi lấy Fragment.
 * Kết quả trả về vẫn đi vào onActivityResult của đúng Fragment đó như luồng gốc.
 */
internal object MediaPickerLaunchForResultFingerprint : Fingerprint(
    isStatic = false,
    returnType = "V",
    parameters = listOf("Landroid/content/Intent;", "I"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "this", location = MatchFirst()),
        methodCall(
            parameters = listOf("Landroid/content/Intent;", "Landroidx/fragment/app/Fragment;", "I"),
            returnType = "Z",
        ),
    ),
    // Wrapper rất ngắn (9 lệnh). Loại các hàm dài hơn có cùng chữ ký.
    custom = { method, _ -> (method.implementation?.instructions?.count() ?: 0) <= 12 },
)

private const val LAUNCH_EXTERNAL_MEDIA_PICKER_EVENT =
    "Lcom/facebook/xapp/messaging/feature/externalmedia/events/LaunchExternalMediaPickerEvent;"
private const val FRAGMENT = "Landroidx/fragment/app/Fragment;"
private const val INTENT = "Landroid/content/Intent;"

/** iget-object vX, vEvent, LaunchExternalMediaPickerEvent->A00:Intent */
private fun Instruction.isEventIntentGet(): Boolean {
    if (opcode != Opcode.IGET_OBJECT) return false
    val ref = (this as ReferenceInstruction).reference as? FieldReference ?: return false
    return ref.definingClass == LAUNCH_EXTERNAL_MEDIA_PICKER_EVENT && ref.type == INTENT
}

/** invoke-virtual {launcher, intent, fragment, requestCode}, ->A0D(Intent, Fragment, I)Z */
private fun Instruction.isSecureLaunchForResult(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL) return false
    val ref = (this as ReferenceInstruction).reference as? MethodReference ?: return false
    return ref.returnType == "Z" &&
        ref.parameterTypes.map { it.toString() } == listOf(INTENT, FRAGMENT, "I") &&
        (this as FiveRegisterInstruction).registerCount == 4
}

@Suppress("unused")
val bypassMediaPickerIntentScopePatch = bytecodePatch(
    name = "Fix Photos picker button not opening",
    description = "Sửa lỗi bấm nút Photos trong khay ảnh không có phản ứng sau khi Messenger tải cấu hình từ server.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MESSENGER)

    execute {
        // --- Đường mới: composer "xapp" ---
        // Nút Photos phát LaunchExternalMediaPickerEvent(intent); handler gọi
        // SecureContextHelper.A0D(intent, fragment, requestCode) → bị lọc giống đường cũ.
        // Thay lời gọi đó bằng fragment.startActivityForResult(intent, requestCode).
        val targets = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.methods.any { m -> m.implementation?.instructions?.any { it.isEventIntentGet() } == true }) {
                targets += classDef
            }
        }

        var patchedHandlers = 0
        targets.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val getIndex = instructions.indexOfFirst { it.isEventIntentGet() }
                if (getIndex < 0) return@forEach

                val callIndex = (getIndex until minOf(getIndex + 16, instructions.size))
                    .firstOrNull { instructions[it].isSecureLaunchForResult() } ?: return@forEach
                val call = instructions[callIndex] as FiveRegisterInstruction
                // registerC = launcher, D = intent, E = fragment, F = requestCode
                method.replaceInstruction(
                    callIndex,
                    "invoke-virtual {v${call.registerE}, v${call.registerD}, v${call.registerF}}, " +
                        "$FRAGMENT->startActivityForResult(${INTENT}I)V",
                )
                if (instructions.getOrNull(callIndex + 1)?.opcode == Opcode.MOVE_RESULT) {
                    method.removeInstruction(callIndex + 1)
                }
                patchedHandlers++
            }
        }
        if (patchedHandlers == 0) {
            throw PatchException("Không tìm thấy handler của LaunchExternalMediaPickerEvent.")
        }

        // --- Đường cũ: khay media kiểu cũ ---
        MediaPickerLaunchForResultFingerprint.let {
            val igetIndex = it.instructionMatches[0].index
            val fragmentRegister = it.method.getInstruction<TwoRegisterInstruction>(igetIndex).registerA

            it.method.addInstructions(
                igetIndex + 1,
                """
                    invoke-virtual {v$fragmentRegister, p1, p2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V
                    return-void
                """,
            )
        }
    }
}
