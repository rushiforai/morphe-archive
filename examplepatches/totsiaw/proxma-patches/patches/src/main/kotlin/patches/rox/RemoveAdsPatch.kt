package patches.rox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

private const val PREBID_PLUGIN = "Lsetupad/plugin/setupad_prebid_flutter/a;"
private const val AD_GATE = "Lapp/proxma/rox/AdGate;"
private const val METHOD_CALL = "Lio/flutter/plugin/common/MethodCall;"
private const val METHOD_RESULT = "Lio/flutter/plugin/common/MethodChannel\$Result;"

internal val roxPrebidOnMethodCallFingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(METHOD_CALL, METHOD_RESULT),
    custom = { method, classDef ->
        classDef.type == PREBID_PLUGIN && method.name == "onMethodCall"
    },
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Stops banner and full-screen ads from loading. Rewarded video ads are left alone, " +
        "so the watch-an-ad-for-points option keeps working.",
) {
    compatibleWith(COMPATIBILITY_ROX)
    extendWith("extensions/extension.mpe")

    execute {
        // The method copies its parameters from high registers first, so v0 and v1 are free here.
        roxPrebidOnMethodCallFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p1
                iget-object v1, v0, $METHOD_CALL->method:Ljava/lang/String;
                iget-object v0, v0, $METHOD_CALL->arguments:Ljava/lang/Object;
                invoke-static {v1, v0}, $AD_GATE->shouldBlock(Ljava/lang/String;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :proxma_continue
                move-object/from16 v1, p2
                const/4 v0, 0x0
                invoke-interface {v1, v0}, $METHOD_RESULT->success(Ljava/lang/Object;)V
                return-void
                :proxma_continue
                nop
            """,
        )
    }
}
