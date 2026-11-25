package app.salaat.patches.integrity

import app.morphe.patcher.patch.resourcePatch

private const val REFLECT = "kotlin.reflect.jvm.internal.impl"

/**
 * kotlin-reflect finds its own implementations through `ServiceLoader`, so it needs these
 * `META-INF/services` files. Tools that merge split APKs into one universal APK often drop them.
 * Without them, every ktor response parse throws "No MetadataExtensions instances found".
 * The online city search (the only search that understands Arabic) and the official Moroccan
 * timetable download then fail silently, and the app falls back to calculated times and
 * Latin-only device geocoding.
 */
private val serviceFiles = mapOf(
    "$REFLECT.km.internal.extensions.MetadataExtensions" to listOf(
        "$REFLECT.km.jvm.internal.JvmMetadataExtensions",
    ),
    "$REFLECT.builtins.BuiltInsLoader" to listOf(
        "$REFLECT.serialization.deserialization.builtins.BuiltInsLoaderImpl",
    ),
    "$REFLECT.resolve.ExternalOverridabilityCondition" to listOf(
        "$REFLECT.load.java.FieldOverridabilityCondition",
        "$REFLECT.load.java.ErasedOverridabilityCondition",
        "$REFLECT.load.java.JavaIncompatibilityRulesOverridabilityCondition",
    ),
)

internal val restoreServiceFilesPatch = resourcePatch(
    description = "Restores the kotlin-reflect META-INF/services files that APK merge tools strip.",
) {
    execute {
        // shortcut: implementation names are verified against 6.4.1 only; re-check them on retarget,
        // since a stale name is a ServiceConfigurationError at runtime, not a patch failure.
        serviceFiles.forEach { (service, implementations) ->
            get("META-INF/services/$service").takeUnless { it.exists() }?.apply {
                parentFile.mkdirs()
                writeText(implementations.joinToString("\n", postfix = "\n"))
            }
        }
    }
}
