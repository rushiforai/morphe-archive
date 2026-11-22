package dev.supperelias2.sbs.qol

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import dev.supperelias2.sbs.morphe.registerFeature
import dev.supperelias2.sbs.morphe.settingsPatch
import org.w3c.dom.Element

private const val MANAGER_DIAGNOSTICS = "Lcom/sbs/ondemand/player/viewmodels/PlayerManager;"
private val diagnosticsMobile640 = Compatibility(
    name = "SBS On Demand", packageName = "com.sbs.ondemand.android",
    apkFileType = ApkFileType.APKM, appIconColor = 0xDCBD1D,
    targets = listOf(AppTarget(version = "6.4.0", isExperimental = true))
)

@Suppress("unused")
val diagnosticsOverlayPatch = bytecodePatch(
    name = "Experimental: local playback diagnostics",
    description = "Adds an opt-in provider, resolution, bitrate and buffer overlay. Does not show stream URLs or account data.",
    default = true
) {
    category("Experimental")
    compatibleWith(diagnosticsMobile640)
    dependsOn(settingsPatch)
    execute {
        registerFeature("diagnostic_overlay")
        val method = Fingerprint(
            definingClass = MANAGER_DIAGNOSTICS, name = "initializePlayer", returnType = "V",
            parameters = listOf("Landroidx/media3/ui/PlayerView;")
        ).method
        method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }.reversed().forEach { index ->
                method.replaceInstruction(index, "invoke-static/range {p0 .. p0}, Ldev/supperelias2/sbs/morphe/features/DiagnosticsHooks;->onPlayerReady(Ljava/lang/Object;)V")
                method.addInstructions(index + 1, "return-void")
            }
    }
}

private val externalPlayerVisibilityPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement
            val existing = root.getElementsByTagName("queries")
            val queries = if (existing.length > 0) existing.item(0) as Element
                else document.createElement("queries").also(root::appendChild)
            // Android 11+ package visibility: only discover apps that handle video.
            val intent = document.createElement("intent")
            val action = document.createElement("action")
            action.setAttribute("android:name", "android.intent.action.VIEW")
            val data = document.createElement("data")
            data.setAttribute("android:mimeType", "video/*")
            intent.appendChild(action)
            intent.appendChild(data)
            queries.appendChild(intent)
        }
    }
}

@Suppress("unused")
val externalPlayerPatch = bytecodePatch(
    name = "Experimental: external direct-stream player",
    description = "Adds opt-in handoff of direct VOD to an installed video player. DRM content stays in SBS; session/format limitations can apply.",
    default = true
) {
    category("Experimental")
    compatibleWith(diagnosticsMobile640)
    dependsOn(settingsPatch, externalPlayerVisibilityPatch)
    execute {
        registerFeature("external_player")
        val method = Fingerprint(
            definingClass = MANAGER_DIAGNOSTICS, name = "loadAkamaiMedia", returnType = "V",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;")
        ).method
        method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }.reversed().forEach { index ->
                method.replaceInstruction(index, "invoke-static/range {p0 .. p0}, Ldev/supperelias2/sbs/morphe/features/ExternalPlayerHooks;->onDirectLoaded(Ljava/lang/Object;)V")
                method.addInstructions(index + 1, "return-void")
            }
    }
}
