package app.plyrs1.patches.com_garnesapps_strukpom

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_STRUKPOM
import org.w3c.dom.Element

// Internal resource patch: name = null hides it from the user patch selection in Morphe Manager/CLI,
// but it is automatically executed when disableStartupPermissionsPatch runs.
private val disableStartupPermissionsResourcePatch = resourcePatch(
    name = null,
    description = "Internal: Strips unnecessary permissions from AndroidManifest.xml and adds IMAGE_CAPTURE intent query.",
    default = true
) {
    compatibleWith(COMPATIBILITY_STRUKPOM)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement

            // 1. Remove unnecessary permissions that trigger unwanted dialogs
            val permissionsToRemove = setOf(
                "android.permission.CAMERA",
                "android.permission.READ_MEDIA_VISUAL_USER_SELECTED",
                "android.permission.READ_EXTERNAL_STORAGE",
                "android.permission.WRITE_EXTERNAL_STORAGE"
            )

            val usesPermissions = manifest.getElementsByTagName("uses-permission")
            val toRemove = mutableListOf<Element>()
            for (i in 0 until usesPermissions.length) {
                val elem = usesPermissions.item(i) as? Element ?: continue
                val name = elem.getAttribute("android:name")
                if (name in permissionsToRemove) {
                    toRemove.add(elem)
                }
            }
            toRemove.forEach { manifest.removeChild(it) }

            // 2. Ensure <queries> contains <intent><action android:name="android.media.action.IMAGE_CAPTURE"/></intent>
            // for package visibility on Android 11+ (API 30+)
            var queries = manifest.getElementsByTagName("queries").item(0) as? Element
            if (queries == null) {
                queries = doc.createElement("queries")
                manifest.appendChild(queries)
            }

            val intentElem = doc.createElement("intent")
            val actionElem = doc.createElement("action")
            actionElem.setAttribute("android:name", "android.media.action.IMAGE_CAPTURE")
            intentElem.appendChild(actionElem)
            queries.appendChild(intentElem)
        }
    }
}

@Suppress("unused")
val disableStartupPermissionsPatch = bytecodePatch(
    name = "Disable Startup Permissions",
    description = "Suppresses indiscriminate startup requests for camera and storage permissions, and configures manifest for direct system camera capture.",
    default = true
) {
    compatibleWith(COMPATIBILITY_STRUKPOM)
    dependsOn(disableStartupPermissionsResourcePatch)
    dependsOn(brandCreditPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // In MenuActivity.<init>():
        // Append bytecode to replace permissionLauncherMultiple with NoOpPermissionLauncher.
        // When MenuActivity.onCreate() later calls permissionLauncherMultiple.launch(...),
        // it invokes NoOpPermissionLauncher.launch(...) which suppresses the system dialog.
        MenuActivityInitFingerprint.method.addInstructions(
            """
                new-instance v0, Lapp/plyrs1/extension/NoOpPermissionLauncher;
                invoke-direct {v0}, Lapp/plyrs1/extension/NoOpPermissionLauncher;-><init>()V
                iput-object v0, p0, Lcom/garnesapps/strukpom/MenuActivity;->permissionLauncherMultiple:Landroidx/activity/result/ActivityResultLauncher;
            """
        )
    }
}
