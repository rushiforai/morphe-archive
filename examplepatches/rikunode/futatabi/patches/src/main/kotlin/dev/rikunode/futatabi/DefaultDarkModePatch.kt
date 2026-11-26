package dev.rikunode.futatabi

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val defaultDarkModeManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val app = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("futatabi: application manifest element missing")
            val provider = doc.createElement("provider")
            provider.setAttribute("android:name", "dev.rikunode.futatabi.bridge.DefaultDarkModeProvider")
            provider.setAttribute("android:authorities", manifest.getAttribute("package") + ".futatabi.theme")
            provider.setAttribute("android:exported", "false")
            provider.setAttribute("android:initOrder", "101")
            app.appendChild(provider)
        }
    }
}

@Suppress("unused")
val defaultDarkModePatch = bytecodePatch(
    name = "Default dark mode",
    description = "Use dark mode when the theme is unset. Preserve saved choices and allow changing the theme in settings.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "futatter", packageName = "com.Nanasaki.ftutter", apkFileType = ApkFileType.APK,
        targets = listOf(AppTarget(version = "3.1.1", versionCodes = mapOf(app.morphe.patcher.patch.SupportedAbi.ARM64_V8A to 65))),
    ))
    dependsOn(defaultDarkModeManifestPatch)
    extendWith("extensions/futatter.mpe")
    execute {}
}
