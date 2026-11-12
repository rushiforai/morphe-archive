package app.template.patches.all.battery

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import org.w3c.dom.Element
import java.util.logging.Logger

private const val BATTERY_PERMISSION =
    "android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"

private const val HELPER =
    "Lapp/template/extension/shared/BatteryUnrestrictedHelper;"

/**
 * Adds the battery-optimization request permission to the manifest (if missing).
 * Used only as a dependency of [requestUnrestrictedBatteryPatch].
 */
@Suppress("unused")
val addBatteryOptimizationPermissionPatch = resourcePatch(
    name = "Add battery optimization permission (internal)",
    description = "Adds REQUEST_IGNORE_BATTERY_OPTIMIZATIONS to the manifest.",
    default = false,
) {
    execute {
        val logger = Logger.getLogger(this::class.java.name)
        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement
            val existing = root.getElementsByTagName("uses-permission")
            for (i in 0 until existing.length) {
                val el = existing.item(i) as? Element ?: continue
                val name = el.getAttribute("android:name").ifEmpty {
                    el.getAttributeNS("http://schemas.android.com/apk/res/android", "name")
                }
                if (name == BATTERY_PERMISSION) {
                    logger.info("Battery optimization permission already present")
                    return@use
                }
            }

            val perm = document.createElement("uses-permission")
            perm.setAttribute("android:name", BATTERY_PERMISSION)
            // Insert near other uses-permission nodes, before <application>
            val application = root.getElementsByTagName("application").item(0)
            if (application != null) {
                root.insertBefore(perm, application)
            } else {
                root.appendChild(perm)
            }
            logger.info("Added $BATTERY_PERMISSION to manifest")
        }
    }
}

/**
 * Universal: when the app starts, shows the system dialog asking for
 * unrestricted battery (ignore battery optimizations), if it is not already granted.
 *
 * Injects a call into Application.onCreate and adds the required permission.
 */
@Suppress("unused")
val requestUnrestrictedBatteryPatch = bytecodePatch(
    name = "Request unrestricted battery",
    description = "On app start, shows the system dialog to allow unrestricted battery " +
        "(ignore battery optimizations) if it is not already allowed.",
    default = false,
) {
    extendWith("extensions/extension.mpe")
    dependsOn(addBatteryOptimizationPermissionPatch)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val target = findApplicationOnCreate()
        if (target == null) {
            logger.warning("No Application.onCreate found. No changes applied.")
            return@execute
        }

        val (_, onCreate) = target
        // p0 is the Application instance (a Context). Helper is safe no-op on failure.
        onCreate.addInstructions(
            0,
            """
                invoke-static {p0}, $HELPER->requestIfNeeded(Landroid/content/Context;)V
            """.trimIndent(),
        )
        logger.info("Unrestricted-battery request injected into Application.onCreate")
    }
}

/** First Application subclass that declares onCreate()V, or null. */
private fun app.morphe.patcher.patch.BytecodePatchContext.findApplicationOnCreate():
    Pair<MutableClass, MutableMethod>? {
    var result: Pair<MutableClass, MutableMethod>? = null
    classDefForEach { classDef ->
        if (classDef.superclass != "Landroid/app/Application;") return@classDefForEach
        val onCreate = classDef.methods.firstOrNull {
            it.name == "onCreate" &&
                it.returnType == "V" &&
                it.parameterTypes.isEmpty()
        } ?: return@classDefForEach
        if (result == null) {
            val mutableClass = mutableClassDefBy(classDef)
            val mutableMethod = mutableClass.methods.first {
                it.name == onCreate.name &&
                    it.parameterTypes == onCreate.parameterTypes &&
                    it.returnType == onCreate.returnType
            }
            result = mutableClass to mutableMethod
        }
    }
    return result
}
