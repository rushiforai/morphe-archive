/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.warunglife

import app.fakh.patches.warunglife.shared.Constants.COMPATIBILITY_WARUNGLIFE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.rawResourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.airlift.compress.zstd.ZstdCompressor
import io.airlift.compress.zstd.ZstdDecompressor
import org.w3c.dom.Element
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder

private const val SUPABASE_RPC_URL = "https://vfeihrxdwynivqcksxwl.supabase.co/rest/v1/rpc/"
private const val SUPABASE_HMAC_SECRET = "286783789c42ce2d58436f6a42b7ea87f3eaa6ace75a188f"
private const val SUPABASE_INTEGRITY_URL = "https://vfeihrxdwynivqcksxwl.supabase.co/functions/v1/cek-integritas"
private const val PLAY_INTEGRITY_PLUGIN_META = "org.godotengine.plugin.v2.GodotPlayIntegrity"
private const val PLAY_INTEGRITY_CLASS = "Lcom/neopawstudio/playintegrity/GodotPlayIntegrity;"
private const val GODOT_IO_CLASS = "Lorg/godotengine/godot/GodotIO;"
private const val SKIPPABLE_MAGIC = 0x184D2A50

/**
 * Replaces Godot 4 Variant string constants (type 4, uint32 length + 4-byte padded UTF-8) with empty strings inside a
 * compressed version-101 `.gdc` file, keeping the file at its original compressed size with a zstd skippable frame.
 */
private fun clearScriptStrings(file: File, vararg targets: String) {
    val script = file.readBytes()
    val header = ByteBuffer.wrap(script).order(ByteOrder.LITTLE_ENDIAN)
    if (script.size < 21 || String(script, 0, 4, Charsets.US_ASCII) != "GDSC" || header.getInt(4) != 101 || header.getInt(8) == 0) {
        throw PatchException("Warung Life: ${file.name} is not a compressed version 101 GDScript.")
    }
    var edited = ByteArray(header.getInt(8))
    ZstdDecompressor().decompress(script, 12, script.size - 12, edited, 0, edited.size)

    val emptyVariant = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN).putInt(4).putInt(0).array()
    for (target in targets) {
        val targetBytes = target.toByteArray(Charsets.UTF_8)
        val paddedLen = (targetBytes.size + 3) and 3.inv()
        val needle = ByteBuffer.allocate(8 + paddedLen).order(ByteOrder.LITTLE_ENDIAN)
            .putInt(4)
            .putInt(targetBytes.size)
            .put(targetBytes)
            .array()

        val matches = (0..edited.size - needle.size).filter { start ->
            needle.indices.all { edited[start + it] == needle[it] }
        }
        if (matches.size != 1) {
            throw PatchException("Warung Life: expected one occurrence of $target in ${file.name}, found ${matches.size}.")
        }
        val at = matches[0]
        edited = edited.copyOfRange(0, at) + emptyVariant + edited.copyOfRange(at + needle.size, edited.size)
    }

    val compressor = ZstdCompressor()
    val encoded = ByteArray(compressor.maxCompressedLength(edited.size))
    val encodedSize = compressor.compress(edited, 0, edited.size, encoded, 0, encoded.size)
    val padding = script.size - 12 - encodedSize
    if (padding < 8) {
        throw PatchException("Warung Life: no room to keep ${file.name} at its original size (padding=$padding).")
    }

    val out = ByteBuffer.allocate(script.size).order(ByteOrder.LITTLE_ENDIAN)
        .put(script, 0, 8)
        .putInt(edited.size)
        .put(encoded, 0, encodedSize)
        .putInt(SKIPPABLE_MAGIC)
        .putInt(padding - 8)
        .array()

    val readBack = ByteArray(edited.size)
    ZstdDecompressor().decompress(out, 12, encodedSize, readBack, 0, readBack.size)
    if (!readBack.contentEquals(edited)) {
        throw PatchException("Warung Life: the repacked ${file.name} does not read back.")
    }
    file.writeBytes(out)
}

/**
 * Unregisters `GodotPlayIntegrity` so `cek_integritas.gdc` treats Play Integrity as unavailable and returns at once
 * without calling Google Play or posting to `/functions/v1/cek-integritas`.
 */
private val playIntegrityManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val entries = manifest.getElementsByTagName("meta-data")
            (0 until entries.length).map { entries.item(it) as Element }
                .filter { it.getAttribute("android:name") == PLAY_INTEGRITY_PLUGIN_META }
                .forEach { it.parentNode.removeChild(it) }
        }
    }
}

/**
 * Clears the Supabase RPC endpoint in `analitik.gdc` and `papan_online.gdc` (plus `/functions/v1/cek-integritas` in
 * `cek_integritas.gdc` on 1.3+). `HTTPRequest.request` rejects relative paths synchronously with no network traffic,
 * blocking analytics, crash reports (`lapor_crash_grafis`), device-ID leaderboard/anti-cheat RPCs (`kirim_skor7`,
 * `catat_hp_warung`, `cek_hp_1_3`, `cek_sita`, `catat_sita`) and unlinked device backups (`cadangan_simpan`), while
 * leaving Google cloud save (`akun_online.gdc`) intact.
 */
private val telemetryScriptsPatch = rawResourcePatch {
    execute {
        clearScriptStrings(get("assets/scripts/analitik.gdc"), SUPABASE_RPC_URL)
        clearScriptStrings(get("assets/scripts/papan_online.gdc"), SUPABASE_RPC_URL, SUPABASE_HMAC_SECRET)
        val integrity = get("assets/scripts/cek_integritas.gdc")
        if (integrity.exists()) {
            clearScriptStrings(integrity, SUPABASE_INTEGRITY_URL)
        }
    }
}

/**
 * Stops Warung Life from calling home with analytics, crash reports, Play Integrity tokens, or device-ID telemetry,
 * and replaces `Settings.Secure.ANDROID_ID` in `GodotIO` with a random per-install hex ID.
 */
@Suppress("unused")
val warungLifeDisableAnalyticsPatch = patch(
    name = "Disable analytics",
    description = "Turns off analytics, crash reporting, Play Integrity checks, and device-ID telemetry, and spoofs " +
        "the Android device ID. Google cloud save still works.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WARUNGLIFE)
    category("Privacy")
    extendWith("extensions/extension.mpe")
    dependsOn(playIntegrityManifestPatch, telemetryScriptsPatch)

    execute {
        val godotIo = mutableClassDefBy(GODOT_IO_CLASS)

        // Never read the real Settings.Secure.ANDROID_ID in GodotIO.<init>.
        val ctor = godotIo.methods.singleOrNull { it.name == "<init>" && it.implementation != null }
            ?: throw PatchException("Warung Life: GodotIO.<init> not found.")
        val instructions = ctor.implementation!!.instructions.toList()
        val getStringIndex = instructions.indexOfFirst { inst ->
            val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference ?: return@indexOfFirst false
            ref.definingClass == "Landroid/provider/Settings\$Secure;" && ref.name == "getString"
        }
        if (getStringIndex < 0 || getStringIndex + 1 >= instructions.size ||
            instructions[getStringIndex + 1].opcode != Opcode.MOVE_RESULT_OBJECT
        ) {
            throw PatchException("Warung Life: Settings.Secure.getString call not found in GodotIO.<init>.")
        }
        val destReg = (instructions[getStringIndex + 1] as OneRegisterInstruction).registerA
        ctor.replaceInstruction(getStringIndex, "nop")
        ctor.replaceInstruction(getStringIndex + 1, "const-string v$destReg, \"\"")

        // Return a persistent random per-install 16-hex-char ID from GodotIO.getUniqueID().
        val getUniqueId = godotIo.methods.singleOrNull {
            it.name == "getUniqueID" && it.parameterTypes.isEmpty() && it.implementation != null
        } ?: throw PatchException("Warung Life: GodotIO.getUniqueID not found.")
        getUniqueId.addInstructions(
            0,
            """
                invoke-direct { p0 }, $GODOT_IO_CLASS->getContext()Landroid/content/Context;
                move-result-object v0
                invoke-static { v0 }, Lapp/fakh/extension/warunglife/DeviceId;->get(Landroid/content/Context;)Ljava/lang/String;
                move-result-object v0
                return-object v0
            """,
        )

        // Belt-and-suspenders stub for Play Integrity plugin (1.3+).
        classDefByOrNull(PLAY_INTEGRITY_CLASS)?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.name == "minta_token" && it.implementation != null }
                .forEach { it.addInstructions(0, "return-void") }
        }
    }
}
