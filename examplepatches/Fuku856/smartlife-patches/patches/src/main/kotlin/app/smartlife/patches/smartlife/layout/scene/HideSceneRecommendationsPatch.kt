package app.smartlife.patches.smartlife.layout.scene

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.smartlife.patches.smartlife.misc.fix.signature.spoofSignaturePatch
import app.smartlife.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE
import app.smartlife.patches.smartlife.shared.localRegisterCount
import app.smartlife.patches.smartlife.shared.logInfo
import app.smartlife.patches.smartlife.shared.logWarning
import app.smartlife.patches.smartlife.shared.signature

private const val EXTENSION_CLASS = "Lapp/smartlife/extension/SmartLifeSettings;"

@Suppress("unused")
val hideSceneRecommendationsPatch = bytecodePatch(
    name = "Hide scene recommendations",
    description = "Hides the recommended scenes (\"お勧め\") shown under the automation and " +
        "tap-to-run lists of the smart tab. This is a runtime toggle in the in-app " +
        "\"SmartLife Patches\" settings screen. Hidden by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE)

    // Provides the extension and the captured app context.
    dependsOn(spoofSignaturePatch)

    execute {
        // SceneRecommendServiceImpl builds the recommendation section (an ISceneHomePageExt)
        // that the automation / tap-to-run list fragments attach. The app itself returns null
        // for some home types and the fragments null-check it, so returning null hides the
        // section through an existing code path. Any no-arg factory whose return type is the
        // interface or a class implementing it is gated (7.12.0 has a bridge plus the real
        // method; in 7.12.6 the implementation class is obfuscated to a6y).
        val service = mutableClassDefByOrNull(SCENE_RECOMMEND_SERVICE_IMPL)
            ?: throw PatchException("Hide scene recommendations: $SCENE_RECOMMEND_SERVICE_IMPL not found")

        var gated = 0
        service.methods
            .filter { method ->
                method.implementation != null && method.parameterTypes.isEmpty() &&
                    method.returnType.startsWith("L") &&
                    (method.returnType == SCENE_HOME_PAGE_EXT ||
                        classDefByOrNull(method.returnType)?.interfaces?.contains(SCENE_HOME_PAGE_EXT) == true)
            }
            .forEach { method ->
                if (localRegisterCount(method) < 1) {
                    logWarning("Scene recommendations ${method.signature}: no free register, not gated")
                    return@forEach
                }
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static { }, $EXTENSION_CLASS->hideSceneRecommendations()Z
                        move-result v0
                        if-eqz v0, :show_recommendations
                        const/4 v0, 0x0
                        return-object v0
                        :show_recommendations
                        nop
                    """,
                )
                logInfo("Scene recommendations gated: ${method.signature}")
                gated++
            }

        if (gated == 0) {
            throw PatchException(
                "Hide scene recommendations: no method of $SCENE_RECOMMEND_SERVICE_IMPL " +
                    "returns an $SCENE_HOME_PAGE_EXT"
            )
        }
    }
}
