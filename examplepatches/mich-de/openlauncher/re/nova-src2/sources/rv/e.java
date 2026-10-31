package rv;

import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class e {
    public static final e A;
    public static final /* synthetic */ e[] B;
    public static final /* synthetic */ i70.a C;

    /* renamed from: b, reason: collision with root package name */
    public static final e f86412b;

    /* renamed from: c, reason: collision with root package name */
    public static final e f86413c;

    /* renamed from: d, reason: collision with root package name */
    public static final e f86414d;

    /* renamed from: e, reason: collision with root package name */
    public static final e f86415e;

    /* renamed from: f, reason: collision with root package name */
    public static final e f86416f;

    /* renamed from: g, reason: collision with root package name */
    public static final e f86417g;

    /* renamed from: h, reason: collision with root package name */
    public static final e f86418h;

    /* renamed from: i, reason: collision with root package name */
    public static final e f86419i;

    /* renamed from: j, reason: collision with root package name */
    public static final e f86420j;

    /* renamed from: k, reason: collision with root package name */
    public static final e f86421k;

    /* renamed from: l, reason: collision with root package name */
    public static final e f86422l;

    /* renamed from: m, reason: collision with root package name */
    public static final e f86423m;
    public static final e n;
    public static final e o;

    /* renamed from: p, reason: collision with root package name */
    public static final e f86424p;

    /* renamed from: q, reason: collision with root package name */
    public static final e f86425q;

    /* renamed from: r, reason: collision with root package name */
    public static final e f86426r;

    /* renamed from: s, reason: collision with root package name */
    public static final e f86427s;

    /* renamed from: t, reason: collision with root package name */
    public static final e f86428t;

    /* renamed from: u, reason: collision with root package name */
    public static final e f86429u;

    /* renamed from: v, reason: collision with root package name */
    public static final e f86430v;

    /* renamed from: w, reason: collision with root package name */
    public static final e f86431w;

    /* renamed from: x, reason: collision with root package name */
    public static final e f86432x;

    /* renamed from: y, reason: collision with root package name */
    public static final e f86433y;

    /* renamed from: z, reason: collision with root package name */
    public static final e f86434z;

    /* renamed from: a, reason: collision with root package name */
    public final String f86435a;

    static {
        e eVar = new e("PARAM_PLATFORM", 0, "C001");
        f86412b = eVar;
        e eVar2 = new e("PARAM_DEVICE_MODEL", 1, "C002");
        f86413c = eVar2;
        e eVar3 = new e("PARAM_OS_NAME", 2, "C003");
        f86414d = eVar3;
        e eVar4 = new e("PARAM_OS_VERSION", 3, "C004");
        f86415e = eVar4;
        e eVar5 = new e("PARAM_LOCALE", 4, "C005");
        f86416f = eVar5;
        e eVar6 = new e("PARAM_TIME_ZONE", 5, "C006");
        f86417g = eVar6;
        e eVar7 = new e("PARAM_SCREEN_RESOLUTION", 6, "C008");
        f86418h = eVar7;
        e eVar8 = new e("PARAM_DEVICE_NAME", 7, "C009");
        e eVar9 = new e("PARAM_IP_ADDRESS", 8, "C010");
        e eVar10 = new e("PARAM_LATITUDE", 9, "C011");
        e eVar11 = new e("PARAM_LONGITUDE", 10, "C012");
        e eVar12 = new e("PARAM_APP_PACKAGE_NAME", 11, "C013");
        e eVar13 = new e("PARAM_SDK_APP_ID", 12, "C014");
        f86419i = eVar13;
        e eVar14 = new e("PARAM_SDK_VERSION", 13, "C015");
        f86420j = eVar14;
        e eVar15 = new e("PARAM_SDK_REF_NUMBER", 14, "C016");
        f86421k = eVar15;
        e eVar16 = new e("PARAM_DATE_TIME", 15, "C017");
        f86422l = eVar16;
        e eVar17 = new e("PARAM_SDK_TRANS_ID", 16, "C018");
        f86423m = eVar17;
        e eVar18 = new e("PARAM_TELE_DEVICE_ID", 17, "A001");
        e eVar19 = new e("PARAM_TELE_SUBSCRIBER_ID", 18, "A002");
        e eVar20 = new e("PARAM_TELE_IMEI_SV", 19, "A003");
        e eVar21 = new e("PARAM_TELE_GROUP_IDENTIFIER_L1", 20, "A004");
        e eVar22 = new e("PARAM_TELE_LINE1_NUMBER", 21, "A005");
        e eVar23 = new e("PARAM_TELE_MMS_UA_PROFILE_URL", 22, "A006");
        e eVar24 = new e("PARAM_TELE_MMS_USER_AGENT", 23, "A007");
        e eVar25 = new e("PARAM_TELE_NETWORK_COUNTRY_ISO", 24, "A008");
        e eVar26 = new e("PARAM_TELE_NETWORK_OPERATOR", 25, "A009");
        e eVar27 = new e("PARAM_TELE_NETWORK_OPERATOR_NAME", 26, "A010");
        e eVar28 = new e("PARAM_TELE_NETWORK_TYPE", 27, "A011");
        e eVar29 = new e("PARAM_TELE_PHONE_COUNT", 28, "A012");
        e eVar30 = new e("PARAM_TELE_PHONE_TYPE", 29, "A013");
        e eVar31 = new e("PARAM_TELE_SIM_COUNTRY_ISO", 30, "A014");
        e eVar32 = new e("PARAM_TELE_SIM_OPERATOR", 31, "A015");
        e eVar33 = new e("PARAM_TELE_SIM_OPERATOR_NAME", 32, "A016");
        e eVar34 = new e("PARAM_TELE_SIM_SERIAL_NUMBER", 33, "A017");
        e eVar35 = new e("PARAM_TELE_SIM_STATE", 34, "A018");
        e eVar36 = new e("PARAM_TELE_VOICE_MAIL_ALPHA_TAG", 35, "A019");
        e eVar37 = new e("PARAM_TELE_VOICE_MAIL_NUMBER", 36, "A020");
        e eVar38 = new e("PARAM_TELE_HAS_ICC_CARD", 37, "A021");
        e eVar39 = new e("PARAM_TELE_IS_HEARING_AID_COMPATIBILITY_SUPPORTED", 38, "A022");
        e eVar40 = new e("PARAM_TELE_IS_NETWORK_ROAMING", 39, "A023");
        e eVar41 = new e("PARAM_TELE_IS_SMS_CAPABLE", 40, "A024");
        e eVar42 = new e("PARAM_TELE_IS_TTY_MODE_SUPPORTED", 41, "A025");
        e eVar43 = new e("PARAM_TELE_IS_VOICE_CAPABLE", 42, "A026");
        e eVar44 = new e("PARAM_TELE_IS_WORLD_PHONE", 43, "A027");
        e eVar45 = new e("PARAM_WIFI_MAC", 44, "A028");
        e eVar46 = new e("PARAM_WIFI_BSSID", 45, "A029");
        e eVar47 = new e("PARAM_WIFI_SSID", 46, "A030");
        e eVar48 = new e("PARAM_WIFI_NETWORK_ID", 47, "A031");
        e eVar49 = new e("PARAM_WIFI_IS_5GHZ_BAND_SUPPORTED", 48, "A032");
        e eVar50 = new e("PARAM_WIFI_IS_DEVICE_TO_AP_RTT_SUPPORTED", 49, "A033");
        e eVar51 = new e("PARAM_WIFI_IS_ENHANCED_POWER_REPORTING_SUPPORTED", 50, "A034");
        e eVar52 = new e("PARAM_WIFI_IS_P2P_SUPPORTED", 51, "A035");
        e eVar53 = new e("PARAM_WIFI_IS_PREFERRED_NETWORK_OFFLOAD_SUPPORTED", 52, "A036");
        e eVar54 = new e("PARAM_WIFI_IS_SCAN_ALWAYS_AVAILABLE", 53, "A037");
        e eVar55 = new e("PARAM_WIFI_IS_TDLS_SUPPORTED", 54, "A038");
        e eVar56 = new e("PARAM_BLUETOOTH_ADDRESS", 55, "A039");
        e eVar57 = new e("PARAM_BLUETOOTH_BONDED_DEVICE", 56, "A040");
        e eVar58 = new e("PARAM_BLUETOOTH_IS_ENABLED", 57, "A041");
        e eVar59 = new e("PARAM_BUILD_BOARD", 58, "A042");
        e eVar60 = new e("PARAM_BUILD_BOOTLOADER", 59, "A043");
        e eVar61 = new e("PARAM_BUILD_BRAND", 60, "A044");
        e eVar62 = new e("PARAM_BUILD_DEVICE", 61, "A045");
        e eVar63 = new e("PARAM_BUILD_DISPLAY", 62, "A046");
        e eVar64 = new e("PARAM_BUILD_FINGERPRINT", 63, "A047");
        e eVar65 = new e("PARAM_BUILD_HARDWARE", 64, "A048");
        e eVar66 = new e("PARAM_BUILD_ID", 65, "A049");
        e eVar67 = new e("PARAM_BUILD_MANUFACTURER", 66, "A050");
        e eVar68 = new e("PARAM_BUILD_PRODUCT", 67, "A051");
        e eVar69 = new e("PARAM_BUILD_RADIO", 68, "A052");
        e eVar70 = new e("PARAM_BUILD_SERIAL", 69, "A053");
        e eVar71 = new e("PARAM_BUILD_SUPPORTED_32_BIT_ABIS", 70, "A054");
        e eVar72 = new e("PARAM_BUILD_SUPPORTED_64_BIT_ABIS", 71, "A055");
        e eVar73 = new e("PARAM_BUILD_TAGS", 72, "A056");
        e eVar74 = new e("PARAM_BUILD_TIME", 73, "A057");
        e eVar75 = new e("PARAM_BUILD_TYPE", 74, "A058");
        e eVar76 = new e("PARAM_BUILD_USER", 75, "A059");
        e eVar77 = new e("PARAM_BUILD_VERSION_CODENAME", 76, "A060");
        e eVar78 = new e("PARAM_BUILD_VERSION_INCREMENTAL", 77, "A061");
        e eVar79 = new e("PARAM_BUILD_VERSION_PREVIEW_SDK_INT", 78, "A062");
        e eVar80 = new e("PARAM_BUILD_VERSION_SDK_INT", 79, "A063");
        e eVar81 = new e("PARAM_BUILD_VERSION_SECURITY_PATCH", 80, "A064");
        e eVar82 = new e("PARAM_SECURE_ACCESSIBILITY_DISPLAY_INVERSION_ENABLED", 81, "A065");
        e eVar83 = new e("PARAM_SECURE_ACCESSIBILITY_ENABLED", 82, "A066");
        e eVar84 = new e("PARAM_SECURE_ACCESSIBILITY_ACCESSIBILITY_SPEAK_PASSWORD", 83, "A067");
        e eVar85 = new e("PARAM_SECURE_ALLOWED_GEOLOCATION_ORIGINS", 84, "A068");
        e eVar86 = new e("PARAM_SECURE_ANDROID_ID", 85, "A069");
        e eVar87 = new e("PARAM_SECURE_DATA_ROAMING", 86, "A070");
        e eVar88 = new e("PARAM_SECURE_DEFAULT_INPUT_METHOD", 87, "A071");
        e eVar89 = new e("PARAM_SECURE_DEVICE_PROVISIONED", 88, "A072");
        e eVar90 = new e("PARAM_SECURE_ENABLED_ACCESSIBILITY_SERVICES", 89, "A073");
        e eVar91 = new e("PARAM_SECURE_ENABLED_INPUT_METHODS", 90, "A074");
        e eVar92 = new e("PARAM_SECURE_INPUT_METHOD_SELECTOR_VISIBILITY", 91, "A075");
        e eVar93 = new e("PARAM_SECURE_INSTALL_NON_MARKET_APPS", 92, "A076");
        e eVar94 = new e("PARAM_SECURE_LOCATION_MODE", 93, "A077");
        e eVar95 = new e("PARAM_SECURE_SKIP_FIRST_USE_HINTS", 94, "A078");
        e eVar96 = new e("PARAM_SECURE_SYS_PROP_SETTING_VERSION", 95, "A079");
        e eVar97 = new e("PARAM_SECURE_TTS_DEFAULT_PITCH", 96, "A080");
        e eVar98 = new e("PARAM_SECURE_TTS_DEFAULT_RATE", 97, "A081");
        e eVar99 = new e("PARAM_SECURE_TTS_DEFAULT_SYNTH", 98, "A082");
        e eVar100 = new e("PARAM_SECURE_TTS_ENABLED_PLUGINS", 99, "A083");
        e eVar101 = new e("PARAM_GLOBAL_ADB_ENABLED", 100, "A084");
        e eVar102 = new e("PARAM_GLOBAL_AIRPLANE_MODE_RADIOS", 101, "A085");
        e eVar103 = new e("PARAM_GLOBAL_ALWAYS_FINISH_ACTIVITIES", 102, "A086");
        e eVar104 = new e("PARAM_GLOBAL_ANIMATOR_DURATION_SCALE", 103, "A087");
        e eVar105 = new e("PARAM_GLOBAL_AUTO_TIME", 104, "A088");
        e eVar106 = new e("PARAM_GLOBAL_AUTO_TIME_ZONE", 105, "A089");
        e eVar107 = new e("PARAM_GLOBAL_DEVELOPMENT_SETTINGS_ENABLED", 106, "A090");
        e eVar108 = new e("PARAM_GLOBAL_HTTP_PROXY", 107, "A091");
        e eVar109 = new e("PARAM_GLOBAL_NETWORK_PREFERENCE", 108, "A092");
        e eVar110 = new e("PARAM_GLOBAL_STAY_ON_WHILE_PLUGGED_IN", 109, "A093");
        e eVar111 = new e("PARAM_GLOBAL_TRANSITION_ANIMATION_SCALE", 110, "A094");
        e eVar112 = new e("PARAM_GLOBAL_USB_MASS_STORAGE_ENABLED", 111, "A095");
        e eVar113 = new e("PARAM_GLOBAL_USE_GOOGLE_MAIL", 112, "A096");
        e eVar114 = new e("PARAM_GLOBAL_WAIT_FOR_DEBUGGER", 113, "A097");
        e eVar115 = new e("PARAM_GLOBAL_WIFI_NETWORKS_AVAILABLE_NOTIFICATION_ON", 114, "A098");
        e eVar116 = new e("PARAM_SYSTEM_ACCELEROMETER_ROTATION", 115, "A099");
        e eVar117 = new e("PARAM_SYSTEM_BLUETOOTH_DISCOVERABILITY", Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, "A100");
        e eVar118 = new e("PARAM_SYSTEM_BLUETOOTH_DISCOVERABILITY_TIMEOUT", Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, "A101");
        e eVar119 = new e("PARAM_SYSTEM_DATE_FORMAT", Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, "A102");
        e eVar120 = new e("PARAM_SYSTEM_DTMF_TONE_TYPE_WHEN_DIALING", Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, "A103");
        e eVar121 = new e("PARAM_SYSTEM_DTMF_TONE_WHEN_DIALING", 120, "A104");
        e eVar122 = new e("PARAM_SYSTEM_END_BUTTON_BEHAVIOR", Sdk.SDKError.Reason.TPAT_ERROR_VALUE, "A105");
        e eVar123 = new e("PARAM_SYSTEM_FONT_SCALE", Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, "A106");
        e eVar124 = new e("PARAM_SYSTEM_HAPTIC_FEEDBACK_ENABLED", Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, "A107");
        e eVar125 = new e("PARAM_SYSTEM_MODE_RINGER_STREAMS_AFFECTED", Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, "A108");
        e eVar126 = new e("PARAM_SYSTEM_NOTIFICATION_SOUND", Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, "A109");
        e eVar127 = new e("PARAM_SYSTEM_MUTE_STREAMS_AFFECTED", Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, "A110");
        e eVar128 = new e("PARAM_SYSTEM_RINGTONE", Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, "A111");
        e eVar129 = new e("PARAM_SYSTEM_SCREEN_BRIGHTNESS", 128, "A112");
        e eVar130 = new e("PARAM_SYSTEM_SCREEN_BRIGHTNESS_MODE", Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, "A113");
        e eVar131 = new e("PARAM_SYSTEM_SCREEN_OFF_TIMEOUT", Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, "A114");
        e eVar132 = new e("PARAM_SYSTEM_SOUND_EFFECTS_ENABLED", Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE, "A115");
        e eVar133 = new e("PARAM_SYSTEM_TEXT_AUTO_CAPS", Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE, "A116");
        e eVar134 = new e("PARAM_SYSTEM_TEXT_AUTO_PUNCTUATE", Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE, "A117");
        e eVar135 = new e("PARAM_SYSTEM_TEXT_AUTO_REPLACE", Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE, "A118");
        e eVar136 = new e("PARAM_SYSTEM_TEXT_SHOW_PASSWORD", Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, "A119");
        e eVar137 = new e("PARAM_SYSTEM_TIME_12_24", Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, "A120");
        e eVar138 = new e("PARAM_SYSTEM_USER_ROTATION", Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, "A121");
        e eVar139 = new e("PARAM_SYSTEM_VIBRATE_ON", Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, "A122");
        e eVar140 = new e("PARAM_SYSTEM_VIBRATE_WHEN_RINGING", 139, "A123");
        e eVar141 = new e("PARAM_PACKAGE_IS_SAFE_MODE", 140, "A124");
        e eVar142 = new e("PARAM_PACKAGE_GET_INSTALLED_APPS", 141, "A125");
        e eVar143 = new e("PARAM_PACKAGE_INSTALLER_PACKAGE_NAME", 142, "A126");
        e eVar144 = new e("PARAM_PACKAGE_SYSTEM_AVAILABLE_FEATURES", 143, "A127");
        e eVar145 = new e("PARAM_PACKAGE_SYSTEM_SHARED_LIBRARY_NAMES", 144, "A128");
        e eVar146 = new e("PARAM_ENV_EXTERNAL_STORAGE_STATE", 145, "A129");
        e eVar147 = new e("PARAM_LOCALE_AVAILABLE_LOCALES", 146, "A130");
        e eVar148 = new e("PARAM_DISPLAY_DENSITY", 147, "A131");
        e eVar149 = new e("PARAM_DISPLAY_DENSITY_DPI", 148, "A132");
        e eVar150 = new e("PARAM_DISPLAY_SCALED_DENSITY", 149, "A133");
        e eVar151 = new e("PARAM_DISPLAY_XDPI", PerAppFeatureCatalog.MAX_TOOLS, "A134");
        e eVar152 = new e("PARAM_DISPLAY_YDPI", 151, "A135");
        e eVar153 = new e("PARAM_STAT_FS_TOTAL_BYTES", 152, "A136");
        e eVar154 = new e("PARAM_WEB_VIEW_USER_AGENT", 153, "A137");
        n = eVar154;
        e eVar155 = new e("PARAM_SIM_CARRIER_ID", 154, "A138");
        o = eVar155;
        e eVar156 = new e("PARAM_SIM_CARRIER_ID_NAME", 155, "A139");
        f86424p = eVar156;
        e eVar157 = new e("PARAM_MANUFACTURER_CODE", 156, "A140");
        f86425q = eVar157;
        e eVar158 = new e("PARAM_SIM_SPECIFIC_CARRIER_ID", 157, "A141");
        f86426r = eVar158;
        e eVar159 = new e("PARAM_SIM_SPECIFIC_CARRIER_ID_NAME", 158, "A142");
        f86427s = eVar159;
        e eVar160 = new e("PARAM_MULTI_SIM_SUPPORTED", 159, "A143");
        f86428t = eVar160;
        e eVar161 = new e("PARAM_SUBSCRIPTION_ID", 160, "A145");
        f86429u = eVar161;
        e eVar162 = new e("PARAM_6GHZ_BAND_SUPPORTED", 161, "A146");
        e eVar163 = new e("PARAM_PASSPOINT_FQDN", 162, "A147");
        e eVar164 = new e("PARAM_PASSPOINT_PROVIDER_FRIENDLY_NAME", 163, "A148");
        e eVar165 = new e("PARAM_BONDED_DEVICES_ALIAS", 164, "A149");
        e eVar166 = new e("PARAM_RTT_CALLING_MODE", 165, "A150");
        f86430v = eVar166;
        e eVar167 = new e("PARAM_SECURE_FRP_MODE", 166, "A151");
        f86431w = eVar167;
        e eVar168 = new e("PARAM_APPLY_RAMPING_RINGER", 167, "A152");
        f86432x = eVar168;
        e eVar169 = new e("PARAM_HARDWARE_SKU", 168, "A153");
        f86433y = eVar169;
        e eVar170 = new e("PARAM_SOC_MANUFACTURER", 169, "A154");
        f86434z = eVar170;
        e eVar171 = new e("PARAM_SOC_MODEL", 170, "A155");
        A = eVar171;
        e[] eVarArr = {eVar, eVar2, eVar3, eVar4, eVar5, eVar6, eVar7, eVar8, eVar9, eVar10, eVar11, eVar12, eVar13, eVar14, eVar15, eVar16, eVar17, eVar18, eVar19, eVar20, eVar21, eVar22, eVar23, eVar24, eVar25, eVar26, eVar27, eVar28, eVar29, eVar30, eVar31, eVar32, eVar33, eVar34, eVar35, eVar36, eVar37, eVar38, eVar39, eVar40, eVar41, eVar42, eVar43, eVar44, eVar45, eVar46, eVar47, eVar48, eVar49, eVar50, eVar51, eVar52, eVar53, eVar54, eVar55, eVar56, eVar57, eVar58, eVar59, eVar60, eVar61, eVar62, eVar63, eVar64, eVar65, eVar66, eVar67, eVar68, eVar69, eVar70, eVar71, eVar72, eVar73, eVar74, eVar75, eVar76, eVar77, eVar78, eVar79, eVar80, eVar81, eVar82, eVar83, eVar84, eVar85, eVar86, eVar87, eVar88, eVar89, eVar90, eVar91, eVar92, eVar93, eVar94, eVar95, eVar96, eVar97, eVar98, eVar99, eVar100, eVar101, eVar102, eVar103, eVar104, eVar105, eVar106, eVar107, eVar108, eVar109, eVar110, eVar111, eVar112, eVar113, eVar114, eVar115, eVar116, eVar117, eVar118, eVar119, eVar120, eVar121, eVar122, eVar123, eVar124, eVar125, eVar126, eVar127, eVar128, eVar129, eVar130, eVar131, eVar132, eVar133, eVar134, eVar135, eVar136, eVar137, eVar138, eVar139, eVar140, eVar141, eVar142, eVar143, eVar144, eVar145, eVar146, eVar147, eVar148, eVar149, eVar150, eVar151, eVar152, eVar153, eVar154, eVar155, eVar156, eVar157, eVar158, eVar159, eVar160, eVar161, eVar162, eVar163, eVar164, eVar165, eVar166, eVar167, eVar168, eVar169, eVar170, eVar171};
        B = eVarArr;
        C = EnumEntriesKt.a(eVarArr);
    }

    public e(String str, int i5, String str2) {
        this.f86435a = str2;
    }

    public static e valueOf(String str) {
        return (e) Enum.valueOf(e.class, str);
    }

    public static e[] values() {
        return (e[]) B.clone();
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.f86435a;
    }
}
