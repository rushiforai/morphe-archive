package app.apppatches.patches.cloudflare.warp

import app.apppatches.patches.shared.Constants.WARP_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ANALYTICS_SERVICE_PREFIX = "Lcom/cloudflare/app/domain/analytics/AnalyticsService\$"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val GMS_MEASUREMENT_PREFIX = "Lcom/google/android/gms/internal/measurement/"

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable Analytics / Telemetry",
    description = "Disables all Cloudflare telemetry by no-oping the analytics bundle builder and the Firebase event dispatchers.",
    default = true
) {
    compatibleWith(WARP_COMPATIBILITY)

    execute {
        // No-op the static bundle builder that enriches every telemetry event.
        AnalyticsServiceDispatchFingerprint.method.addInstructions(0, "return-void")

        // The Firebase dispatchers live in compiler-numbered lambdas of
        // AnalyticsService. Find them by interface and the GMS measurement call
        // instead of relying on class names like AnalyticsService$3 or $7.
        classDefForEach { classDef ->
            if (!classDef.type.startsWith(ANALYTICS_SERVICE_PREFIX)) {
                return@classDefForEach
            }

            if (classDef.interfaces.none { it == FUNCTION1 }) {
                return@classDefForEach
            }

            val targets = classDef.methods.filter { method ->
                method.name == "invoke" &&
                    method.returnType == "Ljava/lang/Object;" &&
                    method.parameterTypes.size == 1 &&
                    method.implementation?.instructions?.any { instruction ->
                        instruction is ReferenceInstruction &&
                            (instruction.reference as? MethodReference)?.let { reference ->
                                reference.definingClass.startsWith(GMS_MEASUREMENT_PREFIX) &&
                                    reference.name == "n"
                            } == true
                    } == true
            }

            if (targets.isEmpty()) return@classDefForEach

            val mutableClass = mutableClassDefByOrNull(classDef.type) ?: return@classDefForEach
            targets.forEach { target ->
                mutableClass.methods.firstOrNull { candidate ->
                    candidate.name == target.name &&
                        candidate.returnType == target.returnType &&
                        candidate.parameterTypes.map { it.toString() } ==
                        target.parameterTypes.map { it.toString() }
                }?.addInstructions(
                    0,
                    """
                        sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;
                        return-object p1
                    """.trimIndent()
                )
            }
        }
    }
}
