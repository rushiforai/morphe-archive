package com.github.xtapped.patches.motioncam

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

private val MOTIONCAM_COMPATIBILITY = Compatibility(
    name = "MotionCam Pro Trial",
    packageName = "com.motioncam",
    apkFileType = ApkFileType.APKS,
    targets = listOf(
        AppTarget(
            version = "5.0.8-trial",
            versionCodes = mapOf(SupportedAbi.ARM64_V8A to 3308)
        )
    )
)

private object PhotoExportLimiterFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "L",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf(
        "trial_photo_export_limiter",
        "completed_photo_exports",
        "pending_photo_exports"
    )
)

private object LicenseFingerprint : Fingerprint(
    definingClass = "Lcom/motioncam/pro/CameraController;",
    name = "isLicensed",
    returnType = "Z",
    parameters = emptyList()
)

/*
 * Installer source spoofing adapted from Morphe's "Change installer source" patch.
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 */
private object InstallerSourceFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "performLocalInstallerCheck",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/pm/InstallSourceInfo;",
            name = "getInstallingPackageName",
            parameters = emptyList(),
            returnType = "Ljava/lang/String;"
        )
    )
)

private object MotionCamAssets

private fun ByteArray.findAll(pattern: ByteArray): List<Int> {
    if (pattern.isEmpty() || pattern.size > size) return emptyList()

    val matches = mutableListOf<Int>()
    for (start in 0..size - pattern.size) {
        var matchesPattern = true
        for (offset in pattern.indices) {
            if (this[start + offset] != pattern[offset]) {
                matchesPattern = false
                break
            }
        }
        if (matchesPattern) matches += start
    }
    return matches
}

private fun loadIconAsset(name: String): ByteArray {
    val path = "/motioncam/$name"
    return MotionCamAssets::class.java.getResourceAsStream(path)?.use { it.readBytes() }
        ?: throw PatchException("Missing bundled launcher icon asset: $path")
}

private fun Element.androidAttribute(name: String): String =
    getAttributeNS(ANDROID_NAMESPACE, name).ifEmpty { getAttribute("android:$name") }

private fun Element.setAndroidAttribute(name: String, value: String) {
    setAttribute("android:$name", value)
}

private fun Document.findElementByAndroidId(id: String): Element? {
    val elements = getElementsByTagName("*")
    for (index in 0 until elements.length) {
        val element = elements.item(index) as? Element ?: continue
        if (element.androidAttribute("id") == id) return element
    }
    return null
}

private val unlockProResourcesPatch = resourcePatch {
    execute {
        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")
            var renamed = false

            for (index in 0 until strings.length) {
                val element = strings.item(index) as? Element ?: continue
                if (element.getAttribute("name") != "app_name") continue

                element.textContent = "MotionCam Pro: RAW Capture"
                renamed = true
                break
            }

            if (!renamed) {
                throw PatchException("Could not find the app_name string resource")
            }
        }

        document("res/mipmap-anydpi/ic_launcher_background.xml").use { document ->
            val paths = document.getElementsByTagName("path")
            val background = (0 until paths.length)
                .asSequence()
                .mapNotNull { paths.item(it) as? Element }
                .firstOrNull()
                ?: throw PatchException("Could not find the launcher icon background path")

            background.setAndroidAttribute("fillColor", "#00253F")
        }

        document("res/layout/ui_settings_about.xml").use { document ->
            val version = document.findElementByAndroidId("@id/version")
                ?: throw PatchException("Could not find the About page version view")
            val parent = version.parentNode
                ?: throw PatchException("About page version view has no parent")

            val patched = document.createElement("TextView").apply {
                setAndroidAttribute("textAppearance", "@style/MotionCam.TextAppearance.Small.Bold")
                setAndroidAttribute("textColor", "@color/textColorSecondary")
                setAndroidAttribute("gravity", "center")
                setAndroidAttribute("layout_width", "fill_parent")
                setAndroidAttribute("layout_height", "wrap_content")
                setAndroidAttribute("layout_marginTop", "2.0dp")
                setAndroidAttribute("text", "PATCHED")
            }

            parent.insertBefore(patched, version.nextSibling)
        }

        listOf(
            "res/layout/camera.xml",
            "res/layout-land/camera.xml"
        ).forEach { layoutPath ->
            document(layoutPath).use { document ->
                val getProLink = document.findElementByAndroidId("@id/getProLink")
                    ?: throw PatchException("Could not find the Get Pro view in $layoutPath")

                getProLink.setAndroidAttribute("visibility", "gone")
                getProLink.setAndroidAttribute("layout_width", "0.0dp")
                getProLink.setAndroidAttribute("layout_height", "0.0dp")
                getProLink.setAndroidAttribute("padding", "0.0dp")
                getProLink.setAndroidAttribute("layout_marginTop", "0.0dp")
                getProLink.setAndroidAttribute("layout_marginEnd", "0.0dp")
                getProLink.setAndroidAttribute("clickable", "false")
                getProLink.setAndroidAttribute("focusable", "false")
                getProLink.setAndroidAttribute("importantForAccessibility", "no")
                getProLink.setAndroidAttribute("text", "")
            }
        }
    }
}

private val unlockProRawResourcesPatch = rawResourcePatch {
    execute {
        val library = get("lib/arm64-v8a/libnative-camera-host.so")
        val bytes = library.readBytes()
        val pattern = byteArrayOf(
            0x09, 0x28, 0x93.toByte(), 0xd2.toByte(),
            0x88.toByte(), 0x03, 0x08, 0xcb.toByte(),
            0x49, 0xfc.toByte(), 0xa8.toByte(), 0xf2.toByte(),
            0x29, 0x00, 0xc0.toByte(), 0xf2.toByte(),
            0x1f, 0x01, 0x09, 0xeb.toByte(),
            0x0b, 0x04, 0x00, 0x54,
            0x68, 0xee.toByte(), 0x41, 0xf9.toByte()
        )
        val matches = bytes.findAll(pattern)

        if (matches.size != 1) {
            throw PatchException("Could not uniquely locate the trial recording limit")
        }

        val branchOffset = matches.single() + 20
        byteArrayOf(0x20, 0x00, 0x00, 0x14).copyInto(bytes, branchOffset)
        library.writeBytes(bytes)

        mapOf(
            "mdpi" to "res/mipmap-mdpi",
            "hdpi" to "res/mipmap-hdpi",
            "xhdpi" to "res/mipmap-xhdpi",
            "xxhdpi" to "res/mipmap-xxhdpi",
            "xxxhdpi" to "res/mipmap-xxxhdpi"
        ).forEach { (density, resourceDirectory) ->
            val icon = loadIconAsset("ic_launcher_$density.webp")
            get("$resourceDirectory/ic_launcher_foreground.png").writeBytes(icon)
            get("$resourceDirectory/ic_launcher_monochrome.png").writeBytes(icon)
        }
    }
}

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Enable unlimited photo exports from captured RAW frames, remove the 5-second video recording limit, enable pro tools, apply patched MotionCam branding, and spoof the installer source as Google Play. Installer source spoofing adapted from Morphe.",
    default = true
) {
    compatibleWith(MOTIONCAM_COMPATIBILITY)
    dependsOn(unlockProResourcesPatch, unlockProRawResourcesPatch)

    execute {
        PhotoExportLimiterFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Lyd1;
                const/4 v1, 0x0
                invoke-direct {v0, p0, v1}, Lyd1;-><init>(Landroid/content/Context;Z)V
                return-object v0
            """
        )

        LicenseFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        val installerSourceCall = InstallerSourceFingerprint.instructionMatches.single()
        val installerSourceResultIndex = installerSourceCall.index + 1
        val installerSourceResult = InstallerSourceFingerprint.method
            .getInstruction<OneRegisterInstruction>(installerSourceResultIndex)

        if (installerSourceResult.opcode != Opcode.MOVE_RESULT_OBJECT) {
            throw PatchException("Unexpected installer source result instruction")
        }

        InstallerSourceFingerprint.method.replaceInstruction(
            installerSourceResultIndex,
            "const-string v${installerSourceResult.registerA}, \"com.android.vending\""
        )
    }
}
