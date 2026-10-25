package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.buildLabel
import java.io.File
import java.nio.file.Files
import java.security.MessageDigest

// GXR spacewarp layer (09-LAYER-B1b): stages the bundled OpenXR implicit layer that
// synthesizes missed-tick projection frames. Provisional val name — the owner may
// rename at review; only the display name and description are user-visible.
internal const val GXR_SPACEWARP_LIBRARY = "libgxr_spacewarp.so"
internal const val GXR_SPACEWARP_MANIFEST = "XR_APILAYER_local_GalaxyXR_gxr_spacewarp.json"
internal const val GXR_SPACEWARP_GATE0 = "gxr_spacewarp_gate0_5002363.json"
internal const val GXR_SPACEWARP_GATE0_5001712 = "gxr_spacewarp_gate0_5001712.json"

// Builtin sha pins for the canonical staged payloads. The .so pin is filled by the
// owner build flow (Build-Native.ps1 output, staged, then pinned — extensions skill
// "Build output only"); the manifest + Gate-0 pins are committed with their files.
// The layer payload is base-agnostic (the .so's per-base profile table selects the
// scene-lib pins at runtime); only the two gate evidence JSONs are per base.
internal const val GXR_SPACEWARP_LIBRARY_SHA256 =
    "a963930142c7c9dcbe536ad1b9862d5be803f39ea079e23829968d65d51ccd22"
internal const val GXR_SPACEWARP_MANIFEST_SHA256 =
    "623f0f1b9c69d049cc9c3754d0481aa06b40529d322f3e233bafa12af840943b"
internal const val GXR_SPACEWARP_GATE0_SHA256 =
    "4acb20d818553cf6a625cdd983497fead739ffa0b21171fd7f63731a4384c3ca"
internal const val GXR_SPACEWARP_VTS_GATE = "gxr_spacewarp_vts_5002363.json"
internal const val GXR_SPACEWARP_VTS_GATE_SHA256 =
    "7d12e9485f29594e5ef299706d576e1e40ea15a326a45ce45f1210c78cc27e54"
internal const val GXR_SPACEWARP_GATE0_5001712_SHA256 =
    "2c7666bef9d6e970268ae31aec4fa932d7bc5811ac16625dbcdbd8b7685bc23c"
internal const val GXR_SPACEWARP_VTS_GATE_5001712 = "gxr_spacewarp_vts_5001712.json"
internal const val GXR_SPACEWARP_VTS_GATE_5001712_SHA256 =
    "183d352208a04e23ed636e065c6154b37d7d21c131b19e58b7f43cd621bd1aa9"

internal const val GXR_SPACEWARP_GATE0_5001812 = "gxr_spacewarp_gate0_5001812.json"
internal const val GXR_SPACEWARP_GATE0_5001812_SHA256 =
    "a8115345f5226dc554401baeac0bcf43060257375946a69c4634a23786bb50f9"
internal const val GXR_SPACEWARP_VTS_GATE_5001812 = "gxr_spacewarp_vts_5001812.json"
internal const val GXR_SPACEWARP_VTS_GATE_5001812_SHA256 =
    "51433e629c6b90319340d456e448e6855645ccdd78568c2d48aec315b3d8c0f4"

internal const val GXR_SPACEWARP_GATE0_5001968 = "gxr_spacewarp_gate0_5001968.json"
internal const val GXR_SPACEWARP_GATE0_5001968_SHA256 =
    "bc7ca8cb8e12a6d3f236751119eb6d29d519cfcfea4951dd765c8e92470cbc6f"
internal const val GXR_SPACEWARP_VTS_GATE_5001968 = "gxr_spacewarp_vts_5001968.json"
internal const val GXR_SPACEWARP_VTS_GATE_5001968_SHA256 =
    "90cb3790b0f84d2f1a4e129aaf15c185ff809e3b1d1af4a91fd4f41305d7bba1"

internal const val GXR_SPACEWARP_GATE0_5002244 = "gxr_spacewarp_gate0_5002244.json"
internal const val GXR_SPACEWARP_GATE0_5002244_SHA256 =
    "21399e266e7b6c38524a8f2830119d2e4eaaa0f2a9b4ddea401b736293252536"
internal const val GXR_SPACEWARP_VTS_GATE_5002244 = "gxr_spacewarp_vts_5002244.json"
internal const val GXR_SPACEWARP_VTS_GATE_5002244_SHA256 =
    "5726b255880eb6c2e748839699d9fdeb1acc0c0e58ef355af1429c15077f90ff"

// The bundled layer embeds a per-base scene/VTS profile table, so a build without an
// entry would load and silently stand down. Keep the exact supported set here until a
// 2.0.24 layer profile and gate evidence exist.
private val GXR_SPACEWARP_SUPPORTED_PAIRS = setOf(
    "2.0.20" to "5001712",
    "2.0.20" to "5001812",
    "2.0.21" to "5001968",
    "2.0.22" to "5002244",
    "2.0.23" to "5002363",
)

internal fun isGxrSpacewarpSteamLinkBuild(versionName: String, versionCode: String): Boolean =
    (versionName to versionCode) in GXR_SPACEWARP_SUPPORTED_PAIRS

private val gxrSpacewarpCompatibilities =
    COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL.filter { compatibility ->
        compatibility.targets.any { target ->
            target.versionCodes?.values?.any { code ->
                isGxrSpacewarpSteamLinkBuild(target.version.orEmpty(), code.toString())
            } == true
        }
    }

private fun spacewarpSha256(bytes: ByteArray): String = MessageDigest.getInstance("SHA-256")
    .digest(bytes).joinToString("") { "%02x".format(it) }

// Window-gated scene-library preconditions, PER BASE (RE-SHARED-IMPL.md "Known
// anchors" + brief 13, re-derived per base by
// extensions/gxr-spacewarp-layer/tests/derive_gate0.py --base <base> against
// android-steamlinkvr-release-base-<tree>; full-file sha stays a
// diagnostics-only value in the Gate-0 JSON, never a gate here). Each base's
// list is exactly its gate-0 JSON's anchor list in the same order: the runtime
// identity anchor (that base's codecs-support audit window) plus that base's
// brief-01 windows (AppTick/FlipFrame/Render). Anchors are pinned by the same
// values the layer itself re-checks at load time.
internal val gxrSpacewarpScenePreconditions: Map<String, List<Triple<Int, Int, String>>> = mapOf(
    "2.0.20/5001712" to listOf(
        Triple(0xfd304, 0x80, "6e5dcb4f5094763e948388ca35c6132af242159fc3c22e812f0fe2f4ab4f2649"),
        Triple(0x10ad18, 0x80, "82ee275b8e5d02083867d5e4a478d2bf80c6f516c7f186df05dbe4a7465100a9"),
        Triple(0x1190a4, 0x80, "4ebd60f23ef4b0f5957f749cb64d0ab68f4f70177a10ab437647767dd5924585"),
        Triple(0x13eb80, 0x80, "aac0333421512dfc5c28fc347d02013f60cedc1b23aabe5ee31f1b8d35ca12b3"),
    ),
    "2.0.23/5002363" to listOf(
        Triple(0xfd6fc, 0x80, "f5c43c6aacb69e61c3f929f361612e1b91bb509803d2c14824b9601b3dd8c795"),
        Triple(0x10cd00, 0x80, "21cfe100a3a057dc633ab0b4934d1aedaa2809278b320a66e93c79e494aff7ca"),
        Triple(0x11b708, 0x80, "daa07b02967fd5682a9add717ceb396a95549c7ffbb7cc38f5a4e3de43ac66aa"),
    ),
    "2.0.20/5001812" to listOf(
        Triple(0xfd1c0, 0x80, "b1bfbf75b91c7f522411c68d30283c414517ac0ef4f948cb73fbe6cde55385ed"),
        Triple(0xfb6b4, 0x80, "ec3b7533986ce9b132f6acd927dfc52384cbf793c2ad438b9749210a4437587d"),
        Triple(0x1191d0, 0x80, "69be9e201e8ac70bd2da8d9b9c4c36c49332a3a33e826400471d4a5413c05e14"),
        Triple(0x13ebe8, 0x80, "eb375ff16999c0e9c32a3e315f9f0b0a86b1de691f326f73eb25639b2c50deed"),
    ),
    "2.0.21/5001968" to listOf(
        Triple(0xf9168, 0x80, "0206212ba391e8486f3d67c41a7373103c02fd41c3ce19432645ad411fa3b52b"),
        Triple(0xf7610, 0x80, "787a4f75036a3e44b7b88ffe98230257490ff5e1114e3e25d05be1942b402438"),
        Triple(0x1151a8, 0x80, "c5899078c748adb01aa2f06cbc252e5aa590d667b461fb4dc0134a82cb9d1a19"),
        Triple(0x13abc0, 0x80, "6de6af6c30572cb7fdb84e52a2c06f1b44700ea05e8d72c3f6262d735f9e5dcc"),
    ),
    "2.0.22/5002244" to listOf(
        Triple(0xfa4a8, 0x80, "f2efc6f172f7dd0724a79a4fd921bca68fc180bff33182c6f51ce55a4b1c0643"),
        Triple(0xf8950, 0x80, "4f870b4aaa2d73996daf82cd6c4dda94de5d72bec80044ae77fdce92f89c12a3"),
        Triple(0x116c10, 0x80, "20eb71d2be352aac82836578c95e68d03d38b024aa953db587e74f71999829bb"),
        Triple(0x13e180, 0x80, "0a1f3be8b69d6e88d7aefc74b9bea6af81eb2b0ff3a28da29f8e44cab04f46c5"),
    ),
)

internal fun validateGxrSpacewarpScene(scene: ByteArray, versionName: String, versionCode: String) {
    val preconditions = gxrSpacewarpScenePreconditions["$versionName/$versionCode"]
    if (preconditions == null) {
        throw PatchException("GXR spacewarp has no scene contract for $versionName/$versionCode")
    }
    preconditions.forEach { (offset, size, expectedHash) ->
        if (offset + size > scene.size) {
            throw PatchException("GXR spacewarp found a truncated scene library at 0x${offset.toString(16)}")
        }
        if (spacewarpSha256(scene.copyOfRange(offset, offset + size)) != expectedHash) {
            throw PatchException("GXR spacewarp found an unknown scene layout at 0x${offset.toString(16)}")
        }
    }
}

// The per-base gate pair (brief 13's "SIMPLEST provable scheme", chose + documented):
// the exact versionCode selects the row; the row's sha pins validate the staged
// payloads, AND each gate JSON's own "versionCode" content marker must name that
// same base - a wrong pair cannot pass, because its content marker names a
// different versionCode than the selector row.
internal data class GxrSpacewarpGatePair(
    val gate0Name: String,
    val gate0Sha256: String,
    val vtsName: String,
    val vtsSha256: String,
)

internal val gxrSpacewarpGatePairs: Map<String, GxrSpacewarpGatePair> = mapOf(
    "5001712" to GxrSpacewarpGatePair(
        GXR_SPACEWARP_GATE0_5001712,
        GXR_SPACEWARP_GATE0_5001712_SHA256,
        GXR_SPACEWARP_VTS_GATE_5001712,
        GXR_SPACEWARP_VTS_GATE_5001712_SHA256,
    ),
    "5002363" to GxrSpacewarpGatePair(
        GXR_SPACEWARP_GATE0,
        GXR_SPACEWARP_GATE0_SHA256,
        GXR_SPACEWARP_VTS_GATE,
        GXR_SPACEWARP_VTS_GATE_SHA256,
    ),
    "5001812" to GxrSpacewarpGatePair(
        GXR_SPACEWARP_GATE0_5001812,
        GXR_SPACEWARP_GATE0_5001812_SHA256,
        GXR_SPACEWARP_VTS_GATE_5001812,
        GXR_SPACEWARP_VTS_GATE_5001812_SHA256,
    ),
    "5001968" to GxrSpacewarpGatePair(
        GXR_SPACEWARP_GATE0_5001968,
        GXR_SPACEWARP_GATE0_5001968_SHA256,
        GXR_SPACEWARP_VTS_GATE_5001968,
        GXR_SPACEWARP_VTS_GATE_5001968_SHA256,
    ),
    "5002244" to GxrSpacewarpGatePair(
        GXR_SPACEWARP_GATE0_5002244,
        GXR_SPACEWARP_GATE0_5002244_SHA256,
        GXR_SPACEWARP_VTS_GATE_5002244,
        GXR_SPACEWARP_VTS_GATE_5002244_SHA256,
    ),
)

internal fun validateGxrSpacewarpPayload(
    library: ByteArray,
    manifest: ByteArray,
    gate0: ByteArray,
    vts: ByteArray,
    versionName: String,
    versionCode: String,
) {
    if (library.size < 20 || !library.copyOfRange(0, 4)
            .contentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46)) ||
        library[4] != 2.toByte() || library[5] != 1.toByte() ||
        library[18] != 0xb7.toByte() || library[19] != 0.toByte()
    ) {
        throw PatchException("Bundled GXR spacewarp library is not an ARM64 ELF shared object")
    }
    if (spacewarpSha256(library) != GXR_SPACEWARP_LIBRARY_SHA256) {
        throw PatchException("Bundled GXR spacewarp library failed its SHA-256 pin")
    }
    if (spacewarpSha256(manifest) != GXR_SPACEWARP_MANIFEST_SHA256) {
        throw PatchException("Bundled GXR spacewarp manifest failed its SHA-256 pin")
    }
    val pair = gxrSpacewarpGatePairs[versionCode]
    if (pair == null) {
        throw PatchException("GXR spacewarp has no gate evidence pair for $versionName/$versionCode")
    }
    if (spacewarpSha256(gate0) != pair.gate0Sha256) {
        throw PatchException("Bundled GXR spacewarp gate-0 evidence failed its SHA-256 pin")
    }
    if (spacewarpSha256(vts) != pair.vtsSha256) {
        throw PatchException("Bundled GXR spacewarp value-transport gate failed its SHA-256 pin")
    }
    // The content marker: each gate JSON names its own base versionCode. Both
    // files of the selected row must carry the selector's code.
    val marker = "\"versionCode\": ${versionCode.toInt()}"
    if (marker !in gate0.decodeToString()) {
        throw PatchException("Bundled GXR spacewarp gate-0 evidence names a different base than $versionName/$versionCode")
    }
    if (marker !in vts.decodeToString()) {
        throw PatchException("Bundled GXR spacewarp value-transport gate names a different base than $versionName/$versionCode")
    }
}

/** All layout, payload and existing-file preconditions run before any write. */
internal fun installGxrSpacewarpResources(
    apkRoot: File,
    versionName: String,
    versionCode: String,
    libraryBytes: ByteArray? = null,
    manifestBytes: ByteArray? = null,
    gate0Bytes: ByteArray? = null,
    vtsBytes: ByteArray? = null,
): Boolean {
    // Dependencies bypass Morphe compatibility. Excluded pairs must not even read files.
    if (!isGxrSpacewarpSteamLinkBuild(versionName, versionCode)) return false

    val sceneFile = File(apkRoot, "lib/arm64-v8a/libvrlink_scene.so")
    if (!sceneFile.isFile) throw PatchException("Missing exact GXR spacewarp scene library")
    validateGxrSpacewarpScene(sceneFile.readBytes(), versionName, versionCode)
    val pair = requireNotNull(gxrSpacewarpGatePairs[versionCode]) {
        "GXR spacewarp has no gate pair registered for $versionCode"
    }
    val library = libraryBytes ?: projectionModeResource(GXR_SPACEWARP_LIBRARY)
    val manifest = manifestBytes ?: projectionModeResource(GXR_SPACEWARP_MANIFEST)
    val gate0 = gate0Bytes ?: projectionModeResource(pair.gate0Name)
    val vts = vtsBytes ?: projectionModeResource(pair.vtsName)
    validateGxrSpacewarpPayload(library, manifest, gate0, vts, versionName, versionCode)

    // The .so mounts under lib/arm64-v8a beside the scene library; the manifest is
    // the loader's implicit.d layer entry; the gate-0 evidence is an inert asset
    // (NEVER under implicit.d — the loader parses every json there as a layer).
    val files = listOf(
        File(sceneFile.parentFile, GXR_SPACEWARP_LIBRARY) to library,
        File(apkRoot, "assets/openxr/1/api_layers/implicit.d/$GXR_SPACEWARP_MANIFEST") to manifest,
        File(apkRoot, "assets/gxr_spacewarp/${pair.gate0Name}") to gate0,
        File(apkRoot, "assets/gxr_spacewarp/${pair.vtsName}") to vts,
    )
    files.forEach { (target, expected) ->
        if (target.exists() && (!target.isFile || !target.readBytes().contentEquals(expected))) {
            throw PatchException("GXR spacewarp found a stale or modified resource: ${target.path}")
        }
    }
    val missing = files.filterNot { (target, _) -> target.exists() }
    if (missing.isEmpty()) return true

    val staged = mutableListOf<Pair<File, File>>()
    val created = mutableListOf<File>()
    try {
        missing.forEach { (target, bytes) ->
            if (!target.parentFile.isDirectory && !target.parentFile.mkdirs()) {
                throw PatchException("Could not create the GXR spacewarp resource directory")
            }
            val temporary = File.createTempFile("gxr-spacewarp-", ".tmp", target.parentFile)
            staged += temporary to target
            temporary.writeBytes(bytes)
        }
        staged.forEach { (temporary, target) ->
            // No replacement: an unexpected concurrent file must never be overwritten.
            Files.move(temporary.toPath(), target.toPath())
            created += target
        }
    } catch (failure: Exception) {
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

// Default false: experimental, headset validation pending, and the recommended
// set must not gain a frame-synthesis layer automatically (RE-SHARED-IMPL.md:
// worst case = stock, and Manager selection stays manual for experiments).
// Second base (brief 13): the exact 2.0.20/5001712 pair joins the same
// experimental object (EXPERIMENTAL name for both, one global default); the
// guard/select logic stays the exact-pair check above.
@Suppress("unused")
val gxrSpacewarpLayerPatch = rawResourcePatch(
    name = "GXR spacewarp layer (experimental)",
    description = "Synthesizes a frame when the stream misses a display tick; any failure stands down to stock. " +
        buildLabel(gxrSpacewarpCompatibilities) + " Experimental; headset validation pending.",
    default = false,
) {
    category(PatchCategories.STREAMING_AND_NETWORK)
    compatibleWith(*gxrSpacewarpCompatibilities.toTypedArray())
    execute {
        // Morphe executes dependencies recursively without rechecking compatibility.
        // Keep this build guard inside the mutation itself so an excluded APK stays untouched.
        if (!isGxrSpacewarpSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@execute
        }
        val sceneFile = get("lib/arm64-v8a/libvrlink_scene.so")
        val apkRoot = sceneFile.parentFile!!.parentFile!!.parentFile!!
        installGxrSpacewarpResources(apkRoot, packageMetadata.versionName, packageMetadata.versionCode)
    }
}