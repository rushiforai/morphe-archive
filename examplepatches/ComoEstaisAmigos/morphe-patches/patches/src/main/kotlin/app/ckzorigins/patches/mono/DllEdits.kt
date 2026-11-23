package app.ckzorigins.patches.mono

import app.ckzorigins.patches.shared.ByteEdit

/**
 * Byte ranges taken from the hand-packaged Origins 2.0.1 Assembly-CSharp.dll.
 * Apply them to the stock DLL from the OBB; each range checks its old bytes first.
 *
 * Line comments are the stock method, not what the new bytes do.
 * CURRENCY_BODIES rewrite Kontagent/GameAnalytics IL: those methods become `ret`, and the
 * freed bytes hold the new currency clamp (`ldc.i4 999999999`). CURRENCY_RVA retargets
 * PlayerData currency MethodDef RVAs into that space. Apply both lists together; the RVA
 * list alone points at leftover telemetry IL.
 *
 * HOSTS is a separate list for Disable telemetry: NTP `GetServerTime` returns MinValue
 * before `Dns.GetHostEntry`. Boot still runs DynamicContent so the loading bar can fill
 * from the bundled AssetBundles: ForcedUpdate skips its lock file and HTTP, ABTesting
 * skips its HTTP, IndexInfo reads StreamingAssets instead of glusvn.s3, and
 * CheckForUpdates returns false so MapWindow does not show the restart dialog.
 * FIRSTPASS_HOSTS is `GWalletHelper::IsGGNAvailable` in Assembly-CSharp-firstpass.dll.
 * Awake still starts CheckGGN; the iterator used to construct
 * `WWW("http://m.glu.com/android/get-unread-count?...")` on boot. Returning false skips
 * that WWW, and also LaunchGGN / LaunchGGNBenefits (`m.glu.com/android/ghome`).
 * TAPJOY hides CommonGUI.GetFreeGoldButton, moves AchievementsButton into that slot,
 * hides FacebookLoginButton, and makes App.GetFreeGold a no-op.
 * AMMO_REFILL_POPUP nops InventoryShopItem.OnPurchase's ShowInfoPopup after a
 * Glu-credit weapon buy. The AddConsumable("AmmoRefill") grant stays. It is not
 * in the extracted list; disableAmmoRefillPopupPatch applies it.
 * HUD_RELOAD rewrites HudController.Update so the ammo label reads 0 while
 * Human.get_IsReloading, which trips the stock ReloadLabel (< 40% of clip).
 * Firearm._ammo is not written. It is not in the extracted list;
 * reloadHudPatch applies it.
 */
internal object DllEdits {
    const val PATH = "assets/bin/Data/Managed/Assembly-CSharp.dll"
    const val FIRSTPASS_PATH = "assets/bin/Data/Managed/Assembly-CSharp-firstpass.dll"

    val AMMO = listOf(
        ByteEdit(0x5C359, "40010000", "26262b02"), // Human::Reload
        ByteEdit(0x6A43A, "02257b170e", "0000000000"), // Firearm::OnReloadCycle
        ByteEdit(0x6A440, "0417597d170e", "000000000000"), // Firearm::OnReloadCycle
        ByteEdit(0x6A447, "04", "00"), // Firearm::OnReloadCycle
        ByteEdit(0x6AC05, "02257b160e", "0000000000"), // Firearm::OnCreateProjectile
        ByteEdit(0x6AC0B, "0417597d160e", "000000000000"), // Firearm::OnCreateProjectile
        ByteEdit(0x6AC12, "04", "00"), // Firearm::OnCreateProjectile
        ByteEdit(0x6B71E, "02257b370e", "0000000000"), // Launcher::Update
        ByteEdit(0x6B724, "0417597d370e", "000000000000"), // Launcher::Update
        ByteEdit(0x6B72B, "04", "00"), // Launcher::Update
    )

    val CURRENCY_BODIES = listOf(
        ByteEdit(0x6F370, "3e020304050e040e0514", "062a1e0228331600062a"), // Kontagent::LogEvent
        ByteEdit(0x6F380, "1b", "13"), // Kontagent::LogEvent
        ByteEdit(0x6F384, "3d01", "0100"), // Kontagent::LogEvent
        ByteEdit(0x6F38C, "73", "2a"), // Kontagent::LogEvent
        ByteEdit(0x6F390, "0a0a0f042807", "033008004300"), // Kontagent::LogEvent
        ByteEdit(0x6F398, "0a3915", "000000"), // Kontagent::LogEvent
        ByteEdit(0x6F39C, "00000f04280800000a13051205288800000a3801000000140b0f052807", "0228351600067baf0f00046f700a000a25200065cd1d301c2602283516"), // Kontagent::LogEvent
        ByteEdit(0x6F3BA, "000a3915", "067baf0f"), // Kontagent::LogEvent
        ByteEdit(0x6F3BF, "00000f0528080000", "0420ffc99a3b6f71"), // Kontagent::LogEvent
        ByteEdit(0x6F3C8, "13061206288800000a3801000000140c03392900000006", "000a20ffc99a3b2a2520ffc99a3b31062620ffc99a3b2a"), // Kontagent::LogEvent
        ByteEdit(0x6F3E0, "4ac000706fc1", "033008004300"), // Kontagent::LogEvent
        ByteEdit(0x6F3E8, "0a282306000a390d", "0000000002283516"), // Kontagent::LogEvent
        ByteEdit(0x6F3F1, "00007252c0007003281300000a100106036fc100000a04391200000006725cc000706fc10000", "067bad0f00046f700a000a25200065cd1d301c260228351600067bad0f000420ffc99a3b6f71"), // Kontagent::LogEvent
        ByteEdit(0x6F418, "06046fc100000a053912000000067264c000706fc10000", "000a20ffc99a3b2a2520ffc99a3b31062620ffc99a3b2a"), // Kontagent::LogEvent
        ByteEdit(0x6F430, "06056fc100", "0330080043"), // Kontagent::LogEvent
        ByteEdit(0x6F436, "0a073912", "00000000"), // Kontagent::LogEvent
        ByteEdit(0x6F43C, "0006726cc000706fc1", "027b8a0f00047baf0f"), // Kontagent::LogEvent
        ByteEdit(0x6F446, "000a06076fc100000a083912000000067270c0", "046f700a000a25200065cd1d301c26027b8a0f"), // Kontagent::LogEvent
        ByteEdit(0x6F45A, "706fc100", "047baf0f"), // Kontagent::LogEvent
        ByteEdit(0x6F45F, "0a06086fc100000a0e06394e0000000e066ff109000a13043822000000120428f209000a0d0612032870", "0420ffc99a3b6f710a000a20ffc99a3b2a2520ffc99a3b31062620ffc99a3b2a6a027b980f00046f2416"), // Kontagent::LogEvent
        ByteEdit(0x6F48A, "000a6fc100000a061203287100000a6fc100000a120428f309000a3ad2ffffffdd0d0000", "062520ffc99a3b31062620ffc99a3b2a860320ffc99a3b310720ffc99a3b100102283516"), // Kontagent::LogEvent
        ByteEdit(0x6F4AF, "11048ca901001b", "067bad0f000403"), // Kontagent::LogEvent
        ByteEdit(0x6F4B7, "2500", "710a"), // Kontagent::LogEvent
        ByteEdit(0x6F4BB, "dc02066fc200", "2a1e02282d16"), // Kontagent::LogEvent
        ByteEdit(0x6F4C2, "0a28", "062a"), // Kontagent::LogEvent
        ByteEdit(0x6F4E8, "1e02", "062a"), // Kontagent::RevenueTracking
        ByteEdit(0x6F4F0, "1a28", "062a"), // Kontagent::StartSession
        ByteEdit(0x6F4F8, "1a28", "062a"), // Kontagent::StopSession
        ByteEdit(0x6F534, "2202", "062a"), // GameAnalytics::LogEvent
        ByteEdit(0x6F59C, "4272", "062a"), // GameAnalytics::LogAppStart
        ByteEdit(0x6F5B0, "4272", "062a"), // GameAnalytics::LogJailbrokenAppStart
        ByteEdit(0x6F5C8, "45", "01"), // GameAnalytics::LogAppStop
        ByteEdit(0x6F5D0, "72", "2a"), // GameAnalytics::LogAppStop
        ByteEdit(0x6F5D4, "70736c", "133009"), // GameAnalytics::LogAppStop
        ByteEdit(0x6F5D8, "000a0a0672b4c00070028c07", "330000003500001102283516"), // GameAnalytics::LogAppStop
        ByteEdit(0x6F5E5, "00016f6f", "067baf0f"), // GameAnalytics::LogAppStop
        ByteEdit(0x6F5EA, "000a0672ccc00070038c550000016f6f00000a0672e6c00070048c070000016f6f00000a0628f11400", "046f700a000a03580a0620ffc99a3b310620ffc99a3b0a0228351600067baf0f0004066f710a000a2a"), // GameAnalytics::LogAppStop
        ByteEdit(0x6F618, "4272", "062a"), // GameAnalytics::LogGameStart
        ByteEdit(0x6F630, "45", "01"), // GameAnalytics::LogGameStop
        ByteEdit(0x6F638, "7220c10070736c", "2af602027b5d13"), // GameAnalytics::LogGameStop
        ByteEdit(0x6F640, "000a0a0672b4c00070028c070000016f6f", "04027b52130004027b4f13000422000000"), // GameAnalytics::LogGameStop
        ByteEdit(0x6F652, "000a0672ccc00070038c550000016f6f00000a0672e6c0", "027b5e130004027b5d130004596b027b481300046f5b22"), // GameAnalytics::LogGameStop
        ByteEdit(0x6F66A, "70048c07", "06289f0c"), // GameAnalytics::LogGameStop
        ByteEdit(0x6F66F, "00016f6f00", "0a58280e1b"), // GameAnalytics::LogGameStop
        ByteEdit(0x6F675, "0a06", "062a"), // GameAnalytics::LogGameStop
        ByteEdit(0x6F684, "23", "01"), // GameAnalytics::LogNotificationStart
        ByteEdit(0x6F68C, "72", "2a"), // GameAnalytics::LogNotificationStart
        ByteEdit(0x6F6B4, "36", "01"), // GameAnalytics::LogNotificationSettingsChanged
        ByteEdit(0x6F6BC, "72", "2a"), // GameAnalytics::LogNotificationSettingsChanged
        ByteEdit(0x6F6F8, "c3", "01"), // GameAnalytics::LogCrash
        ByteEdit(0x6F700, "72", "2a"), // GameAnalytics::LogCrash
        ByteEdit(0x6F704, "70736c", "13300a"), // GameAnalytics::LogCrash
        ByteEdit(0x6F708, "000a0a0672b8c1", "3e000000000000"), // GameAnalytics::LogCrash
        ByteEdit(0x6F710, "70280600000a0b120128e605000a8c070000", "0220ffc99a3b310720ffc99a3b1000725443"), // GameAnalytics::LogCrash
        ByteEdit(0x6F723, "6f6f00000a0672c2c100702806", "70030f0228b80d000a390c0000"), // GameAnalytics::LogCrash
        ByteEdit(0x6F731, "000a0c120228e705000a8c070000016f6f00000a0672cec10070280600", "0f0228b90d000a38050000007ea200000a028c0700000128de01000a2a"), // GameAnalytics::LogCrash
        ByteEdit(0x6F7C8, "23", "01"), // GameAnalytics::LogJailbroken
        ByteEdit(0x6F7D0, "72", "2a"), // GameAnalytics::LogJailbroken
        ByteEdit(0x6F7F8, "2f", "01"), // GameAnalytics::LogPushToken
        ByteEdit(0x6F800, "72", "2a"), // GameAnalytics::LogPushToken
        ByteEdit(0x6F830, "ca02", "062a"), // GameAnalytics::LogABTesting
        ByteEdit(0x6F868, "47", "01"), // GameAnalytics::LogFirstStart
        ByteEdit(0x6F870, "72", "2a"), // GameAnalytics::LogFirstStart
        ByteEdit(0x6F8B8, "c228", "062a"), // GameAnalytics::LogAssetBundlesStarted
        ByteEdit(0x6F8F0, "33", "01"), // GameAnalytics::LogAssetBundlesCompleted
        ByteEdit(0x6F8F8, "28", "2a"), // GameAnalytics::LogAssetBundlesCompleted
        ByteEdit(0x6F930, "2f", "01"), // GameAnalytics::LogGameRated
        ByteEdit(0x6F938, "72", "2a"), // GameAnalytics::LogGameRated
        ByteEdit(0x6F96C, "58", "01"), // GameAnalytics::LogDailyBonus
        ByteEdit(0x6F974, "72", "2a"), // GameAnalytics::LogDailyBonus
        ByteEdit(0x6F9D0, "2f", "01"), // GameAnalytics::LogTapjoyPointsReceived
        ByteEdit(0x6F9D8, "72", "2a"), // GameAnalytics::LogTapjoyPointsReceived
        ByteEdit(0x6FA0C, "a4", "01"), // GameAnalytics::LogHCReceived
        ByteEdit(0x6FA14, "03", "2a"), // GameAnalytics::LogHCReceived
        ByteEdit(0x6FAB8, "1e02", "062a"), // GameAnalytics::SetNextSCSourceType
        ByteEdit(0x6FAC4, "7b", "01"), // GameAnalytics::LogSCReceived
        ByteEdit(0x6FACC, "7e", "2a"), // GameAnalytics::LogSCReceived
        ByteEdit(0x6FB4C, "3d", "01"), // GameAnalytics::LogSCSpent
        ByteEdit(0x6FB54, "72", "2a"), // GameAnalytics::LogSCSpent
        ByteEdit(0x6FB98, "3d", "01"), // GameAnalytics::LogHCSpent
        ByteEdit(0x6FBA0, "72", "2a"), // GameAnalytics::LogHCSpent
        ByteEdit(0x6FBE4, "b8", "01"), // GameAnalytics::LogIAPBuyClicked
        ByteEdit(0x6FBEC, "72", "2a"), // GameAnalytics::LogIAPBuyClicked
        ByteEdit(0x6FCA8, "e9", "01"), // GameAnalytics::LogIAPCompleted
        ByteEdit(0x6FCB0, "72", "2a"), // GameAnalytics::LogIAPCompleted
        ByteEdit(0x6FDA0, "7c", "01"), // GameAnalytics::LogJBIAPCompleted
        ByteEdit(0x6FDA8, "72", "2a"), // GameAnalytics::LogJBIAPCompleted
        ByteEdit(0x6FE28, "83", "01"), // GameAnalytics::LogIAPPurchaseCancelled
        ByteEdit(0x6FE30, "72", "2a"), // GameAnalytics::LogIAPPurchaseCancelled
        ByteEdit(0x6FEB8, "95", "01"), // GameAnalytics::LogIAPFailed
        ByteEdit(0x6FEC0, "72", "2a"), // GameAnalytics::LogIAPFailed
        ByteEdit(0x6FF5C, "51", "01"), // GameAnalytics::LogOneTimeOffer
        ByteEdit(0x6FF64, "72", "2a"), // GameAnalytics::LogOneTimeOffer
        ByteEdit(0x6FFBC, "40", "01"), // GameAnalytics::LogDailyDeal
        ByteEdit(0x6FFC4, "72", "2a"), // GameAnalytics::LogDailyDeal
        ByteEdit(0x70008, "2f", "01"), // GameAnalytics::LogAdShown
        ByteEdit(0x70010, "72", "2a"), // GameAnalytics::LogAdShown
        ByteEdit(0x70044, "5e", "01"), // GameAnalytics::LogItemBuyClicked
        ByteEdit(0x7004C, "72", "2a"), // GameAnalytics::LogItemBuyClicked
        ByteEdit(0x700B0, "43", "01"), // GameAnalytics::LogStoreStats
        ByteEdit(0x700B8, "72", "2a"), // GameAnalytics::LogStoreStats
        ByteEdit(0x70264, "dc", "01"), // GameAnalytics::LogHCConsumable
        ByteEdit(0x7026C, "72", "2a"), // GameAnalytics::LogHCConsumable
        ByteEdit(0x7034C, "dc", "01"), // GameAnalytics::LogSCConsumable
        ByteEdit(0x70354, "72", "2a"), // GameAnalytics::LogSCConsumable
        ByteEdit(0x70434, "dc", "01"), // GameAnalytics::LogHCDurable
        ByteEdit(0x7043C, "72", "2a"), // GameAnalytics::LogHCDurable
        ByteEdit(0x7051C, "dc", "01"), // GameAnalytics::LogSCDurable
        ByteEdit(0x70524, "72", "2a"), // GameAnalytics::LogSCDurable
        ByteEdit(0x70604, "dc", "01"), // GameAnalytics::LogHCBundle
        ByteEdit(0x7060C, "72", "2a"), // GameAnalytics::LogHCBundle
        ByteEdit(0x706EC, "6e", "01"), // GameAnalytics::LogLevelAchieved
        ByteEdit(0x706F4, "72", "2a"), // GameAnalytics::LogLevelAchieved
        ByteEdit(0x70768, "34", "01"), // GameAnalytics::LogLevelTime
        ByteEdit(0x70770, "72", "2a"), // GameAnalytics::LogLevelTime
        ByteEdit(0x707A4, "9a02", "062a"), // GameAnalytics::LogAchievementCompleted
        ByteEdit(0x707D0, "8c", "01"), // GameAnalytics::LogGoalCompleted
        ByteEdit(0x707D8, "72", "2a"), // GameAnalytics::LogGoalCompleted
        ByteEdit(0x70868, "6d", "01"), // GameAnalytics::LogPunchcardCompleted
        ByteEdit(0x70870, "72", "2a"), // GameAnalytics::LogPunchcardCompleted
        ByteEdit(0x708E4, "52", "01"), // GameAnalytics::LogKillUncommonZombie
        ByteEdit(0x708EC, "72", "2a"), // GameAnalytics::LogKillUncommonZombie
        ByteEdit(0x70944, "52", "01"), // GameAnalytics::LogKillSpecialZombie
        ByteEdit(0x7094C, "72", "2a"), // GameAnalytics::LogKillSpecialZombie
        ByteEdit(0x709A4, "52", "01"), // GameAnalytics::LogHeadshot
        ByteEdit(0x709AC, "72", "2a"), // GameAnalytics::LogHeadshot
        ByteEdit(0x70A04, "8c", "01"), // GameAnalytics::LogReviveUsed
        ByteEdit(0x70A0C, "72", "2a"), // GameAnalytics::LogReviveUsed
        ByteEdit(0x70A9C, "37", "01"), // GameAnalytics::LogConsumableUsed
        ByteEdit(0x70AA4, "28", "2a"), // GameAnalytics::LogConsumableUsed
        ByteEdit(0x70AE0, "7f", "01"), // GameAnalytics::LogSurvivalWaveCompleted
        ByteEdit(0x70AE8, "72", "2a"), // GameAnalytics::LogSurvivalWaveCompleted
        ByteEdit(0x70B6C, "c1", "01"), // GameAnalytics::LogTutorialStepCompleted
        ByteEdit(0x70B74, "02", "2a"), // GameAnalytics::LogTutorialStepCompleted
        ByteEdit(0x70C3C, "bf", "01"), // GameAnalytics::LogMissionStarted
        ByteEdit(0x70C44, "72", "2a"), // GameAnalytics::LogMissionStarted
        ByteEdit(0x70D08, "d9", "01"), // GameAnalytics::LogMissionCompleted
        ByteEdit(0x70D10, "72", "2a"), // GameAnalytics::LogMissionCompleted
        ByteEdit(0x70DF0, "1c01", "0100"), // GameAnalytics::LogMissionFailed
        ByteEdit(0x70DF8, "72", "2a"), // GameAnalytics::LogMissionFailed
        ByteEdit(0x70F18, "64", "01"), // GameAnalytics::LogAllBonusCratesFound
        ByteEdit(0x70F20, "72", "2a"), // GameAnalytics::LogAllBonusCratesFound
        ByteEdit(0x70F88, "53", "01"), // GameAnalytics::LogSurvivorDelivered
        ByteEdit(0x70F90, "72", "2a"), // GameAnalytics::LogSurvivorDelivered
        ByteEdit(0x70FE8, "59", "01"), // GameAnalytics::LogInfectionLevelPopup
        ByteEdit(0x70FF0, "72", "2a"), // GameAnalytics::LogInfectionLevelPopup
        ByteEdit(0x71050, "36", "01"), // GameAnalytics::LogCompletelyOutOfAmmo
        ByteEdit(0x71058, "03", "2a"), // GameAnalytics::LogCompletelyOutOfAmmo
        ByteEdit(0x71094, "34", "01"), // GameAnalytics::LogNextStoryMission
        ByteEdit(0x7109C, "7e", "2a"), // GameAnalytics::LogNextStoryMission
        ByteEdit(0x71258, "76", "01"), // GameAnalytics::CacheLogMissionWeaponsAtEnd
        ByteEdit(0x71260, "7e", "2a"), // GameAnalytics::CacheLogMissionWeaponsAtEnd
        ByteEdit(0x712DC, "87", "01"), // GameAnalytics::CacheLogWeaponSwitched
        ByteEdit(0x712E4, "7e", "2a"), // GameAnalytics::CacheLogWeaponSwitched
        ByteEdit(0x71370, "7a", "01"), // GameAnalytics::CacheLogWeaponOutOfAmmo
        ByteEdit(0x71378, "7e", "2a"), // GameAnalytics::CacheLogWeaponOutOfAmmo
        ByteEdit(0x713F8, "7a", "01"), // GameAnalytics::CacheLogWeaponOutOfAmmoCompletely
        ByteEdit(0x71400, "7e", "2a"), // GameAnalytics::CacheLogWeaponOutOfAmmoCompletely
        ByteEdit(0x71480, "6e", "01"), // GameAnalytics::CacheLogAmmoCrateFound
        ByteEdit(0x71488, "7e", "2a"), // GameAnalytics::CacheLogAmmoCrateFound
        ByteEdit(0x714FC, "3e", "01"), // GameAnalytics::CacheLogAutofireWrongUsage
        ByteEdit(0x71504, "7e", "2a"), // GameAnalytics::CacheLogAutofireWrongUsage
        ByteEdit(0x71548, "91", "01"), // GameAnalytics::LogAMFinishedWave
        ByteEdit(0x71550, "72", "2a"), // GameAnalytics::LogAMFinishedWave
        ByteEdit(0x715E8, "39", "01"), // GameAnalytics::LogFacebookLogin
        ByteEdit(0x715F0, "72", "2a"), // GameAnalytics::LogFacebookLogin
        ByteEdit(0x7162C, "aa72", "062a"), // GameAnalytics::LogFacebookLoginCompleted
        ByteEdit(0x71658, "aa72", "062a"), // GameAnalytics::LogFacebookSurvivalPressed
        ByteEdit(0x71684, "aa72", "062a"), // GameAnalytics::LogFacebookLevelUpPressed
        ByteEdit(0x716B0, "aa72", "062a"), // GameAnalytics::LogICloudButtonPressed
        ByteEdit(0x716DC, "aa72", "062a"), // GameAnalytics::LogICloudSaveButtonPressed
        ByteEdit(0x71708, "aa72", "062a"), // GameAnalytics::LogICloudLoadButtonPressed
        ByteEdit(0x71760, "23", "01"), // GameAnalytics::LogAfterTutorial
        ByteEdit(0x71768, "72", "2a"), // GameAnalytics::LogAfterTutorial
    )

    val CURRENCY_RVA = listOf(
        ByteEdit(0xEBE48, "884e", "7f12"), // -
        ByteEdit(0xEBEA2, "1c4f", "3012"), // -
        ByteEdit(0xECB02, "8478", "7211"), // -
        ByteEdit(0xECB5C, "f478", "9011"), // -
        ByteEdit(0xECB6E, "0879", "e011"), // -
        ByteEdit(0xECB80, "1c79", "9a12"), // -
        ByteEdit(0xECBB6, "4079", "d413"), // -
        ByteEdit(0xECC22, "587a", "bc12"), // -
        ByteEdit(0xF22C2, "880609", "391407"), // -
        ByteEdit(0xF7A3A, "10b30a", "041507"), // -
    )

    val HOSTS = listOf(
        ByteEdit(0x15C5, "027b2a0000043a18000000", "02177d2b0000042a000000"), // Resolution/Resolver::Resolve
        ByteEdit(0x2938, "167d7e000004", "187d7e000004"), // IndexInfo::DownloadAll
        ByteEdit(0x3BE74, "160a", "162a"), // ForcedUpdate::CheckUpdateStatus
        ByteEdit(0x3BF25, "02", "2a"), // ForcedUpdate::CheckForUpdateConfig
        ByteEdit(0x43A35, "0a", "2a"), // ServerTimeDefaultSNTPClient::GetServerTime
        ByteEdit(0xBB3D, "2817", "162a"), // DynamicContent::CheckForUpdates
    )

    val FIRSTPASS_HOSTS = listOf(
        ByteEdit(0x7E01, "7e46010004390d000000", "162a0000000000000000"), // GWalletHelper::IsGGNAvailable
    )

    val TAPJOY = listOf(
        ByteEdit(0x473CD, "28", "2a"), // App::GetFreeGold
        ByteEdit(
            0x8F27D,
            "027b7513000428860f0006fe06970f000673aa22000628ce1f0006",
            "027b751300046f8f01000a166fea02000a00000000000000000000",
        ), // CommonGUI::Awake GetFreeGoldButton
        ByteEdit(
            0x90438,
            "027b761300046f0a00002b0a03392c00000006176f9401000a027b7613000472ab1c0170284800000675900000016f920b0006178088130004380d00000006166f9401000a1680881300042a",
            "027b751300046f8f01000a166fea02000a027b771300046f3801000a027b751300046f3801000a6f9302000a6f8802000a2a0000000000000000000000000000000000000000000000000000",
        ), // CommonGUI::ShowGetFreeTutorialIcon
        ByteEdit(
            0x8F5B8,
            "28de1400060a28741000066f8515000619fe0416fe010b027b781300046f8f01000a063a0e000000073908000000027b891300042b01166fea02000a2a",
            "027b781300046f8f01000a166fea02000a2a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ), // CommonGUI::UpdateFacebookButtons
    )

    val AMMO_REFILL_POPUP = listOf(
        ByteEdit(
            0xA63D5,
            "28701000067bcd170004728240017028ca0d00066f4420000626",
            "0000000000000000000000000000000000000000000000000000",
        ), // InventoryShopItem::OnPurchase ShowInfoPopup
    )

    val HUD_RELOAD = listOf(
        ByteEdit(
            0x9BE55,
            "027b45150004066f911400064011000000027b46150004066f8f1400063b63000000",
            "02027b341500046f771200062c03162b06066f911400067d45150004380100000000",
        ), // HudController::Update
        ByteEdit(0x9BE82, "066f91140006", "027b45150004"), // HudController::Update
        ByteEdit(0x9BEC2, "02066f911400067d45150004", "000000000000000000000000"), // HudController::Update
    )
}
