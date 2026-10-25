package app.template.patches.steamlink.androidxr

import app.template.patches.shared.buildLabel
import app.template.patches.shared.PatchCategories
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.booleanOption
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import java.io.File
import java.nio.file.Files
import java.nio.file.StandardOpenOption
import java.security.MessageDigest

internal const val CODECS_SUPPORT_LIBRARY = "libgxr_codecs_support.so"
internal const val CODECS_SUPPORT_MANIFEST = "XR_APILAYER_local_GalaxyXR_codecs_support.json"
internal const val CODECS_SUPPORT_LIBRARY_SHA256 =
    "4ad5e8b16c7cef480d9cb0ea0905fbbb823d534d986704402bf5bb48977f2e51"
internal const val CODECS_SUPPORT_MANIFEST_SHA256 =
    "801f2a6cf8155486879339a7eb7b83b1554a537f517ba50b6406a5a98a96fec5"

internal fun isCodecsSupportSteamLinkBuild(versionName: String, versionCode: String): Boolean =
    app.template.patches.shared.Constants.isLegacyXrFoundationSteamLinkBuild(versionName, versionCode) ||
        app.template.patches.shared.Constants.isNativeXrSteamLinkBuild(versionName, versionCode)

private fun codecsSha256(bytes: ByteArray): String = MessageDigest.getInstance("SHA-256")
    .digest(bytes).joinToString("") { "%02x".format(it) }

// Code regions the bundled layer hashes at runtime before touching the
// scene library's decoder-import GOT slots; the installer checks the same
// regions so an unknown scene layout fails before any resource is written.
// Other patches may modify their own sites elsewhere; these regions must
// stay byte-identical.
private val codecsSupportScenePreconditions: Map<String, List<Triple<Int, Int, String>>> = mapOf(
    "2.0.20/5001712" to listOf(
        Triple(0xfd304, 0x80, "6e5dcb4f5094763e948388ca35c6132af242159fc3c22e812f0fe2f4ab4f2649"),
        Triple(0xfdca8, 0x80, "86ceb824e4a972fbac71d7cb6b88a99d5decde4b42fbd1b80cb5d84361a94b67"),
        Triple(0xfd2f8, 0x40, "25174852802b65e709401364232a3dd9490617cfe9983f8bfc948a27a90e11f4"),
    ),
    "2.0.20/5001812" to listOf(
        Triple(0xfd1c0, 0x80, "b1bfbf75b91c7f522411c68d30283c414517ac0ef4f948cb73fbe6cde55385ed"),
        Triple(0xfdb64, 0x80, "2d79c63e6001f5b6fd708027a3241c7004612b55c5158ee773870825c3b875e1"),
        Triple(0xfd1b4, 0x40, "8be10423034e42a7d6c398c853c0d91085420210c0178247dd3ab1960d1e51ee"),
    ),
    "2.0.21/5001968" to listOf(
        Triple(0xf9168, 0x80, "0206212ba391e8486f3d67c41a7373103c02fd41c3ce19432645ad411fa3b52b"),
        Triple(0xf9b0c, 0x80, "faeea4728e0047b25bae83bd24a14b51bd4972c21530180d73332c82b26e1db3"),
        Triple(0xf915c, 0x40, "2f9ccf5df080c89ddee7bdc010c7eeda87f536fac5d164729acbdb82b8f74ad0"),
    ),
    "2.0.22/5002244" to listOf(
        Triple(0xfa4a8, 0x80, "f2efc6f172f7dd0724a79a4fd921bca68fc180bff33182c6f51ce55a4b1c0643"),
        Triple(0xfae4c, 0x80, "3342b1a89b49d2c038ec58e0f7f76e4871f73efcb7cb0cfbebd87212e1de7e2c"),
        Triple(0xfa49c, 0x40, "d7c2ad75cd4e123d937828007c802055a17675cdc9445af8b90b9dc84c7258ac"),
    ),
    "2.0.23/5002363" to listOf(
        Triple(0xfd6fc, 0x80, "f5c43c6aacb69e61c3f929f361612e1b91bb509803d2c14824b9601b3dd8c795"),
        Triple(0xfe0a0, 0x80, "e08a664f0fd116e2735f68ff8d10a0fcbc4eac8e216fd986beec191a078bddb4"),
        Triple(0xfd6f0, 0x40, "3a38bb855e0af4c544b8568414a9e022803a8c47e5a128b20126c84fb40c7eb3"),
    ),
    "2.0.24/5002395" to listOf(
        Triple(0xfe954, 0x80, "ef7f310bbd65499404aa89a18f873c42a87282a16799b84119c75377654003a3"),
        Triple(0xff2f8, 0x80, "49570c2a54e39d80d2f8bb61c190b9d8b821675a79a4d4c4bf5f94bfb7acde3a"),
        Triple(0xfe948, 0x40, "51b57ce6a5c20fab3266923460c046f1247823cb95526252c61a92020f052464"),
    ),
)

internal fun validateCodecsSupportScene(
    scene: ByteArray,
    versionName: String,
    versionCode: String,
) {
    val regions = codecsSupportScenePreconditions["$versionName/$versionCode"]
        ?: throw PatchException("Codecs Support has no scene contract for $versionName/$versionCode")
    regions.forEach { (offset, size, expectedHash) ->
        if (offset + size > scene.size) {
            throw PatchException("Codecs Support found a truncated scene library at 0x${offset.toString(16)}")
        }
        if (codecsSha256(scene.copyOfRange(offset, offset + size)) != expectedHash) {
            throw PatchException("Codecs Support found an unknown scene function at 0x${offset.toString(16)}")
        }
    }
}

internal fun validateCodecsSupportPayload(helper: ByteArray, manifest: ByteArray) {
    if (helper.size < 20 || !helper.copyOfRange(0, 4)
            .contentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46)) ||
        helper[4] != 2.toByte() || helper[5] != 1.toByte() ||
        helper[18] != 0xb7.toByte() || helper[19] != 0.toByte()
    ) {
        throw PatchException("Bundled codecs support helper is not an ARM64 ELF library")
    }
    if (codecsSha256(helper) != CODECS_SUPPORT_LIBRARY_SHA256) {
        throw PatchException("Bundled codecs support helper failed its SHA-256 precondition")
    }
    if (codecsSha256(manifest) != CODECS_SUPPORT_MANIFEST_SHA256) {
        throw PatchException("Bundled codecs support manifest failed its SHA-256 precondition")
    }
}

/** All layout, payload and existing-file preconditions are checked before writes. */
internal fun installCodecsSupportResources(
    apkRoot: File,
    versionName: String,
    versionCode: String,
    helperBytes: ByteArray? = null,
    manifestBytes: ByteArray? = null,
    enableTelemetry: Boolean = false,
): Boolean {
    // Dependencies bypass Morphe compatibility. Excluded pairs must not even read files.
    if (!isCodecsSupportSteamLinkBuild(versionName, versionCode)) return false
    if (enableTelemetry && !isTelemetrySteamLinkTarget(TELEMETRY_PACKAGE, versionName, versionCode)) {
        throw PatchException(
            "Telemetry is not available for Steam Link $versionName/$versionCode; " +
                "turn Enable telemetry off.",
        )
    }

    val sceneFile = File(apkRoot, "lib/arm64-v8a/libvrlink_scene.so")
    if (!sceneFile.isFile) throw PatchException("Missing exact codecs support renderer library")
    validateCodecsSupportScene(sceneFile.readBytes(), versionName, versionCode)
    val helper = helperBytes ?: projectionModeResource(CODECS_SUPPORT_LIBRARY)
    val manifest = manifestBytes ?: projectionModeResource(CODECS_SUPPORT_MANIFEST)
    validateCodecsSupportPayload(helper, manifest)

    val files = mutableListOf(
        File(sceneFile.parentFile, CODECS_SUPPORT_LIBRARY) to helper,
        File(apkRoot, "assets/openxr/1/api_layers/implicit.d/$CODECS_SUPPORT_MANIFEST") to manifest,
    )
    val receipt = File(apkRoot, "assets/gxr-telemetry/codec-option-ownership.tsv")
    fun telemetryTarget(name: String): File = when {
        name.endsWith(".so") -> File(sceneFile.parentFile, name)
        name == TELEMETRY_MANIFEST -> File(apkRoot, "assets/openxr/1/api_layers/implicit.d/$name")
        else -> File(apkRoot, "assets/gxr-telemetry/NOTICE.txt")
    }
    val owned = linkedMapOf<String, String>()
    if (receipt.exists()) {
        if (!receipt.isFile || Files.isSymbolicLink(receipt.toPath())) throw PatchException("Invalid telemetry ownership receipt")
        val rows = receipt.readLines()
        if (rows.firstOrNull() != "codecs-telemetry-v1") throw PatchException("Unknown telemetry ownership receipt")
        rows.drop(1).forEach { row ->
            val parts = row.split('\t')
            if (parts.size != 2 || parts[0] !in TELEMETRY_PAYLOAD_SHA256 ||
                parts[1] != TELEMETRY_PAYLOAD_SHA256[parts[0]] || owned.put(parts[0], parts[1]) != null) {
                throw PatchException("Invalid telemetry ownership entry")
            }
        }
        if (TELEMETRY_LIBRARY !in owned || TELEMETRY_MANIFEST !in owned) throw PatchException("Incomplete telemetry ownership receipt")
        owned.forEach { (name, hash) ->
            val target = telemetryTarget(name)
            if (!target.isFile || Files.isSymbolicLink(target.toPath()) || codecsSha256(target.readBytes()) != hash) {
                throw PatchException("Owned telemetry resource changed: $name")
            }
        }
    }
    val removals = mutableListOf<Pair<File, ByteArray>>()
    if (enableTelemetry) {
        val optional = prepareTelemetryResources(apkRoot, versionName, versionCode)
        if (!receipt.exists()) {
            if (telemetryTarget(TELEMETRY_LIBRARY).exists() || telemetryTarget(TELEMETRY_MANIFEST).exists()) {
                throw PatchException("Existing telemetry has no Codecs Support ownership receipt")
            }
            optional.forEach { (target, _) ->
                if (!target.exists()) {
                    val name = if (target.name == "NOTICE.txt") "NOTICE.txt" else target.name
                    owned[name] = TELEMETRY_PAYLOAD_SHA256.getValue(name)
                }
            }
        }
        files += optional
        val receiptText = "codecs-telemetry-v1\n" + owned.entries.joinToString("") { "${it.key}\t${it.value}\n" }
        files += receipt to receiptText.toByteArray(Charsets.UTF_8)
    } else if (receipt.exists()) {
        removals += owned.keys.map { name -> telemetryTarget(name).let { it to it.readBytes() } }
        removals += receipt to receipt.readBytes()
    }
    files.forEach { (target, expected) ->
        if (target.exists() && (!target.isFile || !target.readBytes().contentEquals(expected))) {
            throw PatchException("Codecs Support found a stale or modified resource: ${target.path}")
        }
    }
    val missing = files.filterNot { (target, _) -> target.exists() }
    if (missing.isEmpty() && removals.isEmpty()) return true

    val staged = mutableListOf<Pair<File, File>>()
    val created = mutableListOf<File>()
    val removed = mutableListOf<Pair<File, ByteArray>>()
    try {
        missing.forEach { (target, bytes) ->
            if (!target.parentFile.isDirectory && !target.parentFile.mkdirs()) {
                throw PatchException("Could not create codecs support resource directory")
            }
            val temporary = File.createTempFile("gxr-codecs-support-", ".tmp", target.parentFile)
            staged += temporary to target
            temporary.writeBytes(bytes)
        }
        staged.forEach { (temporary, target) ->
            // No replacement: an unexpected concurrent file must never be overwritten.
            Files.move(temporary.toPath(), target.toPath())
            created += target
        }
        removals.forEach { (target, bytes) ->
            if (!target.isFile || !target.readBytes().contentEquals(bytes)) throw PatchException("Telemetry resource changed during option transition")
            Files.delete(target.toPath())
            removed += target to bytes
        }
    } catch (failure: Exception) {
        removed.asReversed().forEach { (target, bytes) ->
            try { Files.write(target.toPath(), bytes, StandardOpenOption.CREATE_NEW) } catch (rollback: Exception) {
                failure.addSuppressed(rollback)
            }
        }
        created.asReversed().forEach { target ->
            try { Files.deleteIfExists(target.toPath()) } catch (rollback: Exception) {
                failure.addSuppressed(rollback)
            }
        }
        throw failure
    } finally {
        staged.forEach { (temporary, _) -> Files.deleteIfExists(temporary.toPath()) }
    }
    return true
}

@Suppress("unused")
val xrCodecsSupportPatch = rawResourcePatch(
    name = "Codecs Support",
    description = "Lets the headset decode H.264 or AV1 streams; HEVC is untouched. " +
        buildLabel(COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL) +
        " Needs: the matching driver codec setting.",
    default = true,
) {
    val enableTelemetry by booleanOption(
        key = "enableTelemetry",
        default = false,
        title = "Enable telemetry",
        description = "Optional decoder measurements and codec-byte capture for SteamVR Colour Lab. Off installs no telemetry components.",
    )
    category(PatchCategories.STREAMING_AND_NETWORK)
    compatibleWith(*(COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL).map { exact ->
        Compatibility(
            name = EXPERIMENTAL_COMPATIBILITY_NAME,
            packageName = requireNotNull(exact.packageName),
            targets = exact.targets,
        )
    }.toTypedArray())
    execute {
        if (packageMetadata.packageName != "com.valvesoftware.steamlinkvr" ||
            !isCodecsSupportSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@execute
        }
        val sceneFile = get("lib/arm64-v8a/libvrlink_scene.so")
        val apkRoot = sceneFile.parentFile!!.parentFile!!.parentFile!!
        installCodecsSupportResources(apkRoot, packageMetadata.versionName, packageMetadata.versionCode,
            enableTelemetry = enableTelemetry == true)
    }
}
