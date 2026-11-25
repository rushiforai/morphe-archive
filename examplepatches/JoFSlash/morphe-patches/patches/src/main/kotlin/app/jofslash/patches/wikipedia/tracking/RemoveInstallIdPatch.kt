package app.jofslash.patches.wikipedia.tracking

import app.jofslash.patches.wikipedia.shared.Constants.COMPATIBILITY_WIKIPEDIA
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val INSTALL_ID_HEADER = "X-WMF-UUID"

// CommonHeaderRequestInterceptor.intercept adds the User-Agent and this header to every request the
// app makes, the article pages in the WebView included. R8 merged the interceptor into another
// class, so its method is found by the header name.
internal object CommonHeadersFingerprint : Fingerprint(
    strings = listOf(INSTALL_ID_HEADER),
)

@Suppress("unused")
val removeInstallIdPatch = bytecodePatch(
    name = "Don't send install ID",
    description = "Stops sending the app's permanent install ID (the X-WMF-UUID header) with every request " +
            "to Wikipedia, which lets all your reading and searching on this phone be linked together, " +
            "signed in or not. Block tracking doesn't cover it. Links to donate and to edit in the browser " +
            "still carry it, as they need it to come back to the app.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_WIKIPEDIA)

    execute {
        val method = CommonHeadersFingerprint.method
        val instructions = method.instructions.toList()
        val name = instructions.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == INSTALL_ID_HEADER
        }
        // The next call taking two strings is builder.header(name, value). Taking it out leaves the
        // name and value unused.
        val header = instructions.withIndex().drop(name + 1).firstOrNull { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).let {
                        it.name == "header" &&
                                it.parameterTypes.map(CharSequence::toString) ==
                                listOf("Ljava/lang/String;", "Ljava/lang/String;")
                    }
        }?.index ?: throw PatchException("Couldn't find the call that adds $INSTALL_ID_HEADER")
        method.removeInstruction(header)
    }
}
