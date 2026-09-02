package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_LEGACY
import java.io.File

private val NOP = byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())

private data class NativeEdit(
    val offset: Int,
    val original: ByteArray,
    val replacement: ByteArray,
    val locateByPattern: Boolean = false,
)

private fun ascii(value: String): ByteArray = value.toByteArray(Charsets.US_ASCII)

private fun paddedAscii(value: String, size: Int): ByteArray =
    ByteArray(size).also { ascii(value).copyInto(it) }

private fun applyNativeEdits(
    bytes: ByteArray,
    patchName: String,
    edits: List<NativeEdit>,
    strictLayout: Boolean,
): ByteArray {
    val replacements = edits.mapNotNull { edit ->
        require(edit.original.size == edit.replacement.size)

        if (edit.locateByPattern) {
            val originalOffsets = bytes.findPatternOffsets(edit.original)
            val replacementOffsets = bytes.findPatternOffsets(edit.replacement)
            return@mapNotNull when {
                originalOffsets.size == 1 && replacementOffsets.isEmpty() ->
                    originalOffsets.single() to edit.replacement
                originalOffsets.isEmpty() && replacementOffsets.size == 1 -> null
                !strictLayout -> return bytes.copyOf()
                originalOffsets.isEmpty() && replacementOffsets.isEmpty() ->
                    throw PatchException(
                        "$patchName pattern is absent on the supported layout: " +
                            "original=${edit.original.toHex()}, patched=${edit.replacement.toHex()}",
                    )
                else ->
                    throw PatchException(
                        "$patchName pattern is ambiguous on the supported layout: " +
                            "original matches=${originalOffsets.size}, " +
                            "patched matches=${replacementOffsets.size}",
                    )
            }
        }

        val end = edit.offset + edit.original.size
        if (edit.offset < 0 || end > bytes.size) {
            throw PatchException("$patchName offset 0x${edit.offset.toString(16)} is outside the library")
        }

        val actual = bytes.copyOfRange(edit.offset, end)
        when {
            actual.contentEquals(edit.replacement) -> null
            actual.contentEquals(edit.original) -> edit.offset to edit.replacement
            else -> throw PatchException(
                "$patchName precondition failed at 0x${edit.offset.toString(16)}: " +
                    "actual=${actual.toHex()}, expected=${edit.original.toHex()} " +
                    "or patched=${edit.replacement.toHex()}",
            )
        }
    }

    if (replacements.isEmpty()) return bytes.copyOf()

    val mutable = bytes.copyOf()
    replacements.forEach { (offset, replacement) ->
        replacement.copyInto(mutable, offset)
    }
    return mutable
}

private data class NativeLayoutEdits(
    val versionCode: Int,
    val fileSize: Int,
    val permissionNames: List<NativeEdit>,
    val hmdInitialization: List<NativeEdit>,
    val lobbyPermissionState: List<NativeEdit>,
    val streamInitialization: List<NativeEdit>,
)

private val facePermissionOriginal =
    ascii("com.oculus.permission.FACE_TRACKING") + byteArrayOf(0)
private val facePermissionReplacement =
    paddedAscii("android.permission.HAND_TRACKING", 36)
private val eyePermissionOriginal =
    ascii("com.oculus.permission.EYE_TRACKING") + byteArrayOf(0, 0x7d, 0)
private val eyePermissionReplacement =
    ascii("android.permission.EYE_TRACKING_FINE") + byteArrayOf(0)

private fun permissionNameEdits(faceOffset: Int, eyeOffset: Int, locateByPattern: Boolean) = listOf(
    NativeEdit(
        offset = faceOffset,
        original = facePermissionOriginal,
        replacement = facePermissionReplacement,
        locateByPattern = locateByPattern,
    ),
    NativeEdit(
        offset = eyeOffset,
        original = eyePermissionOriginal,
        replacement = eyePermissionReplacement,
        locateByPattern = locateByPattern,
    ),
)

private val NATIVE_LAYOUTS = listOf(
    NativeLayoutEdits(
        versionCode = 5001740,
        fileSize = 2_220_528,
        permissionNames = permissionNameEdits(0x9987A, 0xA19DD, locateByPattern = false),
        hmdInitialization = listOf(
            NativeEdit(0xFFCB0, byteArrayOf(0xe0.toByte(), 0x00, 0x00, 0x36), NOP),
            NativeEdit(0xFFCB8, byteArrayOf(0xa8.toByte(), 0x00, 0x00, 0x34), NOP),
        ),
        lobbyPermissionState = listOf(
            NativeEdit(0x10D9A0, byteArrayOf(0x14, 0x04, 0x00, 0x36), NOP),
        ),
        streamInitialization = listOf(
            NativeEdit(0x1163F4, byteArrayOf(0x68, 0x00, 0x00, 0x35), NOP),
            NativeEdit(0x1163FC, byteArrayOf(0x68, 0x05, 0x00, 0x34), NOP),
            NativeEdit(0x1164B0, byteArrayOf(0xa8.toByte(), 0x05, 0x00, 0x34), NOP),
        ),
    ),
    NativeLayoutEdits(
        versionCode = 5002244,
        fileSize = 2_251_920,
        permissionNames = permissionNameEdits(0x93952, 0x9C10E, locateByPattern = false),
        hmdInitialization = listOf(
            NativeEdit(0xFD040, byteArrayOf(0xe0.toByte(), 0x00, 0x00, 0x36), NOP),
            NativeEdit(0xFD048, byteArrayOf(0xa8.toByte(), 0x00, 0x00, 0x34), NOP),
        ),
        lobbyPermissionState = listOf(
            NativeEdit(0x10B658, byteArrayOf(0x14, 0x04, 0x00, 0x36), NOP),
        ),
        streamInitialization = listOf(
            NativeEdit(0x1140AC, byteArrayOf(0x68, 0x00, 0x00, 0x35), NOP),
            NativeEdit(0x1140B4, byteArrayOf(0x68, 0x05, 0x00, 0x34), NOP),
            NativeEdit(0x114168, byteArrayOf(0xa8.toByte(), 0x05, 0x00, 0x34), NOP),
        ),
    ),
    NativeLayoutEdits(
        versionCode = 5002313,
        fileSize = 2_276_872,
        permissionNames = permissionNameEdits(0x94B4F, 0x9D861, locateByPattern = false),
        hmdInitialization = listOf(
            NativeEdit(0xFF010, byteArrayOf(0x20, 0x01, 0x00, 0x36), NOP),
            NativeEdit(0xFF018, byteArrayOf(0xe8.toByte(), 0x00, 0x00, 0x34), NOP),
        ),
        lobbyPermissionState = listOf(
            NativeEdit(0x10E6C0, byteArrayOf(0x14, 0x04, 0x00, 0x36), NOP),
        ),
        // Valve rewrote XrSceneStream::Init in 5002313 to enumerate runtime/vendor
        // permissions. The three 5002244 gates have no safe one-to-one equivalent.
        streamInitialization = emptyList(),
    ),
)

private fun applyLayoutNativeEdits(
    bytes: ByteArray,
    patchName: String,
    select: (NativeLayoutEdits) -> List<NativeEdit>,
): ByteArray {
    val layout = NATIVE_LAYOUTS.singleOrNull { it.fileSize == bytes.size }
        ?: return bytes.copyOf()
    return applyNativeEdits(
        bytes,
        "$patchName (versionCode ${layout.versionCode})",
        select(layout),
        strictLayout = true,
    )
}

private fun applyLayoutNativeEdits(
    file: File,
    patchName: String,
    select: (NativeLayoutEdits) -> List<NativeEdit>,
) {
    val bytes = file.readBytes()
    val patched = applyLayoutNativeEdits(bytes, patchName, select)
    if (!patched.contentEquals(bytes)) file.writeBytes(patched)
}

private fun ByteArray.findPatternOffsets(pattern: ByteArray): List<Int> {
    if (pattern.isEmpty() || pattern.size > size) return emptyList()
    return (0..size - pattern.size).filter { offset ->
        pattern.indices.all { index -> this[offset + index] == pattern[index] }
    }
}

private val relocatablePermissionNameEdits =
    permissionNameEdits(0, 0, locateByPattern = true)

internal fun patchNativePermissionNames(bytes: ByteArray): ByteArray {
    // Native-XR builds already contain the Android XR permission names and working request flow.
    // Pattern-rewriting its retained Oculus fallback names can break vendor/hand capability routing.
    if (bytes.size == 2_277_488 || bytes.size == 2_283_400) return bytes.copyOf()

    val layout = NATIVE_LAYOUTS.singleOrNull { it.fileSize == bytes.size }
    return applyNativeEdits(
        bytes,
        layout?.let {
            "Android XR native permission names (versionCode ${it.versionCode})"
        } ?: "Android XR native permission names",
        layout?.permissionNames ?: relocatablePermissionNameEdits,
        strictLayout = layout != null,
    )
}

internal fun patchHmdInitializationGates(bytes: ByteArray): ByteArray =
    applyLayoutNativeEdits(bytes, "Force HMD initialization gates") { it.hmdInitialization }

internal fun patchLobbyPermissionStateGate(bytes: ByteArray): ByteArray =
    applyLayoutNativeEdits(bytes, "Force lobby permission-state gate") { it.lobbyPermissionState }

internal fun patchStreamXrGates(bytes: ByteArray): ByteArray =
    applyLayoutNativeEdits(bytes, "Force stream XR gates") { it.streamInitialization }

@Suppress("unused")
val androidXrNativePermissionNamesPatch = rawResourcePatch(
    name = "Android XR native permission names",
    description = "Replaces native Oculus face/eye permission checks with the Android XR permission names used by Galaxy XR.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())

    execute {
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val bytes = file.readBytes()
        val patched = patchNativePermissionNames(bytes)
        if (!patched.contentEquals(bytes)) file.writeBytes(patched)
    }
}

@Suppress("unused")
val forceHmdInitializationGatesPatch = rawResourcePatch(
    name = "Force HMD initialization gates",
    description = "Bypasses the two verified capability gates in QSVLDeviceHmd::Init for Steam Link builds 5001740, 5002244, and 5002313.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())

    execute {
        applyLayoutNativeEdits(
            get("lib/arm64-v8a/libvrlink_scene.so"),
            "Force HMD initialization gates",
        ) { it.hmdInitialization }
    }
}

@Suppress("unused")
val forceLobbyPermissionStateGatePatch = rawResourcePatch(
    name = "Force lobby permission-state gate",
    description = "Bypasses the verified permission-state gate in XrSceneLobby for Steam Link builds 5001740, 5002244, and 5002313.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())

    execute {
        applyLayoutNativeEdits(
            get("lib/arm64-v8a/libvrlink_scene.so"),
            "Force lobby permission-state gate",
        ) { it.lobbyPermissionState }
    }
}

@Suppress("unused")
val forceStreamXrGatesPatch = rawResourcePatch(
    name = "Force stream XR gates",
    description = "Bypasses the three verified XR gates in builds 5001740 and 5002244. Build 5002313 rewrote XrSceneStream::Init and is intentionally left unchanged.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())

    execute {
        applyLayoutNativeEdits(
            get("lib/arm64-v8a/libvrlink_scene.so"),
            "Force stream XR gates",
        ) { it.streamInitialization }
    }
}

private fun ByteArray.toHex(): String = joinToString("") { "%02x".format(it) }
