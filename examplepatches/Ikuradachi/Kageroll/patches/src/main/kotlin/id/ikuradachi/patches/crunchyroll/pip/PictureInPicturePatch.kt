package id.ikuradachi.patches.crunchyroll.pip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

private val PLAYBACK_ACTIVITIES = setOf(
    "com.crunchyroll.watchscreen.screen.WatchScreenActivity",
    "com.crunchyroll.watchscreen.screen.offline.OfflineWatchScreenActivity",
    "com.crunchyroll.watchscreen.screen.xr.AdaptiveWatchScreenActivity",
)

private val REQUIRED_CONFIG_CHANGES = listOf(
    "screenSize",
    "smallestScreenSize",
    "screenLayout",
    "orientation",
)

private fun Element.getAndroidAttr(name: String): String {
    val qname = "android:$name"
    if (hasAttribute(qname)) return getAttribute(qname)
    if (hasAttributeNS(ANDROID_NS, name)) return getAttributeNS(ANDROID_NS, name)
    return ""
}

private fun Element.setAndroidAttr(name: String, value: String) {
    setAttributeNS(ANDROID_NS, "android:$name", value)
}

private val pictureInPictureManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            val matched = mutableSetOf<String>()
            for (i in 0 until activities.length) {
                val activity = activities.item(i) as? Element ?: continue
                val rawName = activity.getAndroidAttr("name")
                val resolvedName = when {
                    rawName.startsWith(".") -> "com.crunchyroll.crunchyroid$rawName"
                    !rawName.contains(".") -> "com.crunchyroll.crunchyroid.$rawName"
                    else -> rawName
                }
                if (resolvedName in PLAYBACK_ACTIVITIES) {
                    matched += resolvedName

                    val existingConfig = activity.getAndroidAttr("configChanges")
                    val tokens = existingConfig.split("|").map { it.trim() }.filter { it.isNotEmpty() }
                    val mergedConfig = (tokens + REQUIRED_CONFIG_CHANGES).distinct().joinToString("|")

                    activity.setAndroidAttr("configChanges", mergedConfig)
                    activity.setAndroidAttr("supportsPictureInPicture", "true")
                    activity.setAndroidAttr("resizeableActivity", "true")
                }
            }
            check(matched.containsAll(PLAYBACK_ACTIVITIES)) {
                "Missing expected playback activities in manifest: ${PLAYBACK_ACTIVITIES - matched}"
            }
        }
    }
}

@Suppress("unused")
val pictureInPicturePatch = bytecodePatch(
    name = "Picture-in-Picture",
    description = "Enables native Picture-in-Picture playback support.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    dependsOn(pictureInPictureManifestPatch)

    execute {
        // 1. Force PipConfigImpl._isEnabled = true so DI instantiates PictureInPictureManager instead of NoOp stub
        val pipConfigClass = PipConfigFingerprint.matchAll(1..1).single().classDef
        var patchedConstructors = 0
        for (method in pipConfigClass.methods) {
            val params = method.parameterTypes.map { it.toString() }
            if (method.name == "<init>" && (params == listOf("I") || params == listOf("I", "Z"))) {
                val iput = method.implementation?.instructions
                    ?.filterIsInstance<ReferenceInstruction>()
                    ?.firstOrNull { it.opcode == Opcode.IPUT_BOOLEAN } ?: continue
                val fieldRef = iput.reference
                method.addInstructions(
                    1,
                    """
                        const/4 p1, 0x1
                        iput-boolean p1, p0, $fieldRef
                        return-void
                    """.trimIndent(),
                )
                patchedConstructors++
            }
        }
        check(patchedConstructors >= 2) {
            "Expected at least 2 PipConfigImpl constructors to be patched, found $patchedConstructors"
        }

        // 2. Unlock PictureInPictureManager.isEnabled()
        val match = PictureInPictureIsEnabledFingerprint.matchAll(1..1).single()
        val implementation = requireNotNull(match.method.implementation) {
            "Missing implementation for PictureInPictureManager.isEnabled"
        }
        check(implementation.registerCount >= 1) {
            "Unexpected register count in PictureInPictureManager.isEnabled: ${implementation.registerCount}"
        }
        match.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
