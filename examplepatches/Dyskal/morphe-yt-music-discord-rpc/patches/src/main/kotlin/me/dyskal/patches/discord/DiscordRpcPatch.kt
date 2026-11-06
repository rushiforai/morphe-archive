package me.dyskal.patches.discord

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private const val EXTENSION_CLASS = "Lme/dyskal/ytmrpc/DiscordRpcPatch;"

internal fun mediaSessionCallbackInstruction(instruction: Instruction, callback: String): String {
    val register = when (instruction.opcode) {
        Opcode.INVOKE_VIRTUAL -> (instruction as FiveRegisterInstruction).let {
            require(it.registerCount == 2) { "Expected MediaSession receiver and one argument" }
            it.registerD
        }
        Opcode.INVOKE_VIRTUAL_RANGE -> (instruction as RegisterRangeInstruction).let {
            require(it.registerCount == 2) { "Expected MediaSession receiver and one argument" }
            it.startRegister + 1
        }
        else -> throw PatchException("Expected a MediaSession virtual setter call, found ${instruction.opcode}")
    }
    return "invoke-static/range {v$register .. v$register}, $EXTENSION_CLASS->$callback"
}

private val discordResourcesPatch = resourcePatch {
    execute {
        get("assets").mkdirs()
        get("assets/dyskal_discord_notices.txt").writeText(discordNoticesText())
        if (!get(ADD_ON_PREFERENCES).exists()) {
            get(ADD_ON_PREFERENCES).writeText("""<morphe-add-on-preferences xmlns:android="http://schemas.android.com/apk/res/android"/>""")
        }
        document(ADD_ON_PREFERENCES).use { addDiscordPreferences(it) }
        document("AndroidManifest.xml").use { manifest ->
            val queries = manifest.getElementsByTagName("queries").item(0)
                ?: manifest.createElement("queries").also { manifest.documentElement.appendChild(it) }
            queries.appendChild(manifest.createElement("intent").apply {
                appendChild(manifest.createElement("action").apply {
                    setAttribute("android:name", "android.support.customtabs.action.CustomTabsService")
                })
            })
            val application = manifest.getElementsByTagName("application").item(0)
            val activity = manifest.createElement("activity").apply {
                setAttribute("android:name", "me.dyskal.ytmrpc.DiscordOAuthActivity")
                setAttribute("android:exported", "true")
                setAttribute("android:excludeFromRecents", "true")
                setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            }
            val filter = manifest.createElement("intent-filter")
            fun child(tag: String, attribute: String, value: String) {
                filter.appendChild(manifest.createElement(tag).apply { setAttribute(attribute, value) })
            }
            child("action", "android:name", "android.intent.action.VIEW")
            child("category", "android:name", "android.intent.category.DEFAULT")
            child("category", "android:name", "android.intent.category.BROWSABLE")
            filter.appendChild(manifest.createElement("data").apply {
                setAttribute("android:scheme", "ytmdiscord")
                setAttribute("android:host", "oauth2")
                setAttribute("android:path", "/callback")
            })
            activity.appendChild(filter)
            application.appendChild(activity)
        }
    }

    finalize {
        if (!get("res/xml/morphe_prefs.xml").exists()) {
            throw PatchException("Discord RPC requires the official Morphe Settings patch (Morphe Patches 2.0.0 or later). Apply both bundles together.")
        }
    }
}

@Suppress("unused")
val discordRpcPatch = bytecodePatch(
    name = "Discord rich presence",
    description = "Adds Discord rich presence, cover art, and clickable music links. Configure it under Morphe → Misc → Discord rich presence. Requires official Morphe Settings (2.0.0+).",
    default = true
) {
    dependsOn(discordResourcesPatch)
    compatibleWith(Compatibility(
        name = "YouTube Music",
        packageName = "com.google.android.apps.youtube.music",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0xFF0000,
        targets = listOf("9.43.51", "9.42.52", "9.41.52")
            .map { AppTarget(version = it, minSdk = 26, isExperimental = true) } +
                listOf("9.30.53", "9.20.53", "9.15.51")
                    .map { AppTarget(version = it, minSdk = 26, isExperimental = false) }
    ))
    extendWith("extensions/discord.mpe")
    execute {
        installNativeMetadataHook()
        MusicApplicationOnCreateFingerprint.method.addInstruction(
            0, "invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->initialize(Landroid/content/Context;)V"
        )
        for ((fingerprint, callback) in listOf(
            MediaSessionSetMetadataFingerprint to "onSetMetadata(Landroid/media/MediaMetadata;)V",
            MediaSessionSetPlaybackStateFingerprint to "onSetPlaybackState(Landroid/media/session/PlaybackState;)V"
        )) {
            // Resolve against the current method: an earlier insertion may have shifted its indexes.
            fingerprint.clearMatch()
            val index = fingerprint.instructionMatches.first().index
            fingerprint.method.addInstruction(index,
                mediaSessionCallbackInstruction(fingerprint.method.getInstruction(index), callback))
        }
    }
}
