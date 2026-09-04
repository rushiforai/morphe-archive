package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_LEGACY
import app.template.patches.shared.Constants.isNativeXrSteamLinkBuild
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
    val versionName: String,
    val versionCode: Int,
    val fileSize: Int,
    val stockSha256: String,
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
        versionName = "2.0.20",
        versionCode = 5001712,
        fileSize = 2_221_072,
        stockSha256 = "80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495",
        permissionNames = permissionNameEdits(0x99924, 0xA1A7F, locateByPattern = false),
        hmdInitialization = listOf(
            NativeEdit(0xFFE20, byteArrayOf(0xe0.toByte(), 0x00, 0x00, 0x36), NOP),
            NativeEdit(0xFFE28, byteArrayOf(0xa8.toByte(), 0x00, 0x00, 0x34), NOP),
        ),
        lobbyPermissionState = listOf(
            NativeEdit(0x10DB10, byteArrayOf(0x14, 0x04, 0x00, 0x36), NOP),
        ),
        streamInitialization = listOf(
            NativeEdit(0x116564, byteArrayOf(0x68, 0x00, 0x00, 0x35), NOP),
            NativeEdit(0x11656C, byteArrayOf(0x68, 0x05, 0x00, 0x34), NOP),
            NativeEdit(0x116620, byteArrayOf(0xa8.toByte(), 0x05, 0x00, 0x34), NOP),
        ),
    ),
    NativeLayoutEdits(
        versionName = "2.0.20",
        versionCode = 5001740,
        fileSize = 2_220_528,
        stockSha256 = "5fbb76c06c9fc0e3e5c5825752aa17e040462c8551b69d3492265f620244f443",
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
        versionName = "2.0.22",
        versionCode = 5002244,
        fileSize = 2_251_920,
        stockSha256 = "4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12",
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
        versionName = "2.0.22",
        versionCode = 5002313,
        fileSize = 2_276_872,
        stockSha256 = "e4d3575a130dc013e4c8fe4fb965217028229f89b13ba821c01b492e457398bb",
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
    versionName: String,
    versionCode: String,
    patchName: String,
    select: (NativeLayoutEdits) -> List<NativeEdit>,
): ByteArray {
    val layout = NATIVE_LAYOUTS.singleOrNull {
        it.versionName == versionName && it.versionCode.toString() == versionCode
    }
        ?: return bytes.copyOf()
    if (bytes.size != layout.fileSize) {
        throw PatchException(
            "$patchName library size=${bytes.size} for Steam Link $versionName/$versionCode; " +
                "expected ${layout.fileSize}, stockSha256=${layout.stockSha256}",
        )
    }
    return applyNativeEdits(
        bytes,
        "$patchName (versionCode ${layout.versionCode})",
        select(layout),
        strictLayout = true,
    )
}

private fun applyLayoutNativeEdits(
    file: File,
    versionName: String,
    versionCode: String,
    patchName: String,
    select: (NativeLayoutEdits) -> List<NativeEdit>,
) {
    val bytes = file.readBytes()
    val patched = applyLayoutNativeEdits(bytes, versionName, versionCode, patchName, select)
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

internal fun patchNativePermissionNames(
    bytes: ByteArray,
    versionName: String,
    versionCode: String,
): ByteArray {
    // Native-XR builds already contain the Android XR permission names and working request flow.
    // Pattern-rewriting its retained Oculus fallback names can break vendor/hand capability routing.
    if (isNativeXrSteamLinkBuild(versionName, versionCode)) return bytes.copyOf()

    val layout = NATIVE_LAYOUTS.singleOrNull {
        it.versionName == versionName && it.versionCode.toString() == versionCode
    }
    if (layout != null && bytes.size != layout.fileSize) {
        throw PatchException(
            "Android XR native permission names library size=${bytes.size} for " +
                "Steam Link $versionName/$versionCode; expected ${layout.fileSize}, " +
                "stockSha256=${layout.stockSha256}",
        )
    }
    if (layout == null && NATIVE_LAYOUTS.any { it.fileSize == bytes.size }) return bytes.copyOf()
    return applyNativeEdits(
        bytes,
        layout?.let {
            "Android XR native permission names (versionCode ${it.versionCode})"
        } ?: "Android XR native permission names",
        layout?.permissionNames ?: relocatablePermissionNameEdits,
        strictLayout = layout != null,
    )
}

internal fun patchHmdInitializationGates(
    bytes: ByteArray,
    versionName: String,
    versionCode: String,
): ByteArray =
    applyLayoutNativeEdits(bytes, versionName, versionCode, "Force HMD initialization gates") {
        it.hmdInitialization
    }

internal fun patchLobbyPermissionStateGate(
    bytes: ByteArray,
    versionName: String,
    versionCode: String,
): ByteArray =
    applyLayoutNativeEdits(bytes, versionName, versionCode, "Force lobby permission-state gate") {
        it.lobbyPermissionState
    }

internal fun patchStreamXrGates(
    bytes: ByteArray,
    versionName: String,
    versionCode: String,
): ByteArray =
    applyLayoutNativeEdits(bytes, versionName, versionCode, "Force stream XR gates") {
        it.streamInitialization
    }

@Suppress("unused")
val androidXrNativePermissionNamesPatch = rawResourcePatch(
    name = "Android XR native permission names",
    description = "Replaces native Oculus face/eye permission checks with the Android XR permission names used by Galaxy XR, including the verified Steam Link 5001712 layout.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())

    execute {
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val bytes = file.readBytes()
        val patched = patchNativePermissionNames(
            bytes,
            packageMetadata.versionName,
            packageMetadata.versionCode,
        )
        if (!patched.contentEquals(bytes)) file.writeBytes(patched)
    }
}

@Suppress("unused")
val forceHmdInitializationGatesPatch = rawResourcePatch(
    name = "Force HMD initialization gates",
    description = "Bypasses the two verified capability gates in QSVLDeviceHmd::Init for Steam Link builds 5001712, 5001740, 5002244, and 5002313.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())

    execute {
        applyLayoutNativeEdits(
            get("lib/arm64-v8a/libvrlink_scene.so"),
            packageMetadata.versionName,
            packageMetadata.versionCode,
            "Force HMD initialization gates",
        ) { it.hmdInitialization }
    }
}

@Suppress("unused")
val forceLobbyPermissionStateGatePatch = rawResourcePatch(
    name = "Force lobby permission-state gate",
    description = "Bypasses the verified permission-state gate in XrSceneLobby for Steam Link builds 5001712, 5001740, 5002244, and 5002313.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())

    execute {
        applyLayoutNativeEdits(
            get("lib/arm64-v8a/libvrlink_scene.so"),
            packageMetadata.versionName,
            packageMetadata.versionCode,
            "Force lobby permission-state gate",
        ) { it.lobbyPermissionState }
    }
}

@Suppress("unused")
val forceStreamXrGatesPatch = rawResourcePatch(
    name = "Force stream XR gates",
    description = "Bypasses the three verified XR gates in builds 5001712, 5001740, and 5002244. Build 5002313 rewrote XrSceneStream::Init and is intentionally left unchanged.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())

    execute {
        applyLayoutNativeEdits(
            get("lib/arm64-v8a/libvrlink_scene.so"),
            packageMetadata.versionName,
            packageMetadata.versionCode,
            "Force stream XR gates",
        ) { it.streamInitialization }
    }
}

private fun ByteArray.toHex(): String = joinToString("") { "%02x".format(it) }
