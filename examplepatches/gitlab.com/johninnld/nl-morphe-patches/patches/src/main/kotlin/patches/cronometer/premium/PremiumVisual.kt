package patches.cronometer.premium

import app.morphe.patcher.patch.resourcePatch
import patches.cronometer.NativeEdit
import patches.cronometer.NativeRange
import patches.cronometer.nativeInput
import patches.cronometer.transformNative

private fun bytes(hex: String): ByteArray = ByteArray(hex.length / 2) { index ->
    ((Character.digit(hex[index * 2], 16) shl 4) or Character.digit(hex[index * 2 + 1], 16)).toByte()
}

private val accountType = NativeRange(
    "AccountType.fromString",
    0xa39168,
    320,
    "c4208338f61ef50541b8daf22140e1cce1ffca8ba8dea54af49930948a2774b3",
)

private val showAds = NativeRange(
    "User.get:showAds",
    0xa51698,
    168,
    "0a0411dc4e8024c228addbf89ec8ac8b7d1cf818e9f39d0493d24c1ae4b25306",
)

private val userType = NativeRange(
    "User.getUserType",
    0xa2ef58,
    508,
    "8ef3cfd0711effb15562ee430b9dedc56029c8e2a56259281edc4a96d793fc1b",
)

// dashboard_screen.dart card-builder closure; hides the server-only cards by
// taking the existing "skip card" branch instead of stubbing build().
private val dashboardCards = NativeRange(
    "DashboardScreen card builder",
    0xf21598,
    5220,
    "f0233f48269cb3f0bde76ac60d44f8af557e92d3c4f467cb056c62b47347d7ac",
)

// FoodsScreenState.foodScreen: retain meals, custom recipes/foods and repeat
// items, then resume at the existing shared-blurb guard. Both the server-backed
// Suggest Food and Oracle tile constructors are skipped, without returning null.
private val foodsScreen = NativeRange(
    "FoodsScreenState.foodScreen",
    0xd716f0,
    5156,
    "db0808149678b183ef59b424e00fce2f168ecc825e771d313251bfa01969ee97",
)

// The legacy plus-menu builder has an existing nullable-button skip and a
// normal closure return. The matched Suggest Food action may return there;
// Flutter widget build methods must never be stubbed to return null.
private val legacyPlusMenu = NativeRange(
    "PlusMenuState.generateButtonList action closure",
    0xf4862c,
    1376,
    "c63cef23250f48e36e14053135c6c2b16e9a5626e3b5ef2482be8c33350c0119",
)

// Exclude Suggest Food from the legacy available/default actions as well as
// the rendered list (which may still contain saved preferences from older builds).
private val legacyMenuOptions = NativeRange(
    "MenuOptionsModel constructor",
    0xf99164,
    1220,
    "458d158d8d5bc07c605f609dd539257a3f41fe0f0d851aa339e7c06dd9a2ff98",
)

private val plusMenuAvailability = NativeRange(
    "PlusMenuSettingsV2 availability predicate",
    0x125d748,
    68,
    "ebc205c42f24e846effbac4b8ce4679bf41ee60f973f1c1a7ddc5ec72a4a5d76",
)

private val userUpdate = NativeRange(
    "User.update",
    0xa362c4,
    3676,
    "4b3dcfe82a767f06259dd68da21ef0371646f097b183074cfb21189ed930964d",
)

private val popupPreference = NativeRange(
    "User.showGoldPopUp",
    0xbf4ea0,
    56,
    "d2f028a27913cdcbb65350c91a2e771771ce1173a9744ed1638169a5a186c275",
)

private val startupPromotion = NativeRange(
    "User.shouldShowGoldPopUp",
    0x1146150,
    152,
    "b796a66525582344991e0db838ea8e05fda4af38f19bedb225874edde16fde25",
)

private val moreBody = NativeRange(
    "SettingsPage.mainBody",
    0xd537c0,
    3068,
    "cdb9a45e6f3f7de8fea6ee3158c0e5d63411ec4d495f8b052d2e7ab1f4c55f44",
)

private val standardNavigation = NativeRange(
    "AppNavContext._standard",
    0xd48424,
    1972,
    "2ad7dd33f5a2a821d1f47d57bbc7a4ed81f64836c921b649ccbf696167b969d1",
)

private val goldGate = NativeRange(
    "CronoGoldGateWrapperState.build",
    0x10bb4c0,
    296,
    "2be234829a70e6cc284196ab4d6b62e5b3b8914669b969d1976aadec80742f33",
)

/**
 * The Dart AOT image is the only place the Gold gate and the local Gold/ad
 * state live. These edits keep the shipped calling convention and only change
 * the recovered branch/immediate:
 *  - AccountType.fromString returns AccountType.gold.
 *  - User.update stores the local Gold override as Dart true.
 *  - User.get:showAds returns false.
 *  - CronoGoldGateWrapperState.build always takes the unlocked branch.
 *  - Marketing and server-only tiles follow existing non-rendering paths.
 *
 * Server-only data remains server-side; this is a visual/client-gate policy.
 */
internal val premiumEdits = listOf(
    // Follow the existing Gold=true assignment, including the local cached
    // value. Direct local feature checks then see the same state as the
    // AccountType/UserType controls; no subscription objects are fabricated.
    NativeEdit(userUpdate, 0xa36f64, bytes("60002037"), bytes("01000014")),
    // Keep the original frames and return false through their epilogues.
    NativeEdit(popupPreference, 0xbf4ec0, bytes("120df597"), bytes("c0c20091")),
    NativeEdit(startupPromotion, 0x1146164, bytes("403f40f900dc48f9"), bytes("c0c200911b000014")),
    // This is the actual More upsell card guard, not _buildBottom's Pro header.
    NativeEdit(moreBody, 0xd53cf0, bytes("80000054"), bytes("02000014")),
    // Existing null-tooltip path: retain the real navigation/FAB and avoid
    // constructing the persistent first-food overlay shown on every tab.
    NativeEdit(standardNavigation, 0xd48888, bytes("80092037"), bytes("4c000014")),
    NativeEdit(userType, 0xa2ef94, bytes("c1002036"), bytes("06000014")),
    NativeEdit(accountType, 0xa39290, bytes("00e046f9"), bytes("60bf46f9")),
    NativeEdit(goldGate, 0x10bb534, bytes("80000054"), bytes("1f2003d5")),
    NativeEdit(goldGate, 0x10bb538, bytes("61002037"), bytes("1f2003d5")),
    NativeEdit(dashboardCards, 0xf21e10, bytes("40070054"), bytes("3a000014")),
    NativeEdit(dashboardCards, 0xf21f14, bytes("a0062037"), bytes("35000014")),
    NativeEdit(dashboardCards, 0xf228e4, bytes("21072036"), bytes("39000014")),
    // At this point x0 is the State and the widget null check has passed.
    // The join at 0xd72674 expects that State in x4. Move it before branching;
    // do not enter the Oracle tail, which reads locals never initialized here.
    NativeEdit(foodsScreen, 0xd7236c, bytes("23b040b863801c8b"), bytes("e40300aac1000014")),
    NativeEdit(legacyPlusMenu, 0xf48688, bytes("a0835ff8"), bytes("3a010014")),
    // Allocate four default slots, omit Suggest Food and shift the four local
    // actions down one slot. Keep array capacity and growable length consistent.
    NativeEdit(legacyMenuOptions, 0xf991bc, bytes("420180d2"), bytes("020180d2")),
    NativeEdit(legacyMenuOptions, 0xf991d0, bytes("10f000b8"), bytes("1f2003d5")),
    NativeEdit(legacyMenuOptions, 0xf991dc, bytes("103001b8"), bytes("10f000b8")),
    NativeEdit(legacyMenuOptions, 0xf991e8, bytes("107001b8"), bytes("103001b8")),
    NativeEdit(legacyMenuOptions, 0xf991f4, bytes("10b001b8"), bytes("107001b8")),
    NativeEdit(legacyMenuOptions, 0xf99200, bytes("10f001b8"), bytes("10b001b8")),
    NativeEdit(legacyMenuOptions, 0xf9921c, bytes("400180d2"), bytes("000180d2")),
    // Leaf predicate: load the action argument from the caller's Dart SP (x15),
    // extract CID, return Dart false only for SuggestFoodPlusMenuAction (3094).
    // Otherwise tail-dispatch the original isAvailable selector (CID + 0x26bd).
    // br x16 preserves LR and the caller's SP/FP; the native getter returns
    // directly to the caller and keeps its own stack checks and policy intact.
    NativeEdit(
        plusMenuAvailability,
        0x125d748,
        bytes("fd79bfa9fd030faa502740f9ff0110eb69010054a10b40f920f05ff8007c4cd3b1d784d21e00118bbe7a7ef8"),
        bytes("e10140f920f05ff8007c4cd31f5830f1a0000054b1d784d21000118bb07a70f800021fd6c0c20091c0035fd6"),
    ),
    NativeEdit(showAds, 0xa516b4, bytes("30000094"), bytes("1d000014")),
)

@Suppress("unused")
val premiumVisual = resourcePatch {
    dependsOn(nativeInput)
    execute {
        val file = get("lib/arm64-v8a/libapp.so")
        val input = file.readBytes()
        val output = transformNative("arm64-v8a", input, premiumEdits, emptyList())
        check(!output.contentEquals(input)) { "Cronometer premium native edits produced no change" }
        file.writeBytes(output)
    }
}
