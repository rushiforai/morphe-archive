package app.stayfree.patches.shared.resource

import app.morphe.patcher.patch.resourcePatch

/**
 * `META-INF/services` files from the 20.18.2 base APK. Some split mergers / patch pipelines drop
 * them, and coroutines then dies on launch with "Module with the Main dispatcher is missing".
 */
private val serviceFiles = mapOf(
    "kotlinx.coroutines.internal.MainDispatcherFactory" to "kotlinx.coroutines.android.AndroidDispatcherFactory",
    "kotlinx.coroutines.CoroutineExceptionHandler" to "kotlinx.coroutines.android.AndroidExceptionPreHandler",
    "com.fasterxml.jackson.core.JsonFactory" to "com.fasterxml.jackson.core.JsonFactory",
    "com.fasterxml.jackson.core.ObjectCodec" to "com.fasterxml.jackson.databind.ObjectMapper",
    // shortcut: R8-renamed names valid for 20.18.2 only; re-read them from the base APK on retarget.
    "ox3" to "r14\npq3\nqn5",
    "r41" to "s41",
)

internal val restoreServiceFilesPatch = resourcePatch(
    description = "Restores the META-INF/services files that APK merge tools strip.",
) {
    execute {
        serviceFiles.forEach { (service, implementations) ->
            get("META-INF/services/$service").takeUnless { it.exists() }?.apply {
                parentFile.mkdirs()
                writeText("$implementations\n")
            }
        }
    }
}
