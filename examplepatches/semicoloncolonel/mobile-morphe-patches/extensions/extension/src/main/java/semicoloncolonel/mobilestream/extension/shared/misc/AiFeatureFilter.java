package semicoloncolonel.mobilestream.extension.shared.misc;

import android.util.Log;
import android.webkit.WebView;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * "Disable AI" for the shopping apps (opt-in).
 *
 * Each app switches its AI features with its own remote flags. The patches
 * call into this class at the top of each app's flag reader, and the reader
 * answers "off" for the AI flags listed here. Every other flag is read as
 * usual.
 *
 * Everything is decided on-device; nothing is sent anywhere by this class.
 */
@SuppressWarnings("unused")
public final class AiFeatureFilter {
    private static final String TAG = "MSP-AI";

    private static final Set<String> logged = Collections.synchronizedSet(new HashSet<>());

    private AiFeatureFilter() {
    }

    private static boolean logOff(String key) {
        if (logged.add(key)) {
            Log.i(TAG, "turned off " + key);
        }
        return true;
    }

    /**
     * Walmart: the Sparky assistant (converse.sparkyAssistant.*, ads.sparky.*), generative
     * AI on item and search pages (feature.search.genAI.*), and the search AI wizard.
     */
    public static boolean isWalmartAiKey(String key) {
        if (key == null) {
            return false;
        }
        String k = key.toLowerCase(Locale.US);
        return (k.contains("sparky") || k.contains("genai") || k.contains("aiwizard")) && logOff(key);
    }

    /** The Home Depot: the Magic Apron assistant (EnableMagicApronChat and related flags). */
    public static boolean isHomeDepotAiKey(String key) {
        return key != null && key.toLowerCase(Locale.US).contains("magicapron") && logOff(key);
    }

    private static final Set<String> TARGET_AI_FLAGS = new HashSet<>(Arrays.asList(
            "agentic_shopper_clarity", // AI mode in search
            "agentic_shopper_gifting",
            "conversational_gift_finder",
            "animated_gift_finder_chat_banner",
            "virtual_assistant_genai_support",
            "shopping_list_scanner", // AI scanner for photos of shopping lists
            "target_on_platform_agent", // Ask Target ("topas") itself
            "topas_sign_in_gate"
    ));

    /**
     * Target's boolean flag reader gets the flag object, not its key. Its getKey() is read
     * here; anything without one is not an AI flag.
     */
    public static boolean isTargetAiFlag(Object flag) {
        if (flag == null) {
            return false;
        }
        try {
            Object key = flag.getClass().getMethod("getKey").invoke(flag);
            return key instanceof String && isTargetAiKey((String) key);
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Target: the AI shopping agent (Ask Target), the conversational gift finder, generative
     * support chat and the AI list scanner.
     */
    /**
     * Target: replaces calls to the composable that draws the Ask Target button (onClick,
     * modifier, feature type, composer, changed flags, default flags). Not calling a composable
     * leaves nothing on screen, so the button is gone wherever the app would draw it.
     */
    public static void skipTargetAskTargetButton(Object onClick, Object modifier, Object featureType,
                                                 Object composer, int changed, int defaults) {
        logOff("Ask Target button");
    }

    /**
     * Target 2026.44.0 and later: the Ask Target button also takes its entry-point config
     * (onClick, modifier, feature type, entry point, composer, changed flags, default flags).
     */
    public static void skipTargetAskTargetButton(Object onClick, Object modifier, Object featureType,
                                                 Object entryPoint, Object composer, int changed, int defaults) {
        logOff("Ask Target button");
    }

    public static boolean isTargetAiKey(String key) {
        return key != null && TARGET_AI_FLAGS.contains(key) && logOff(key);
    }

    /**
     * Amazon: the Rufus assistant's weblabs (RUFUS_*, ASK_RUFUS lens entry) and the Amazon Pay
     * AI assistant. They are answered with the control treatment "C", which leaves the
     * feature off.
     */
    public static boolean isAmazonAiWeblab(String name) {
        if (name == null) {
            return false;
        }
        return (name.startsWith("RUFUS_") || name.contains("_RUFUS_") || name.contains("AI_ASSISTANT"))
                && logOff(name);
    }

    private static final String MOBILE_WEBLAB = "com.amazon.weblab.mobile.IMobileWeblab";
    private static final String CONTROL_TREATMENT = "C";

    /** Calls a no-argument method of IMobileWeblab or its result through the interface. */
    private static Object callInterface(Object target, String interfaceName, String method) throws Exception {
        Class<?> type = Class.forName(interfaceName, false, target.getClass().getClassLoader());
        return type.getMethod(method).invoke(target);
    }

    private static boolean isAmazonAiWeblabObject(Object weblab) {
        try {
            return isAmazonAiWeblab((String) callInterface(weblab, MOBILE_WEBLAB, "getName"));
        } catch (Throwable t) {
            return false;
        }
    }

    /** Replaces IMobileWeblab.getTreatmentAssignment() at app call sites. */
    public static String amazonTreatmentAssignment(Object weblab) throws Throwable {
        if (isAmazonAiWeblabObject(weblab)) {
            return CONTROL_TREATMENT;
        }
        try {
            return (String) callInterface(weblab, MOBILE_WEBLAB, "getTreatmentAssignment");
        } catch (java.lang.reflect.InvocationTargetException e) {
            throw e.getCause();
        }
    }

    /**
     * Replaces IMobileWeblab.getTreatmentAndRecordTrigger() at app call sites. For an AI weblab
     * the real result is wrapped, so its getTreatment() reports the control treatment.
     */
    public static Object amazonTreatmentAndRecordTrigger(Object weblab) throws Throwable {
        Object real;
        try {
            real = callInterface(weblab, MOBILE_WEBLAB, "getTreatmentAndRecordTrigger");
        } catch (java.lang.reflect.InvocationTargetException e) {
            throw e.getCause();
        }
        if (real == null || !isAmazonAiWeblabObject(weblab)) {
            return real;
        }
        ClassLoader loader = real.getClass().getClassLoader();
        Class<?> resultType = Class.forName(MOBILE_WEBLAB + "TreatmentAndTriggerResult", false, loader);
        return java.lang.reflect.Proxy.newProxyInstance(loader, new Class<?>[]{resultType},
                (proxy, method, args) -> {
                    if (method.getName().equals("getTreatment") && method.getParameterTypes().length == 0) {
                        return CONTROL_TREATMENT;
                    }
                    try {
                        return method.invoke(real, args);
                    } catch (java.lang.reflect.InvocationTargetException e) {
                        throw e.getCause();
                    }
                });
    }

    /**
     * myAT&T: Andi, the AI assistant, its "Fusion" chat (voice, AI search, and AI cards), and the
     * Personal Assistant are switched by flags in a JSON document that native code hands to
     * the app's JavaScript through a callback. The callback is wrapped, and every AI flag in
     * the document is set to false before the JavaScript reads it.
     */
    public static boolean isAttAiFlag(String name) {
        if (name == null) {
            return false;
        }
        String n = name.toUpperCase(Locale.US).replace('-', '_');
        return n.startsWith("SVC_")
                && (n.contains("FUSION") || n.contains("ANDI_CHAT") || n.contains("PERSONAL_ASSISTANT"));
    }

    public static Object wrapAttFeatureFlagsCallback(final Object callback) {
        if (callback == null) {
            return null;
        }
        try {
            ClassLoader loader = callback.getClass().getClassLoader();
            return java.lang.reflect.Proxy.newProxyInstance(loader, callback.getClass().getInterfaces(),
                    (proxy, method, args) -> {
                        if ("invoke".equals(method.getName()) && args != null && args.length == 1
                                && args[0] instanceof Object[]) {
                            Object[] values = (Object[]) args[0];
                            if (values.length > 0 && values[0] instanceof String) {
                                values[0] = disableAttAiFlags((String) values[0]);
                            }
                        }
                        try {
                            return method.invoke(callback, args);
                        } catch (java.lang.reflect.InvocationTargetException e) {
                            throw e.getCause();
                        }
                    });
        } catch (Throwable t) {
            Log.w(TAG, "wrap AT&T flags failed: " + t);
            return callback;
        }
    }

    /**
     * myAT&T's JavaScript also fetches the flag allocations itself. React Native hands every
     * response body to the JavaScript through NetworkEventUtil.onDataReceived, which calls this
     * first: flag documents get the same treatment, and everything else passes through.
     */
    public static String filterAttJsResponse(String body) {
        if (body == null || body.indexOf("\"allocations\"") < 0 || body.indexOf("svc-") < 0) {
            return body;
        }
        return disableAttAiFlags(body);
    }

    private static final String BLOCKED_URL = "http://127.0.0.1:9/";

    /**
     * myAT&T: Andi's own API gets the usual network error: its chat service (chatlogicprocessor,
     * which also hands chats to agents), its AI endpoints, and its streaming hub.
     */
    public static String filterJsRequestUrl(String url) {
        return isAttAndiUrl(url) ? BLOCKED_URL : url;
    }

    public static java.net.URL filterJsRequestUrl(java.net.URL url) {
        try {
            return url != null && isAttAndiUrl(url.toString()) ? new java.net.URL(BLOCKED_URL) : url;
        } catch (Exception e) {
            return url;
        }
    }

    /** myAT&T: Andi's live chat connection (a WebSocket to its streaming hub) is refused. */
    public static String filterAttWebSocketUrl(String url) {
        return isAttAndiUrl(url) ? "ws://127.0.0.1:9/" : url;
    }

    private static boolean isAttAndiUrl(String url) {
        return url != null && (url.contains("/andiai/") || url.contains("/user/andi") || url.contains("andistreaminghub")
                || url.contains("/chatlogicprocessor/")) && logOff("Andi API");
    }

    private static String disableAttAiFlags(String json) {
        if (json == null || json.isEmpty()) {
            return json;
        }
        try {
            Object root = new org.json.JSONTokener(json).nextValue();
            disableAttAi(root, null);
            return root.toString();
        } catch (Throwable t) {
            Log.w(TAG, "AT&T flags not changed: " + t);
            return json;
        }
    }

    /** Sets AI flags to false, whether stored as name: value or as {name, value/enabled}. */
    private static void disableAttAi(Object node, String owner) throws Exception {
        if (node instanceof org.json.JSONObject) {
            org.json.JSONObject object = (org.json.JSONObject) node;
            String name = object.optString("name", object.optString("key", owner));
            boolean aiEntry = isAttAiFlag(name);
            java.util.Iterator<String> keys = object.keys();
            java.util.List<String> names = new java.util.ArrayList<>();
            while (keys.hasNext()) {
                names.add(keys.next());
            }
            for (String key : names) {
                Object value = object.get(key);
                boolean flag = isAttAiFlag(key)
                        || (aiEntry && (key.equals("value") || key.equals("enabled") || key.equals("isEnabled")));
                if (flag && (value instanceof Boolean || "true".equals(value))) {
                    object.put(key, value instanceof Boolean ? Boolean.FALSE : "false");
                    logOff(isAttAiFlag(key) ? key : name);
                } else {
                    disableAttAi(value, key);
                }
            }
        } else if (node instanceof org.json.JSONArray) {
            org.json.JSONArray array = (org.json.JSONArray) node;
            for (int i = 0; i < array.length(); i++) {
                disableAttAi(array.get(i), owner);
            }
        }
    }

    /**
     * The Home Depot's web pages have their own Magic Apron button. This hides it with a style
     * rule, using the selector the app itself uses to find the button.
     */
    private static final String HIDE_MAGIC_APRON_BUTTON = "(function () {\n"
            + "  if (document.getElementById('msp-hide-magic-apron')) { return; }\n"
            + "  var style = document.createElement('style');\n"
            + "  style.id = 'msp-hide-magic-apron';\n"
            + "  style.textContent = '[data-component=\"ExpandableFab\"],.expandable-fab-button'\n"
            + "    + '{display:none !important}';\n"
            + "  (document.head || document.documentElement).appendChild(style);\n"
            + "})();";

    public static void hideHomeDepotWebAssistant(WebView webView) {
        try {
            if (webView != null) {
                webView.evaluateJavascript(HIDE_MAGIC_APRON_BUTTON, null);
            }
        } catch (Throwable t) {
            Log.w(TAG, "hide Magic Apron button failed: " + t);
        }
    }
}
