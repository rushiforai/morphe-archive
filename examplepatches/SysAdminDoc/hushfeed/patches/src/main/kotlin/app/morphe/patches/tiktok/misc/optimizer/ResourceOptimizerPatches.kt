/*
 * Adapted from kveld9/kveld-morphe-patches at
 * fcb1768620b8f98a6dd31e801074589ce9a63356 (GPL-3.0).
 * https://github.com/kveld9/kveld-morphe-patches/tree/fcb1768620b8f98a6dd31e801074589ce9a63356
 */
package app.morphe.patches.tiktok.misc.optimizer

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.diagnostics.BUILD_DETAILS_ASSET
import app.morphe.patches.tiktok.misc.diagnostics.BuildChoice
import app.morphe.patches.tiktok.misc.diagnostics.BuildDetails
import app.morphe.patches.tiktok.misc.diagnostics.buildChoicePatch
import java.util.Locale

@Suppress("unused")
val p2pRelayBlockerPatch = rawResourcePatch(
    name = "Block P2P video relay",
    description = "Removes the files TikTok uses to pass videos on to other viewers through " +
        "your phone's internet connection. The app gets about 3.5 MB smaller. It's built in while " +
        "patching, so only patching again without it brings them back.",
    default = false,
) {
    category("Performance")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(buildChoicePatch(BuildChoice.P2P))

    execute {
        val nativeFiles = listOf(
            "lib/arm64-v8a/libavmdlp2pv2.so",
            "lib/arm64-v8a/libp2plivevdp.so",
            "lib/armeabi-v7a/libavmdlp2pv2.so",
            "lib/armeabi-v7a/libp2plivevdp.so",
        )
        val result = stripVerifiedResources(
            get("."),
            "P2P Relay Blocker",
            emptyList(),
            nativeFiles,
            p2pRelayProfiles,
            resolveStandaloneFile = { path -> get(path) },
            versionName = packageMetadata.versionName,
        )
        BuildDetails.stripped(get(BUILD_DETAILS_ASSET), BuildChoice.P2P, result)
        result.report("P2P Relay Blocker")
    }
}

@Suppress("unused")
val coreAssetDebloatPatch = rawResourcePatch(
    name = "Remove content credential and card scanner assets",
    description = "Removes TikTok's built-in AI model files, payment card scanner and content " +
        "credential files, saving about 19 MB of storage. Anything in TikTok that needs them may " +
        "stop working. Only patching again without it brings them back.",
    default = false,
) {
    category("Performance")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(buildChoicePatch(BuildChoice.CORE))

    execute {
        // Only libraries nothing else in the APK links against. An emptied .so that another
        // library names in its DT_NEEDED list fails that library's dlopen ("file offset >=
        // file size: 0 >= 0"), and TikTok's Librarian turns that into an uncaught error.
        // libbytemonitor is needed by libbytebench, which the whole video editor stack loads,
        // so emptying it killed the app the moment the Create tab opened (S22, 2026-09-17);
        // libprofiler is needed by the crash handler's npth_ref_monitor and reschecker, and
        // libAndroidPitayaCore by nine Pitaya modules. All three stay. The Python runtime's five
        // libraries name only one another, and only Pitaya's feature dex, emptied here, loads them.
        val nativeFiles = listOf(
            "lib/arm64-v8a/libtt_c2pa_sdk.so",
            "lib/arm64-v8a/libtt_c2pa_sdk_d.so",
            "lib/armeabi-v7a/libtt_c2pa_sdk.so",
            "lib/armeabi-v7a/libtt_c2pa_sdk_d.so",
            "lib/arm64-v8a/libPitayaBdComponent.so",
            "lib/arm64-v8a/libPitayaTTPPolicy.so",
            "lib/arm64-v8a/libTTNativeML.so",
            "lib/arm64-v8a/libclient_ai_impl_df_jni.so",
            "lib/arm64-v8a/libclient_ai_impl_jni.so",
            "lib/arm64-v8a/libdex_df_pitaya.so",
            "lib/armeabi-v7a/libPitayaBdComponent.so",
            "lib/armeabi-v7a/libPitayaTTPPolicy.so",
            "lib/armeabi-v7a/libTTNativeML.so",
            "lib/armeabi-v7a/libclient_ai_impl_df_jni.so",
            "lib/armeabi-v7a/libclient_ai_impl_jni.so",
            "lib/armeabi-v7a/libdex_df_pitaya.so",
            "lib/arm64-v8a/libdex_df_live_cast.so",
            "lib/armeabi-v7a/libdex_df_live_cast.so",
            "lib/arm64-v8a/libartlog_monitor.so",
            "lib/armeabi-v7a/libartlog_monitor.so",
            "lib/arm64-v8a/libpythonA.so",
            "lib/arm64-v8a/libBDPythonVM.so",
            "lib/arm64-v8a/libBDMicroPythonVM.so",
            "lib/arm64-v8a/libpy-numpy.so",
            "lib/arm64-v8a/libpy-cv-numpycv.so",
            "lib/armeabi-v7a/libpythonA.so",
            "lib/armeabi-v7a/libBDPythonVM.so",
            "lib/armeabi-v7a/libBDMicroPythonVM.so",
            "lib/armeabi-v7a/libpy-numpy.so",
            "lib/armeabi-v7a/libpy-cv-numpycv.so",
        )
        val result = stripVerifiedResources(
            get("."),
            "Core Asset De-bloat",
            listOf("assets/microblink"),
            nativeFiles,
            coreAssetProfiles,
            resolveStandaloneFile = { path -> get(path) },
        )
        BuildDetails.stripped(get(BUILD_DETAILS_ASSET), BuildChoice.CORE, result)
        result.report("Core Asset De-bloat")
    }
}

@Suppress("unused")
val languagePackPurgerPatch = rawResourcePatch(
    name = "Remove unused language packs",
    description = "Removes the app languages you don't list in this patch's options, saving " +
        "up to about 26 MB of storage. English is always kept. With no list it keeps them all. " +
        "Only patching again brings removed ones back.",
    default = false,
) {
    category("Performance")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(buildChoicePatch(BuildChoice.LANGUAGES))
    val targetLocales by stringOption(
        key = "locales",
        title = "Languages to keep",
        description = "The languages to keep, as short codes separated by commas, like en, es, " +
            "pt, fr or de. Type all to keep every language. English is always kept.",
        // Keep native translations unless the user chooses which languages to remove (#67).
        default = "all",
        required = false,
    )

    execute {
        val result = stripVerifiedLanguagePacks(get("."), targetLocales, languageInventories)
        if (result.retainedLocales == null) {
            // Build details keep "unverified": nothing here was checked against a reviewed APK.
            println("[Language Pack Purger] Kept every language pack. This APK's set isn't a reviewed one, so none could be removed.")
        } else {
            BuildDetails.languages(get(BUILD_DETAILS_ASSET), result)
            if (result.files == 0) {
                println("[Language Pack Purger] Kept every reviewed language pack.")
            } else {
                result.report("Language Pack Purger")
            }
        }
    }
}

@Suppress("unused")
val studioCreationDebloatPatch = rawResourcePatch(
    name = "Remove creation tools",
    description = "Removes TikTok's camera, editing and effects files, saving about 40 MB of " +
        "storage. The catch: the Create tab and every recording, editing and effects tool stop " +
        "working.",
    default = false,
) {
    category("Performance")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(buildChoicePatch(BuildChoice.CREATION))

    execute {
        val nativeFiles = listOf(
            "lib/arm64-v8a/libEffectCreatorJni.so",
            "lib/arm64-v8a/libdex_df_camera_biz.so",
            "lib/arm64-v8a/libeffect_plugin.so",
            "lib/arm64-v8a/libttvesdk_plugin.so",
            "lib/armeabi-v7a/libEffectCreatorJni.so",
            "lib/armeabi-v7a/libdex_df_camera_biz.so",
            "lib/armeabi-v7a/libeffect_plugin.so",
            "lib/armeabi-v7a/libttvesdk_plugin.so",
        )
        val result = stripVerifiedResources(
            get("."),
            "Studio & Creation De-bloat",
            listOf("assets/model/ttfacemodel"),
            nativeFiles,
            studioAssetProfiles,
            resolveStandaloneFile = { path -> get(path) },
        )
        BuildDetails.stripped(get(BUILD_DETAILS_ASSET), BuildChoice.CREATION, result)
        result.report("Studio & Creation De-bloat")
    }
}

@Suppress("unused")
val liveStreamSuiteOptimizerPatch = rawResourcePatch(
    name = "Remove LIVE extras",
    description = "Removes the files for LIVE co-hosting, matches, games and gift effects, so " +
        "the app gets about 3 MB smaller. The catch: in LIVEs, battle scores and guest names can " +
        "go missing, and co-hosting, games or animated gifts may stop working.",
    default = false,
) {
    category("Performance")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(buildChoicePatch(BuildChoice.LIVE), liveGiftEffectOptimizerPatch)

    execute {
        val nativeFiles = listOf(
            "lib/arm64-v8a/liblink_mic_sdk.so",
            "lib/armeabi-v7a/liblink_mic_sdk.so",
        )
        val result = stripVerifiedResources(
            get("."),
            "LIVE Stream Suite Optimizer",
            listOf(
                "assets/native_runtime_server/game",
                "assets/offline/tiktok_live_tt_live_lynx_match_component_container",
            ),
            nativeFiles,
            liveAssetProfiles,
            resolveStandaloneFile = { path -> get(path) },
        )
        BuildDetails.stripped(get(BUILD_DETAILS_ASSET), BuildChoice.LIVE, result)
        result.report("LIVE Stream Suite Optimizer")
    }
}

private fun StripSummary.report(patchName: String) {
    if (files == 0) {
        println("[$patchName] This build ships none of the reviewed files, so there was nothing to empty.")
    } else if (alreadyStripped) {
        println("[$patchName] The reviewed target set was already empty.")
    } else {
        val mebibytes = String.format(Locale.US, "%.2f", bytes.toDouble() / (1024.0 * 1024.0))
        println("[$patchName] Emptied $files reviewed files ($mebibytes MiB unpacked).")
    }
}

private fun file(path: String, sha256: String) = ResourceFileContract(path, sha256)

private val microblinkFiles = listOf(
    file("assets/microblink/blinkcard/Model_1118d9d674e23996f70c6416b2bf5a6ce6ef24a6ad2c92f0ddd1e198e5f05305.rtttl", "5175cfccf687db041900edf58775cdda68553977e043941166fc63d26d460298"),
    file("assets/microblink/blinkcard/Model_349432d66ef2b216155673b634f7d5c47795bed35719b954f726b5f0856740f3.rtttl", "70c2d6e2db5739948f6b25c691454328e64fee3de381b19d4f984d238f201e2c"),
    file("assets/microblink/blinkcard/Model_3b11c3ffacbbf390b932fb9a7024f1a0016f66281ea8c790f8b5903374ad89c2.rtttl", "baae6d2360a3ce299b13b0750f6f8f21d4eb9961031b1cb6318bb59c29ca2d65"),
    file("assets/microblink/blinkcard/Model_47a2b4fe3503a673b9119db53c50711a9f9ae9b3ada515a534fdbd8013623d43.rtttl", "f088377e3391855d5ada5ff4001c89fdb6acd29a40f25b346bc988c6e84f4f50"),
    file("assets/microblink/blinkcard/Model_830c13896f96c1cb6d5cad725f44e6aae470f8672d640d20b3272ed4bb839699.rtttl", "ee18e0f7a9b964eb2fb4dd08abe6f5017f0ae9486f308c9a27d65e81dcc85aa8"),
    file("assets/microblink/blinkcard/Model_9f6734be0f5c1e4f3c6c621f4a72db8241feaf7c8705dc68a9cc07a7b634ee85.rtttl", "c0d8dca352eef82edbfcb63465f656783e5cdda57b435104c25b1a552ddd6263"),
    file("assets/microblink/blinkcard/Model_b9263312a9b623d1a3b75b643ccdcbc36aae52c278d721443468147c50e44583.rtttl", "8cd96554162a2b0b7d413d95b3d99da6cfd8e84caa499714f034850f788cbcd7"),
    file("assets/microblink/blinkcard/Model_cc1fab8df49d9a21de6c7b76ccf0dac40b17fcfb7073cc520eca073cbf8e33e9.rtttl", "61e33f9748bd27c4e2bb88fc677e05a8517b018fbc3d9899b6e9e852a627dcc0"),
    file("assets/microblink/blinkcard/Model_e946dc0b1d15d7dd6ab8b936593bd77a07a9d8a5fa7a803e531713a6f5d2eab6.rtttl", "5b531081f2d15eda91f1598089281c4a887a4990325eac3f66ffbf23de359e8f"),
    file("assets/microblink/blinkcard/Model_ee471cb6e7b68287281f761c2b05221043b9b059c6cea9132523ab2981f9a7ca.rtttl", "74174713ad1974152b8a5d92405b91bf84ee515a36f5691f7314a6b4720f352c"),
    file("assets/microblink/blinkcard/Model_f132d1bd7614b1274fafb8a41ec6c047b84b2a43654ae2da5ddd78a2765601c6.rtttl", "00caf18a73114c05903ddb448afbd1191ff07825a318664fcc82360ce7e9290d"),
    file("assets/microblink/blinkcard/device_list.json", "7093365bcfc7a97ac57f2aefb23d9be05b0fc707b5aea58305ec76a8abefd670"),
    file("assets/microblink/blinkcard/device_list_mb.json", "07b3a400c1246e09de51fc15c57308d5ff0feeb09ae2bbfa3511fdd4afe06aed"),
)

// One reviewed path set per strip for the declared build, read off its universal APK and its
// split bundle. The Pitaya, live cast, log monitor, camera, relay and link mic libraries are
// rebuilt from one TikTok build to the next, so a strip refuses any other build's files ("no
// reviewed path set matched"), and a build the bundle moves to needs its own sets read off its
// fixtures. The C2PA and Microblink files have been byte-identical on every build read so far.
private val c2paArm64Files = listOf(
    file("lib/arm64-v8a/libtt_c2pa_sdk.so", "e9c5a788ca3b36696bec2a05832d856af0a2510ccbb4d393ccdb9fbaa2aa16ba"),
    file("lib/arm64-v8a/libtt_c2pa_sdk_d.so", "a64ce0fb43e7c22e2d95d8bbfcaede522d585c5d51dbae87d24db1359c27a01a"),
)

private val c2paArmeabiFiles = listOf(
    file("lib/armeabi-v7a/libtt_c2pa_sdk.so", "24bc0cbc99cdca42ddd9062ac7deef64abaf3d1206969ef8f461c097ebdaf77c"),
    file("lib/armeabi-v7a/libtt_c2pa_sdk_d.so", "a96af4a99de68503234e3ab658d9702ac436ae1e0650dc5551e4e29a89700b0c"),
)

// 47.1.4 (APKMirror's universal APK, read on 2026-09-30): 53 paths. Its split bundle holds the
// universal APK's bytes for every file it carries.
private val pitayaFiles = listOf(
    file("lib/arm64-v8a/libPitayaBdComponent.so", "ae7cf15f60167939497dabfd2c0149d94d3b2b2ae8045a309287066ffcad4edd"),
    file("lib/arm64-v8a/libPitayaTTPPolicy.so", "644c79287cb465a2bbba9f43887eca694f0c9561e46830154c0a57473c1d3694"),
    file("lib/arm64-v8a/libTTNativeML.so", "3ee1f54531db56564834e2aa9ef39e8da71c176be8650569275e2038098ee35a"),
    file("lib/arm64-v8a/libclient_ai_impl_df_jni.so", "2cd72b97eb873e0dcc652aee6fd83b2ae959e84346a4a73e05110f54b9cc4a03"),
    file("lib/arm64-v8a/libclient_ai_impl_jni.so", "938f8a725842a9df0c8530b81896720abfa2dcb203f69faa9d374cc9d6488d96"),
    file("lib/arm64-v8a/libdex_df_pitaya.so", "f9c97cdc3d7c5e0094c9111d539821a0c99a1128fbe92df557b2af983a66064b"),
    file("lib/armeabi-v7a/libPitayaBdComponent.so", "5e2bf11472c65f754cf05cc9386309d1be8d85f66e797bc416a0ef12c28bdb18"),
    file("lib/armeabi-v7a/libPitayaTTPPolicy.so", "2cc41a8339a8ac6c4cd64e96c0cc70e1b0e90d96d761a41dd6a1219511ac2e83"),
    file("lib/armeabi-v7a/libTTNativeML.so", "48ab30a6114c2ce2fda2aa6222eff2313c0128dc8962175c1bb1cdfa61fbfeac"),
    file("lib/armeabi-v7a/libclient_ai_impl_df_jni.so", "9efe835fa5f754ad14540f6246dcf7f7d01b2f18b3606af0fde5cf7f6b2d1d6b"),
    file("lib/armeabi-v7a/libclient_ai_impl_jni.so", "b11f7872f1f0c9b51a7ec8c6a1add5500b76b8ae33dabbf41e5c97f966b52a96"),
    file("lib/armeabi-v7a/libdex_df_pitaya.so", "f9c97cdc3d7c5e0094c9111d539821a0c99a1128fbe92df557b2af983a66064b"),
)

private val monitorFiles = listOf(
    file("lib/arm64-v8a/libartlog_monitor.so", "58ef4dc22fbbfae9ed1099ceba0f9c8549bdf6ecdb46c7a52b92ad0102fb19d3"),
    file("lib/armeabi-v7a/libartlog_monitor.so", "2f5810cf024b209e0c6de883af8ca92325217571a39d4ad58035cb8c3ea0c251"),
)

private val liveCastFiles = listOf(
    file("lib/arm64-v8a/libdex_df_live_cast.so", "c8320f1bb23d3d7b8b06edda0b8b9ce580bbbbfe73c5a238cad9b7e363e2e8d1"),
    file("lib/armeabi-v7a/libdex_df_live_cast.so", "c8320f1bb23d3d7b8b06edda0b8b9ce580bbbbfe73c5a238cad9b7e363e2e8d1"),
)

// Pitaya's Python runtime, read off every fixture on 2026-10-08. The five libraries only link one
// another, and the one thing that names them outside that set is libdex_df_pitaya's dex, which
// this strip empties too (libreschecker lists two of them, as it lists TTNativeML). The split
// bundle carries the arm64 set at these bytes and none of the armeabi-v7a one.
private val pythonArm64Files = listOf(
    file("lib/arm64-v8a/libpythonA.so", "b64a04f94b0af582c97489312627cf2452a254b8ef9f9aa82570c103554aa7e4"),
    file("lib/arm64-v8a/libBDPythonVM.so", "dab0e910387292b1471329b92452013f4572fe15de8db9f5947b3b14cf9254c4"),
    file("lib/arm64-v8a/libBDMicroPythonVM.so", "096c7a0dc264e67da014cec7d7d2fd18129040381bd934ac643d604f4410a29b"),
    file("lib/arm64-v8a/libpy-numpy.so", "24927708429326db6fe3a932bc01ea7cece3df9fe10b2c05b3d7ebac1655f026"),
    file("lib/arm64-v8a/libpy-cv-numpycv.so", "d8faa75b0b5acd7450182ecb3f8201a6783bdc834c18784d5e7ae15142fe1f2a"),
)

private val pythonArmeabiFiles = listOf(
    file("lib/armeabi-v7a/libpythonA.so", "ab27865b2778888a3ea941c9bc9081ec9cb3c1ff4d27e7f8e745a642c9164e83"),
    file("lib/armeabi-v7a/libBDPythonVM.so", "43ddecc4a35aaeca5107f044c5619f55ba2fa9e44b319510b167d0fda0bb8048"),
    file("lib/armeabi-v7a/libBDMicroPythonVM.so", "d13e83b23c603b4f7079be7e0c6ddd147327f173d845f3dd935eb321e6f030da"),
    file("lib/armeabi-v7a/libpy-numpy.so", "4fcd5dbdcd75d71d72d6300f0020686d7986bc89d95c8fba4fefc2980db4e35a"),
    file("lib/armeabi-v7a/libpy-cv-numpycv.so", "c2f6a1648cb37e700f123d19dae30f5121e90bceafc75f12c9d039c3e810d284"),
)

/** The Python runtime's armeabi-v7a paths, none of which a split bundle carries. */
private val pythonArmeabiPaths = pythonArmeabiFiles.map { it.path }.toTypedArray()

// APKMirror also sells TikTok as a split bundle (tiktok-47-1-4, "arm64-v8a + armeabi-v7a",
// 120-640dpi, read on 2026-09-30). Morphe Manager and the desktop CLI merge every split in one,
// and every file the merged APK shares with the universal APK is byte-identical: the arm64
// libraries it carries, only part of the armeabi-v7a set, and some of the 64 language asset
// directories, because those ship as language splits. Each bundle profile is the universal APK's
// profile less the files the bundle doesn't have: besides that part of the armeabi-v7a set, the
// arm64 C2PA debug library, both arm64 editor plugins and all four P2P relay libraries. It keeps
// 25 languages.

/** [profile] without [absent], every one of which it must list: its build's split bundle. */
private fun bundleOf(profile: ResourceProfile, vararg absent: String): ResourceProfile {
    val paths = profile.files.map { it.path }.toSet()
    val missing = absent.filterNot { it in paths }
    check(missing.isEmpty()) { "${profile.label} does not list $missing, so it cannot be left out of the bundle profile" }
    return ResourceProfile("${profile.label} split bundle", profile.files.filterNot { it.path in absent })
}

private val coreAssets = ResourceProfile(
    "TikTok 47.1.4",
    microblinkFiles + c2paArm64Files + c2paArmeabiFiles + pitayaFiles + monitorFiles + liveCastFiles +
        pythonArm64Files + pythonArmeabiFiles,
)

internal val coreAssetProfiles = listOf(
    coreAssets,
    bundleOf(
        coreAssets,
        "lib/arm64-v8a/libtt_c2pa_sdk_d.so",
        "lib/armeabi-v7a/libtt_c2pa_sdk_d.so",
        "lib/armeabi-v7a/libPitayaBdComponent.so",
        "lib/armeabi-v7a/libPitayaTTPPolicy.so",
        "lib/armeabi-v7a/libTTNativeML.so",
        "lib/armeabi-v7a/libclient_ai_impl_df_jni.so",
        "lib/armeabi-v7a/libdex_df_pitaya.so",
        "lib/armeabi-v7a/libdex_df_live_cast.so",
        *pythonArmeabiPaths,
    ),
)

private val studioArm64Files = listOf(
    file("assets/model/ttfacemodel/tt_face_v11.1.model", "c4b081d04f6829f7cd5849abca0941891f1a7f2cb250efd7f0e42fece5426610"),
    file("lib/arm64-v8a/libEffectCreatorJni.so", "b7db28436aa1ccd85e3d52d1f916817397be6b35dfff40d1bb69d0d5251a3293"),
    file("lib/arm64-v8a/libeffect_plugin.so", "2990d5bf76d832b4a6c25bbd9540f3191e86aa8342c54a638fad26ada2806be3"),
    file("lib/arm64-v8a/libttvesdk_plugin.so", "0f1cc7737330f8a9b81e03f3ab15eecea197254c16c23b5492c5424aaf51d6c0"),
)

// The camera feature library is the same bytes for both ABIs.
private val studioAssets = ResourceProfile(
    "TikTok 47.1.4",
    studioArm64Files +
        file("lib/arm64-v8a/libdex_df_camera_biz.so", "00a381fc36185d3b3017b28b1f468be14106af36f94d4ec8a2874748dd36a870") +
        listOf(
            file("lib/armeabi-v7a/libEffectCreatorJni.so", "d3ae58712413c2d1d06dcf508eb7850452f58c93b9befd57867cd029421c9482"),
            file("lib/armeabi-v7a/libdex_df_camera_biz.so", "00a381fc36185d3b3017b28b1f468be14106af36f94d4ec8a2874748dd36a870"),
            file("lib/armeabi-v7a/libeffect_plugin.so", "f89bd50e941392fee2e47d031711fdce3520dae7f3e531da59dd0afbbec9d91c"),
            file("lib/armeabi-v7a/libttvesdk_plugin.so", "42ab2be66f2b02622f52062fc3ff1b4862f44f0098faecfac3996afe3e7cf1f9"),
        ),
)

internal val studioAssetProfiles = listOf(
    studioAssets,
    bundleOf(
        studioAssets,
        "lib/arm64-v8a/libeffect_plugin.so",
        "lib/arm64-v8a/libttvesdk_plugin.so",
        "lib/armeabi-v7a/libEffectCreatorJni.so",
        "lib/armeabi-v7a/libdex_df_camera_biz.so",
        "lib/armeabi-v7a/libeffect_plugin.so",
        "lib/armeabi-v7a/libttvesdk_plugin.so",
    ),
)

internal val liveAssetProfiles = listOf(
    // The universal APK and the split bundle carry these five files byte for byte.
    ResourceProfile(
        "TikTok 47.1.4",
        listOf(
            file("assets/native_runtime_server/game/scripts/ttmg-core.js.zip", "897d0f54569ea8c34b31652943f9abd7f89a842357078ea9bc78ca47fa0c8a14"),
            file("assets/offline/tiktok_live_tt_live_lynx_match_component_container/mainV12/template.js", "d648b3e0ad779a0dde442ca381212661ea97eeddc255dbb92003aab5f4514460"),
            file("assets/offline/tiktok_live_tt_live_lynx_match_component_container/match_invitee_v3/template.js", "8e84ec297249a771c9c9d56438f6c509d2a0f438c759ee65e212ab14ef7cb3eb"),
            file("lib/arm64-v8a/liblink_mic_sdk.so", "5403e0fff6e1dcfd9088db4e770bf1cdffbef2906062bf13f0120ffdc7f3d6e3"),
            file("lib/armeabi-v7a/liblink_mic_sdk.so", "501d2d72247cba87d38871d2488e7dbd79f7c71acc575fbd0cef5146711e3a98"),
        ),
    ),
)

internal val p2pRelayProfiles = listOf(
    ResourceProfile(
        "TikTok 47.1.4",
        listOf(
            file("lib/arm64-v8a/libavmdlp2pv2.so", "caf93bb834c9b4efb483dd47182c44ec5094c0a024f202049eec0aba92dbe43b"),
            file("lib/arm64-v8a/libp2plivevdp.so", "ed35b032fac7c169860d3f37bc3be1933df9bddc8ac6785413f9608945946337"),
            file("lib/armeabi-v7a/libavmdlp2pv2.so", "d1945d14b66511c8f8c29a6ed2d7523884ef41a730585e1badc5228c577570bc"),
            file("lib/armeabi-v7a/libp2plivevdp.so", "dd8a626f8b0efe36a883096923bed56ecb457e9408b26262c844442901dc1d09"),
        ),
    ),
    // The split bundle ships no relay library at all, so there is nothing to empty. Only on
    // 47.1.4: another build without these files has renamed or moved them, and the strip must
    // refuse it.
    ResourceProfile("TikTok 47.1.4 split bundle", emptyList(), onlyVersion = "47.1.4"),
)

internal val languageInventories = listOf(
    // The universal APK: 207 files in 64 directories.
    LanguageInventoryContract(
        directories = setOf(
            "af", "ar", "az", "bg", "bn", "ca", "ceb", "cs", "da", "de", "el", "en", "es", "et", "fa", "fi",
            "fil", "fr", "ga", "gu", "he", "hi", "hr", "hu", "id", "in", "is", "it", "iw", "ja", "jv", "kk",
            "km", "kn", "ko", "lt", "lv", "ml", "mr", "ms", "my", "nb", "nl", "or", "pa", "pl", "pt", "ro",
            "ru", "sk", "sl", "sq", "sv", "sw", "ta", "te", "th", "tr", "uk", "ur", "uz", "vi", "zh", "zu",
        ),
        pathManifestSha256 = "38f412319f00a31a025e03095ea9bf4266b412c2322d2a6b0b4a031a073b0c08",
        contentManifestSha256 = setOf("f1e693f4041fba07ba1f505edd8baded98afe23acd461180bae56d2f470e330c"),
    ),
    // The split bundle: 25 language splits and 102 files.
    LanguageInventoryContract(
        directories = setOf(
            "ar", "de", "en", "es", "et", "fi", "fr", "hi", "hu", "id", "in", "it", "ja", "ko", "ms", "nl",
            "pl", "pt", "ru", "sv", "th", "tr", "uk", "vi", "zh",
        ),
        pathManifestSha256 = "33aad0753feebf540e226b415eecfc59323d40f7b52dfc70a06bd278e7acc9a6",
        contentManifestSha256 = setOf("c92a42adcd81b317ac6b83ac9c88f55767f2bb470e27d5becc57ce305bf32255"),
    ),
)
