package app.morphe.bilibili

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private class Marker
private val resources = resourcePatch {
    execute {
        val icons = listOf("", "_bold", "_fluent", "_phosphor", "_phosphor_light", "_phosphor_fill", "_phosphor_duotone", "_ionicons", "_sharp")
        for (suffix in icons) {
            val name = "morphe_bilibili_danmaku_button_on$suffix.xml"
            val target = this["res/drawable/$name"]
            target.parentFile.mkdirs()
            Marker::class.java.getResourceAsStream("/$name")!!.use { input -> target.outputStream().use { input.copyTo(it) } }
        }
        document("AndroidManifest.xml").use { doc ->
            val activity = doc.createElement("activity")
            activity.setAttribute("android:name", "app.morphe.extension.youtube.bilibilidanmaku.BilibiliXmlPickerActivity")
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            doc.getElementsByTagName("application").item(0).appendChild(activity)
        }
        val prefs = this["morphe_addon_prefs.xml"]
        if (!prefs.exists()) prefs.writeText("""<morphe-add-on-preferences xmlns:android="http://schemas.android.com/apk/res/android"/>""")
        document("morphe_addon_prefs.xml").use { doc ->
            val screen = doc.createElement("screen")
            screen.setAttribute("key", "morphe_overlay_buttons_screen")
            val preference = doc.createElement("SwitchPreference")
            preference.setAttribute("android:key", "morphe_bilibili_danmaku_overlay_button")
            preference.setAttribute("android:title", "B站弹幕按钮")
            preference.setAttribute("android:defaultValue", "true")
            screen.appendChild(preference)
            doc.documentElement.appendChild(screen)
        }
    }
}

@Suppress("unused")
val bilibiliDanmakuPatch = bytecodePatch(
    name = "Bilibili danmaku",
    description = "Bilibili danmaku add-on; requires the official Morphe YouTube patches."
) {
    compatibleWith(Compatibility(name = "YouTube", packageName = "com.google.android.youtube", targets = listOf(AppTarget(version = "21.30.216", minSdk = 29))))
    dependsOn(resources)
    extendWith("extensions/bilibili-danmaku.mpe")
    finalize {
        // Separate bundles have separate patch class loaders. Check the actual
        // injected hooks instead of running another copy of the official patches.
        val required = mutableSetOf("initializeButton", "initializeLegacyButton", "videoIdChanged", "videoTimeChanged")
        classDefForEach { cls ->
            if (required.isNotEmpty() && !cls.type.startsWith("Lapp/morphe/extension/")) {
                cls.methods.forEach { method ->
                    method.implementation?.instructions?.forEach { instruction ->
                        val target = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        if (target?.definingClass == "Lapp/morphe/extension/youtube/addon/AddOnApi;") required.remove(target.name)
                    }
                }
            }
        }
        if (required.isNotEmpty()) throw PatchException(
            "Bilibili danmaku requires official patches Mute button and SponsorBlock (missing hooks: ${required.joinToString()})."
        )
        val manager = mutableClassDefByOrNull("Lapp/morphe/extension/youtube/addon/AddOnManager;")
            ?: throw PatchException("Bilibili danmaku requires the official Morphe YouTube patches with Add-on support.")
        val register = manager.methods.firstOrNull { it.name == "registerAddOns" && it.parameterTypes.isEmpty() }
            ?: throw PatchException("Official Morphe Add-on registration hook was not found.")
        register.addInstruction(0, "invoke-static {}, Lapp/morphe/extension/youtube/bilibilidanmaku/BilibiliDanmakuAddOn;->register()V")
    }
}
