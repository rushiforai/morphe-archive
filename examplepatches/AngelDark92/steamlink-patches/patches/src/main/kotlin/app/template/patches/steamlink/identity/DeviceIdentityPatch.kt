package app.template.patches.steamlink.identity

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_BEFORE_LATEST
import app.template.patches.shared.Constants.isNativeXrSteamLinkBuild
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

/** Change only the outward model in the runtime-selected HMD entries. */
internal fun patchHmdModelIdentity(json: String, profile: String): String {
    val model = when (profile) {
        "stock-no-change", "Stock identity (no change)",
        "samsung-default", "Samsung Galaxy XR (default, no change)" -> return json
        "samsung-galaxy-xr", "Samsung Galaxy XR" -> return patchNativeGalaxyIdentity(json)
        "meta-quest-pro", "Meta Quest Pro" -> "Oculus Quest Pro"
        "pico-4-pro", "PICO 4 Pro" -> "PICO 4 Pro"
        else -> throw PatchException("Unknown device identity profile: $profile")
    }

    // Legacy baselines identify Galaxy XR explicitly; native stock falls back to "unknown".
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

@Suppress("unused")
val deviceIdentityPatch = rawResourcePatch(
    name = "Device identity",
    description = "Overrides the HMD identity reported to SteamVR. The Galaxy profile installs its " +
        "complete transport identity while preserving stock controller/hand routing and extensions.",
    default = true,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_BEFORE_LATEST.toTypedArray())
    // Morphe executes dependencies without checking their compatibility. The legacy foundation is
    // therefore build-aware and becomes a mutation no-op on native builds, while older builds retain the
    // same automatic XR baseline that Device identity historically installed.
    dependsOn(xrDeviceConfigBaselinePatch)

    val profile by stringOption(
        key = "profile",
        default = "samsung-galaxy-xr",
        values = mapOf(
            "Samsung Galaxy XR" to "samsung-galaxy-xr",
            "Stock identity (no change)" to "stock-no-change",
            "Meta Quest Pro" to "meta-quest-pro",
            "PICO 4 Pro" to "pico-4-pro",
        ),
        title = "HMD identity",
        description = "Native-XR builds: installs the full Galaxy transport identity or an explicit model spoof while preserving stock XR routing. Legacy builds retain their verified payloads.",
        required = true,
    )

    execute {
        val file = get("assets/config/hmd_config.json")
        val selectedProfile = profile ?: throw PatchException("HMD identity profile is required")
        if (!isNativeXrSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            val fileName = when (selectedProfile) {
                "stock-no-change", "Stock identity (no change)",
                "samsung-default", "Samsung Galaxy XR (default, no change)",
                "samsung-galaxy-xr", "Samsung Galaxy XR" -> return@execute
                "meta-quest-pro", "Meta Quest Pro" -> "hmd_config_meta_quest_pro.json"
                "pico-4-pro", "PICO 4 Pro" -> "hmd_config_pico_4_pro.json"
                else -> throw PatchException("Unknown device identity profile: $selectedProfile")
            }
            file.writeBytes(identityResource(fileName))
            return@execute
        }

        val original = file.readText()
        val patched = patchHmdModelIdentity(original, selectedProfile)
        if (patched != original) file.writeText(patched)
    }
}
