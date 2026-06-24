package app.kareem.patches.twitter.links

import app.kareem.patches.shared.Constants.COMPATIBILITY_TWITTER
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

private const val SANITIZE_CLASS = "Lcom/twitter/share/api/targets/u;"
private const val SANITIZE_METHOD = "a"
private const val SANITIZE_RETURN_TYPE = "Ljava/lang/String;"

@Suppress("unused")
val sanitizeTwitterShareLinksPatch =
    bytecodePatch(
        name = "Sanitize Twitter share links",
        description = "Stops Twitter/X from appending tracking query parameters to shared links.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_TWITTER)

        execute {
            var sanitizedShareTarget = false

            classDefForEach { classDef ->
                if (classDef.type != SANITIZE_CLASS) {
                    return@classDefForEach
                }

                val mutableClass = mutableClassDefBy(classDef)
                val sanitizeMethod =
                    mutableClass.methods.firstOrNull(::isSanitizeMethod)
                        ?: throw PatchException("Could not find sanitize method in $SANITIZE_CLASS")

                if (sanitizeMethod.implementation == null) {
                    throw PatchException("Sanitize method in $SANITIZE_CLASS has no implementation")
                }

                val linkRegister = if (AccessFlags.STATIC.isSet(sanitizeMethod.accessFlags)) "p0" else "p1"
                sanitizeMethod.addInstructions(
                    0,
                    "return-object $linkRegister",
                )
                sanitizedShareTarget = true
            }

            if (!sanitizedShareTarget) {
                throw PatchException("Could not find sanitize class $SANITIZE_CLASS")
            }
        }
    }

private fun isSanitizeMethod(method: Method): Boolean {
    if (method.definingClass != SANITIZE_CLASS) return false
    if (method.name != SANITIZE_METHOD) return false
    if (method.returnType != SANITIZE_RETURN_TYPE) return false

    return method.parameterTypes.map(CharSequence::toString) ==
        listOf(
            "Ljava/lang/String;",
            "Lcom/twitter/share/api/targets/t;",
            "Ljava/lang/String;",
        )
}
