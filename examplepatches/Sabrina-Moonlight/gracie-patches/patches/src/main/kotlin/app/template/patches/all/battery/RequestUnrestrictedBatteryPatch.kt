package app.template.patches.all.battery

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import org.w3c.dom.Element
import java.util.logging.Logger

private const val BATTERY_PERMISSION =
    "android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"

private const val HELPER =
    "Lapp/template/extension/shared/BatteryUnrestrictedHelper;"

/** Adds the permission to the manifest. Not listed in Morphe UI. */
private val addBatteryOptimizationPermissionPatch = resourcePatch {
    execute {
        val logger = Logger.getLogger("battery.permission")
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
 * One universal patch: permission + dialog on start.
 */
@Suppress("unused")
val requestUnrestrictedBatteryPatch = bytecodePatch(
    name = "Request unrestricted battery",
    description = "Asks for unrestricted battery when the app starts.",
    default = false,
) {
    extendWith("extensions/extension.mpe")
    dependsOn(addBatteryOptimizationPermissionPatch)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        var injected = 0

        // 1) Application.onCreate if the app defines one
        classDefForEach { classDef ->
            if (classDef.superclass != "Landroid/app/Application;") return@classDefForEach
            val onCreate = classDef.methods.firstOrNull {
                it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.isEmpty()
            } ?: return@classDefForEach
            val mutableMethod = mutableClassDefBy(classDef).methods.first {
                it.name == onCreate.name &&
                    it.parameterTypes == onCreate.parameterTypes &&
                    it.returnType == onCreate.returnType
            }
            injectHelperCall(mutableMethod)
            injected++
        }

        // 2) Fallback: every Activity.onCreate (covers apps without custom Application.onCreate)
        if (injected == 0) {
            classDefForEach { classDef ->
                var superName: String? = classDef.superclass
                var isActivity = false
                // shallow check: direct Activity or AppCompatActivity common supers
                if (superName == "Landroid/app/Activity;" ||
                    superName == "Landroidx/appcompat/app/AppCompatActivity;" ||
                    superName == "Landroid/support/v7/app/AppCompatActivity;"
                ) {
                    isActivity = true
                }
                if (!isActivity) return@classDefForEach
                val onCreate = classDef.methods.firstOrNull {
                    it.name == "onCreate" &&
                        it.returnType == "V" &&
                        it.parameterTypes.size == 1 &&
                        it.parameterTypes[0] == "Landroid/os/Bundle;"
                } ?: return@classDefForEach
                val mutableMethod = mutableClassDefBy(classDef).methods.first {
                    it.name == onCreate.name &&
                        it.parameterTypes == onCreate.parameterTypes &&
                        it.returnType == onCreate.returnType
                }
                injectHelperCall(mutableMethod)
                injected++
            }
        }

        if (injected == 0) {
            logger.warning("No Application/Activity onCreate found — battery request not injected")
        } else {
            logger.info("Unrestricted-battery request injected into $injected method(s)")
        }
    }
}

private fun injectHelperCall(method: MutableMethod) {
    method.addInstructions(
        0,
        """
            invoke-static {p0}, $HELPER->requestIfNeeded(Landroid/content/Context;)V
        """.trimIndent(),
    )
}
