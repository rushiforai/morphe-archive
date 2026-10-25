// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.patches.immich

import app.morphe.patcher.patch.*
import app.morphe.patches.shared.fonts.readTrueType
import java.security.MessageDigest

private val immich = Compatibility(name = "Immich", packageName = "app.alextran.immich",
    targets = listOf(AppTarget(version = "3.3.5")))

private object ImmichResources

val immichThemePatch = resourcePatch(
    name = "Immich Catppuccin",
    description = "Replace the light and dark palettes with Catppuccin Latte and Macchiato. Requires the supported arm64 build.",
    default = false,
) {
    compatibleWith(immich)
    execute {
        val path = "lib/arm64-v8a/libapp.so"
        require(listApkEntries("lib/").filter { it.endsWith("/libapp.so") } == listOf(path)) {
            "This Immich theme supports only the verified arm64 APK."
        }
        val file = get(path)
        val data = file.readBytes()
        val recipe = ImmichResources::class.java.classLoader
            .getResourceAsStream("catppuccin/immich/3.3.5-arm64.tsv")!!
            .bufferedReader().use { it.readLines() }.filter { it.isNotBlank() && !it.startsWith("#") }
        val sha = MessageDigest.getInstance("SHA-256").digest(data).joinToString("") { "%02x".format(it) }
        require(sha == recipe.first()) { "Immich's Flutter binary differs from the verified build; refusing to modify it." }
        fun hex(value: String) = value.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
        for (line in recipe.drop(1)) {
            val (address, beforeHex, afterHex) = line.split('\t')
            val offset = address.toInt(16)
            val before = hex(beforeHex)
            val after = hex(afterHex)
            require(before.size == after.size && offset + before.size <= data.size &&
                data.copyOfRange(offset, offset + before.size).contentEquals(before)) {
                "Immich theme patch precondition failed at $address."
            }
            after.copyInto(data, offset)
        }
        file.writeBytes(data)
    }
}

val immichCustomFontPatch = resourcePatch(
    name = "Immich custom font",
    description = "Replace the bundled interface fonts with your TTF. Repatch an original APK to change or remove it.",
    default = false,
) {
    compatibleWith(immich)
    val fontFile = filePathOption(key = "font-file", default = null, title = "Custom TTF font",
        description = "Choose a TTF for Immich.", required = true, allowedExtensions = listOf("ttf"))
    execute {
        val data = readTrueType(requireNotNull(fontFile.value) { "Choose a TTF font." })
        val root = get("assets/flutter_assets/fonts")
        val targets = listOf("GoogleSans", "GoogleSansCode").flatMap { family ->
            root.resolve(family).listFiles().orEmpty().filter { it.extension == "ttf" }
        }
        require(targets.size == 8) { "Immich's bundled font layout changed; refusing a partial font replacement." }
        targets.forEach { it.writeBytes(data) }
        // MaterialIcons is an icon font: replacing it would turn buttons into text glyphs.
    }
}
