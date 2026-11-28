/*
 * WLD premium probing script (phase 1 of the experimental investigation).
 *
 * Attach to the patched app (which ships an embedded Frida gadget):
 *   adb forward tcp:27042 tcp:27042
 *   frida -H 127.0.0.1 Gadget -l tools/welovedeals/wld-probe.js
 *
 * Everything here is READ-ONLY observation of the Dart AOT snapshot (Dart 3.12.2,
 * compressed pointers, arm64): hooks log at the entitlement parse sites and at the
 * redeem-screen paywall gate, decoding Dart objects by pointer.
 *
 * Addresses are offsets into libapp.so for build 1.2.0 (vc 87). The redeem gate
 * chain (verified against the blutter dump of _RedeemScreennState::build):
 *
 * KNOWN LIMITATION (device-proven on the Lenovo, 2026-11-28): Interceptor.attach at
 * a Dart AOT function's checked entry (the function start) does NOT fire when the
 * closure is invoked through Dart's UNCHECKED ENTRY point — the hook stays silent
 * while the code demonstrably runs. To probe Dart AOT code, hook the unchecked entry
 * (after the arg-check prologue) or use Stalker/Interceptor.replace.
 *
 *   static0 = [THR+0x78].field_table_values + 0x1e00   (late-final isolate static)
 *     if static0 present and static0->field_27 == true  -> normal flow
 *   else A = state.field_17 ([x1+0x17]); B = A.field_b; C = B.field_1b
 *        bool = C.field_2b  ;  bool == false -> PAYWALL (branch to 0x58ef3c)
 *   normal flow: A.field_b -> B; B.field_f -> state object; stateObj.field_13
 *        = redemption state int (0 fetch, 1 confirm, 2 finalize)
 *
 * Dart object decoding: compressed word w -> heap | w, heap is 4 GiB aligned
 * (mask 0xffff00000000); class id = [obj-1] >> 12 & 0xfffff; Dart bools are
 * NULL+0x20 (true) / NULL+0x30 (false) and the NULL register is x22.
 */

const libapp = Process.getModuleByName("libapp.so");
const base = libapp.base;
const HEAP_MASK = ptr("0xffff00000000");
const OFF_STATIC_SLOT = 0x1e00; // field_table_values offset of the static under test

// ---- logging: console (while attached) + android.util.Log (survives detach) ------
function plog(line) {
  console.log(line);
  try {
    Java.perform(() => {
      const Log = Java.use("android.util.Log");
      Log.i("WLD-PROBE", line);
    });
  } catch (_) { /* Java bridge not available in this script */ }
}

// ---- Dart helpers ----------------------------------------------------------------
function decompress(anyHeapObj, word) { return anyHeapObj.and(HEAP_MASK).add(word); }
function classId(obj) { return obj.readU32().shiftRight(12).and(0xfffff); }
function cidName(cid) { return CIDMAP[cid] || ""; }
function readWord(obj, off) { return decompress(obj, obj.add(off).readU32()); }
function boolIsTrue(obj) { return obj.equals(_NULL.add(0x20)); }
function boolIsFalse(obj) { return obj.equals(_NULL.add(0x30)); }
function boolVerdict(obj) { return boolIsTrue(obj) ? "true" : boolIsFalse(obj) ? "false" : `other(${obj})`; }
function describe(label, obj) {
  if (obj.isNull()) return `${label}=NULL`;
  const cid = classId(obj);
  return `${label}@${obj}(cid ${cid}${cidName(cid) ? " " + cidName(cid) : ""})`;
}

// Optional: paste the output of tools/welovedeals/gen_cid_map.py here to name
// class ids in the log output (generate: python3 gen_cid_map.py <blutter-out> /tmp/cid.json).
const CIDMAP = {
  181: "ProfileDetails",
  182: "Branch",
  183: "Vendor",
  184: "User",
  185: "SubscriptionQuote",
  186: "ReferralDiscount",
  187: "PaymentPlan",
  188: "Pagedata",
  189: "HomeData",
  190: "FAQ",
  191: "FAQGroup",
  192: "RedemptionStatus",
  193: "DealRedemption",
  194: "CouponGroup",
  195: "CouponConstraints",
  196: "Coupon",
  197: "Category",
  198: "AppSettings",
  199: "APIResponse",
  200: "Vector4",
  201: "Vector3",
  202: "Vector2",
  204: "Quaternion",
  205: "Matrix3",
  207: "UuidV1",
  208: "Uuid",
  211: "CryptoRNG",
  217: "LaunchOptions",
  218: "InAppBrowserConfiguration",
  219: "InAppWebViewConfiguration",
  220: "UrlLauncherApi",
  221: "BrowserOptions",
  222: "WebViewOptions",
  225: "UnicodeGlyphSet",
  227: "ReentrantLock",
  229: "BasicLock",
  230: "StringScanner",
  232: "SqlBuilder",
  233: "SqfliteOpenDatabaseOptions",
  234: "_NamedLock",
  239: "SqfliteDatabaseException",
  240: "SqfliteDatabaseOpenHelper",
  631: "UserScriptInjectionTime",
  633: "UserPreferredContentMode",
  1545: "CouponClipper",
  2141: "VerticalDragGestureRecognizer",
  2143: "PanGestureRecognizer",
  2144: "_MultipleGestureRecognizer",
  2147: "TapAndHorizontalDragGestureRecognizer",
  2151: "ChangeNotifier",
  2152: "MaintenanceService",
  2153: "VendorFunctions",
  2154: "UserFunctions",
  2155: "updateFunctions",
  2156: "Termsandconditionsfunctions",
  2157: "SubscriptionFunctions",
  2158: "Privacypolicyfunctions",
  2159: "MapFunctions",
  2160: "HomeFunctions",
  2161: "Faqfunctions",
  2162: "DataFunctions",
  2163: "couponGroupFunctions",
  2164: "CouponFunctions",
  2165: "categoryFunctions",
  2166: "AppSettingsFunctions",
  2167: "AffiliateFunctions",
  2168: "SessionManager",
  2169: "ExpandedTileController",
  2170: "SnapshotController",
  2246: "UserScrollNotification",
  2930: "RatingBox",
  2931: "QRScanButton",
  2932: "InfoCard2",
  2933: "InfoCard",
  2934: "IconArrowButton",
  2935: "GeneralFormTextField",
  2936: "GeneralCountryCodePicker",
  2937: "GeneralCircularButton",
  2938: "GeneralButton",
  2939: "ExpandableCard",
  2940: "DentCard",
  2941: "DealCard",
  2942: "CouponWidget",
  2943: "ContactButton",
  2944: "CircularImage",
  2945: "ButtonTextBox",
  2946: "BankDetailRow",
  2947: "BankDetailsCard",
  2948: "AddressSectionWithMap",
  2949: "QRCodeBox",
  2950: "VendorProfilePage",
  2951: "VendorBranchScreen",
  2952: "ProfileScreen",
  2953: "NotificationScreen",
  2954: "MaintenanceScreen",
  2955: "AccountSettingsScreen",
  2956: "VendorCard",
  2957: "VendorPageAppbar",
  2958: "SettingsPageAppbar",
  2959: "CongratulationsScreen",
  2960: "RedeemCouponData",
  2961: "RedeemCouponDetails",
  2962: "PaymentoptionsSlideup",
  2963: "NoSubscriptionSlideupContent",
  2964: "HomepageSavingsSection",
  2965: "HomepageCategorySection",
  2966: "HomepageAppbar",
  2967: "GeneralAppbar",
  2968: "FAQSection",
  2969: "EnterSavedAmountWidget",
  2970: "DealsSection",
  2971: "SignInButtonSmall",
  2972: "_QrContentView",
  2973: "_PinItem",
  2974: "_PinputCursor",
  2975: "_SeparatedRaw",
  2977: "Consumer",
  2980: "ChangeNotifierProvider",
  3080: "TabItem",
  3081: "NavigationBarItem",
  3082: "GapItem",
  3083: "AroundCustomPainter",
  3085: "SavingsCard",
  3086: "CategoryCard",
  3087: "VendorScreen",
  3088: "TermsAndConditionsScreen",
  3089: "SignInRegisterScreen",
  3090: "SettingsScreen",
  3091: "SearchPage",
  3092: "RegisterScreen",
  3093: "RedeemScreenn",
  3094: "PrivaryPolicyScreen",
  3095: "PricingScreen",
  3096: "PaymentDetailsScreen",
  3097: "OTPScreen",
  3098: "MapScreen",
  3099: "InAppBrowserScreen",
  3100: "HomeScreen",
  3101: "FavoriteCouponsScreen",
  3102: "FAQScreen",
  3103: "BankTransferScreen",
  3104: "MyApp",
  3105: "Home",
  3106: "VendorPageTabbar",
  3107: "ReferralCodeEnterSlideup",
  3108: "ReferAndEarnSection",
  3109: "MapVendorProfile",
  3110: "CategorySet",
  3490: "_TermsAndConditionsScreenState",
  3491: "_SignInRegisterScreenState",
  3492: "_SettingsScreenState",
  3493: "_SearchPageState",
  3494: "_RegisterScreenState",
  3495: "_PrivaryPolicyScreenState",
  3496: "_PricingScreenState",
  3497: "_PaymentDetailsScreenState",
  3498: "_OTPScreenState",
  3499: "_InAppBrowserScreenState",
  3500: "_HomeScreenState",
  3501: "_FavoriteCouponsScreenState",
  3502: "_FAQScreenState",
  3503: "_BankTransferScreenState",
  3504: "_MyAppState",
  3505: "_HomeState",
  3506: "_VendorPageTabbarState",
  3507: "_ReferralCodeEnterSlideupState",
  3508: "_ReferAndEarnSectionState",
  3509: "_MapVendorProfileState",
  3510: "_CategorySetState",
  3511: "_HomepageBannerImageState",
  3512: "_QrImageViewState",
  3513: "_OctoImageState",
  3514: "_GoogleMapState",
  3515: "_RatingBarState",
  3516: "_InAppWebViewState",
  3517: "_HtmlParserState",
  3518: "_HtmlState",
  3519: "_ValueListenableBuilderState",
  3520: "_AnimatedState",
  3591: "_PinputState",
  3593: "_ExpandedTileState",
  3595: "CarouselSliderState",
  3597: "_CupertinoTextSelectionToolbarContentState",
  3600: "_CupertinoCheckboxState",
  3602: "_CupertinoButtonState",
  3604: "_CupertinoActivityIndicatorState",
  3606: "_RedeemScreennState",
  3608: "_ViewState",
  3610: "UndoHistoryState",
  3612: "_SelectionHandleOverlayState",
  3614: "_SelectionToolbarWrapperState",
};

// NULL register baseline (x22) is captured per-hook: true = NULL+0x20.
let _NULL = null;

// ---- probe 1: entitlement parse sites (User.has_active_subscription) ------------
// After 'bl User::_asBool', x0 = the Dart bool pointer; print true/false.
function hookEntitlement(name, where) {
  Interceptor.attach(base.add(where), {
    onEnter() { _NULL = this.context.x22; },
    onLeave() {
      plog(`[entitlement] ${name}: has_active_subscription = ${boolVerdict(this.context.x0)}`);
    }
  });
}
hookEntitlement("User.updateFromJson (session refresh)", 0x4e188c);
hookEntitlement("User.fromJson (login/createSession)",   0x5d5378);

// ---- probe 2: redeem paywall gate ------------------------------------------------
// Closure entry at 0x58ee24: x2 = the _RedeemScreennState (captured receiver),
// x18 = THR. Read the whole gate decision tree, then let it run.
Interceptor.attach(base.add(0x58ee24), {
  onEnter() {
    try {
      _NULL = this.context.x22;
      const thr = this.context.x18;                       // thread-local TLS
      const state = this.context.x2;                      // _RedeemScreennState
      const lines = [];

      // (a) the late-final isolate static under test
      let staticOk = false;
      try {
        const tables = thr.add(0x78).readPointer();
        const staticCompressed = tables.add(OFF_STATIC_SLOT).readU32();
        if (staticCompressed !== 0) {
          const staticObj = decompress(thr, staticCompressed);
          lines.push(describe("static0", staticObj));
          const flag = readWord(staticObj, 0x27);
          lines.push(`static0.field_27 ${boolVerdict(flag)}`);
          staticOk = !boolIsFalse(flag);
        } else {
          lines.push("static0: (uninitialized)");
        }
      } catch (e) { lines.push(`static read failed: ${e}`); }

      // (b) state.field_17 chain: A.field_b -> B, B.field_1b -> C, C.field_2b
      const A = readWord(state, 0x17);
      lines.push(describe("A(state.field_17)", A));
      const B = readWord(A, 0xb);
      lines.push(describe("B(A.field_b)", B));
      const C = readWord(B, 0x1b);
      lines.push(describe("C(B.field_1b)", C));
      const gate = readWord(C, 0x2b);
      lines.push(`C.field_2b ${boolVerdict(gate)}`);

      const gatePasses = staticOk || boolIsTrue(gate);
      lines.push(gatePasses ? "gate: PASS -> redeem flow" : "gate: FAIL -> PAYWALL slideup");

      // (c) the redemption-state int (normal flow only): B.field_f.field_13
      if (gatePasses) {
        try {
          const B2 = readWord(A, 0xb);
          const stateObj = readWord(B2, 0xf);
          lines.push(`${describe("stateObj(B.field_f)", stateObj)} .field_13 = ${stateObj.add(0x13).readU64()}`);
        } catch (e) { lines.push(`state read failed: ${e}`); }
      }
      plog(`[redeem-gate]\n  ` + lines.join("\n  "));
    } catch (e) {
      plog(`[redeem-gate] read failed: ${e}\n${e.stack}`);
    }
  }
});

plog("[wld-probe] hooks: updateFromJson(0x4e188c) fromJson(0x5d5378) redeem-gate(0x58ee24)");