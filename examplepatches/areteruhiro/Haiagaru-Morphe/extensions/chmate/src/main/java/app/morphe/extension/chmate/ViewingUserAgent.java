package app.morphe.extension.chmate;

import android.content.SharedPreferences;
import android.util.Log;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URLConnection;
import java.util.Set;
import java.util.Collections;
import java.util.concurrent.ConcurrentHashMap;

public final class ViewingUserAgent {
    private static volatile SharedPreferences preferences;
    private static volatile String defaultAgent;
    private static final Set<Class<?>> warned = Collections.newSetFromMap(new ConcurrentHashMap<>());
    static void init(SharedPreferences prefs, String fallback) {
        String saved = prefs.getString("userAgent", null);
        String updated = BrowserUaTemplates.resolve(saved);
        if (saved != null && !saved.equals(updated)) prefs.edit().putString("userAgent", updated).apply();
        defaultAgent = fallback;
        preferences = prefs;
    }

    static String selected(String url, String method) {
        SharedPreferences prefs = preferences;
        if (prefs == null || !prefs.getBoolean(BrowserUaTemplates.ENABLED, false)
                || !ViewingUserAgentRules.eligible(url, method)) return null;
        String agent = BrowserUaTemplates.resolve(prefs.getString("userAgent", defaultAgent));
        return ViewingUserAgentRules.valid(agent) ? agent : null;
    }

    /** The original setter and its validation still run, with all other headers untouched. */
    public static void setRequestProperty(URLConnection connection, String name, String value) {
        connection.setRequestProperty(name, replacement(connection, name, value));
    }
    public static void addRequestProperty(URLConnection connection, String name, String value) {
        String replacement = replacement(connection, name, value);
        if ("User-Agent".equalsIgnoreCase(name) && replacement != value)
            connection.setRequestProperty(name, replacement);
        else connection.addRequestProperty(name, replacement);
    }
    private static String replacement(URLConnection connection, String name, String original) {
        if (!(connection instanceof HttpURLConnection)
                || !"User-Agent".equalsIgnoreCase(name)) return original;
        String value = selected(connection.getURL().toExternalForm(), ((HttpURLConnection) connection).getRequestMethod());
        return value == null ? original : ViewingUserAgentRules.withNativeIdentity(original, value);
    }
    /** Called immediately before native connect/read/write calls, after the method is selected. */
    public static void prepare(URLConnection connection) {
        if (!(connection instanceof HttpURLConnection)) return;
        HttpURLConnection http = (HttpURLConnection) connection;
        String method = http.getRequestMethod();
        String agent = selected(http.getURL().toExternalForm(), method);
        if (agent == null) return;
        try { http.setRequestProperty("User-Agent", ViewingUserAgentRules.withNativeIdentity(http.getRequestProperty("User-Agent"),agent)); }
        catch (IllegalStateException connected) { /* An earlier prepare/setter already had its opportunity. */ }
    }
    static String browserAgent(android.content.Context context){
        SharedPreferences prefs=SettingsProfiles.prefs(context);
        if(!prefs.getBoolean(BrowserUaTemplates.ENABLED,false))return null;
        String value=BrowserUaTemplates.resolve(prefs.getString("userAgent",BrowserUaTemplates.DEFAULT));
        return ViewingUserAgentRules.valid(value)?value:null;
    }

    /** These are ChMate's own request classes, not similarly named advertising SDKs. */
    public static void prepareRequest(Object request) {
        if (preferences == null || !preferences.getBoolean(BrowserUaTemplates.ENABLED, false)) return;
        String urlName, methodName, headersName;
        switch (request.getClass().getName()) {
            case "o.r8lambda17vlhACr7B0IDgCdn1Q67LKhir8": urlName="f"; methodName="c"; headersName="a"; break;
            case "o.zzdA": urlName="h"; methodName="c"; headersName="a"; break;
            case "o.zzcvq": urlName="f"; methodName="a"; headersName="b"; break;
            default: return;
        }
        try {
            Class<?> type = request.getClass();
            Object url = field(type, urlName).get(request);
            String method = (String) field(type, methodName).get(request);
            String agent = selected(url == null ? null : url.toString(), method);
            if (agent == null) return;
            Field target = field(type, headersName);
            Object original = target.get(request);
            if (original == null) return;
            Class<?> headersType = original.getClass();
            String[] pairs = (String[]) field(headersType, "namesAndValues").get(original);
            String[] changed = ViewingUserAgentRules.headers(pairs, agent);
            if (changed == pairs) return;
            Constructor<?> constructor = headersType.getDeclaredConstructor(String[].class);
            constructor.setAccessible(true);
            // Never mutate a shared Headers instance or a different request's UA.
            target.set(request, constructor.newInstance((Object) changed));
        } catch (Exception error) {
            if (warned.add(request.getClass())) Log.w("Haiagaru", "Could not apply request user agent", error);
        }
    }
    private static Field field(Class<?> type, String name) throws ReflectiveOperationException {
        Field field = type.getDeclaredField(name); field.setAccessible(true); return field;
    }
    private ViewingUserAgent() { }
}
