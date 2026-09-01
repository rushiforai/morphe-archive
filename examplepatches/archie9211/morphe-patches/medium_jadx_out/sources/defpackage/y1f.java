package defpackage;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import j$.util.DesugarCollections;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class y1f {
    public static final x1f a;

    public static boolean a() {
        Set<dz> setUnmodifiableSet = DesugarCollections.unmodifiableSet(dz.c);
        HashSet<dz> hashSet = new HashSet();
        for (dz dzVar : setUnmodifiableSet) {
            if (dzVar.a.equals("ALGORITHMIC_DARKENING")) {
                hashSet.add(dzVar);
            }
        }
        if (hashSet.isEmpty()) {
            ygf.i("Unknown feature ALGORITHMIC_DARKENING");
            return false;
        }
        for (dz dzVar2 : hashSet) {
            if (dzVar2.a() || dzVar2.b()) {
                return true;
            }
        }
        return false;
    }

    static {
        new cz("VISUAL_STATE_CALLBACK", "VISUAL_STATE_CALLBACK", 0);
        new cz("OFF_SCREEN_PRERASTER", "OFF_SCREEN_PRERASTER", 0);
        new cz("SAFE_BROWSING_ENABLE", "SAFE_BROWSING_ENABLE", 3);
        new cz("DISABLED_ACTION_MODE_MENU_ITEMS", "DISABLED_ACTION_MODE_MENU_ITEMS", 1);
        new cz("START_SAFE_BROWSING", "START_SAFE_BROWSING", 4);
        new cz("SAFE_BROWSING_WHITELIST", "SAFE_BROWSING_WHITELIST", 4);
        new cz("SAFE_BROWSING_WHITELIST", "SAFE_BROWSING_ALLOWLIST", 4);
        new cz("SAFE_BROWSING_ALLOWLIST", "SAFE_BROWSING_WHITELIST", 4);
        new cz("SAFE_BROWSING_ALLOWLIST", "SAFE_BROWSING_ALLOWLIST", 4);
        new cz("SAFE_BROWSING_PRIVACY_POLICY_URL", "SAFE_BROWSING_PRIVACY_POLICY_URL", 4);
        new cz("SERVICE_WORKER_BASIC_USAGE", "SERVICE_WORKER_BASIC_USAGE", 1);
        new cz("SERVICE_WORKER_CACHE_MODE", "SERVICE_WORKER_CACHE_MODE", 1);
        new cz("SERVICE_WORKER_CONTENT_ACCESS", "SERVICE_WORKER_CONTENT_ACCESS", 1);
        new cz("SERVICE_WORKER_FILE_ACCESS", "SERVICE_WORKER_FILE_ACCESS", 1);
        new cz("SERVICE_WORKER_BLOCK_NETWORK_LOADS", "SERVICE_WORKER_BLOCK_NETWORK_LOADS", 1);
        new cz("SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST", "SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST", 1);
        new cz("RECEIVE_WEB_RESOURCE_ERROR", "RECEIVE_WEB_RESOURCE_ERROR", 0);
        new cz("RECEIVE_HTTP_ERROR", "RECEIVE_HTTP_ERROR", 0);
        new cz("SHOULD_OVERRIDE_WITH_REDIRECTS", "SHOULD_OVERRIDE_WITH_REDIRECTS", 1);
        new cz("SAFE_BROWSING_HIT", "SAFE_BROWSING_HIT", 4);
        new cz("WEB_RESOURCE_REQUEST_IS_REDIRECT", "WEB_RESOURCE_REQUEST_IS_REDIRECT", 1);
        new cz("WEB_RESOURCE_ERROR_GET_DESCRIPTION", "WEB_RESOURCE_ERROR_GET_DESCRIPTION", 0);
        new cz("WEB_RESOURCE_ERROR_GET_CODE", "WEB_RESOURCE_ERROR_GET_CODE", 0);
        new cz("SAFE_BROWSING_RESPONSE_BACK_TO_SAFETY", "SAFE_BROWSING_RESPONSE_BACK_TO_SAFETY", 4);
        new cz("SAFE_BROWSING_RESPONSE_PROCEED", "SAFE_BROWSING_RESPONSE_PROCEED", 4);
        new cz("SAFE_BROWSING_RESPONSE_SHOW_INTERSTITIAL", "SAFE_BROWSING_RESPONSE_SHOW_INTERSTITIAL", 4);
        new cz("WEB_MESSAGE_PORT_POST_MESSAGE", "WEB_MESSAGE_PORT_POST_MESSAGE", 0);
        String str = QFTsJPDEnO.fiLwwcmNXCDXa;
        new cz(str, str, 0);
        new cz("WEB_MESSAGE_ARRAY_BUFFER", "WEB_MESSAGE_ARRAY_BUFFER", 2);
        new cz("WEB_MESSAGE_PORT_SET_MESSAGE_CALLBACK", "WEB_MESSAGE_PORT_SET_MESSAGE_CALLBACK", 0);
        new cz("CREATE_WEB_MESSAGE_CHANNEL", "CREATE_WEB_MESSAGE_CHANNEL", 0);
        new cz("POST_WEB_MESSAGE", "POST_WEB_MESSAGE", 0);
        new cz("WEB_MESSAGE_CALLBACK_ON_MESSAGE", "WEB_MESSAGE_CALLBACK_ON_MESSAGE", 0);
        new cz("GET_WEB_VIEW_CLIENT", "GET_WEB_VIEW_CLIENT", 3);
        new cz("GET_WEB_CHROME_CLIENT", "GET_WEB_CHROME_CLIENT", 3);
        new cz("GET_WEB_VIEW_RENDERER", "GET_WEB_VIEW_RENDERER", 6);
        new cz("WEB_VIEW_RENDERER_TERMINATE", "WEB_VIEW_RENDERER_TERMINATE", 6);
        new cz("TRACING_CONTROLLER_BASIC_USAGE", "TRACING_CONTROLLER_BASIC_USAGE", 5);
        new kpc();
        new kpc();
        new cz("WEB_VIEW_RENDERER_CLIENT_BASIC_USAGE", "WEB_VIEW_RENDERER_CLIENT_BASIC_USAGE", 6);
        a = new x1f();
        new cz("PROXY_OVERRIDE", "PROXY_OVERRIDE:3", 2);
        new cz("SUPPRESS_ERROR_PAGE", "SUPPRESS_ERROR_PAGE", 2);
        new cz("MULTI_PROCESS", "MULTI_PROCESS_QUERY", 2);
        new cz("FORCE_DARK", "FORCE_DARK", 6);
        new cz("FORCE_DARK_STRATEGY", "FORCE_DARK_BEHAVIOR", 2);
        new cz("WEB_MESSAGE_LISTENER", "WEB_MESSAGE_LISTENER", 2);
        new cz("DOCUMENT_START_SCRIPT", "DOCUMENT_START_SCRIPT:1", 2);
        new cz("PROXY_OVERRIDE_REVERSE_BYPASS", "PROXY_OVERRIDE_REVERSE_BYPASS", 2);
        new cz("GET_VARIATIONS_HEADER", "GET_VARIATIONS_HEADER", 2);
        new cz("ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY", "ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY", 2);
        new cz("GET_COOKIE_INFO", "GET_COOKIE_INFO", 2);
        new cz("REQUESTED_WITH_HEADER_ALLOW_LIST", "REQUESTED_WITH_HEADER_ALLOW_LIST", 2);
    }
}
