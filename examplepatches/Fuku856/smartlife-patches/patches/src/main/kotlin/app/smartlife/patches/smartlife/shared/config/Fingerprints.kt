package app.smartlife.patches.smartlife.shared.config

import app.morphe.patcher.Fingerprint

/**
 * The PackConfig getter: reads a public static field of com.smart.app.ThingNGConfig (the app's
 * build-time feature flags) by name through reflection and caches the Field. Every flag read
 * (is_ai_assistant_support, is_admob_support, firebase_analytics_enable, ...) goes through it.
 *
 * 7.12.0: ihl.a(String, Class)Object      7.12.6: j0t.a(Class, String)Object
 *
 * Matched by its "PackConfig" log tag plus the (Class, String) -> Object shape in either
 * parameter order, which is all that survives obfuscation. The sibling method that resolves the
 * ThingNGConfig class also logs "PackConfig" but returns Class, so it is excluded.
 */
internal object PackConfigGetterFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("PackConfig"),
    custom = { method, _ ->
        method.parameterTypes.map { it.toString() }.sorted() ==
            listOf("Ljava/lang/Class;", "Ljava/lang/String;")
    },
)

/**
 * The combined boolean flag getter: PackConfig value (as the default), then the remote
 * "oem:config" value from the Tangram config service, which can override it.
 *
 * 7.12.0: hhl.a(String, boolean)boolean   7.12.6: i0t.a(String, boolean)boolean
 */
internal object RemoteConfigBooleanFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Z"),
    strings = listOf("oem:config"),
)
