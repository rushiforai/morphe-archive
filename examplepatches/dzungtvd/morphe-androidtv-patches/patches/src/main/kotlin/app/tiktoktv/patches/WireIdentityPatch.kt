package app.tiktoktv.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.tiktoktv.patches.shared.Constants.COMPATIBILITY_TIKTOK_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val CALL_SERVER_INTERCEPTOR = "Lcom/bytedance/retrofit2/CallServerInterceptor;"
private const val REQUEST_CHAIN = "Lcom/bytedance/retrofit2/d/a\$a;"
private const val REQUEST = "Lcom/bytedance/retrofit2/b/c;"
private const val RESPONSE = "Lcom/bytedance/retrofit2/z;"
private const val WIRE_IDENTITY = "Lapp/template/extension/extension/WireIdentity;"

/** Re-tags requests that require the TV identity. */
@Suppress("unused")
val wireIdentityPatch = bytecodePatch(
    name = "Fix TikTok TV identity",
    description = "Re-tags the search and profile requests with the TikTok TV app id, which those backends require, while the feed keeps the TikTok Lite id that it is only served under; empty risk-engine answers are retried.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK_TV)
    extendWith("extensions/extension.mpe")

    execute {
        val intercept = mutableClassDefBy(CALL_SERVER_INTERCEPTOR).methods.first {
            it.name == "intercept" && it.parameterTypes == listOf(REQUEST_CHAIN)
        }

        val requestStore = intercept.implementation!!.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.IPUT_OBJECT &&
                ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
                    ?.let {
                        it.definingClass == CALL_SERVER_INTERCEPTOR && it.name == "c"
                    } == true
        }
        check(requestStore >= 0) { "CallServerInterceptor no longer stores the outgoing request" }

        intercept.addInstructions(
            requestStore + 1,
            """
                invoke-static {p1}, $WIRE_IDENTITY->rewrite(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p1
                check-cast p1, $REQUEST
                iput-object p1, p0, $CALL_SERVER_INTERCEPTOR->c:$REQUEST
            """.trimIndent(),
        )

        // The risk engine suppresses a share of those re-tagged requests with an empty 200, and
        // this interceptor deserialises the body itself, so the failure surfaces as an exception
        // rather than a response and cannot be retried from a return site. Taking over the method
        // lets `WireIdentity.intercept` re-run the whole transport, which re-signs every attempt.
        // The bypass branch is what stops that re-entry from wrapping itself again.
        intercept.addInstructions(
            0,
            """
                invoke-static {}, $WIRE_IDENTITY->shouldWrap()Z
                move-result v0
                if-eqz v0, :passthrough
                invoke-static {p0, p1}, $WIRE_IDENTITY->intercept(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, $RESPONSE
                return-object v0
                :passthrough
                nop
            """.trimIndent(),
        )
    }
}
