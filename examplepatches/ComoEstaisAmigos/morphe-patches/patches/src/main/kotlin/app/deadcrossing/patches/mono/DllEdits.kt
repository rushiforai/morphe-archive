package app.deadcrossing.patches.mono

import app.adebisi.patches.shared.ByteEdit

/**
 * Byte ranges taken from stock Dead Crossing 1.06 Assembly-CSharp.dll.
 * Apply them to the stock DLL; each range checks its old bytes first.
 *
 * Line comments are the stock method, not what the new bytes do.
 *
 * CURRENCY_BODIES rewrite DataAnalysis.PassMission / FailedMission to clamp+stsfld
 * caves (16 nop, then 21-byte body, fat header untouched). CURRENCY_WRITES turns
 * every remaining `stsfld Profile::gold/meritorious` into a `call` of those caves.
 * The LoadFromPreference write at IL_0020 sits inside CURRENCY_GRANT's 18-byte
 * `bge` -> `bge.s` blob, so it is not in WRITES. CURRENCY_CALLERS pops the int
 * the two remaining managed callers push. CURRENCY_GRANT is the fresh-install
 * PlayerPrefs default: gold `ldc.i4 1000` in place, glory `ldc.i4.s 10` expanded
 * with the three bytes `bge.s` frees.
 *
 * HOSTS is Disable telemetry: Apsalar / Flurry / Aarki entry points in
 * Assembly-CSharp-firstpass.dll become `ret` so DataAnalysis still calls them
 * and the argument is consumed. FIRSTPASS_URLS rewrites the same file's UTF-16
 * Feelingtouch RPC hosts (C# GETs those strings without Java AdsTransport) to
 * `http://127.0.0.1:1/` plus `a` padding so the #US heap does not move.
 * PassMission / FailedMission bodies stay with Unlimited currency.
 */
internal object DllEdits {
    const val PATH = "assets/bin/Data/Managed/Assembly-CSharp.dll"
    const val FIRSTPASS_PATH = "assets/bin/Data/Managed/Assembly-CSharp-firstpass.dll"

    val CURRENCY_BODIES = listOf(
        ByteEdit(
            0x4BF4,
            "198d08000001251672ec6c0070a2251772046d0070a22518028c0b000001a2286a00000a2a",
            "00000000000000000000000000000000022520ffe0f50531062620ffe0f50580e70700042a",
        ), // DataAnalysis::PassMission
        ByteEdit(
            0x4C28,
            "198d08000001251672106d0070a2251772046d0070a22518028c0b000001a2286a00000a2a",
            "00000000000000000000000000000000022520ffe0f50531062620ffe0f50580e80700042a",
        ), // DataAnalysis::FailedMission
    )

    val CURRENCY_GRANT = listOf(
        ByteEdit(0x140A9, "20e8030000", "20ffe0f505"), // Profile::LoadFromPreference gold default
        ByteEdit(
            0x140BE,
            "3c060000001680e707000472128000701f0a",
            "2f0616284a000006721280007020ffe0f505",
        ), // Profile::LoadFromPreference glory default via bge.s
    )

    val CURRENCY_WRITES = listOf(
        ByteEdit(0x99AD, "80e7070004", "284a000006"), // GameOverPage::OnShow gold
        ByteEdit(0x99B9, "80e8070004", "284b000006"), // GameOverPage::OnShow meritorious
        ByteEdit(0xBD1C, "80e7070004", "284a000006"), // BulletInfoUpdater::<Awake>m__3B gold
        ByteEdit(0xC265, "80e8070004", "284b000006"), // RecoveryCtrl::<Awake>m__3E meritorious
        ByteEdit(0xC60C, "80e8070004", "284b000006"), // CarBloodCtrl::<Awake>m__44 meritorious
        ByteEdit(0x13FE0, "80e7070004", "284a000006"), // Profile::BuyCoins gold
        ByteEdit(0x14000, "80e8070004", "284b000006"), // Profile::BuyGlory meritorious
        ByteEdit(0x140B3, "80e7070004", "284a000006"), // Profile::LoadFromPreference gold
        ByteEdit(0x140D5, "80e8070004", "284b000006"), // Profile::LoadFromPreference meritorious
        ByteEdit(0x140E6, "80e8070004", "284b000006"), // Profile::LoadFromPreference meritorious
        ByteEdit(0x16275, "80e7070004", "284a000006"), // SomeCallBacks::<CheckPayItems>m__5C gold
        ByteEdit(0x16327, "80e8070004", "284b000006"), // SomeCallBacks::<CheckVirualCash>m__5D meritorious
        ByteEdit(0x16347, "80e7070004", "284a000006"), // SomeCallBacks::<CheckVirualCash>m__5E gold
        ByteEdit(0x18153, "80e7070004", "284a000006"), // AchievementItem::<Awake>m__88 gold
        ByteEdit(0x18169, "80e8070004", "284b000006"), // AchievementItem::<Awake>m__88 meritorious
        ByteEdit(0x18AB6, "80e8070004", "284b000006"), // BuyTouchEventDelegate::<InitOkTouchEvent>m__95 meritorious
        ByteEdit(0x1D35D, "80e8070004", "284b000006"), // LevelSelectPage::<Awake>m__EF meritorious
        ByteEdit(0x1D3EF, "80e8070004", "284b000006"), // LevelSelectPage::<Awake>m__F2 meritorious
        ByteEdit(0x1DF58, "80e8070004", "284b000006"), // TimeAwardCtrl::<Awake>m__10B meritorious
        ByteEdit(0x1E69D, "80e7070004", "284a000006"), // ShopItem::TestBuy gold
        ByteEdit(0x1EE87, "80e7070004", "284a000006"), // SlotItem::CheckCost gold
        ByteEdit(0x1EEB3, "80e8070004", "284b000006"), // SlotItem::CheckCost meritorious
        ByteEdit(0x1EEDF, "80e8070004", "284b000006"), // SlotItem::CheckCost meritorious
        ByteEdit(0x1F094, "80e7070004", "284a000006"), // SlotItem::ResultToCoin gold
        ByteEdit(0x1F0B4, "80e8070004", "284b000006"), // SlotItem::ResultToGlory meritorious
        ByteEdit(0x2B586, "80e7070004", "284a000006"), // <SetBuyTouchEvent>c__AnonStorey64::<>m__D1 gold
        ByteEdit(0x2B597, "80e8070004", "284b000006"), // <SetBuyTouchEvent>c__AnonStorey64::<>m__D1 meritorious
        ByteEdit(0x2B724, "80e7070004", "284a000006"), // <UpdateGunAttribute>c__AnonStorey67::<>m__E1 gold
        ByteEdit(0x2B736, "80e8070004", "284b000006"), // <UpdateGunAttribute>c__AnonStorey67::<>m__E1 meritorious
        ByteEdit(0x2B85E, "80e7070004", "284a000006"), // <Awake>c__AnonStorey65::<>m__DF gold
        ByteEdit(0x2B86F, "80e8070004", "284b000006"), // <Awake>c__AnonStorey65::<>m__DF meritorious
        ByteEdit(0x2B8DD, "80e8070004", "284b000006"), // <initUnlockBtnEvent>c__AnonStorey66::<>m__E0 meritorious
        ByteEdit(0x2BC1A, "80e7070004", "284a000006"), // <MakeToUpgradeBtn>c__AnonStorey6A::<>m__13A gold
        ByteEdit(0x2BC2B, "80e8070004", "284b000006"), // <MakeToUpgradeBtn>c__AnonStorey6A::<>m__13A meritorious
        ByteEdit(0x2BD12, "80e8070004", "284b000006"), // <MakeToFinishedBtn>c__AnonStorey6B::<>m__13B meritorious
    )

    val CURRENCY_CALLERS = listOf(
        ByteEdit(0x9A29, "284a000006", "2600000000"), // GameOverPage::Show call PassMission
        ByteEdit(0x9A45, "284b000006", "2600000000"), // GameOverPage::Show call FailedMission
    )

    val CURRENCY = CURRENCY_BODIES + CURRENCY_GRANT + CURRENCY_WRITES + CURRENCY_CALLERS

    val HOSTS = listOf(
        ByteEdit(0x34D, "72", "2a"), // AarkiContact::RegisterEvent
        ByteEdit(0x520, "72", "2a"), // ApsalarUtil::Event
        ByteEdit(0x5F8, "72", "2a"), // ApsalarUtil::EndSession
        ByteEdit(0x650, "72", "2a"), // ApsalarUtil::StartSession
        ByteEdit(0x715, "72", "2a"), // ApsalarUtil::RestartSession
        ByteEdit(0x797C, "72", "2a"), // FlurryAgent::LogEvent
    )

    val FIRSTPASS_URLS = listOf(
        ByteEdit(
            0x14088,
            "68007400740070003a002f002f006100640073002e006600650065006c0069006e00670074006f007500630068002e0063006f006d003a0038003000380030002f006100640073002d007300650072007600650072002f00660065006c00610064003f0070006e0061006d0065003d00",
            "68007400740070003a002f002f003100320037002e0030002e0030002e0031003a0031002f006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100",
        ), // FelAd banner URL in #US
        ByteEdit(
            0x14D84,
            "68007400740070003a002f002f006100640073002e006600650065006c0069006e00670074006f007500630068002e0063006f006d003a0038003000380030002f006100640073002d007300650072007600650072002f00",
            "68007400740070003a002f002f003100320037002e0030002e0030002e0031003a0031002f006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100",
        ), // AdsTransport base URL in #US
        ByteEdit(
            0x14DDE,
            "68007400740070003a002f002f00670061006d00650062006f0078002e006600650065006c0069006e00670074006f007500630068002e0063006f006d003a0038003000380030002f00670061006d00650062006f0078002d007300650072007600650072002f00",
            "68007400740070003a002f002f003100320037002e0030002e0030002e0031003a0031002f00610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100",
        ), // GameBox base URL in #US
        ByteEdit(
            0x15915,
            "68007400740070003a002f002f006100640073002e006600650065006c0069006e00670074006f007500630068002e0063006f006d003a0038003000380030002f006100640073002d007300650072007600650072002f00660065006c00610064003f0070006e0061006d0065003d00",
            "68007400740070003a002f002f003100320037002e0030002e0030002e0031003a0031002f006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100",
        ), // FelAd banner URL in #Blob
        ByteEdit(
            0x15C01,
            "68007400740070003a002f002f006100640073002e006600650065006c0069006e00670074006f007500630068002e0063006f006d003a0038003000380030002f006100640073002d007300650072007600650072002f00",
            "68007400740070003a002f002f003100320037002e0030002e0030002e0031003a0031002f006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100",
        ), // AdsTransport base URL in #Blob
        ByteEdit(
            0x15C5A,
            "68007400740070003a002f002f00670061006d00650062006f0078002e006600650065006c0069006e00670074006f007500630068002e0063006f006d003a0038003000380030002f00670061006d00650062006f0078002d007300650072007600650072002f00",
            "68007400740070003a002f002f003100320037002e0030002e0030002e0031003a0031002f00610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100610061006100",
        ), // GameBox base URL in #Blob
    )
}
