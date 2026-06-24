package app.kareem.patches.twitter.links

import app.kareem.patches.shared.Constants.COMPATIBILITY_TWITTER
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.Method

private const val PAIRIP_APPLICATION_CLASS = "Lcom/pairip/application/Application;"
private const val PAIRIP_SIGNATURE_CHECK_CLASS = "Lcom/pairip/SignatureCheck;"
private const val PAIRIP_STARTUP_LAUNCHER_CLASS = "Lcom/pairip/StartupLauncher;"

@Suppress("unused")
val disableTwitterPairIpPatch =
    bytecodePatch(
        name = "Disable Twitter PairIP startup checks",
        description = "Bypasses X/Twitter PairIP integrity startup checks that crash after APKM repacking.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_TWITTER)

        execute {
            var patchedAttachBaseContext = false
            var patchedVerifyIntegrity = false
            var patchedStartupLaunch = false

            classDefForEach { classDef ->
                val mutableClass = mutableClassDefBy(classDef)
                mutableClass.methods.forEach { method ->
                    if (method.implementation == null) {
                        return@forEach
                    }

                    when {
                        method.matches(
                            definingClass = PAIRIP_APPLICATION_CLASS,
                            name = "attachBaseContext",
                            returnType = "V",
                            parameterTypes = listOf("Landroid/content/Context;"),
                        ) -> {
                            method.addInstructions(
                                0,
                                """
                                invoke-super { p0, p1 }, $PAIRIP_APPLICATION_CLASS->attachBaseContext(Landroid/content/Context;)V
                                return-void
                                """.trimIndent(),
                            )
                            patchedAttachBaseContext = true
                        }

                        method.matches(
                            definingClass = PAIRIP_SIGNATURE_CHECK_CLASS,
                            name = "verifyIntegrity",
                            returnType = "V",
                            parameterTypes = listOf("Landroid/content/Context;"),
                        ) -> {
                            method.addInstructions(0, "return-void")
                            patchedVerifyIntegrity = true
                        }

                        method.matches(
                            definingClass = PAIRIP_STARTUP_LAUNCHER_CLASS,
                            name = "launch",
                            returnType = "V",
                            parameterTypes = emptyList(),
                        ) -> {
                            method.addInstructions(0, "return-void")
                            patchedStartupLaunch = true
                        }
                    }
                }
            }

            val missingTargets =
                listOfNotNull(
                    "PairIP application attachBaseContext".takeUnless { patchedAttachBaseContext },
                    "PairIP signature verifier".takeUnless { patchedVerifyIntegrity },
                    "PairIP startup launcher".takeUnless { patchedStartupLaunch },
                )
            if (missingTargets.isNotEmpty()) {
                throw PatchException("Could not patch ${missingTargets.joinToString()}")
            }
        }
    }

private fun Method.matches(
    definingClass: String,
    name: String,
    returnType: String,
    parameterTypes: List<String>,
): Boolean =
    this.definingClass == definingClass &&
        this.name == name &&
        this.returnType == returnType &&
        this.parameterTypes.map(CharSequence::toString) == parameterTypes
