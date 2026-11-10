package app.libby.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addFreeRegisters
import app.libby.patches.Constants.COMPATIBILITY_LIBBY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val ROUTER_CLASS = "Lapp/libby/web/MorpheWebRouter;"

private val INTERCEPT = ImmutableMethodReference(
    ROUTER_CLASS,
    "intercept",
    listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
    "Landroid/webkit/WebResourceResponse;",
)

/**
 * Installs the one shared interception point.
 *
 * Other patches depend on this patch instead of patching shouldInterceptRequest
 * themselves. They then register a namespace at runtime through MorpheWebRouter.
 */
@Suppress("unused")
val webRoutesPatch = bytecodePatch(
    name = "Shared web routes",
    description = "Internal: installs one /morphe/ request router for extension patches.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LIBBY)

    // This DEX contains the router, the font bridge, and route handlers.
    extendWith("extensions/libby.mpe")

    execute {
        val current = WebViewClientShouldInterceptRequestFingerprint.method

        // Dependencies are applied once by Morphe, but keep this idempotent in
        // case another patch ever calls the same helper.
        val alreadyHooked = current.instructions.any { instruction ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                instruction is BuilderInstruction35c &&
                instruction.reference == INTERCEPT
        }
        if (alreadyHooked) {
            return@execute
        }

        // addFreeRegisters also inserts moves that copy the shifted parameters
        // back down for the original body. v0 is the newly freed local: it still
        // holds `this` when our code runs, but the generated move restores it on
        // the fall-through path. The second return value is a move count, not a
        // register number, so do not use it as a scratch register.
        val (method, _) = current.addFreeRegisters(1)
        method.addInstructions(
            0,
            """
                invoke-static {p1, p2}, $ROUTER_CLASS->intercept(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                move-result-object v0
                if-eqz v0, :morphe_continue
                return-object v0
                :morphe_continue
            """,
        )
    }
}
