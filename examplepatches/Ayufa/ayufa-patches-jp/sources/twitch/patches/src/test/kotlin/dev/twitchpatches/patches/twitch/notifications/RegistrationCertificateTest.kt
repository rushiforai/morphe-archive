package dev.twitchpatches.patches.twitch.notifications

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.code
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class RegistrationCertificateTest {
    private val body = """
        const-string v1, "X-Android-Package"
        const-string v2, "synthetic.package"
        invoke-virtual {v0, v1, v2}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
        const-string v1, "X-Android-Cert"
        :header
        invoke-virtual {v0, v1, v2}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
        const-string v2, "x-goog-api-key"
        invoke-virtual {v0, v2, p2}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
        return-object v0
    """.trimIndent()

    private fun method(code: String = body, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) =
        ImmutableMethod("Lsynthetic/Installations;", "connection",
            listOf(ImmutableMethodParameter("Ljava/net/URL;", null, null),
                ImmutableMethodParameter("Ljava/lang/String;", null, null)),
            "Ljava/net/HttpURLConnection;", flags, null, null, MutableMethodImplementation(6))
            .toMutable().apply { addInstructionsWithLabels(0, code) }

    @Test fun changesOnlyTheCertificateHeaderValue() {
        val method = method()
        val before = method.code()
        val header = resolveCertificateHeader(method)
        restoreRegistrationCertificate(method)
        val after = method.code()
        assertEquals(before.size + 1, after.size)
        assertEquals(TWITCH_REGISTRATION_CERTIFICATE,
            ((after[header.callIndex] as ReferenceInstruction).reference as StringReference).string)
        assertEquals(2, (after[header.callIndex + 1] as FiveRegisterInstruction).registerE)
        assertEquals(before.map { it.opcode }, after.filterIndexed { index, _ -> index != header.callIndex }.map { it.opcode })
    }

    @Test(expected = PatchException::class) fun rejectsMissingHeader() {
        resolveCertificateHeader(method(body.replace("X-Android-Cert", "Unrelated-Header")))
    }

    @Test(expected = PatchException::class) fun rejectsDuplicateHeaders() {
        resolveCertificateHeader(method("const-string v1, \"X-Android-Cert\"\n$body"))
    }

    @Test(expected = PatchException::class) fun rejectsReusedCertificateRegister() {
        resolveCertificateHeader(method(body.replace("const-string v2, \"x-goog-api-key\"", "const-string v1, \"x-goog-api-key\"")))
    }

    @Test(expected = PatchException::class) fun rejectsChangedHeaderArgument() {
        resolveCertificateHeader(method(body.replace("{v0, v1, v2}", "{v0, v2, v1}")))
    }

    @Test(expected = PatchException::class) fun rejectsStaticConnectionBuilder() {
        resolveCertificateHeader(method(flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or AccessFlags.STATIC.value))
    }

    @Test fun branchToHeaderRunsReplacementFirst() {
        val method = method(body.replace("const-string v1, \"X-Android-Package\"", "goto :header\nconst-string v1, \"X-Android-Package\""))
        restoreRegistrationCertificate(method)
        val code = method.code()
        val targetOffset = (code.first() as OffsetInstruction).codeOffset
        var offset = 0
        val target = code.first { instruction ->
            val match = offset == targetOffset
            offset += instruction.codeUnits
            match
        }
        assertTrue(target.opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO))
        assertEquals(TWITCH_REGISTRATION_CERTIFICATE,
            ((target as ReferenceInstruction).reference as StringReference).string)
    }
}
