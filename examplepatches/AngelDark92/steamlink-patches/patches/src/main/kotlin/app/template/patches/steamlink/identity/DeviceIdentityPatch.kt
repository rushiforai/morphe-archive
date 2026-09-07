package app.template.patches.steamlink.identity

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.shared.Constants.isLegacyRecommendedSteamLinkBuild
import app.template.patches.shared.Constants.isNativeXrSteamLinkBuild
import app.template.patches.steamlink.androidxr.adaptLegacyHmdConfigForBuild
import app.template.patches.steamlink.androidxr.xrDeviceConfigBaselinePatch

private fun identityResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/identity/$name")
        ?: error("Missing bundled resource: steamlink/identity/$name"))
        .use { it.readBytes() }

private val galaxyIdentityEntries = listOf("unknown", "xrvst2ue", "xrvst2")

private fun findObjectValueRange(json: String, key: String, start: Int, endExclusive: Int): IntRange? {
    val matches = Regex("\\\"${Regex.escape(key)}\\\"\\s*:")
        .findAll(json, start)
        .takeWhile { it.range.first < endExclusive }
        .toList()
    if (matches.size > 1) {
        throw PatchException("Duplicate HMD identity entry '$key'")
    }
    val match = matches.singleOrNull() ?: return null
    var objectStart = match.range.last + 1
    while (objectStart < endExclusive && json[objectStart].isWhitespace()) objectStart++
    if (objectStart >= endExclusive || json[objectStart] != '{') {
        throw PatchException("HMD identity entry '$key' is not an object")
    }

    var depth = 0
    var inString = false
    var escaped = false
    for (index in objectStart until endExclusive) {
        val character = json[index]
        if (inString) {
            when {
                escaped -> escaped = false
                character == '\\' -> escaped = true
                character == '"' -> inString = false
            }
            continue
        }
        when (character) {
            '"' -> inString = true
            '{' -> depth++
            '}' -> {
                depth--
                if (depth == 0) return objectStart..index
            }
        }
    }
    throw PatchException("Unterminated HMD identity entry '$key'")
}

private fun lineIndentAt(json: String, index: Int): String {
    val lineStart = json.lastIndexOf('\n', index - 1).let { if (it < 0) 0 else it + 1 }
    return json.substring(lineStart, index).takeWhile { it == ' ' || it == '\t' }
}

private fun galaxyIdentityObject(indent: String, newline: String): String {
    val fieldIndent = "$indent  "
    return listOf(
        "{",
        "${fieldIndent}\"sTrackingSystem\": \"androidxr\",",
        "${fieldIndent}\"sSerialNumber\": \"VRLINKHMDGALAXYXR\",",
        "${fieldIndent}\"sManufacturerName\": \"Samsung\",",
        "${fieldIndent}\"sModelNumber\": \"Galaxy XR\",",
        "${fieldIndent}\"sRenderModelName\": \"{galaxyxrresources}/rendermodels/galaxy_xr_hmd\",",
        "${fieldIndent}\"sResourceRoot\": \"galaxyxrresources\",",
        "${fieldIndent}\"sInputProfilePath\": \"{galaxyxrresources}/input/galaxy_xr_hmd_profile.json\",",
        "${fieldIndent}\"flLaserMouseHmdAngleDegrees\": 0,",
        "${fieldIndent}\"sControllerType\": \"galaxy_xr_hmd\",",
        "${fieldIndent}\"sDeviceType\": \"androidxr/VRLINKHMDGALAXYXR\"",
        "$indent}",
    ).joinToString(newline)
}

/**
 * Upsert the complete Galaxy XR transport identity into native-XR HMD entries.
 *
 * Valve's native builds already contain the correct OpenXR extensions, vendor profiles, head
 * offsets, and controller/hand routing. Only the three runtime-selected HMD entries are replaced;
 * every unrelated byte of hmd_config.json remains untouched.
 */
internal fun patchNativeGalaxyIdentity(json: String): String {
    val staticPropsMatch = Regex("\\\"staticProps\\\"\\s*:").find(json)
        ?: throw PatchException("Missing staticProps object")
    val initialStaticProps = findObjectValueRange(
        json,
        "staticProps",
        staticPropsMatch.range.first,
        json.length,
    ) ?: throw PatchException("Missing staticProps object")
    val newline = if (json.contains("\r\n")) "\r\n" else "\n"
    val parentIndent = lineIndentAt(json, staticPropsMatch.range.first)
    val entryIndent = "$parentIndent  "

    // Validate all existing target entries before constructing a result. This keeps malformed or
    // duplicate layouts atomic: either every requested identity is committed, or none is returned.
    galaxyIdentityEntries.forEach { key ->
        findObjectValueRange(json, key, initialStaticProps.first + 1, initialStaticProps.last)
    }

    var patched = json
    galaxyIdentityEntries.forEach { key ->
        val staticProps = findObjectValueRange(patched, "staticProps", 0, patched.length)
            ?: throw PatchException("Missing staticProps object")
        val existing = findObjectValueRange(
            patched,
            key,
            staticProps.first + 1,
            staticProps.last,
        )
        val identityObject = galaxyIdentityObject(entryIndent, newline)
        patched = if (existing != null) {
            patched.replaceRange(existing, identityObject)
        } else {
            val insertion = "$newline$entryIndent\"$key\": $identityObject,"
            patched.replaceRange(staticProps.first + 1, staticProps.first + 1, insertion)
        }
    }
    return patched
}

/** Validate before range edits; do not normalize or serialize the caller's JSON. */
private fun validateSpoofIdentityJson(json: String) {
    var position = 0
    fun invalid(): Nothing = throw PatchException("Malformed HMD config JSON at offset $position")
    fun whitespace() {
        while (position < json.length && json[position] in " \t\r\n") position++
    }
    fun string(): String {
        if (position >= json.length || json[position++] != '"') invalid()
        val decoded = StringBuilder()
        while (position < json.length) {
            val character = json[position++]
            when {
                character == '"' -> return decoded.toString()
                character == '\\' -> {
                    if (position >= json.length) invalid()
                    when (val escape = json[position++]) {
                        '"', '\\', '/' -> decoded.append(escape)
                        'b' -> decoded.append('\b')
                        'f' -> decoded.append('\u000c')
                        'n' -> decoded.append('\n')
                        'r' -> decoded.append('\r')
                        't' -> decoded.append('\t')
                        'u' -> {
                            if (position + 4 > json.length) invalid()
                            val digits = json.substring(position, position + 4)
                            if (digits.any { it !in "0123456789abcdefABCDEF" }) invalid()
                            decoded.append(digits.toInt(16).toChar())
                            position += 4
                        }
                        else -> invalid()
                    }
                }
                character < ' ' -> invalid()
                else -> decoded.append(character)
            }
        }
        invalid()
    }
    val number = Regex("-?(?:0|[1-9][0-9]*)(?:\\.[0-9]+)?(?:[eE][+-]?[0-9]+)?")
    val literalTargetKeys = (galaxyIdentityEntries + listOf("staticProps", "sModelNumber")).toSet()
    fun value(depth: Int) {
        if (depth > 128) invalid()
        whitespace()
        if (position >= json.length) invalid()
        when (json[position]) {
            '{' -> {
                position++
                whitespace()
                val keys = mutableSetOf<String>()
                if (position < json.length && json[position] == '}') {
                    position++
                    return
                }
                while (true) {
                    whitespace()
                    val keyStart = position
                    val key = string()
                    if (!keys.add(key)) throw PatchException("Duplicate JSON property '$key'")
                    // The byte-range editor intentionally accepts only literal target names.
                    // Escaped aliases would otherwise be missed and a semantic duplicate inserted.
                    if (key in literalTargetKeys && '\\' in json.substring(keyStart, position)) {
                        throw PatchException("Escaped HMD identity property '$key' is unsupported")
                    }
                    whitespace()
                    if (position >= json.length || json[position++] != ':') invalid()
                    value(depth + 1)
                    whitespace()
                    if (position >= json.length) invalid()
                    when (json[position++]) {
                        '}' -> return
                        ',' -> Unit
                        else -> invalid()
                    }
                }
            }
            '[' -> {
                position++
                whitespace()
                if (position < json.length && json[position] == ']') {
                    position++
                    return
                }
                while (true) {
                    value(depth + 1)
                    whitespace()
                    if (position >= json.length) invalid()
                    when (json[position++]) {
                        ']' -> return
                        ',' -> Unit
                        else -> invalid()
                    }
                }
            }
            '"' -> string()
            't', 'f', 'n' -> {
                val token = when (json[position]) { 't' -> "true"; 'f' -> "false"; else -> "null" }
                if (!json.startsWith(token, position)) invalid()
                position += token.length
            }
            else -> {
                val match = number.matchAt(json, position) ?: invalid()
                position = match.range.last + 1
            }
        }
    }
    value(0)
    whitespace()
    if (position != json.length) invalid()
}

/** Change only the outward model in the runtime-selected HMD entries. */
internal fun patchHmdModelIdentity(
    json: String,
    profile: String,
    exactProductLookup: Boolean = false,
): String {
    val model = when (profile) {
        "stock-no-change", "Stock identity (no change)",
        "samsung-default", "Samsung Galaxy XR (default, no change)" -> return json
        "samsung-galaxy-xr", "Samsung Galaxy XR" -> return patchNativeGalaxyIdentity(json)
        "meta-quest-pro", "Meta Quest Pro" -> "Oculus Quest Pro"
        "pico-4-pro", "PICO 4 Pro" -> "PICO 4 Pro"
        else -> throw PatchException("Unknown device identity profile: $profile")
    }

    if (!exactProductLookup) {
        // Preserve the verified older-build output exactly; only 5002322 needs product upserts.
        val targetKeys = if (Regex("\\\"xrvst2\\\"\\s*:").containsMatchIn(json)) {
            listOf("xrvst2", "xrvst2ue", "unknown")
        } else {
            listOf("unknown")
        }
        return targetKeys.fold(json) { current, key ->
            val entryAndModel = Regex(
                "(?s)(\\\"${Regex.escape(key)}\\\"\\s*:\\s*\\{.*?" +
                    "\\\"sModelNumber\\\"\\s*:\\s*\\\")([^\\\"]*)(\\\")",
            )
            val match = entryAndModel.find(current)
                ?: throw PatchException("Missing HMD identity entry '$key' or sModelNumber")
            current.replaceRange(match.groups[2]!!.range, model)
        }
    }

    validateSpoofIdentityJson(json)
    val staticProps = findObjectValueRange(json, "staticProps", 0, json.length)
        ?: throw PatchException("Missing staticProps object")
    val unknown = findObjectValueRange(json, "unknown", staticProps.first + 1, staticProps.last)
        ?: throw PatchException("Missing HMD identity entry 'unknown'")
    val newline = if (json.contains("\r\n")) "\r\n" else "\n"
    val entryIndent = lineIndentAt(json, unknown.first)

    fun withModel(entry: String, key: String): String {
        val property = Regex("\\\"sModelNumber\\\"\\s*:").findAll(entry).toList()
        if (property.size != 1) {
            throw PatchException("Expected exactly one sModelNumber in HMD identity entry '$key'")
        }
        val valueStart = property.single().range.last + 1
        val stringValue = Regex("\\s*\\\"(?:[^\\\"\\\\\\x00-\\x1f]|\\\\(?:[\\\"\\\\/bfnrt]|u[0-9a-fA-F]{4}))*\\\"")
            .matchAt(entry, valueStart)
            ?: throw PatchException("Invalid sModelNumber in HMD identity entry '$key'")
        val remainder = entry.substring(stringValue.range.last + 1).trimStart()
        if (!remainder.startsWith(',') && !remainder.startsWith('}')) {
            throw PatchException("Invalid sModelNumber terminator in HMD identity entry '$key'")
        }
        var depth = 0
        var inString = false
        var escaped = false
        entry.take(property.single().range.first).forEach { character ->
            if (inString) {
                when {
                    escaped -> escaped = false
                    character == '\\' -> escaped = true
                    character == '"' -> inString = false
                }
            } else {
                when (character) {
                    '"' -> inString = true
                    '{', '[' -> depth++
                    '}', ']' -> depth--
                }
            }
        }
        if (depth != 1) throw PatchException("Missing direct sModelNumber in HMD identity entry '$key'")
        val quoteStart = entry.indexOf('"', valueStart)
        return entry.replaceRange(quoteStart + 1, stringValue.range.last, model)
    }

    // Native 5002322 selects staticProps by the exact product name, without consulting
    // unknown on a miss. Clone that template for missing products; keep existing product
    // fields and every unrelated byte intact. Validate every target before constructing output.
    val template = withModel(json.substring(unknown), "unknown")
    val edits = galaxyIdentityEntries.mapNotNull { key ->
        findObjectValueRange(json, key, staticProps.first + 1, staticProps.last)?.let { range ->
            range to withModel(json.substring(range), key)
        }
    }
    val missing = galaxyIdentityEntries.filter { key ->
        findObjectValueRange(json, key, staticProps.first + 1, staticProps.last) == null
    }
    var patched = json
    edits.sortedByDescending { it.first.first }.forEach { (range, replacement) ->
        patched = patched.replaceRange(range, replacement)
    }
    if (missing.isNotEmpty()) {
        val additions = missing.joinToString("") { key ->
            "$newline$entryIndent\"$key\": $template,"
        }
        patched = patched.replaceRange(staticProps.first + 1, staticProps.first + 1, additions)
    }
    return patched
}

// Resolve per execution: patch options are shared objects, so setting the Quest Pro option
// while declaring a legacy bundle would also change the native 5002318 recommendation.
internal fun resolveDeviceIdentityProfile(profile: String, version: String, versionCode: String): String =
    if (profile == "recommended") {
        if (isLegacyRecommendedSteamLinkBuild(version, versionCode)) "meta-quest-pro" else "samsung-galaxy-xr"
    } else {
        profile
    }

@Suppress("unused")
val deviceIdentityPatch = rawResourcePatch(
    name = "Device identity",
    description = "Overrides the HMD identity reported to SteamVR. Recommended selects Meta Quest Pro " +
        "for exact legacy bundle targets through 5002244, including 2.0.20/5001712; otherwise Galaxy XR. The Galaxy profile installs its " +
        "complete transport identity while preserving stock controller/hand routing and extensions. " +
        "Optional on 2.0.22/5002322; explicit Quest Pro and Pico profiles populate exact Galaxy XR product entries.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK.toTypedArray())
    // Morphe executes dependencies without checking their compatibility. The legacy foundation is
    // therefore build-aware and becomes a mutation no-op on native builds, while older builds retain the
    // same automatic XR baseline that Device identity historically installed.
    dependsOn(xrDeviceConfigBaselinePatch)

    val profile by stringOption(
        key = "profile",
        default = "recommended",
        values = mapOf(
            "Recommended for this build (legacy Quest Pro / native Galaxy XR)" to "recommended",
            "Samsung Galaxy XR" to "samsung-galaxy-xr",
            "Stock identity (no change)" to "stock-no-change",
            "Meta Quest Pro" to "meta-quest-pro",
            "PICO 4 Pro" to "pico-4-pro",
        ),
        title = "HMD identity",
        description = "Recommended uses Meta Quest Pro on exact legacy bundle targets through 5002244 (including 5001712), and Galaxy XR otherwise. Explicit profiles override that choice. Native-XR routing and verified legacy payloads are preserved.",
        required = true,
    )

    execute {
        val file = get("assets/config/hmd_config.json")
        val selectedProfile = resolveDeviceIdentityProfile(
            profile ?: throw PatchException("HMD identity profile is required"),
            packageMetadata.versionName,
            packageMetadata.versionCode,
        )
        if (!isNativeXrSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            val fileName = when (selectedProfile) {
                "stock-no-change", "Stock identity (no change)",
                "samsung-default", "Samsung Galaxy XR (default, no change)",
                "samsung-galaxy-xr", "Samsung Galaxy XR" -> return@execute
                "meta-quest-pro", "Meta Quest Pro" -> "hmd_config_meta_quest_pro.json"
                "pico-4-pro", "PICO 4 Pro" -> "hmd_config_pico_4_pro.json"
                else -> throw PatchException("Unknown device identity profile: $selectedProfile")
            }
            file.writeBytes(
                adaptLegacyHmdConfigForBuild(
                    identityResource(fileName),
                    packageMetadata.versionName,
                    packageMetadata.versionCode,
                ),
            )
            return@execute
        }

        val original = file.readText()
        val patched = patchHmdModelIdentity(
            original,
            selectedProfile,
            exactProductLookup = packageMetadata.versionName == "2.0.22" &&
                packageMetadata.versionCode == "5002322",
        )
        if (patched != original) file.writeText(patched)
    }
}
