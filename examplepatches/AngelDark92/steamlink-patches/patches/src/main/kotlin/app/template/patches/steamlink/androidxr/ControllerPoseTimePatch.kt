package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.intSliderOption
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.buildLabel
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

internal const val CONTROLLER_POSE_TIME_LIBRARY = "libgxr_controller_pose_time.so"
internal const val CONTROLLER_POSE_TIME_MANIFEST = "XR_APILAYER_local_GalaxyXR_controller_pose_time.json"
internal const val CONTROLLER_POSE_TIME_CONFIG_MAGIC = "GXRPTMCFG0000001"
internal const val CONTROLLER_POSE_TIME_DEFAULT_MS = 5
internal const val CONTROLLER_POSE_TIME_MAX_MS = 30

// Config block of the bundled layer, located by the 16-byte magic:
//   +16 version uint32, 1
//   +20 leadUs  uint32, compensation in microseconds (0..30000)
private const val CONFIG_VERSION = 1
private const val CONFIG_SIZE = 32

internal data class PoseTimeRegion(val offset: Int, val length: Int, val sha256: String)
internal data class PoseTimeScene(
    val version: String,
    val versionCode: Int,
    val state: PoseTimeRegion,
    val send: PoseTimeRegion,
    val clock: PoseTimeRegion,
)

// The layer finds the same three code regions by hash at runtime (extensions/controller-pose-time-layer,
// profiles.py). They were taken from installed patched APKs of each base, and on 2.0.23 the
// GetControllerState region matches the original 5002363 bytes, so the recommended patches leave
// them alone. Other patches may change unrelated bytes of the scene library.
internal val CONTROLLER_POSE_TIME_SCENES = listOf(
    PoseTimeScene(
        "2.0.20", 5001712,
        state = PoseTimeRegion(0x1070cc, 0xa78, "eefcb6a7bffbb01e5372a3ac0bda144d567eb83a6dc1911d26f646d515e1bc8b"),
        send = PoseTimeRegion(0xf4e74, 0x514, "b6031c5147641142e80ad6de19af0431b8feaf6445ccb2494144ef7b980b0ce0"),
        clock = PoseTimeRegion(0x155bf4, 0x40, "34ab8d6b71aba044a599a172257035e13029ea10d9819d3907c215356e872c21"),
    ),
    PoseTimeScene(
        "2.0.20", 5001812,
        state = PoseTimeRegion(0x10722c, 0xa78, "aea72e1523efc481775fcb702a99fb67599cae5a7f22946d9186ff925b4256b7"),
        send = PoseTimeRegion(0xf4d34, 0x514, "6c1fbe7ec1a4f2ff27a87a5f9cb0e8df5facb4553e8c37ecad07043c75297fb6"),
        clock = PoseTimeRegion(0x155c38, 0x78, "f1b840b2be041e63aec5669bae395e823929e4d8c3d8f68b0046d0bb7deb98a3"),
    ),
    PoseTimeScene(
        "2.0.21", 5001968,
        state = PoseTimeRegion(0x10319c, 0xa78, "6d7292da1ff3d1fa9439c1a3a2ec63b56dd7c0ac9cb6c13833ebe26f32137163"),
        send = PoseTimeRegion(0xf06cc, 0x534, "0758a927fb176829d637623beb6d36d67af3db3933f19065963f2a6bf1473f1a"),
        clock = PoseTimeRegion(0x151d2c, 0x78, "6e94ab11f89a2401ac1acf405546c894d98ae5a46608798a7eae502b029dc3af"),
    ),
    PoseTimeScene(
        "2.0.22", 5002244,
        state = PoseTimeRegion(0x104800, 0xa78, "5c82f95c9d0f9c8069814d5ccba18e87d571b168bc0066d5ee10302e17e6632a"),
        send = PoseTimeRegion(0xf1c64, 0x534, "027cf28b63162b26b2a9ccc1882a9f2b0b078f3a17f7cbc34997bf87e0c9be52"),
        clock = PoseTimeRegion(0x1555b8, 0x78, "76bc4a3d6ca7beb282b034bfc8d03e5e1cfcb737769d1f9a4e4b979fc2f579a7"),
    ),
    PoseTimeScene(
        "2.0.23", 5002363,
        state = PoseTimeRegion(0x107d30, 0xa9c, "38053102f7461f9ebc9aa3a5542fdcc4baaab3a5e43c95881cd566fcf34fac5f"),
        send = PoseTimeRegion(0xf4da4, 0x550, "5f738a5b1ffbba4ea6454c03ce4b65d2ddb2b8b8eead79ec0c03f39e478694d8"),
        clock = PoseTimeRegion(0x15cb78, 0x40, "815c82ab54e2b55ff23941b8896b58f5d3af5130335627540180c8fc102b23df"),
    ),
    PoseTimeScene(
        "2.0.24", 5002395,
        state = PoseTimeRegion(0x108f88, 0xa9c, "4cda1b9020578b65a04c36e48e1d6240124ce9458007b6a7f09d712509c00a7b"),
        send = PoseTimeRegion(0xf5ff4, 0x550, "4f30c94895e96d10ce06abc3a96f05892871894d8e893dd0eb7d3765a3db0bb4"),
        clock = PoseTimeRegion(0x15e2b8, 0x40, "7279ef642ad5b65f5784bded4d9a42ef1f120796a2f2ac87fbe39f6fc62885d4"),
    ),
)

// Layers that change where VRLink's controller poses come from or when they are predicted for;
// the pose time layer also leaves the poses unchanged while one of them is loaded.
internal val controllerPoseTimeConflicts = listOf("controller_hal_pose", "controller_extrapolation")

internal fun controllerPoseTimeScene(version: String, versionCode: String): PoseTimeScene? =
    CONTROLLER_POSE_TIME_SCENES.singleOrNull { it.version == version && it.versionCode.toString() == versionCode }

private fun ByteArray.sha256(offset: Int, length: Int): String =
    MessageDigest.getInstance("SHA-256").digest(copyOfRange(offset, offset + length))
        .joinToString("") { "%02x".format(it) }

internal fun validateControllerPoseTimeScene(scene: PoseTimeScene, bytes: ByteArray) {
    if (bytes.size < 64 || bytes[0] != 0x7f.toByte() ||
        bytes.copyOfRange(1, 6).toList() != listOf(69, 76, 70, 2, 1).map(Int::toByte) ||
        bytes[18] != 0xb7.toByte() || bytes[19] != 0.toByte()) {
        throw PatchException("Expected an AArch64 ELF64 Steam Link ${scene.version}/${scene.versionCode} scene library")
    }
    listOf("GetControllerState" to scene.state, "SendPoses" to scene.send, "vendor clock" to scene.clock)
        .forEach { (name, region) ->
            if (region.offset + region.length > bytes.size || bytes.sha256(region.offset, region.length) != region.sha256) {
                throw PatchException(
                    "Unknown or modified Steam Link ${scene.version}/${scene.versionCode} $name code; " +
                        "no pose time layer installed",
                )
            }
        }
}

internal fun controllerPoseTimeResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/$name")
        ?: throw PatchException("Missing pose time resource: $name")).use { it.readBytes() }

private fun ByteArray.poseTimeConfigOffset(): Int {
    val marker = CONTROLLER_POSE_TIME_CONFIG_MAGIC.encodeToByteArray()
    val matches = indices.filter { start ->
        start + marker.size <= size && marker.indices.all { this[start + it] == marker[it] }
    }
    if (matches.size != 1) throw PatchException("$CONTROLLER_POSE_TIME_CONFIG_MAGIC config marker count=${matches.size}, expected 1")
    val offset = matches.single()
    if (offset + CONFIG_SIZE > size) throw PatchException("$CONTROLLER_POSE_TIME_CONFIG_MAGIC config block is truncated")
    val version = ByteBuffer.wrap(this, offset + 16, 4).order(ByteOrder.LITTLE_ENDIAN).int
    if (version != CONFIG_VERSION) throw PatchException("Unsupported $CONTROLLER_POSE_TIME_CONFIG_MAGIC config version=$version")
    return offset
}

internal fun ByteArray.poseTimeCompensationUs(): Int =
    ByteBuffer.wrap(this, poseTimeConfigOffset() + 20, 4).order(ByteOrder.LITTLE_ENDIAN).int

/** A copy of the bundled layer with the compensation set, in whole milliseconds. */
internal fun controllerPoseTimeLibrary(compensationMs: Int): ByteArray {
    if (compensationMs !in 0..CONTROLLER_POSE_TIME_MAX_MS) {
        throw PatchException("Pose time compensation must be 0 to $CONTROLLER_POSE_TIME_MAX_MS ms, got $compensationMs")
    }
    val bytes = controllerPoseTimeResource(CONTROLLER_POSE_TIME_LIBRARY).copyOf()
    ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN).putInt(bytes.poseTimeConfigOffset() + 20, compensationMs * 1000)
    return bytes
}

private fun conflictingLayer(exists: (String) -> Boolean): String? = controllerPoseTimeConflicts.firstOrNull { name ->
    exists("lib/arm64-v8a/libgxr_$name.so") ||
        exists("assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_$name.json")
}

private val controllerPoseTimeCompatibilities = COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL.filter { compatibility ->
    compatibility.targets.any { target ->
        target.versionCodes?.values?.any { controllerPoseTimeScene(target.version.orEmpty(), it.toString()) != null } == true
    }
}

@Suppress("unused")
val controllerPoseTimePatch = rawResourcePatch(
    name = "Controller pose time (experimental)",
    description = "Dates each controller pose by its sample time; the runtime labels poses 28.82 ms late. " +
        buildLabel(controllerPoseTimeCompatibilities) +
        " Needs: not with Controller pose extrapolation or the HAL pose patch. " +
        STEAM_LINK_CONTROLLER_CREDIT,
    default = false,
) {
    category(PatchCategories.CONTROLLER)
    compatibleWith(*controllerPoseTimeCompatibilities.toTypedArray())

    val compensationMs = intSliderOption(
        key = "compensationMs",
        min = 0,
        max = CONTROLLER_POSE_TIME_MAX_MS,
        default = CONTROLLER_POSE_TIME_DEFAULT_MS,
        step = 1,
        title = "Pose time compensation (ms)",
        // 5 ms: user-chosen default; 28.82 ms is the measured label lead (the sample's own time).
        description = "How far before the runtime's label each controller pose is dated. Lower values " +
            "shorten SteamVR's prediction: steadier, but the hands trail slightly. Higher values lengthen it: " +
            "more responsive, but fast moves can overshoot and jerk. 0 ms sends the runtime's label unchanged; " +
            "29 ms is closest to the true sample time. Default: 5 ms. Allowed range: 0 to 30 ms. " +
            "Change it with adb shell setprop debug.gxr.pose_time.lead_us <microseconds> without repatching.",
        required = true,
    )

    execute {
        // Morphe dependencies do not re-check compatibility before execution.
        controllerPoseTimeScene(packageMetadata.versionName, packageMetadata.versionCode) ?: return@execute
        val conflict = conflictingLayer { get(it).exists() }
        if (conflict != null) throw PatchException("Remove the $conflict APK layer before selecting Controller pose time")

        // Load both inputs before writing either output.
        val libraryBytes = controllerPoseTimeLibrary(compensationMs.value!!)
        val manifestBytes = controllerPoseTimeResource(CONTROLLER_POSE_TIME_MANIFEST)
        val library = get("lib/arm64-v8a/$CONTROLLER_POSE_TIME_LIBRARY")
        val manifest = get("assets/openxr/1/api_layers/implicit.d/$CONTROLLER_POSE_TIME_MANIFEST")
        library.parentFile!!.mkdirs(); manifest.parentFile!!.mkdirs()
        library.writeBytes(libraryBytes); manifest.writeBytes(manifestBytes)
    }

    finalize {
        val scene = controllerPoseTimeScene(packageMetadata.versionName, packageMetadata.versionCode)
            ?: return@finalize
        // All execute blocks have run: also reject conflicting patches selected later, and scene
        // edits by other patches that reach the hooked code.
        val conflict = conflictingLayer { get(it).exists() }
        if (conflict != null) throw PatchException("Controller pose time cannot be combined with the $conflict APK layer")
        validateControllerPoseTimeScene(scene, get("lib/arm64-v8a/libvrlink_scene.so").readBytes())
    }
}
