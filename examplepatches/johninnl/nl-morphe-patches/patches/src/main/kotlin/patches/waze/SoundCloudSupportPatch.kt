package patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element
import patches.waze.Constants.COMPATIBILITY_WAZE

private const val SOUNDCLOUD_EXTENSION = "Lapp/wazeytm/extension/waze/SoundCloudSupportPatch;"

private val soundCloudVisibility = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val queries = (manifest.getElementsByTagName("queries").item(0) as? Element)
                ?: manifest.createElement("queries").also(manifest.documentElement::appendChild)
            val existing = queries.getElementsByTagName("package")
            if ((0 until existing.length).none {
                (existing.item(it) as Element).getAttribute("android:name") == "com.soundcloud.android"
            }) queries.appendChild(manifest.createElement("package").apply {
                setAttribute("android:name", "com.soundcloud.android")
            })
        }
    }
}

@Suppress("unused")
val soundCloudSupportPatch = bytecodePatch(
    name = "SoundCloud in Waze",
    description = "Adds SoundCloud to Waze's built-in audio player. Show list displays the signed-in " +
        "Feed and playable mixes, not the personal Library. SoundCloud Home recommendations are not included.",
    default = true
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(soundCloudVisibility)
    extendWith(EXTENSION_PATH)

    execute {
        val sc = discoverSoundCloudSdk()
        UpdateAppListFingerprint.let {
            val result = it.instructionMatches[1]
            val register = result.getInstruction<OneRegisterInstruction>().registerA
            it.method.addInstruction(result.index + 1,
                "invoke-static/range { v$register .. v$register }, $SOUNDCLOUD_EXTENSION->onSdkConfigurationLoaded(Lcom/waze/sdk/SdkConfiguration;)V")
        }
        val availability = sc.availability
        if (availability.implementation!!.registerCount < 2)
            throw PatchException("SoundCloud availability hook requires a local register")
        availability.addInstructionsWithLabels(0, """
            invoke-static/range { p0 .. p0 }, $SOUNDCLOUD_EXTENSION->availability(Landroid/content/Intent;)I
            move-result v0
            if-ltz v0, :original_receiver_check
            return v0
        """, ExternalLabel("original_receiver_check", availability.implementation!!.instructions.first()))
        sc.start.addInstruction(0,
            "invoke-static/range { p1 .. p3 }, $SOUNDCLOUD_EXTENSION->prepare(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V")
        val watchdog = sc.start.implementation!!.instructions.indexOfFirst {
            val call = (it as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == "Landroid/os/Handler;" && call.name == "postDelayed"
        }
        if (watchdog < 0) throw PatchException("SoundCloud startup watchdog missing")
        val after = watchdog + if (sc.start.implementation!!.instructions.getOrNull(watchdog + 1)?.opcode == Opcode.MOVE_RESULT) 2 else 1
        sc.start.addInstruction(after, "invoke-static {}, $SOUNDCLOUD_EXTENSION->finishStart()V")
        for ((method, hook) in listOf(sc.sdk.connected to "onBrowserConnected",
            sc.failed to "onBrowserLost", sc.suspended to "onBrowserLost")) {
            method.addInstruction(0, "invoke-static/range { p0 .. p0 }, $SOUNDCLOUD_EXTENSION->$hook(Ljava/lang/Object;)V")
        }
        val rootCall = sc.sdk.connected.implementation!!.instructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.toString() == sc.rootGetter.toString()
        }
        if (rootCall < 0 || sc.sdk.connected.getInstruction(rootCall + 1).opcode != Opcode.MOVE_RESULT_OBJECT)
            throw PatchException("SoundCloud browser root result missing")
        val register = sc.sdk.connected.getInstruction<OneRegisterInstruction>(rootCall + 1).registerA
        sc.sdk.connected.addInstruction(rootCall + 2,
            "invoke-static/range { v$register .. v$register }, $SOUNDCLOUD_EXTENSION->browseRoot(Ljava/lang/String;)Ljava/lang/String;")
        sc.sdk.connected.addInstruction(rootCall + 3, "move-result-object v$register")
    }
}
