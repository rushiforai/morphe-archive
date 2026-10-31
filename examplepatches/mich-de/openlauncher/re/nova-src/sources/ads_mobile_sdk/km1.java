package ads_mobile_sdk;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes.dex */
public enum km1 implements b.e5 {
    CUI_NAME_UNKNOWN(0),
    CUI_NAME_SDKINIT(1),
    CUI_NAME_SDKINIT_LOAD_FLAGS(25),
    CUI_NAME_SDKINIT_ACTIVITY_TRACKER(33),
    CUI_NAME_SDKINIT_CLD(2),
    CUI_NAME_SDKINIT_OVERALL_ADAPTER_INIT(Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE),
    CUI_NAME_SDKINIT_ADAPTERINIT(3),
    CUI_NAME_SDKINIT_SDKCORE(4),
    CUI_NAME_SDKINIT_SDKCORE_LOAD_URL(54),
    CUI_NAME_SDKINIT_SDKCORE_REQUEST(68),
    CUI_NAME_SDKINIT_SDKCORE_LOAD_HTML(67),
    CUI_NAME_SDKINIT_SDKCORE_JS_LOADED(55),
    CUI_NAME_SDKINIT_INIT_CONSENT_STATE(28),
    CUI_NAME_SDKINIT_INIT_OMID(31),
    CUI_NAME_SDKINIT_INIT_SPAM(38),
    CUI_NAME_SDKINIT_INIT_CRYPTO(62),
    CUI_NAME_SDKINIT_INIT_AD_ID_PERMISSION(63),
    CUI_NAME_SDKINIT_INIT_APP_PERMISSIONS(64),
    CUI_NAME_SDKINIT_INIT_ENVIRONMENT_SIGNAL(65),
    CUI_NAME_SDKINIT_INIT_DEVICE_SIGNAL(66),
    CUI_NAME_SDKINIT_INIT_NATIVE_AD_SETTINGS(70),
    CUI_NAME_SDKINIT_INIT_AD_INSPECTOR(71),
    CUI_NAME_SDKINIT_INIT_CONTENT_PROVIDER(165),
    CUI_NAME_UNINITIALIZE_SDK(166),
    CUI_NAME_AD_INSPECTOR_DISABLED(169),
    CUI_NAME_AD_INSPECTOR_GLOBAL_ALLOWLIST_OVERRIDE(170),
    CUI_NAME_UPDATE_FLAGS_INIT_TASK(24),
    CUI_NAME_DEVICE_PROPERTIES_INIT_TASK(30),
    CUI_NAME_UPDATE_FLAGS(22),
    CUI_NAME_ADREQUEST(5),
    CUI_NAME_ADREQUEST_SIGNALS(6),
    CUI_NAME_ADREQUEST_BUILDURL(7),
    CUI_NAME_ADREQUEST_REQUEST(8),
    CUI_NAME_ADREQUEST_NORMALIZE_RESPONSE(26),
    CUI_NAME_ADREQUEST_PARSERESPONSE(9),
    CUI_NAME_ADREQUEST_MEDIATION(29),
    CUI_NAME_ADREQUEST_MEDIATION_ADAPTER(10),
    CUI_NAME_ADREQUEST_WAIT_FOR_RESPONSE(161),
    CUI_NAME_WEBVIEW_USER_AGENT(69),
    CUI_NAME_WEBVIEW_INITIALIZATION(36),
    CUI_NAME_CREATIVE_WEBVIEW_INITIALIZATION(111),
    CUI_NAME_WEBVIEW_LOAD(37),
    CUI_NAME_CREATIVE_WEBVIEW_LOAD(110),
    CUI_NAME_STARTUP_WEBVIEW(113),
    CUI_NAME_WEBVIEW_PROFILE_INIT(115),
    CUI_NAME_WEBVIEW_PROFILE_SET(Sdk.SDKError.Reason.TPAT_ERROR_VALUE),
    CUI_NAME_WEBVIEW_PROFILE_PRECONNECT(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE),
    CUI_NAME_WEBVIEW_PROFILE_QUIC_HINTS(Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE),
    CUI_NAME_WEBVIEW_PROFILE_PREFETCH_RESOURCES(Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE),
    CUI_NAME_WEBVIEW_PRERENDER_RESOURCES(168),
    CUI_NAME_GET_WEBVIEW_VARIATIONS(120),
    CUI_NAME_ADSHOW(11),
    CUI_NAME_ADSHOW_WITH_VIEW(167),
    CUI_NAME_NETWORK_CONNECTIVITY_MANAGER_STATE(32),
    CUI_NAME_PRESENTATION(114),
    CUI_NAME_IMPRESSION(34),
    CUI_NAME_VIEW_SIGNALS(39),
    CUI_NAME_CLICK(35),
    CUI_NAME_CLICK_SIGNALS(40),
    CUI_NAME_NATIVE_AD_HANDLE_CLICK(44),
    CUI_NAME_NATIVE_AD_HANDLE_IMPRESSION(45),
    CUI_NAME_NATIVE_AD_SIGNAL(46),
    CUI_NAME_NATIVE_AD_HANDLE_MEDIA_VIEW_READY(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE),
    CUI_NAME_NATIVE_AD_VIDEO_LOAD(58),
    CUI_NAME_NATIVE_AD_MEDIA_LOAD(61),
    CUI_NAME_LOAD_NATIVE_ASSETS(90),
    CUI_NAME_LOAD_NATIVE_IMAGE(91),
    CUI_NAME_LOAD_NATIVE_ICON(92),
    CUI_NAME_LOAD_NATIVE_ATTRIBUTION_INFO(93),
    CUI_NAME_LOAD_NATIVE_CUSTOM_ASSETS(94),
    CUI_NAME_LOAD_NATIVE_JS_ENGINE(59),
    CUI_NAME_LOAD_NATIVE_JSON_FROM_ARRAY(108),
    CUI_NAME_CONSENT_ALLOWLIST_UPDATE(42),
    CUI_NAME_CONSENT_STRING_READING(43),
    CUI_NAME_PING(12),
    CUI_NAME_PING_ATTESTATION(13),
    CUI_NAME_VIDEO_INIT(14),
    CUI_NAME_VIDEO_START(15),
    CUI_NAME_VIDEO_PLAY(16),
    CUI_NAME_VIDEO_PAUSE(17),
    CUI_NAME_VIDEO_RESUME(18),
    CUI_NAME_REGISTER_ATTRIBUTION_SOURCE(57),
    CUI_NAME_REWARD_GRANTED(19),
    CUI_NAME_SCAR_SIGNALS(20),
    CUI_NAME_SCAR_RENDERING(21),
    CUI_NAME_SCAR_CACHE_EVICTION(41),
    CUI_NAME_RTB_ADAPTER_SIGNALS(81),
    CUI_NAME_INSTALL_CRONET(82),
    CUI_NAME_CUSTOM_TABS_NAVIGATION_EVENT(83),
    CUI_NAME_SIGNAL_PREFETCH(84),
    CUI_NAME_GET_SIGNAL_FROM_CACHE(85),
    CUI_NAME_LOG_EVENT_TO_FIREBASE_ANALYTICS(86),
    CUI_NAME_INIT_FIREBASE_ANALYTICS(87),
    CUI_NAME_TYPE2_FETCH(Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE),
    CUI_NAME_PING_AND_EMIT_PAID_EVENT(Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE),
    CUI_NAME_POST_CLICK_LIFECYCLE_MONITORING(Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE),
    CUI_NAME_TWO_PIECE_EXPANDABLE_LOAD(Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE),
    CUI_NAME_INSTALL_REFERRER_TASK(128),
    CUI_NAME_INSTALL_REFERRER_DETAILS(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE),
    CUI_NAME_SIGNAL(23),
    CUI_NAME_SIGNAL_UPDATE_SIGNALS(112),
    CUI_NAME_SIGNAL_CACHE_REFRESH(Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE),
    CUI_NAME_GMSG(27),
    CUI_NAME_DEBUG_MENU(47),
    CUI_NAME_DEBUG_MENU_CREATIVE_PREVIEW(48),
    CUI_NAME_CREATIVE_PREVIEW_LINKING(49),
    CUI_NAME_DEBUG_MENU_DEBUG_SIGNALS(50),
    CUI_NAME_DEBUG_SIGNALS_LINKING(51),
    CUI_NAME_DEBUG_MENU_AD_INFO(52),
    CUI_NAME_DEBUG_MENU_INSPECTOR_SETTINGS(53),
    CUI_NAME_MRAID_STORE_PICTURE(56),
    CUI_NAME_LOAD_OMID_NATIVE_WEBVIEW(60),
    CUI_NAME_GET_TRUSTLESS_TOKEN(72),
    CUI_NAME_SHOW_AD_INSPECTOR(73),
    CUI_NAME_NATIVE_1_5_CLICK_WEBVIEW_CREATE(88),
    CUI_NAME_NATIVE_1_5_CLICK_WEBVIEW_LOAD(89),
    CUI_NAME_NATIVE_POLICY_VALIDATOR_WEBVIEW_CREATE(95),
    CUI_NAME_NATIVE_POLICY_VALIDATOR_WEBVIEW_LOAD(96),
    CUI_NAME_JS_SANDBOX_INIT(74),
    CUI_NAME_JS_SANDBOX_CREATE_CONNECTION(75),
    CUI_NAME_JS_SANDBOX_CREATE_ISOLATE(76),
    CUI_NAME_JS_SANDBOX_DOWNLOAD_SDK_CORE_JS(77),
    CUI_NAME_JS_SANDBOX_LOAD_SDK_CORE_JS(78),
    CUI_NAME_JS_SANDBOX_CALL_JS(79),
    CUI_NAME_WEBVIEW_CALL_JS(80),
    CUI_NAME_JS_SANDBOX_GET_SDKCORE_FROM_DISK(Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE),
    CUI_NAME_JS_SANDBOX_REFRESH_ISOLATES(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE),
    CUI_NAME_START_PRELOAD(97),
    CUI_NAME_PAUSE_PRELOAD(98),
    CUI_NAME_RESUME_PRELOAD(99),
    CUI_NAME_STOP_PRELOAD(100),
    CUI_NAME_PRELOAD_AD(101),
    CUI_NAME_EVICT_AD(102),
    CUI_NAME_POLL_PRELOADED_AD(103),
    CUI_NAME_PEEK_PRELOADED_AD(139),
    CUI_NAME_RESET_PRELOAD_BACKOFF(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE),
    CUI_NAME_CENTRALIZED_MANAGER_PRELOAD(Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE),
    CUI_NAME_CENTRALIZED_MANAGER_PRELOADER_STATE_CHANGE(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE),
    CUI_NAME_CENTRALIZED_MANAGER_LIMIT_REACHED(Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE),
    CUI_NAME_CENTRALIZED_MANAGER_PAUSE_FOR_AD_SHOW(156),
    CUI_NAME_CENTRALIZED_MANAGER_RESUME_FOR_AD_CLOSE(157),
    CUI_NAME_PRELOAD_AD_CLOSE_TIMEOUT(158),
    CUI_NAME_OFFLINE_OPEN(104),
    CUI_NAME_BLOB_ENCRYPTION(105),
    CUI_NAME_ADREQUEST_BUILDURL_CLIENT(106),
    CUI_NAME_CONSENT_UPDATE_FOR_CSRB(107),
    CUI_NAME_LOAD_CONSENT_FROM_DISK(109),
    CUI_NAME_PLAY_PREWARM(Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE),
    CUI_NAME_ANR_DETECTED(Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE),
    CUI_NAME_LOAD_NATIVE_IMMERSIVE_VIDEO_MEDIA_DATA(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE),
    CUI_NAME_ADREQUEST_CLIENT_REQUEST(140),
    CUI_NAME_SI_SETTLE_START(141),
    CUI_NAME_SI_SETTLE_END(142),
    CUI_NAME_PERSISTENT_CACHE_INIT(143),
    CUI_NAME_PERSISTENT_CACHE_LOAD(144),
    CUI_NAME_PERSISTENT_CACHE_METADATA_READ(145),
    CUI_NAME_PERSISTENT_CACHE_FILE_READ(146),
    CUI_NAME_PERSISTENT_CACHE_PUT(147),
    CUI_NAME_PERSISTENT_CACHE_METADATA_WRITE(148),
    CUI_NAME_PERSISTENT_CACHE_FILE_WRITE(149),
    CUI_NAME_PERSISTENT_CACHE_EVICT(PerAppFeatureCatalog.MAX_TOOLS),
    CUI_NAME_PERSISTENT_CACHE_METADATA_DELETE(151),
    CUI_NAME_PERSISTENT_CACHE_FILE_DELETE(152),
    CUI_NAME_PERSISTENT_CACHE_KEY_GENERATE(153),
    CUI_NAME_PERSISTENT_CACHE_EXPIRE(154),
    CUI_NAME_PERSISTENT_CACHE_CLEAR(155),
    CUI_NAME_PERSISTENT_CACHE_FILL_CHECK(159),
    CUI_NAME_PERSISTENT_CACHE_FILL(160),
    CUI_NAME_PERSISTENT_CACHE_AUTO_REFRESH(TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173),
    CUI_NAME_HSDP_SERVICE(162),
    CUI_NAME_PAW_GET_QUERY_INFO(163),
    CUI_NAME_PAW_REPORT_TOUCH_EVENT(164),
    CUI_NAME_MOVE_PIP_AD(171),
    CUI_NAME_USER_CLOSED_PIP_AD(172),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f5885a;

    km1(int i5) {
        this.f5885a = i5;
    }

    public static km1 a(int i5) {
        switch (i5) {
            case 0:
                return CUI_NAME_UNKNOWN;
            case 1:
                return CUI_NAME_SDKINIT;
            case 2:
                return CUI_NAME_SDKINIT_CLD;
            case 3:
                return CUI_NAME_SDKINIT_ADAPTERINIT;
            case 4:
                return CUI_NAME_SDKINIT_SDKCORE;
            case 5:
                return CUI_NAME_ADREQUEST;
            case 6:
                return CUI_NAME_ADREQUEST_SIGNALS;
            case 7:
                return CUI_NAME_ADREQUEST_BUILDURL;
            case 8:
                return CUI_NAME_ADREQUEST_REQUEST;
            case 9:
                return CUI_NAME_ADREQUEST_PARSERESPONSE;
            case 10:
                return CUI_NAME_ADREQUEST_MEDIATION_ADAPTER;
            case 11:
                return CUI_NAME_ADSHOW;
            case 12:
                return CUI_NAME_PING;
            case 13:
                return CUI_NAME_PING_ATTESTATION;
            case 14:
                return CUI_NAME_VIDEO_INIT;
            case 15:
                return CUI_NAME_VIDEO_START;
            case 16:
                return CUI_NAME_VIDEO_PLAY;
            case 17:
                return CUI_NAME_VIDEO_PAUSE;
            case 18:
                return CUI_NAME_VIDEO_RESUME;
            case 19:
                return CUI_NAME_REWARD_GRANTED;
            case 20:
                return CUI_NAME_SCAR_SIGNALS;
            case 21:
                return CUI_NAME_SCAR_RENDERING;
            case 22:
                return CUI_NAME_UPDATE_FLAGS;
            case 23:
                return CUI_NAME_SIGNAL;
            case 24:
                return CUI_NAME_UPDATE_FLAGS_INIT_TASK;
            case 25:
                return CUI_NAME_SDKINIT_LOAD_FLAGS;
            case 26:
                return CUI_NAME_ADREQUEST_NORMALIZE_RESPONSE;
            case 27:
                return CUI_NAME_GMSG;
            case 28:
                return CUI_NAME_SDKINIT_INIT_CONSENT_STATE;
            case 29:
                return CUI_NAME_ADREQUEST_MEDIATION;
            case 30:
                return CUI_NAME_DEVICE_PROPERTIES_INIT_TASK;
            case 31:
                return CUI_NAME_SDKINIT_INIT_OMID;
            case 32:
                return CUI_NAME_NETWORK_CONNECTIVITY_MANAGER_STATE;
            case 33:
                return CUI_NAME_SDKINIT_ACTIVITY_TRACKER;
            case 34:
                return CUI_NAME_IMPRESSION;
            case 35:
                return CUI_NAME_CLICK;
            case 36:
                return CUI_NAME_WEBVIEW_INITIALIZATION;
            case 37:
                return CUI_NAME_WEBVIEW_LOAD;
            case 38:
                return CUI_NAME_SDKINIT_INIT_SPAM;
            case 39:
                return CUI_NAME_VIEW_SIGNALS;
            case 40:
                return CUI_NAME_CLICK_SIGNALS;
            case 41:
                return CUI_NAME_SCAR_CACHE_EVICTION;
            case 42:
                return CUI_NAME_CONSENT_ALLOWLIST_UPDATE;
            case 43:
                return CUI_NAME_CONSENT_STRING_READING;
            case 44:
                return CUI_NAME_NATIVE_AD_HANDLE_CLICK;
            case 45:
                return CUI_NAME_NATIVE_AD_HANDLE_IMPRESSION;
            case 46:
                return CUI_NAME_NATIVE_AD_SIGNAL;
            case 47:
                return CUI_NAME_DEBUG_MENU;
            case 48:
                return CUI_NAME_DEBUG_MENU_CREATIVE_PREVIEW;
            case 49:
                return CUI_NAME_CREATIVE_PREVIEW_LINKING;
            case 50:
                return CUI_NAME_DEBUG_MENU_DEBUG_SIGNALS;
            case 51:
                return CUI_NAME_DEBUG_SIGNALS_LINKING;
            case 52:
                return CUI_NAME_DEBUG_MENU_AD_INFO;
            case 53:
                return CUI_NAME_DEBUG_MENU_INSPECTOR_SETTINGS;
            case 54:
                return CUI_NAME_SDKINIT_SDKCORE_LOAD_URL;
            case 55:
                return CUI_NAME_SDKINIT_SDKCORE_JS_LOADED;
            case 56:
                return CUI_NAME_MRAID_STORE_PICTURE;
            case 57:
                return CUI_NAME_REGISTER_ATTRIBUTION_SOURCE;
            case 58:
                return CUI_NAME_NATIVE_AD_VIDEO_LOAD;
            case 59:
                return CUI_NAME_LOAD_NATIVE_JS_ENGINE;
            case 60:
                return CUI_NAME_LOAD_OMID_NATIVE_WEBVIEW;
            case 61:
                return CUI_NAME_NATIVE_AD_MEDIA_LOAD;
            case 62:
                return CUI_NAME_SDKINIT_INIT_CRYPTO;
            case 63:
                return CUI_NAME_SDKINIT_INIT_AD_ID_PERMISSION;
            case 64:
                return CUI_NAME_SDKINIT_INIT_APP_PERMISSIONS;
            case 65:
                return CUI_NAME_SDKINIT_INIT_ENVIRONMENT_SIGNAL;
            case 66:
                return CUI_NAME_SDKINIT_INIT_DEVICE_SIGNAL;
            case 67:
                return CUI_NAME_SDKINIT_SDKCORE_LOAD_HTML;
            case 68:
                return CUI_NAME_SDKINIT_SDKCORE_REQUEST;
            case 69:
                return CUI_NAME_WEBVIEW_USER_AGENT;
            case 70:
                return CUI_NAME_SDKINIT_INIT_NATIVE_AD_SETTINGS;
            case 71:
                return CUI_NAME_SDKINIT_INIT_AD_INSPECTOR;
            case 72:
                return CUI_NAME_GET_TRUSTLESS_TOKEN;
            case 73:
                return CUI_NAME_SHOW_AD_INSPECTOR;
            case 74:
                return CUI_NAME_JS_SANDBOX_INIT;
            case 75:
                return CUI_NAME_JS_SANDBOX_CREATE_CONNECTION;
            case 76:
                return CUI_NAME_JS_SANDBOX_CREATE_ISOLATE;
            case 77:
                return CUI_NAME_JS_SANDBOX_DOWNLOAD_SDK_CORE_JS;
            case 78:
                return CUI_NAME_JS_SANDBOX_LOAD_SDK_CORE_JS;
            case 79:
                return CUI_NAME_JS_SANDBOX_CALL_JS;
            case 80:
                return CUI_NAME_WEBVIEW_CALL_JS;
            case 81:
                return CUI_NAME_RTB_ADAPTER_SIGNALS;
            case 82:
                return CUI_NAME_INSTALL_CRONET;
            case 83:
                return CUI_NAME_CUSTOM_TABS_NAVIGATION_EVENT;
            case 84:
                return CUI_NAME_SIGNAL_PREFETCH;
            case 85:
                return CUI_NAME_GET_SIGNAL_FROM_CACHE;
            case 86:
                return CUI_NAME_LOG_EVENT_TO_FIREBASE_ANALYTICS;
            case 87:
                return CUI_NAME_INIT_FIREBASE_ANALYTICS;
            case 88:
                return CUI_NAME_NATIVE_1_5_CLICK_WEBVIEW_CREATE;
            case 89:
                return CUI_NAME_NATIVE_1_5_CLICK_WEBVIEW_LOAD;
            case 90:
                return CUI_NAME_LOAD_NATIVE_ASSETS;
            case 91:
                return CUI_NAME_LOAD_NATIVE_IMAGE;
            case pd.N0 /* 92 */:
                return CUI_NAME_LOAD_NATIVE_ICON;
            case pd.O0 /* 93 */:
                return CUI_NAME_LOAD_NATIVE_ATTRIBUTION_INFO;
            case pd.P0 /* 94 */:
                return CUI_NAME_LOAD_NATIVE_CUSTOM_ASSETS;
            case pd.f8203p0 /* 95 */:
                return CUI_NAME_NATIVE_POLICY_VALIDATOR_WEBVIEW_CREATE;
            case pd.A0 /* 96 */:
                return CUI_NAME_NATIVE_POLICY_VALIDATOR_WEBVIEW_LOAD;
            case pd.H0 /* 97 */:
                return CUI_NAME_START_PRELOAD;
            case pd.Q0 /* 98 */:
                return CUI_NAME_PAUSE_PRELOAD;
            case pd.R0 /* 99 */:
                return CUI_NAME_RESUME_PRELOAD;
            case 100:
                return CUI_NAME_STOP_PRELOAD;
            case 101:
                return CUI_NAME_PRELOAD_AD;
            case 102:
                return CUI_NAME_EVICT_AD;
            case 103:
                return CUI_NAME_POLL_PRELOADED_AD;
            case 104:
                return CUI_NAME_OFFLINE_OPEN;
            case 105:
                return CUI_NAME_BLOB_ENCRYPTION;
            case 106:
                return CUI_NAME_ADREQUEST_BUILDURL_CLIENT;
            case 107:
                return CUI_NAME_CONSENT_UPDATE_FOR_CSRB;
            case 108:
                return CUI_NAME_LOAD_NATIVE_JSON_FROM_ARRAY;
            case 109:
                return CUI_NAME_LOAD_CONSENT_FROM_DISK;
            case 110:
                return CUI_NAME_CREATIVE_WEBVIEW_LOAD;
            case 111:
                return CUI_NAME_CREATIVE_WEBVIEW_INITIALIZATION;
            case 112:
                return CUI_NAME_SIGNAL_UPDATE_SIGNALS;
            case 113:
                return CUI_NAME_STARTUP_WEBVIEW;
            case 114:
                return CUI_NAME_PRESENTATION;
            case 115:
                return CUI_NAME_WEBVIEW_PROFILE_INIT;
            case GZIP_ENCODE_ERROR_VALUE:
                return CUI_NAME_SIGNAL_CACHE_REFRESH;
            case ASSET_FAILED_STATUS_CODE_VALUE:
                return CUI_NAME_PLAY_PREWARM;
            case PROTOBUF_SERIALIZATION_ERROR_VALUE:
                return CUI_NAME_TYPE2_FETCH;
            case JSON_ENCODE_ERROR_VALUE:
                return CUI_NAME_ANR_DETECTED;
            case 120:
                return CUI_NAME_GET_WEBVIEW_VARIATIONS;
            case TPAT_ERROR_VALUE:
                return CUI_NAME_WEBVIEW_PROFILE_SET;
            case INVALID_ADS_ENDPOINT_VALUE:
                return CUI_NAME_PING_AND_EMIT_PAID_EVENT;
            case INVALID_RI_ENDPOINT_VALUE:
                return CUI_NAME_NATIVE_AD_HANDLE_MEDIA_VIEW_READY;
            case INVALID_LOG_ERROR_ENDPOINT_VALUE:
                return CUI_NAME_POST_CLICK_LIFECYCLE_MONITORING;
            case INVALID_METRICS_ENDPOINT_VALUE:
                return CUI_NAME_RESET_PRELOAD_BACKOFF;
            case ASSET_FAILED_INSUFFICIENT_SPACE_VALUE:
                return CUI_NAME_TWO_PIECE_EXPANDABLE_LOAD;
            case ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE:
                return CUI_NAME_LOAD_NATIVE_IMMERSIVE_VIDEO_MEDIA_DATA;
            case 128:
                return CUI_NAME_INSTALL_REFERRER_TASK;
            case EMPTY_TPAT_ERROR_VALUE:
                return CUI_NAME_INSTALL_REFERRER_DETAILS;
            case MRAID_DOWNLOAD_JS_ERROR_VALUE:
                return CUI_NAME_WEBVIEW_PROFILE_PRECONNECT;
            case MRAID_JS_WRITE_FAILED_VALUE:
                return CUI_NAME_WEBVIEW_PROFILE_QUIC_HINTS;
            case OMSDK_DOWNLOAD_JS_ERROR_VALUE:
                return CUI_NAME_WEBVIEW_PROFILE_PREFETCH_RESOURCES;
            case OMSDK_JS_WRITE_FAILED_VALUE:
                return CUI_NAME_SDKINIT_OVERALL_ADAPTER_INIT;
            case STORE_REGION_CODE_ERROR_VALUE:
                return CUI_NAME_CENTRALIZED_MANAGER_PRELOAD;
            case INVALID_CONFIG_RESPONSE_VALUE:
                return CUI_NAME_CENTRALIZED_MANAGER_PRELOADER_STATE_CHANGE;
            case PRIVACY_URL_ERROR_VALUE:
                return CUI_NAME_CENTRALIZED_MANAGER_LIMIT_REACHED;
            case TPAT_RETRY_FAILED_VALUE:
                return CUI_NAME_JS_SANDBOX_GET_SDKCORE_FROM_DISK;
            case CONFIG_REFRESH_FAILED_VALUE:
                return CUI_NAME_JS_SANDBOX_REFRESH_ISOLATES;
            case 139:
                return CUI_NAME_PEEK_PRELOADED_AD;
            case 140:
                return CUI_NAME_ADREQUEST_CLIENT_REQUEST;
            case 141:
                return CUI_NAME_SI_SETTLE_START;
            case 142:
                return CUI_NAME_SI_SETTLE_END;
            case 143:
                return CUI_NAME_PERSISTENT_CACHE_INIT;
            case 144:
                return CUI_NAME_PERSISTENT_CACHE_LOAD;
            case 145:
                return CUI_NAME_PERSISTENT_CACHE_METADATA_READ;
            case 146:
                return CUI_NAME_PERSISTENT_CACHE_FILE_READ;
            case 147:
                return CUI_NAME_PERSISTENT_CACHE_PUT;
            case 148:
                return CUI_NAME_PERSISTENT_CACHE_METADATA_WRITE;
            case 149:
                return CUI_NAME_PERSISTENT_CACHE_FILE_WRITE;
            case PerAppFeatureCatalog.MAX_TOOLS /* 150 */:
                return CUI_NAME_PERSISTENT_CACHE_EVICT;
            case 151:
                return CUI_NAME_PERSISTENT_CACHE_METADATA_DELETE;
            case 152:
                return CUI_NAME_PERSISTENT_CACHE_FILE_DELETE;
            case 153:
                return CUI_NAME_PERSISTENT_CACHE_KEY_GENERATE;
            case 154:
                return CUI_NAME_PERSISTENT_CACHE_EXPIRE;
            case 155:
                return CUI_NAME_PERSISTENT_CACHE_CLEAR;
            case 156:
                return CUI_NAME_CENTRALIZED_MANAGER_PAUSE_FOR_AD_SHOW;
            case 157:
                return CUI_NAME_CENTRALIZED_MANAGER_RESUME_FOR_AD_CLOSE;
            case 158:
                return CUI_NAME_PRELOAD_AD_CLOSE_TIMEOUT;
            case 159:
                return CUI_NAME_PERSISTENT_CACHE_FILL_CHECK;
            case 160:
                return CUI_NAME_PERSISTENT_CACHE_FILL;
            case 161:
                return CUI_NAME_ADREQUEST_WAIT_FOR_RESPONSE;
            case 162:
                return CUI_NAME_HSDP_SERVICE;
            case 163:
                return CUI_NAME_PAW_GET_QUERY_INFO;
            case 164:
                return CUI_NAME_PAW_REPORT_TOUCH_EVENT;
            case 165:
                return CUI_NAME_SDKINIT_INIT_CONTENT_PROVIDER;
            case 166:
                return CUI_NAME_UNINITIALIZE_SDK;
            case 167:
                return CUI_NAME_ADSHOW_WITH_VIEW;
            case 168:
                return CUI_NAME_WEBVIEW_PRERENDER_RESOURCES;
            case 169:
                return CUI_NAME_AD_INSPECTOR_DISABLED;
            case 170:
                return CUI_NAME_AD_INSPECTOR_GLOBAL_ALLOWLIST_OVERRIDE;
            case 171:
                return CUI_NAME_MOVE_PIP_AD;
            case 172:
                return CUI_NAME_USER_CLOSED_PIP_AD;
            case TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173 /* 173 */:
                return CUI_NAME_PERSISTENT_CACHE_AUTO_REFRESH;
            default:
                return null;
        }
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f5885a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(km1.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        if (this != UNRECOGNIZED) {
            sbM.append(" number=");
            sbM.append(getNumber());
        }
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
