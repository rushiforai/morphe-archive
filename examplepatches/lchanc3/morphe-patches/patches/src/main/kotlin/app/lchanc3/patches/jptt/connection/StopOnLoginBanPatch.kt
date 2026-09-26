package app.lchanc3.patches.jptt.connection

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_LOGIN_BAN_CLASS
import app.lchanc3.patches.jptt.shared.Constants.JSOCKET_CLASS
import app.lchanc3.patches.jptt.shared.Constants.JSOCKET_SIMPLE_CLASS
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.lchanc3.patches.jptt.shared.newMethod
import app.lchanc3.patches.jptt.shared.toSmaliLiteral
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val KNOWN_REFUSAL = "登入太頻繁"

/** The part of PTT's "帳號 … 已被暫時禁止登入。" that names what happened. */
private const val BANNED_TEXT = "禁止登入"

private const val DIALOG_TITLE = "帳號暫時禁止登入"

/** The method added to JSocket, named so it cannot collide with its own. */
private const val HELPER_METHOD = "patchStopIfLoginBanned"

@Suppress("unused")
val stopOnLoginBanPatch = bytecodePatch(
    name = "Stop on login ban",
    description = "Shows PTT's message and stops when it temporarily bans the account " +
        "from logging in, instead of sitting at 連線中 until the app is closed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    execute {
        val classDef = ProcessReadCharacterFingerprint.classDef
        val method = ProcessReadCharacterFingerprint.method

        if (classDef.methods.any { it.name == HELPER_METHOD }) {
            throw PatchException("$JSOCKET_CLASS already has a $HELPER_METHOD method.")
        }
        if (classDef.methods.none {
                it.name == "showLoginErrorDialog" && it.returnType == "V" &&
                    it.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z")
            }
        ) {
            throw PatchException("$JSOCKET_CLASS no longer has showLoginErrorDialog(String, String, boolean).")
        }

        // Shows JPTT's own login error dialog, the one it shows for a wrong
        // password: it marks the socket disconnected, and without a 重試 button
        // its only way out is back to the login screen. So nothing retries into
        // a longer ban, and nothing is left waiting at 連線中.
        classDef.methods.add(
            newMethod(
                JSOCKET_CLASS,
                HELPER_METHOD,
                "Z",
                AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                // v0 to v2, and p0 for the socket itself.
                registers = 4,
                """
                    const-string v0, "${BANNED_TEXT.toSmaliLiteral()}"
                    invoke-virtual { p0, v0 }, $JSOCKET_SIMPLE_CLASS->curLineContains(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :not_banned
                    invoke-virtual { p0 }, $JSOCKET_CLASS->getTerminalText()Ljava/lang/String;
                    move-result-object v1
                    invoke-static { v1 }, $EXTENSION_LOGIN_BAN_CLASS->message(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v1
                    const-string v0, "${DIALOG_TITLE.toSmaliLiteral()}"
                    const/4 v2, 0x0
                    invoke-direct { p0, v0, v1, v2 }, $JSOCKET_CLASS->showLoginErrorDialog(Ljava/lang/String;Ljava/lang/String;Z)V
                    const/4 v0, 0x1
                    return v0
                    :not_banned
                    const/4 v0, 0x0
                    return v0
                """,
            ),
        )

        // The check for 登入太頻繁 is the last of the login screens JPTT answers,
        // reached for every character until the main menu shows up. The new check
        // goes right after its string is loaded: going in before would put it
        // behind the label the branch jumps to. The string's register is borrowed
        // and the string loaded again, so the original check sees what it did.
        val instructions = method.instructions.toList()
        val constIndex = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as ReferenceInstruction).reference as StringReference).string == KNOWN_REFUSAL
        }
        if (constIndex < 0) throw PatchException("processReadCharacter no longer loads \"$KNOWN_REFUSAL\".")

        val stringRegister = method.getInstruction<OneRegisterInstruction>(constIndex).registerA
        val check = instructions[constIndex + 1]
        val checkReference = (check as? ReferenceInstruction)?.reference as? MethodReference
        if (check.opcode != Opcode.INVOKE_VIRTUAL || checkReference?.name != "lineNContains") {
            throw PatchException("\"$KNOWN_REFUSAL\" is no longer passed straight to lineNContains.")
        }
        // registerC of the call is the socket it is made on.
        val socketRegister = (check as FiveRegisterInstruction).registerC
        if (stringRegister > 15 || socketRegister > 15) {
            throw PatchException("The registers around \"$KNOWN_REFUSAL\" are out of reach of the injected code.")
        }

        method.addInstructionsWithLabels(
            constIndex + 1,
            """
                invoke-direct { v$socketRegister }, $JSOCKET_CLASS->$HELPER_METHOD()Z
                move-result v$stringRegister
                if-eqz v$stringRegister, :not_banned
                const/4 v$stringRegister, 0x0
                return v$stringRegister
                :not_banned
                const-string v$stringRegister, "${KNOWN_REFUSAL.toSmaliLiteral()}"
            """,
        )
    }
}
