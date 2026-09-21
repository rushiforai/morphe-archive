/*
 * Adapted from kveld9/kveld-morphe-patches at
 * fcb1768620b8f98a6dd31e801074589ce9a63356 (GPL-3.0).
 * https://github.com/kveld9/kveld-morphe-patches/tree/fcb1768620b8f98a6dd31e801074589ce9a63356
 */
package app.morphe.patches.tiktok.misc.optimizer

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.shared.compat.AppCompatibilities
import java.util.Locale

@Suppress("unused")
val p2pRelayBlockerPatch = rawResourcePatch(
    name = "Block P2P video relay",
    description = "Strips TikTok's peer-to-peer CDN libraries so your phone is not used as a relay node for other people's video traffic. Saves battery and mobile data.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4703())

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
        )
        result.report("P2P Relay Blocker")
    }
}

@Suppress("unused")
val coreAssetDebloatPatch = rawResourcePatch(
    name = "Remove content credential and card scanner assets",
    description = "Empties TikTok's bundled C2PA and Microblink card-scanning assets, the Pitaya AI model libraries, the live-cast dynamic feature, and the ART log monitor probe.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4703())

    execute {
        // Only libraries nothing else in the APK links against. An emptied .so that another
        // library names in its DT_NEEDED list fails that library's dlopen ("file offset >=
        // file size: 0 >= 0"), and TikTok's Librarian turns that into an uncaught error.
        // libbytemonitor is needed by libbytebench, which the whole video editor stack loads,
        // so emptying it killed the app the moment the Create tab opened (S22, 2026-09-17);
        // libprofiler is needed by the crash handler's npth_ref_monitor and reschecker, and
        // libAndroidPitayaCore by nine Pitaya modules. All three stay.
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
        )
        val result = stripVerifiedResources(
            get("."),
            "Core Asset De-bloat",
            listOf("assets/microblink"),
            nativeFiles,
            coreAssetProfiles,
            resolveStandaloneFile = { path -> get(path) },
        )
        result.report("Core Asset De-bloat")
    }
}

@Suppress("unused")
val languagePackPurgerPatch = rawResourcePatch(
    name = "Remove unused language packs",
    description = "Empties unselected TikTok language bundles while always keeping English. Selected language codes are checked before any file changes.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4703())
    val targetLocales by stringOption(
        key = "locales",
        title = "Languages to keep",
        description = "Comma-separated language codes such as en, es, pt, fr or de. English is always kept.",
        default = "en",
        required = false,
    )

    execute {
        stripVerifiedLanguagePacks(get("."), targetLocales, languageInventories).report("Language Pack Purger")
    }
}

@Suppress("unused")
val studioCreationDebloatPatch = rawResourcePatch(
    name = "Remove creation tools",
    description = "Empties TikTok's reviewed editor, camera-effect and face-model assets. The Create tab and all recording, editing and effects tools stop working. Switch: Hushfeed settings > App behavior.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4703())

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
        result.report("Studio & Creation De-bloat")
    }
}

@Suppress("unused")
val liveStreamSuiteOptimizerPatch = rawResourcePatch(
    name = "Remove LIVE extras",
    description = "Empties TikTok's link-mic and LIVE match or minigame assets, then skips its gift-effect widget setup. Co-hosting, games and animated gifts may stop.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4703())
    dependsOn(liveGiftEffectOptimizerPatch)

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
        result.report("LIVE Stream Suite Optimizer")
    }
}

private fun StripSummary.report(patchName: String) {
    if (alreadyStripped) {
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

private val pitayaFiles4623 = listOf(
    file("lib/arm64-v8a/libPitayaBdComponent.so", "ae7cf15f60167939497dabfd2c0149d94d3b2b2ae8045a309287066ffcad4edd"),
    file("lib/arm64-v8a/libPitayaTTPPolicy.so", "4d6514622e8083074d657d4ed088ba06796185023f0fad77fe38d3dfeff6be08"),
    file("lib/arm64-v8a/libTTNativeML.so", "8567d7a37ac0d0a45d90893d288c2432466e24773e0ecb100be82ea106cd3ff5"),
    file("lib/arm64-v8a/libclient_ai_impl_df_jni.so", "237d31094271153e2c1f88427c272c213ac8cb5a106363819f862bb03777f530"),
    file("lib/arm64-v8a/libclient_ai_impl_jni.so", "6ecc63f593fc3dc5a875322efc6a9ba1bc2a8be0e68084340a0315acd4f901cc"),
    file("lib/arm64-v8a/libdex_df_pitaya.so", "496e2037cecdaeb31d7262ba656e0856ec79c59f46eb3957becfe4b6ba0ff6fb"),
    file("lib/armeabi-v7a/libPitayaBdComponent.so", "509dd74746e6473757abaee5fa5353250b45845df0d6eea94c13af08db6cc1f9"),
    file("lib/armeabi-v7a/libPitayaTTPPolicy.so", "c43526b61a15fd4edddb4651191a305275b03302fc28c62bd07716ec6a9a54e6"),
    file("lib/armeabi-v7a/libTTNativeML.so", "1982bf9f4353d4f5d874aaee19744378b63952eb2dbd15b998cc1d1652d2d796"),
    file("lib/armeabi-v7a/libclient_ai_impl_df_jni.so", "e347553011515ae1ed67e28a3e7bf318eb8a494e80496054b5256bf80ef68fb2"),
    file("lib/armeabi-v7a/libclient_ai_impl_jni.so", "4fabf2b022a874b221ab239e11d56c79ca59a9ce92e1cf1193892d8a3cd03b32"),
    file("lib/armeabi-v7a/libdex_df_pitaya.so", "496e2037cecdaeb31d7262ba656e0856ec79c59f46eb3957becfe4b6ba0ff6fb"),
)

private val monitorFiles4623 = listOf(
    file("lib/arm64-v8a/libartlog_monitor.so", "a2c72c6fdedc2bb9f1d56f241b40e3505ce33851a9fe4257c9b2ca5cf5eadd73"),
    file("lib/armeabi-v7a/libartlog_monitor.so", "4ae823d1dbb15f4002e48ed28a740e1c85e37d3e915847b54a62c1aadf6acebb"),
)

private val liveCastFiles4623 = listOf(
    file("lib/arm64-v8a/libdex_df_live_cast.so", "3189dad02b2c99caac3511da1ba9e761ab452299bf3fc495867c76cfbde679f2"),
    file("lib/armeabi-v7a/libdex_df_live_cast.so", "3189dad02b2c99caac3511da1ba9e761ab452299bf3fc495867c76cfbde679f2"),
)

// The C2PA and Microblink files are byte-identical on every retained build. The Pitaya, live
// cast and log monitor libraries are not: each build ships its own, and 46.7.3 and 46.8.3 ship
// arm64 only. One reviewed path set per build, read off the fixtures on 2026-09-17, or the
// receipt's forced runs on the newer builds refuse the group ("no reviewed path set matched").
private val c2paArm64Files = listOf(
    file("lib/arm64-v8a/libtt_c2pa_sdk.so", "e9c5a788ca3b36696bec2a05832d856af0a2510ccbb4d393ccdb9fbaa2aa16ba"),
    file("lib/arm64-v8a/libtt_c2pa_sdk_d.so", "a64ce0fb43e7c22e2d95d8bbfcaede522d585c5d51dbae87d24db1359c27a01a"),
)

private val c2paArmeabiFiles = listOf(
    file("lib/armeabi-v7a/libtt_c2pa_sdk.so", "24bc0cbc99cdca42ddd9062ac7deef64abaf3d1206969ef8f461c097ebdaf77c"),
    file("lib/armeabi-v7a/libtt_c2pa_sdk_d.so", "a96af4a99de68503234e3ab658d9702ac436ae1e0650dc5551e4e29a89700b0c"),
)

private val pitayaFiles4673 = listOf(
    file("lib/arm64-v8a/libPitayaBdComponent.so", "ae7cf15f60167939497dabfd2c0149d94d3b2b2ae8045a309287066ffcad4edd"),
    file("lib/arm64-v8a/libPitayaTTPPolicy.so", "cfdde9c90b7a1e8a7258f50eab8d626326026de282b1b40c8da82556c708d12d"),
    file("lib/arm64-v8a/libTTNativeML.so", "c3e8635ba8f6bddaa297f096153d668c88f2b2457d1ecc95fbf79350232bf513"),
    file("lib/arm64-v8a/libclient_ai_impl_df_jni.so", "400dd59e695e229017cb4835ab997d54280b35de4b4d9f3deb602db29c0b18a5"),
    file("lib/arm64-v8a/libclient_ai_impl_jni.so", "d0f460ff1a77521c51adbcee6597a6e3afc2dbd849f4b563fb5e3eb00f2dd624"),
    file("lib/arm64-v8a/libdex_df_pitaya.so", "fd207d5750c7ffa9614f0fdd8ef5ea6fe546bde765387795d6833063d8e715e3"),
)

private val monitorFiles4673 = listOf(
    file("lib/arm64-v8a/libartlog_monitor.so", "58ef4dc22fbbfae9ed1099ceba0f9c8549bdf6ecdb46c7a52b92ad0102fb19d3"),
)

private val liveCastFiles4673 = listOf(
    file("lib/arm64-v8a/libdex_df_live_cast.so", "4625d073c58177af99917f782cd03236052f58e1bb83688833d54bf82f770176"),
)

private val pitayaFiles4683 = listOf(
    file("lib/arm64-v8a/libPitayaBdComponent.so", "ae7cf15f60167939497dabfd2c0149d94d3b2b2ae8045a309287066ffcad4edd"),
    file("lib/arm64-v8a/libPitayaTTPPolicy.so", "cfdde9c90b7a1e8a7258f50eab8d626326026de282b1b40c8da82556c708d12d"),
    file("lib/arm64-v8a/libTTNativeML.so", "d36ee98f6f830ac707e92667f6c722414e4387b97ece99e30ddaf34d807d27f5"),
    file("lib/arm64-v8a/libclient_ai_impl_df_jni.so", "6672f774e57996e25465104dbb17e13b5cd1895e96375f2dd2a0bf121e6bb83d"),
    file("lib/arm64-v8a/libclient_ai_impl_jni.so", "aa7205cc36f70214bb805121717cb42bdc116c31d66ca09ee7269c499751220b"),
    file("lib/arm64-v8a/libdex_df_pitaya.so", "e114beb125f615cb7403cfa32c21e5d19884cc11e4b1a6b3132421b23d9a4f5e"),
)

private val monitorFiles4683 = listOf(
    file("lib/arm64-v8a/libartlog_monitor.so", "58ef4dc22fbbfae9ed1099ceba0f9c8549bdf6ecdb46c7a52b92ad0102fb19d3"),
)

private val liveCastFiles4683 = listOf(
    file("lib/arm64-v8a/libdex_df_live_cast.so", "3f5bb5827457443d6c928cf899e88ea330542faf7229ade8a6a134aaa1fc9df6"),
)

private val pitayaFiles4693 = listOf(
    file("lib/arm64-v8a/libPitayaBdComponent.so", "ae7cf15f60167939497dabfd2c0149d94d3b2b2ae8045a309287066ffcad4edd"),
    file("lib/arm64-v8a/libPitayaTTPPolicy.so", "644c79287cb465a2bbba9f43887eca694f0c9561e46830154c0a57473c1d3694"),
    file("lib/arm64-v8a/libTTNativeML.so", "3ee1f54531db56564834e2aa9ef39e8da71c176be8650569275e2038098ee35a"),
    file("lib/arm64-v8a/libclient_ai_impl_df_jni.so", "fa6bfab1f2a98bbe1c6d91aba8f482870025ff88cdc7edc9b7b5d9ccfb1a922a"),
    file("lib/arm64-v8a/libclient_ai_impl_jni.so", "68526523a6c7b17f105647f5856e06cea74c5a7c28d6971a360a95360f1c13fb"),
    file("lib/arm64-v8a/libdex_df_pitaya.so", "a7a84478d2d4202e688f4f76910ebc7d245cc71caadde805537c4d85be2e102a"),
    file("lib/armeabi-v7a/libPitayaBdComponent.so", "220748d0bf194d4eebfef7dd004533716de7b2b085c997d015811fd1991efc65"),
    file("lib/armeabi-v7a/libPitayaTTPPolicy.so", "67e1414f464907311a16567c69717289ed67f3a5334c281913c040cfa7f37a55"),
    file("lib/armeabi-v7a/libTTNativeML.so", "22faf86123cff1bfdff97bae69c2bf9dee9dfb8fb6d0bc2bf89a61c45b3d3bca"),
    file("lib/armeabi-v7a/libclient_ai_impl_df_jni.so", "cd81cbd9e342392dab3eb85732c3db293b312ec967e66a82f8455c3b1bcf917e"),
    file("lib/armeabi-v7a/libclient_ai_impl_jni.so", "14fd15d3b83fa2f064f72948a5cc3b043531a11d0725698a8eaf93a8c6c9ed18"),
    file("lib/armeabi-v7a/libdex_df_pitaya.so", "a7a84478d2d4202e688f4f76910ebc7d245cc71caadde805537c4d85be2e102a"),
)

private val monitorFiles4693 = listOf(
    file("lib/arm64-v8a/libartlog_monitor.so", "58ef4dc22fbbfae9ed1099ceba0f9c8549bdf6ecdb46c7a52b92ad0102fb19d3"),
    file("lib/armeabi-v7a/libartlog_monitor.so", "2f5810cf024b209e0c6de883af8ca92325217571a39d4ad58035cb8c3ea0c251"),
)

private val liveCastFiles4693 = listOf(
    file("lib/arm64-v8a/libdex_df_live_cast.so", "499ed07c6858a5739f55f46bb61b3de64e4dd0aacac76a6f22b01f3f8f058a76"),
    file("lib/armeabi-v7a/libdex_df_live_cast.so", "499ed07c6858a5739f55f46bb61b3de64e4dd0aacac76a6f22b01f3f8f058a76"),
)

private val pitayaFiles4703 = listOf(
    file("lib/arm64-v8a/libPitayaBdComponent.so", "ae7cf15f60167939497dabfd2c0149d94d3b2b2ae8045a309287066ffcad4edd"),
    file("lib/arm64-v8a/libPitayaTTPPolicy.so", "644c79287cb465a2bbba9f43887eca694f0c9561e46830154c0a57473c1d3694"),
    file("lib/arm64-v8a/libTTNativeML.so", "3ee1f54531db56564834e2aa9ef39e8da71c176be8650569275e2038098ee35a"),
    file("lib/arm64-v8a/libclient_ai_impl_df_jni.so", "0c64685ecba21ac989ba09d95db354e9b58f94afe1e33854bcc20a17cffbe83d"),
    file("lib/arm64-v8a/libclient_ai_impl_jni.so", "eefae6587b6086b9b84a867bcb1ec0661ee1c804776f527948f5974ddb844aa3"),
    file("lib/arm64-v8a/libdex_df_pitaya.so", "dc3572e0018f3adfb411bcff3f47656efda0d5015ab92cedd8bc920b2e9815d9"),
    file("lib/armeabi-v7a/libPitayaBdComponent.so", "5e2bf11472c65f754cf05cc9386309d1be8d85f66e797bc416a0ef12c28bdb18"),
    file("lib/armeabi-v7a/libPitayaTTPPolicy.so", "2cc41a8339a8ac6c4cd64e96c0cc70e1b0e90d96d761a41dd6a1219511ac2e83"),
    file("lib/armeabi-v7a/libTTNativeML.so", "48ab30a6114c2ce2fda2aa6222eff2313c0128dc8962175c1bb1cdfa61fbfeac"),
    file("lib/armeabi-v7a/libclient_ai_impl_df_jni.so", "96d7dcaf53cbb0e3767ae173eb3f8a6440e25b04115638117da6c2798ede4ef3"),
    file("lib/armeabi-v7a/libclient_ai_impl_jni.so", "c9f027fdea76e9e9a3ea8008ceb1719d6592b2d46492a7e8ea2118b8734e5077"),
    file("lib/armeabi-v7a/libdex_df_pitaya.so", "dc3572e0018f3adfb411bcff3f47656efda0d5015ab92cedd8bc920b2e9815d9"),
)

private val monitorFiles4703 = listOf(
    file("lib/arm64-v8a/libartlog_monitor.so", "58ef4dc22fbbfae9ed1099ceba0f9c8549bdf6ecdb46c7a52b92ad0102fb19d3"),
    file("lib/armeabi-v7a/libartlog_monitor.so", "2f5810cf024b209e0c6de883af8ca92325217571a39d4ad58035cb8c3ea0c251"),
)

private val liveCastFiles4703 = listOf(
    file("lib/arm64-v8a/libdex_df_live_cast.so", "99da027c27858b6500bcf439b61bf640b2a537638266eaf134eeb90f8bf3fb30"),
    file("lib/armeabi-v7a/libdex_df_live_cast.so", "99da027c27858b6500bcf439b61bf640b2a537638266eaf134eeb90f8bf3fb30"),
)

// APKMirror also sells 46.2.3 as a split bundle (tiktok-46-2-3-2, "arm64-v8a + arm-v7a",
// 120-640dpi). Morphe Manager and the desktop CLI merge every split in it, and the merged APK
// carries a strict subset of the universal APK's files, every one of them byte-identical: all of
// the arm64 libraries, only part of the armeabi-v7a set, one C2PA debug library fewer, and 25 of
// the 64 language asset directories, because those ship as language splits. Each bundle profile is
// the 46.2.3 profile less the files the bundle does not have, read off the bundle on 2026-09-18
// (issue #9, where all four strips refused it).
private const val BUNDLE_4623 = "TikTok 46.2.3 split bundle"

/** [profile] without [absent], every one of which it must list. */
private fun bundleOf(profile: ResourceProfile, vararg absent: String): ResourceProfile {
    val paths = profile.files.map { it.path }.toSet()
    val missing = absent.filterNot { it in paths }
    check(missing.isEmpty()) { "${profile.label} does not list $missing, so it cannot be left out of the bundle profile" }
    return ResourceProfile(BUNDLE_4623, profile.files.filterNot { it.path in absent })
}

private val coreAssets4623 = ResourceProfile(
    "TikTok 46.2.3",
    microblinkFiles + c2paArm64Files + c2paArmeabiFiles + pitayaFiles4623 + monitorFiles4623 + liveCastFiles4623,
)

internal val coreAssetProfiles = listOf(
    coreAssets4623,
    bundleOf(
        coreAssets4623,
        "lib/arm64-v8a/libtt_c2pa_sdk_d.so",
        "lib/armeabi-v7a/libtt_c2pa_sdk_d.so",
        "lib/armeabi-v7a/libPitayaBdComponent.so",
        "lib/armeabi-v7a/libPitayaTTPPolicy.so",
        "lib/armeabi-v7a/libTTNativeML.so",
        "lib/armeabi-v7a/libclient_ai_impl_df_jni.so",
        "lib/armeabi-v7a/libdex_df_pitaya.so",
        "lib/armeabi-v7a/libdex_df_live_cast.so",
    ),
    ResourceProfile(
        "TikTok 46.7.3",
        microblinkFiles + c2paArm64Files + pitayaFiles4673 + monitorFiles4673 + liveCastFiles4673,
    ),
    ResourceProfile(
        "TikTok 46.8.3",
        microblinkFiles + c2paArm64Files + pitayaFiles4683 + monitorFiles4683 + liveCastFiles4683,
    ),
    ResourceProfile(
        "TikTok 46.9.3",
        microblinkFiles + c2paArm64Files + c2paArmeabiFiles + pitayaFiles4693 + monitorFiles4693 + liveCastFiles4693,
    ),
    ResourceProfile(
        "TikTok 47.0.3",
        microblinkFiles + c2paArm64Files + c2paArmeabiFiles + pitayaFiles4703 + monitorFiles4703 + liveCastFiles4703,
    ),
)

private val studioArm64Files = listOf(
    file("assets/model/ttfacemodel/tt_face_v11.1.model", "c4b081d04f6829f7cd5849abca0941891f1a7f2cb250efd7f0e42fece5426610"),
    file("lib/arm64-v8a/libEffectCreatorJni.so", "b7db28436aa1ccd85e3d52d1f916817397be6b35dfff40d1bb69d0d5251a3293"),
    file("lib/arm64-v8a/libeffect_plugin.so", "2990d5bf76d832b4a6c25bbd9540f3191e86aa8342c54a638fad26ada2806be3"),
    file("lib/arm64-v8a/libttvesdk_plugin.so", "0f1cc7737330f8a9b81e03f3ab15eecea197254c16c23b5492c5424aaf51d6c0"),
)

private val studioArmV7Files = listOf(
    file("lib/armeabi-v7a/libEffectCreatorJni.so", "d3ae58712413c2d1d06dcf508eb7850452f58c93b9befd57867cd029421c9482"),
    file("lib/armeabi-v7a/libdex_df_camera_biz.so", "007e1196a936af0c15ced6749b01b5cfb29f8d16858af7c3a9eaffd0c57a01a7"),
    file("lib/armeabi-v7a/libeffect_plugin.so", "f89bd50e941392fee2e47d031711fdce3520dae7f3e531da59dd0afbbec9d91c"),
    file("lib/armeabi-v7a/libttvesdk_plugin.so", "42ab2be66f2b02622f52062fc3ff1b4862f44f0098faecfac3996afe3e7cf1f9"),
)

private fun studioProfile(label: String, cameraDigest: String, additionalFiles: List<ResourceFileContract> = emptyList()) = ResourceProfile(
    label,
    studioArm64Files + file("lib/arm64-v8a/libdex_df_camera_biz.so", cameraDigest) + additionalFiles,
)

private val studioAssets4623 = studioProfile(
    "TikTok 46.2.3",
    "007e1196a936af0c15ced6749b01b5cfb29f8d16858af7c3a9eaffd0c57a01a7",
    studioArmV7Files,
)

internal val studioAssetProfiles = listOf(
    studioAssets4623,
    bundleOf(studioAssets4623, *studioArmV7Files.map { it.path }.toTypedArray()),
    studioProfile("TikTok 46.7.3", "a373335786f26d0da9089a0c470c9b97b2beb6a2b59e4532e9f3dd6fb2ca793b"),
    studioProfile("TikTok 46.8.3", "9dda032818072944eaca3c08cbdf55103ceda0cc9707e7130993c54c204105f4"),
    // Both ABIs again, like 46.2.3, with one camera library digest shared by the two and every
    // other file unchanged since 46.2.3. Read off the retained fixture on 2026-09-16.
    ResourceProfile(
        "TikTok 46.9.3",
        studioArm64Files +
            file("lib/arm64-v8a/libdex_df_camera_biz.so", "82c825d91113b4ad1b9d111717859f6a070e9e0da378ba5a610757906962b595") +
            listOf(
                file("lib/armeabi-v7a/libEffectCreatorJni.so", "d3ae58712413c2d1d06dcf508eb7850452f58c93b9befd57867cd029421c9482"),
                file("lib/armeabi-v7a/libdex_df_camera_biz.so", "82c825d91113b4ad1b9d111717859f6a070e9e0da378ba5a610757906962b595"),
                file("lib/armeabi-v7a/libeffect_plugin.so", "f89bd50e941392fee2e47d031711fdce3520dae7f3e531da59dd0afbbec9d91c"),
                file("lib/armeabi-v7a/libttvesdk_plugin.so", "42ab2be66f2b02622f52062fc3ff1b4862f44f0098faecfac3996afe3e7cf1f9"),
            ),
    ),
    ResourceProfile(
        "TikTok 47.0.3",
        studioArm64Files +
            file("lib/arm64-v8a/libdex_df_camera_biz.so", "23f4988d556a79b71736a007085e885c8174a1946b68099639c8df7d681b2956") +
            listOf(
                file("lib/armeabi-v7a/libEffectCreatorJni.so", "d3ae58712413c2d1d06dcf508eb7850452f58c93b9befd57867cd029421c9482"),
                file("lib/armeabi-v7a/libdex_df_camera_biz.so", "23f4988d556a79b71736a007085e885c8174a1946b68099639c8df7d681b2956"),
                file("lib/armeabi-v7a/libeffect_plugin.so", "f89bd50e941392fee2e47d031711fdce3520dae7f3e531da59dd0afbbec9d91c"),
                file("lib/armeabi-v7a/libttvesdk_plugin.so", "42ab2be66f2b02622f52062fc3ff1b4862f44f0098faecfac3996afe3e7cf1f9"),
            ),
    ),
)

internal val liveAssetProfiles = listOf(
    ResourceProfile(
        "TikTok 46.2.3",
        listOf(
            file("assets/native_runtime_server/game/scripts/ttmg-core.js.zip", "0d761a8a1f50fab6f572a92ce1f01e6604c363ea81a78c268f326a61aa302542"),
            file("assets/offline/tiktok_live_tt_live_lynx_match_component_container/mainV12/template.js", "3d47fd7bf8cdc520afe53aebf6a5f098021002d9743b56d5b2e2822d7003e728"),
            file("lib/arm64-v8a/liblink_mic_sdk.so", "0aaa82ed1b3f8d86a6b1af2bdb3ee51d337d302c9a54e247df2e3e1d945649e3"),
            file("lib/armeabi-v7a/liblink_mic_sdk.so", "c0ec145368c9479f1a6df62a554db8c26bf89e5766cdcac4dc0570f24af44dc3"),
        ),
    ),
    ResourceProfile(
        "TikTok 46.7.3",
        listOf(
            file("assets/native_runtime_server/game/scripts/ttmg-core.js.zip", "9320a88713c02074dd4797f4934dfc1c951fedb990c889619a7c84782ad73c2c"),
            file("assets/offline/tiktok_live_tt_live_lynx_match_component_container/mainV12/template.js", "f60f660659a53209e4c52db3021cec7adac6ce8174c1fe679ab57456685ae001"),
            file("assets/offline/tiktok_live_tt_live_lynx_match_component_container/match_invitee_v3/template.js", "8e84ec297249a771c9c9d56438f6c509d2a0f438c759ee65e212ab14ef7cb3eb"),
            file("lib/arm64-v8a/liblink_mic_sdk.so", "4e1f04e0b372627dcadd1dfb5eac46821000bdaec46fa9095d437af41aa414f6"),
        ),
    ),
    ResourceProfile(
        "TikTok 46.8.3",
        listOf(
            file("assets/native_runtime_server/game/scripts/ttmg-core.js.zip", "4bc5a6764423cd8d36a4eec913e9d4e2e19c6e6903503ad5ef0488adf1506039"),
            file("assets/offline/tiktok_live_tt_live_lynx_match_component_container/mainV12/template.js", "f60f660659a53209e4c52db3021cec7adac6ce8174c1fe679ab57456685ae001"),
            file("assets/offline/tiktok_live_tt_live_lynx_match_component_container/match_invitee_v3/template.js", "8e84ec297249a771c9c9d56438f6c509d2a0f438c759ee65e212ab14ef7cb3eb"),
            file("lib/arm64-v8a/liblink_mic_sdk.so", "2b4e28569193f720e50679d928278f593bc5fd700acdc2d3b971702b5280a875"),
        ),
    ),
    // Five files: the fixture carries both ABIs, so the armeabi-v7a link library is back beside
    // the arm64 one, and the match invitee template is the same bytes as 46.7.3 and 46.8.3.
    ResourceProfile(
        "TikTok 46.9.3",
        listOf(
            file("assets/native_runtime_server/game/scripts/ttmg-core.js.zip", "897d0f54569ea8c34b31652943f9abd7f89a842357078ea9bc78ca47fa0c8a14"),
            file("assets/offline/tiktok_live_tt_live_lynx_match_component_container/mainV12/template.js", "d648b3e0ad779a0dde442ca381212661ea97eeddc255dbb92003aab5f4514460"),
            file("assets/offline/tiktok_live_tt_live_lynx_match_component_container/match_invitee_v3/template.js", "8e84ec297249a771c9c9d56438f6c509d2a0f438c759ee65e212ab14ef7cb3eb"),
            file("lib/arm64-v8a/liblink_mic_sdk.so", "6b513a5d8b3e53178caabd02da3169f666a08817f367a8e49e807a9b1a37ef88"),
            file("lib/armeabi-v7a/liblink_mic_sdk.so", "8e899f30d1419e57a4b4dd5d193c66b0e4ffb5ed522b2cfb2a55680ba533347b"),
        ),
    ),
    ResourceProfile(
        "TikTok 47.0.3",
        listOf(
            file("assets/native_runtime_server/game/scripts/ttmg-core.js.zip", "897d0f54569ea8c34b31652943f9abd7f89a842357078ea9bc78ca47fa0c8a14"),
            file("assets/offline/tiktok_live_tt_live_lynx_match_component_container/mainV12/template.js", "d648b3e0ad779a0dde442ca381212661ea97eeddc255dbb92003aab5f4514460"),
            file("assets/offline/tiktok_live_tt_live_lynx_match_component_container/match_invitee_v3/template.js", "8e84ec297249a771c9c9d56438f6c509d2a0f438c759ee65e212ab14ef7cb3eb"),
            file("lib/arm64-v8a/liblink_mic_sdk.so", "53ea488ddf69161ff3471f3357b5d8576f36e1fd120783194b10e95894aeaf56"),
            file("lib/armeabi-v7a/liblink_mic_sdk.so", "705c951bac3fba5eca0b7fc58d509559bee588228c0c838f23733e63322680de"),
        ),
    ),
)

private val p2pRelay4623 = ResourceProfile(
    "TikTok 46.2.3",
    listOf(
        file("lib/arm64-v8a/libavmdlp2pv2.so", "d2be5f45bbe3c46f47dbb14ec14721da4a1e9de31bcdbe0d43db0611e1d33e9c"),
        file("lib/arm64-v8a/libp2plivevdp.so", "ed35b032fac7c169860d3f37bc3be1933df9bddc8ac6785413f9608945946337"),
        file("lib/armeabi-v7a/libavmdlp2pv2.so", "4455cf9ce576de61c04368e869d27abc485fac1e33046e14a87abad7f422a429"),
        file("lib/armeabi-v7a/libp2plivevdp.so", "dd8a626f8b0efe36a883096923bed56ecb457e9408b26262c844442901dc1d09"),
    ),
)

internal val p2pRelayProfiles = listOf(
    p2pRelay4623,
    bundleOf(p2pRelay4623, "lib/armeabi-v7a/libavmdlp2pv2.so", "lib/armeabi-v7a/libp2plivevdp.so"),
    ResourceProfile(
        "TikTok 46.7.3",
        listOf(
            file("lib/arm64-v8a/libavmdlp2pv2.so", "878315f0a27638ca8d73a7fa4351af4f810353cf08d01f06611640525c084174"),
            file("lib/arm64-v8a/libp2plivevdp.so", "ed35b032fac7c169860d3f37bc3be1933df9bddc8ac6785413f9608945946337"),
        ),
    ),
    ResourceProfile(
        "TikTok 46.8.3",
        listOf(
            file("lib/arm64-v8a/libavmdlp2pv2.so", "11c6519e2b1dde6872c3a0e70aedd3a019aab6058122e5b81fb4b38091e3d7ae"),
            file("lib/arm64-v8a/libp2plivevdp.so", "ed35b032fac7c169860d3f37bc3be1933df9bddc8ac6785413f9608945946337"),
        ),
    ),
    ResourceProfile(
        "TikTok 46.9.3",
        listOf(
            file("lib/arm64-v8a/libavmdlp2pv2.so", "7cea29a6fca15cfe6d0f2001b27dc204b3fe534132f447c479ceef828f071d07"),
            file("lib/arm64-v8a/libp2plivevdp.so", "ed35b032fac7c169860d3f37bc3be1933df9bddc8ac6785413f9608945946337"),
            // 46.9.3 rebuilt the armeabi relay library; the arm64 one and both live ones are
            // the same bytes as on 46.2.3. Read off the fixture on 2026-09-17, after the
            // release receipt refused the group with 46.2.3's hash in this slot.
            file("lib/armeabi-v7a/libavmdlp2pv2.so", "6366e54832a633ce18e878e4d2b758ffdf490164a2e5174578573e06619fee80"),
            file("lib/armeabi-v7a/libp2plivevdp.so", "dd8a626f8b0efe36a883096923bed56ecb457e9408b26262c844442901dc1d09"),
        ),
    ),
    ResourceProfile(
        "TikTok 47.0.3",
        listOf(
            file("lib/arm64-v8a/libavmdlp2pv2.so", "07ae036846b87cd4ac49db1558740eb031f9930db86e507d08fefacd6baa640d"),
            file("lib/arm64-v8a/libp2plivevdp.so", "ed35b032fac7c169860d3f37bc3be1933df9bddc8ac6785413f9608945946337"),
            file("lib/armeabi-v7a/libavmdlp2pv2.so", "14a614103ba671d9045f4d8d7e7b5f270c732fc5e55e49154da7b19b4a21ad99"),
            file("lib/armeabi-v7a/libp2plivevdp.so", "dd8a626f8b0efe36a883096923bed56ecb457e9408b26262c844442901dc1d09"),
        ),
    ),
)

internal val languageInventories = listOf(
    LanguageInventoryContract(
        directories = setOf(
            "af", "ar", "az", "bg", "bn", "ca", "ceb", "cs", "da", "de", "el", "en", "es", "et", "fa", "fi",
            "fil", "fr", "ga", "gu", "he", "hi", "hr", "hu", "id", "in", "is", "it", "iw", "ja", "jv", "kk",
            "km", "kn", "ko", "lt", "lv", "ml", "mr", "ms", "my", "nb", "nl", "or", "pa", "pl", "pt", "ro",
            "ru", "sk", "sl", "sq", "sv", "sw", "ta", "te", "th", "tr", "uk", "ur", "uz", "vi", "zh", "zu",
        ),
        pathManifestSha256 = "38f412319f00a31a025e03095ea9bf4266b412c2322d2a6b0b4a031a073b0c08",
        contentManifestSha256 = setOf(
            "147b0f0f1dba4e5baac4cccc512cc39f1fc2601291828a908825b382b0442e51",
            "4af4860c7f3f27fd9195bc6b2e0e976698861dc3cb82bba6465b06b9da14843c",
            "a42fac1f4d1fa86e0cfbbf3286c4daca12a6172944789a797bb27ac028ad1206",
            // 46.9.3: the same 64 directories and the same path manifest, new strings.
            "8bea806dfa98e0f0bf00362acf9f7afd065c77a90541e8a3bbb61b368898bab8",
            // 47.0.3: the same path inventory changed content again.
            "1835bf4b3ccfe982927139bf660eacb49312db0b0ed90984057724e2c69af8b4",
        ),
    ),
    // The 46.2.3 split bundle: 25 language splits, 102 files, each byte-identical to the
    // universal APK's copy.
    LanguageInventoryContract(
        directories = setOf(
            "ar", "de", "en", "es", "et", "fi", "fr", "hi", "hu", "id", "in", "it", "ja", "ko", "ms", "nl",
            "pl", "pt", "ru", "sv", "th", "tr", "uk", "vi", "zh",
        ),
        pathManifestSha256 = "33aad0753feebf540e226b415eecfc59323d40f7b52dfc70a06bd278e7acc9a6",
        contentManifestSha256 = setOf("9c41da0041c61b4eab8b891b6bb2749223330bbecdd6a8d5808ac2cac7226ae8"),
    ),
)
