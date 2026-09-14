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
val coreAssetDebloatPatch = rawResourcePatch(
    name = "Core Asset De-bloat",
    description = "Empties TikTok's bundled C2PA native libraries and Microblink payment-card OCR assets. Content credentials and card scanning may stop. Choose this patch to enable it.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        val nativeFiles = listOf(
            "lib/arm64-v8a/libtt_c2pa_sdk.so",
            "lib/arm64-v8a/libtt_c2pa_sdk_d.so",
            "lib/armeabi-v7a/libtt_c2pa_sdk.so",
            "lib/armeabi-v7a/libtt_c2pa_sdk_d.so",
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
    name = "Language Pack Purger",
    description = "Empties unselected TikTok language bundles while always keeping English. Selected language codes are checked before any file changes. Choose this patch to enable it.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4623())
    val targetLocales by stringOption(
        key = "locales",
        title = "Languages to keep",
        description = "Comma-separated language codes such as en, es, pt, fr or de. English is always kept.",
        default = "en",
        required = false,
    )

    execute {
        stripVerifiedLanguagePacks(get("."), targetLocales, languageInventory).report("Language Pack Purger")
    }
}

@Suppress("unused")
val studioCreationDebloatPatch = rawResourcePatch(
    name = "Studio & Creation De-bloat",
    description = "Empties TikTok's reviewed editor, camera-effect and face-model assets. Recording, editing, effects and creator tools may stop working. Choose this patch to enable it.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4623())

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
    name = "Live Stream Suite Optimizer",
    description = "Empties TikTok's link-mic and LIVE match or minigame assets, then skips its gift-effect widget setup. Co-hosting, games and animated gifts may stop. Choose this patch to enable it.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4623())
    dependsOn(liveGiftEffectOptimizerPatch)

    execute {
        val nativeFiles = listOf(
            "lib/arm64-v8a/liblink_mic_sdk.so",
            "lib/armeabi-v7a/liblink_mic_sdk.so",
        )
        val result = stripVerifiedResources(
            get("."),
            "Live Stream Suite Optimizer",
            listOf(
                "assets/native_runtime_server/game",
                "assets/offline/tiktok_live_tt_live_lynx_match_component_container",
            ),
            nativeFiles,
            liveAssetProfiles,
            resolveStandaloneFile = { path -> get(path) },
        )
        result.report("Live Stream Suite Optimizer")
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

private val coreAssetProfiles = listOf(
    ResourceProfile(
        "TikTok 46.2.3",
        microblinkFiles + listOf(
            file("lib/arm64-v8a/libtt_c2pa_sdk.so", "e9c5a788ca3b36696bec2a05832d856af0a2510ccbb4d393ccdb9fbaa2aa16ba"),
            file("lib/arm64-v8a/libtt_c2pa_sdk_d.so", "a64ce0fb43e7c22e2d95d8bbfcaede522d585c5d51dbae87d24db1359c27a01a"),
            file("lib/armeabi-v7a/libtt_c2pa_sdk.so", "24bc0cbc99cdca42ddd9062ac7deef64abaf3d1206969ef8f461c097ebdaf77c"),
            file("lib/armeabi-v7a/libtt_c2pa_sdk_d.so", "a96af4a99de68503234e3ab658d9702ac436ae1e0650dc5551e4e29a89700b0c"),
        ),
    ),
    ResourceProfile(
        "TikTok 46.7.3 to 46.8.3",
        microblinkFiles + listOf(
            file("lib/arm64-v8a/libtt_c2pa_sdk.so", "e9c5a788ca3b36696bec2a05832d856af0a2510ccbb4d393ccdb9fbaa2aa16ba"),
            file("lib/arm64-v8a/libtt_c2pa_sdk_d.so", "a64ce0fb43e7c22e2d95d8bbfcaede522d585c5d51dbae87d24db1359c27a01a"),
        ),
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

private val studioAssetProfiles = listOf(
    studioProfile(
        "TikTok 46.2.3",
        "007e1196a936af0c15ced6749b01b5cfb29f8d16858af7c3a9eaffd0c57a01a7",
        studioArmV7Files,
    ),
    studioProfile("TikTok 46.7.3", "a373335786f26d0da9089a0c470c9b97b2beb6a2b59e4532e9f3dd6fb2ca793b"),
    studioProfile("TikTok 46.8.3", "9dda032818072944eaca3c08cbdf55103ceda0cc9707e7130993c54c204105f4"),
)

private val liveAssetProfiles = listOf(
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
)

private val languageInventory = LanguageInventoryContract(
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
    ),
)
