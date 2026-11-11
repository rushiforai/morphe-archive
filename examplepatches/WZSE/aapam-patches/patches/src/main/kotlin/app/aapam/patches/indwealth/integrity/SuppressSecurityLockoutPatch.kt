package app.aapam.patches.indwealth.integrity

import app.aapam.patches.indwealth.shared.Constants
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val suppressSecurityLockoutPatch = bytecodePatch(
    name = "Suppress App Blocked Screen",
    description = "Neutralizes Talsec RASP callbacks, threat dispatchers, memory map checks, and AppExitTracker to prevent access blocked screens and premature process termination.",
) {
    compatibleWith(Constants.COMPATIBILITY_INDWEALTH)

    execute {
        // 1. Disable Talsec freeRASP initialization and lifecycle monitoring in h3 (AppThreatSafetyHandler)
        mutableClassDefByOrNull("Lcom/indwealth/android/h3;")?.let { h3Class ->
            h3Class.methods.forEach { method ->
                // p(App) -> void: initializes Talsec engine and registers lifecycle callbacks
                if (method.name == "p" && method.returnType == "V" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "Lcom/indwealth/android/App;") {
                    method.addInstructions(
                        0,
                        """
                            return-void
                        """,
                    )
                }
                // Neutralize threat event consumer methods
                if ((method.name == "K" || method.name == "a") && method.returnType == "V") {
                    method.addInstructions(
                        0,
                        """
                            return-void
                        """,
                    )
                }
            }
        }

        // 2. Stub BaseAppThreatSafetyHandler (y3) threat dispatchers
        mutableClassDefByOrNull("Lcom/indwealth/android/y3;")?.let { y3Class ->
            y3Class.methods.forEach { method ->
                // z: dispatches threat coroutine (z3)
                if (method.name == "z" && method.returnType == "V") {
                    method.addInstructions(
                        0,
                        """
                            return-void
                        """,
                    )
                }
            }
        }

        // 3. Stub PlayIntegrityUtility proxy tool checks (e7.j & e7.k)
        mutableClassDefByOrNull("Lcom/indwealth/common/utils/e7;")?.let { e7Class ->
            e7Class.methods.forEach { method ->
                // j() -> ArrayList (proxy tool scan)
                if (method.name == "j" && method.returnType == "Ljava/util/ArrayList;") {
                    method.addInstructions(
                        0,
                        """
                            new-instance v0, Ljava/util/ArrayList;
                            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                            return-object v0
                        """,
                    )
                }
                // k(String, String, Continuation) -> Object (lockout launcher)
                if (method.name == "k" && method.returnType == "Ljava/lang/Object;") {
                    method.addInstructions(
                        0,
                        """
                            sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                            return-object v0
                        """,
                    )
                }
            }
        }
    }
}
