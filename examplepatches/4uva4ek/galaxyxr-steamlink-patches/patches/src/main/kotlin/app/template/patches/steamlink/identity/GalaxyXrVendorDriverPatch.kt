package app.template.patches.steamlink.identity

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.buildLabel

/**
 * Identity for the resource-only SteamVR driver `galaxyxr` (Galaxy XR VRLink Setup on the PC).
 *
 * Valve's vendor layout (openvr wiki, "Steam Link Integration for External Vendors") lets a
 * resource-only driver supply icons, input profiles and render models that the headset refers to
 * through `{galaxyxr}/...` paths. This patch edits only the three runtime-selected HMD entries and
 * the two Touch controller entries plus the grip offset in the two config assets; every unrelated
 * byte, including line endings, stays as it was. Measured constraints of driver_vrlink.dll
 * (SteamVR 2.18.3): the controller type must stay `oculus_touch`, and the hand is parsed from the
 * `(Left Controller)` / `(Right Controller)` suffix of the model number.
 */

internal const val VENDOR_DRIVER_NAME = "galaxyxr"
internal const val TOUCH_PROFILE = "/interaction_profiles/oculus/touch_controller"
internal const val DEFAULT_OFFSET_POSITION_CM = "-0.7,0.279,-5.279"
internal const val DEFAULT_OFFSET_ROTATION_DEG = "1.4,0,0"

private val hmdEntryKeys = listOf("xrvst2", "xrvst2ue", "unknown")

// ---------------------------------------------------------------------------
// Byte-preserving JSON helpers (object ranges and direct-member value replacement)
// ---------------------------------------------------------------------------

/** Range of the `{...}` value of `"key":` found directly inside [start, endExclusive). */
private fun objectValueRange(json: String, key: String, start: Int, endExclusive: Int): IntRange? {
    val matches = Regex("\\\"${Regex.escape(key)}\\\"\\s*:")
        .findAll(json, start)
        .takeWhile { it.range.first < endExclusive }
        .filter { depthAt(json, start, it.range.first) == 0 }
        .toList()
    if (matches.size > 1) throw PatchException("Duplicate JSON member '$key'")
    val match = matches.singleOrNull() ?: return null
    var objectStart = match.range.last + 1
    while (objectStart < endExclusive && json[objectStart].isWhitespace()) objectStart++
    if (objectStart >= endExclusive || json[objectStart] != '{') {
        throw PatchException("JSON member '$key' is not an object")
    }
    var depth = 0
    var inString = false
    var escaped = false
    for (index in objectStart until endExclusive) {
        val c = json[index]
        if (inString) {
            when {
                escaped -> escaped = false
                c == '\\' -> escaped = true
                c == '"' -> inString = false
            }
            continue
        }
        when (c) {
            '"' -> inString = true
            '{' -> depth++
            '}' -> {
                depth--
                if (depth == 0) return objectStart..index
            }
        }
    }
    throw PatchException("Unterminated JSON object '$key'")
}

/** Brace/bracket depth of [index] relative to [start] (strings are skipped). */
private fun depthAt(json: String, start: Int, index: Int): Int {
    var depth = 0
    var inString = false
    var escaped = false
    for (i in start until index) {
        val c = json[i]
        if (inString) {
            when {
                escaped -> escaped = false
                c == '\\' -> escaped = true
                c == '"' -> inString = false
            }
            continue
        }
        when (c) {
            '"' -> inString = true
            '{', '[' -> depth++
            '}', ']' -> depth--
        }
    }
    return depth
}

/** Direct member of the document's root object. */
private fun rootObject(json: String, key: String): IntRange? {
    val root = json.indexOf('{')
    if (root < 0) throw PatchException("Not a JSON object")
    return objectValueRange(json, key, root + 1, json.length)
}

/** The direct members of an object are those at depth 1 relative to its opening brace. */
private fun directMember(json: String, obj: IntRange, key: String): MatchResult {
    val matches = Regex("\\\"${Regex.escape(key)}\\\"\\s*:")
        .findAll(json, obj.first + 1)
        .takeWhile { it.range.first < obj.last }
        .filter { depthAt(json, obj.first, it.range.first) == 1 }
        .toList()
    if (matches.size > 1) throw PatchException("Duplicate JSON member '$key'")
    return matches.singleOrNull() ?: throw PatchException("Missing JSON member '$key'")
}

private val jsonString = Regex("\\s*\\\"((?:[^\\\"\\\\\\x00-\\x1f]|\\\\(?:[\\\"\\\\/bfnrt]|u[0-9a-fA-F]{4}))*)\\\"")
private val jsonNumber = Regex("\\s*(-?(?:0|[1-9][0-9]*)(?:\\.[0-9]+)?(?:[eE][+-]?[0-9]+)?)")

private fun replaceStringMember(json: String, obj: IntRange, key: String, value: String): String {
    val member = directMember(json, obj, key)
    val m = jsonString.matchAt(json, member.range.last + 1)
        ?: throw PatchException("JSON member '$key' is not a string")
    val g = m.groups[1]!!.range
    val escaped = value.replace("\\", "\\\\").replace("\"", "\\\"")
    return json.replaceRange(g.first, g.last + 1, escaped)
}

private fun replaceNumberMember(json: String, obj: IntRange, key: String, value: Double): String {
    val member = directMember(json, obj, key)
    val m = jsonNumber.matchAt(json, member.range.last + 1)
        ?: throw PatchException("JSON member '$key' is not a number")
    val g = m.groups[1]!!.range
    return json.replaceRange(g.first, g.last + 1, formatNumber(value))
}

internal fun formatNumber(value: Double): String {
    if (value.isNaN() || value.isInfinite()) throw PatchException("Offset value must be finite")
    val text = java.math.BigDecimal(value).setScale(5, java.math.RoundingMode.HALF_UP)
        .stripTrailingZeros().toPlainString()
    return if ('.' in text) text else "$text.0"
}

internal fun parseTriple(raw: String?, what: String): DoubleArray {
    val parts = (raw ?: "").split(',').map { it.trim() }
    if (parts.size != 3) throw PatchException("$what must be three comma-separated numbers, got '$raw'")
    return DoubleArray(3) { i ->
        parts[i].toDoubleOrNull() ?: throw PatchException("$what component ${i + 1} is not a number: '${parts[i]}'")
    }
}

// ---------------------------------------------------------------------------
// Config edits
// ---------------------------------------------------------------------------

/** HMD identity for the `galaxyxr` driver in every runtime-selected entry that exists. */
internal fun patchHmdConfigForVendorDriver(json: String): String {
    val staticProps = rootObject(json, "staticProps")
        ?: throw PatchException("Missing staticProps object in hmd_config.json")
    // The runtime falls back to `unknown`; every build we patch has it.
    objectValueRange(json, "unknown", staticProps.first + 1, staticProps.last)
        ?: throw PatchException("Missing HMD identity entry 'unknown'")
    var patched = json
    hmdEntryKeys.forEach { key ->
        val sp = rootObject(patched, "staticProps")!!
        if (objectValueRange(patched, key, sp.first + 1, sp.last) == null) return@forEach
        listOf(
            "sTrackingSystem" to "SamsungVST",
            "sSerialNumber" to "VRLINKHMDGALAXYXR",
            "sManufacturerName" to "Samsung",
            "sModelNumber" to "Galaxy XR",
            "sRenderModelName" to "generic_hmd",
            "sResourceRoot" to VENDOR_DRIVER_NAME,
            "sInputProfilePath" to "{$VENDOR_DRIVER_NAME}/input/galaxy_xr_hmd_profile.json",
            "sControllerType" to "galaxy_xr_hmd",
            "sDeviceType" to "SamsungVST/VRLINKHMDGALAXYXR",
        ).forEach { (member, value) ->
            // Re-resolve the entry after each edit: lengths change.
            val sp2 = rootObject(patched, "staticProps")!!
            val entry2 = objectValueRange(patched, key, sp2.first + 1, sp2.last)!!
            patched = replaceStringMember(patched, entry2, member, value)
        }
    }
    return patched
}

/** Touch controller identity for the `galaxyxr` driver and the calibrated grip offset. */
internal fun patchControllerConfigForVendorDriver(
    json: String,
    offsetPositionCm: DoubleArray,
    offsetRotationDeg: DoubleArray,
): String {
    var patched = json
    for (side in listOf("left", "right")) {
        val fields = listOf(
            "sTrackingSystem" to "SamsungVST",
            "sSerialNumber" to "SamsungVST-Controller_${side.replaceFirstChar { it.uppercase() }}",
            "sManufacturerName" to "Samsung",
            "sModelNumber" to "Galaxy XR (${side.replaceFirstChar { it.uppercase() }} Controller)",
            "sRenderModelName" to "{$VENDOR_DRIVER_NAME}/rendermodels/vst_controller_$side",
            "sResourceRoot" to VENDOR_DRIVER_NAME,
            "sInputProfilePath" to "{$VENDOR_DRIVER_NAME}/input/samsung_input_profile.json",
            "sControllerType" to "oculus_touch",
            "sDeviceType" to "SamsungVST/SamsungVST-Controller_${side.replaceFirstChar { it.uppercase() }}",
        )
        fields.forEach { (member, value) ->
            val staticProps = rootObject(patched, "staticProps")
                ?: throw PatchException("Missing staticProps object in controller_config.json")
            val profile = objectValueRange(patched, TOUCH_PROFILE, staticProps.first + 1, staticProps.last)
                ?: throw PatchException("Missing $TOUCH_PROFILE in controller_config.json staticProps")
            val hand = objectValueRange(patched, side, profile.first + 1, profile.last)
                ?: throw PatchException("Missing '$side' entry in $TOUCH_PROFILE")
            patched = replaceStringMember(patched, hand, member, value)
        }
    }
    val axes = listOf("x", "y", "z")
    for ((group, values) in listOf("position" to offsetPositionCm.map { it / 100.0 }, "rotation" to offsetRotationDeg.toList())) {
        axes.forEachIndexed { i, axis ->
            val poseAction = rootObject(patched, "poseAction")
                ?: throw PatchException("Missing poseAction object in controller_config.json")
            val profile = objectValueRange(patched, TOUCH_PROFILE, poseAction.first + 1, poseAction.last)
                ?: throw PatchException("Missing $TOUCH_PROFILE in controller_config.json poseAction")
            val offset = objectValueRange(patched, "offset", profile.first + 1, profile.last)
                ?: throw PatchException("Missing offset in $TOUCH_PROFILE poseAction")
            val vector = objectValueRange(patched, group, offset.first + 1, offset.last)
                ?: throw PatchException("Missing offset.$group in $TOUCH_PROFILE poseAction")
            patched = replaceNumberMember(patched, vector, axis, values[i])
        }
    }
    return patched
}

internal fun isVendorDriverTarget(packageName: String, version: String, code: String): Boolean =
    COMPATIBILITIES_STEAM_LINK.any { compatibility ->
        compatibility.packageName == packageName && compatibility.targets.any { target ->
            target.version == version && target.versionCodes?.values?.any { it.toString() == code } == true
        }
    }

@Suppress("unused")
val galaxyXrVendorDriverPatch = rawResourcePatch(
    name = "Galaxy XR SteamVR driver (galaxyxr)",
    description = "Sets Galaxy XR names in SteamVR; needs the PC-side Galaxy XR VRLink Setup. " +
        buildLabel(COMPATIBILITIES_STEAM_LINK),
    default = false,
) {
    category(PatchCategories.APP_AND_DEVICE_IDENTITY)
    compatibleWith(*COMPATIBILITIES_STEAM_LINK.toTypedArray())
    // Independent source: rewrite the existing Galaxy/fallback entries directly.
    // Do not import the upstream Device identity payload or its XR foundation patches.

    val offsetPositionCm by stringOption(
        key = "offsetPositionCm",
        default = DEFAULT_OFFSET_POSITION_CM,
        title = "Grip offset position (cm, x,y,z)",
        description = "Offsets the controller position from your grip point, in cm: x right, y up, z backward " +
            "(negative = forward). Default is calibrated on Galaxy XR. Stock Quest Touch value is -0.7,-3.416,-9.607.",
        required = true,
    )
    val offsetRotationDeg by stringOption(
        key = "offsetRotationDeg",
        default = DEFAULT_OFFSET_ROTATION_DEG,
        title = "Grip offset rotation (deg, x,y,z)",
        description = "Rotates the controller model around your grip point, in degrees: x pitch, y yaw, z roll. " +
            "Stock Quest Touch value is -20.6,0,0.",
        required = true,
    )

    execute {
        if (!isVendorDriverTarget(packageMetadata.packageName, packageMetadata.versionName,
                packageMetadata.versionCode)) return@execute
        val position = parseTriple(offsetPositionCm, "Grip offset position")
        val rotation = parseTriple(offsetRotationDeg, "Grip offset rotation")

        val hmd = get("assets/config/hmd_config.json")
        val hmdOriginal = hmd.readText()
        val hmdPatched = patchHmdConfigForVendorDriver(hmdOriginal)

        val controllers = get("assets/config/controller_config.json")
        val controllersOriginal = controllers.readText()
        val controllersPatched = patchControllerConfigForVendorDriver(controllersOriginal, position, rotation)
        // Validate both assets and all options before writing either asset.
        if (hmdPatched != hmdOriginal) hmd.writeText(hmdPatched)
        if (controllersPatched != controllersOriginal) controllers.writeText(controllersPatched)
    }
}
