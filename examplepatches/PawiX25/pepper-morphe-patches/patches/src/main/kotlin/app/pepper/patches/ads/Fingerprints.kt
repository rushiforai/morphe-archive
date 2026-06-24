package app.pepper.patches.ads

import app.morphe.patcher.Fingerprint

/**
 * The renderer references the literal String "liveramp.com" — unique to this
 * method (Pubmatic external-user-ID setup) in the obfuscated v8.12.00 build.
 *
 * Renderer signature in vanilla 8.12.00:  d(Lbn9;Lha;)V
 *  - 2 reference params, both short obfuscated classes (Lbn9; and Lha;)
 *  - returns void (it's a binder, not a builder)
 */
internal object BannerAdRendererFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("liveramp.com"),
    custom = { method, _ ->
        method.parameterTypes.size == 2 &&
            method.parameterTypes.all {
                val s = it.toString()
                s.startsWith("L") && s.endsWith(";")
            }
    },
)
