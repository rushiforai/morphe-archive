package androidx.webkit;

import android.annotation.SuppressLint;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import n7.b;
import n7.c;
import n7.e;
import n7.w;

/* loaded from: classes.dex */
public class WebViewFeature {
    public static final String ADD_QUIC_HINTS_V1 = "ADD_QUIC_HINTS";
    public static final String ALGORITHMIC_DARKENING = "ALGORITHMIC_DARKENING";
    public static final String ATTRIBUTION_REGISTRATION_BEHAVIOR = "ATTRIBUTION_REGISTRATION_BEHAVIOR";
    public static final String BACK_FORWARD_CACHE = "BACK_FORWARD_CACHE";
    public static final String BACK_FORWARD_CACHE_SETTINGS = "BACK_FORWARD_CACHE_SETTINGS";
    public static final String COOKIE_INTERCEPT = "COOKIE_INTERCEPT";
    public static final String CREATE_WEB_MESSAGE_CHANNEL = "CREATE_WEB_MESSAGE_CHANNEL";
    public static final String CUSTOM_REQUEST_HEADERS = "CUSTOM_REQUEST_HEADERS";
    public static final String DEFAULT_TRAFFICSTATS_TAGGING = "DEFAULT_TRAFFICSTATS_TAGGING";
    public static final String DELETE_BROWSING_DATA = "DELETE_BROWSING_DATA";

    @SuppressLint({"IntentName"})
    public static final String DISABLED_ACTION_MODE_MENU_ITEMS = "DISABLED_ACTION_MODE_MENU_ITEMS";
    public static final String DOCUMENT_START_SCRIPT = "DOCUMENT_START_SCRIPT";
    public static final String ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY = "ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY";
    public static final String FORCE_DARK = "FORCE_DARK";
    public static final String FORCE_DARK_STRATEGY = "FORCE_DARK_STRATEGY";
    public static final String GET_COOKIE_INFO = "GET_COOKIE_INFO";
    public static final String GET_VARIATIONS_HEADER = "GET_VARIATIONS_HEADER";
    public static final String GET_WEB_CHROME_CLIENT = "GET_WEB_CHROME_CLIENT";
    public static final String GET_WEB_VIEW_CLIENT = "GET_WEB_VIEW_CLIENT";
    public static final String GET_WEB_VIEW_RENDERER = "GET_WEB_VIEW_RENDERER";
    public static final String HYPERLINK_CONTEXT_MENU_ITEMS = "HYPERLINK_CONTEXT_MENU_ITEMS";
    public static final String MULTI_PROCESS = "MULTI_PROCESS";
    public static final String MULTI_PROFILE = "MULTI_PROFILE";
    public static final String MUTE_AUDIO = "MUTE_AUDIO";
    public static final String NAVIGATION_CALLBACK_BASIC = "WEB_VIEW_NAVIGATION_CLIENT_BASIC_USAGE";
    public static final String NAVIGATION_LISTENER_V1 = "NAVIGATION_LISTENER_V1";
    public static final String OFF_SCREEN_PRERASTER = "OFF_SCREEN_PRERASTER";
    public static final String ORIGIN_MATCHED_HEADERS = "ORIGIN_MATCHED_HEADERS";
    public static final String PAYMENT_REQUEST = "PAYMENT_REQUEST";
    public static final String POST_WEB_MESSAGE = "POST_WEB_MESSAGE";
    public static final String PRECONNECT = "PRECONNECT";
    public static final String PRERENDER_WITH_URL = "PRERENDER_URL_V2";
    public static final String PROFILE_URL_PREFETCH = "PREFETCH_URL_V5";
    public static final String PROVIDER_WEAKLY_REF_WEBVIEW = "PROVIDER_WEAKLY_REF_WEBVIEW";
    public static final String PROXY_OVERRIDE = "PROXY_OVERRIDE";
    public static final String PROXY_OVERRIDE_REVERSE_BYPASS = "PROXY_OVERRIDE_REVERSE_BYPASS";
    public static final String RECEIVE_HTTP_ERROR = "RECEIVE_HTTP_ERROR";
    public static final String RECEIVE_WEB_RESOURCE_ERROR = "RECEIVE_WEB_RESOURCE_ERROR";

    @Deprecated
    public static final String REQUESTED_WITH_HEADER_ALLOW_LIST = "REQUESTED_WITH_HEADER_ALLOW_LIST";
    public static final String SAFE_BROWSING_ALLOWLIST = "SAFE_BROWSING_ALLOWLIST";
    public static final String SAFE_BROWSING_ENABLE = "SAFE_BROWSING_ENABLE";
    public static final String SAFE_BROWSING_HIT = "SAFE_BROWSING_HIT";
    public static final String SAFE_BROWSING_PRIVACY_POLICY_URL = "SAFE_BROWSING_PRIVACY_POLICY_URL";
    public static final String SAFE_BROWSING_RESPONSE_BACK_TO_SAFETY = "SAFE_BROWSING_RESPONSE_BACK_TO_SAFETY";
    public static final String SAFE_BROWSING_RESPONSE_PROCEED = "SAFE_BROWSING_RESPONSE_PROCEED";
    public static final String SAFE_BROWSING_RESPONSE_SHOW_INTERSTITIAL = "SAFE_BROWSING_RESPONSE_SHOW_INTERSTITIAL";

    @Deprecated
    public static final String SAFE_BROWSING_WHITELIST = "SAFE_BROWSING_WHITELIST";
    public static final String SAVE_STATE = "SAVE_STATE";
    public static final String SERVICE_WORKER_BASIC_USAGE = "SERVICE_WORKER_BASIC_USAGE";
    public static final String SERVICE_WORKER_BLOCK_NETWORK_LOADS = "SERVICE_WORKER_BLOCK_NETWORK_LOADS";
    public static final String SERVICE_WORKER_CACHE_MODE = "SERVICE_WORKER_CACHE_MODE";
    public static final String SERVICE_WORKER_CONTENT_ACCESS = "SERVICE_WORKER_CONTENT_ACCESS";
    public static final String SERVICE_WORKER_FILE_ACCESS = "SERVICE_WORKER_FILE_ACCESS";
    public static final String SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST = "SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST";
    public static final String SHOULD_OVERRIDE_WITH_REDIRECTS = "SHOULD_OVERRIDE_WITH_REDIRECTS";
    public static final String SPECULATIVE_LOADING = "SPECULATIVE_LOADING_STATUS";
    public static final String SPECULATIVE_LOADING_CONFIG = "SPECULATIVE_LOADING_CONFIG_V2";
    public static final String STARTUP_FEATURE_CONFIGURE_PARTITIONED_COOKIES = "STARTUP_FEATURE_CONFIGURE_PARTITIONED_COOKIES";
    public static final String STARTUP_FEATURE_SET_DATA_DIRECTORY_SUFFIX = "STARTUP_FEATURE_SET_DATA_DIRECTORY_SUFFIX";
    public static final String STARTUP_FEATURE_SET_DIRECTORY_BASE_PATHS = "STARTUP_FEATURE_SET_DIRECTORY_BASE_PATHS";
    public static final String STARTUP_FEATURE_SET_PROFILES_TO_LOAD = "STARTUP_FEATURE_SET_PROFILES_TO_LOAD";

    @Deprecated
    public static final String STARTUP_FEATURE_SET_UI_THREAD_STARTUP_MODE = "STARTUP_FEATURE_SET_UI_THREAD_STARTUP_MODE";
    public static final String STARTUP_FEATURE_SET_UI_THREAD_STARTUP_MODE_V2 = "STARTUP_FEATURE_SET_UI_THREAD_STARTUP_MODE_V2";
    public static final String START_SAFE_BROWSING = "START_SAFE_BROWSING";
    public static final String TRACING_CONTROLLER_BASIC_USAGE = "TRACING_CONTROLLER_BASIC_USAGE";
    public static final String USER_AGENT_METADATA = "USER_AGENT_METADATA";
    public static final String USER_AGENT_METADATA_FORM_FACTORS = "USER_AGENT_METADATA_FORM_FACTORS";
    public static final String VISUAL_STATE_CALLBACK = "VISUAL_STATE_CALLBACK";
    public static final String WARM_UP_RENDERER_PROCESS = "WARM_UP_RENDERER_PROCESS";
    public static final String WEBVIEW_BUILDER_EXPERIMENTAL_V1 = "WEBVIEW_BUILDER_EXPERIMENTAL_V1";
    public static final String WEBVIEW_MEDIA_INTEGRITY_API_STATUS = "WEBVIEW_MEDIA_INTEGRITY_API_STATUS";
    public static final String WEB_AUTHENTICATION = "WEB_AUTHENTICATION";
    public static final String WEB_MESSAGE_ARRAY_BUFFER = "WEB_MESSAGE_ARRAY_BUFFER";
    public static final String WEB_MESSAGE_CALLBACK_ON_MESSAGE = "WEB_MESSAGE_CALLBACK_ON_MESSAGE";
    public static final String WEB_MESSAGE_LISTENER = "WEB_MESSAGE_LISTENER";
    public static final String WEB_MESSAGE_PORT_CLOSE = "WEB_MESSAGE_PORT_CLOSE";
    public static final String WEB_MESSAGE_PORT_POST_MESSAGE = "WEB_MESSAGE_PORT_POST_MESSAGE";
    public static final String WEB_MESSAGE_PORT_SET_MESSAGE_CALLBACK = "WEB_MESSAGE_PORT_SET_MESSAGE_CALLBACK";
    public static final String WEB_RESOURCE_ERROR_GET_CODE = "WEB_RESOURCE_ERROR_GET_CODE";
    public static final String WEB_RESOURCE_ERROR_GET_DESCRIPTION = "WEB_RESOURCE_ERROR_GET_DESCRIPTION";
    public static final String WEB_RESOURCE_REQUEST_IS_REDIRECT = "WEB_RESOURCE_REQUEST_IS_REDIRECT";
    public static final String WEB_VIEW_RENDERER_CLIENT_BASIC_USAGE = "WEB_VIEW_RENDERER_CLIENT_BASIC_USAGE";
    public static final String WEB_VIEW_RENDERER_TERMINATE = "WEB_VIEW_RENDERER_TERMINATE";

    public static boolean a(String str) {
        b bVar = w.f77940a;
        Set<e> setUnmodifiableSet = Collections.unmodifiableSet(c.f77908c);
        HashSet hashSet = new HashSet();
        for (e eVar : setUnmodifiableSet) {
            if (((c) eVar).f77909a.equals(str)) {
                hashSet.add(eVar);
            }
        }
        if (hashSet.isEmpty()) {
            throw new RuntimeException("Unknown feature ".concat(str));
        }
        Iterator it = hashSet.iterator();
        while (it.hasNext()) {
            c cVar = (c) ((e) it.next());
            if (cVar.a() || cVar.b()) {
                return true;
            }
        }
        return false;
    }
}
