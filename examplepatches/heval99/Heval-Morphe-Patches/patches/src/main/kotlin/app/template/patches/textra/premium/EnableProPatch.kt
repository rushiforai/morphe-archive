package app.template.patches.textra.premium

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_TEXTRA

/**
 * Textra stores its purchase state in a single integer preference (key "lc", -1 unknown,
 * 0 free, 1 licensed). That preference is owned by a dedicated class which is the only
 * class in the app declaring all four methods `g()Ljava/lang/Integer;`,
 * `i(Ljava/lang/Integer;)V`, `k()Z` and `l()Z` - verified with a whole-app scan on 4.85.
 * Because the app is R8-obfuscated the class is located structurally instead of by name,
 * so the patch survives name rotation.
 *
 * Gates read `l()` (true = licensed) and `k()` (true = state 0). Forcing `l() -> true`
 * and `k() -> false` emulates the purchased state (1) for every call site: ad placement
 * checks, settings visibility and the upgrade prompts.
 */
private fun BytecodePatchContext.licenseClass(): MutableClass {
    val candidates = mutableListOf<MutableClass>()
    classDefForEach { classDef ->
        val methods = classDef.methods.filter { it.implementation != null }
        fun declares(name: String, returnType: String, parameters: List<String> = emptyList()) =
            methods.any { method ->
                method.name == name &&
                    method.returnType == returnType &&
                    method.parameterTypes.map(CharSequence::toString) == parameters
            }

        if (declares("g", "Ljava/lang/Integer;") &&
            declares("i", "V", listOf("Ljava/lang/Integer;")) &&
            declares("k", "Z") &&
            declares("l", "Z")
        ) {
            candidates += mutableClassDefBy(classDef)
        }
    }
    return candidates.singleOrNull()
        ?: error("Textra license preference class not found (candidates=${candidates.size})")
}

private fun MutableClass.booleanMethod(name: String): MutableMethod =
    methods.first { it.name == name && it.returnType == "Z" && it.parameterTypes.isEmpty() }

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Unlocks Textra Pro: removes ads and unlocks the paid features."
) {
    compatibleWith(COMPATIBILITY_TEXTRA)

    execute {
        val license = licenseClass()
        license.booleanMethod("l").returnEarly(true)
        license.booleanMethod("k").returnEarly(false)
    }
}
