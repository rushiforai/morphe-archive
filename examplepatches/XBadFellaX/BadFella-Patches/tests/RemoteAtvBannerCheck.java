package app.badfella.remoteatv.bannercheck;

import android.app.Instrumentation;
import android.os.Bundle;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

/** Same-signature Android instrumentation; exercises the helper in the actual patched APK. */
public final class RemoteAtvBannerCheck extends Instrumentation {
    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); start(); }

    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            java.lang.reflect.Method hide = getTargetContext().getClassLoader()
                    .loadClass("app.badfella.extension.remoteatv.AdFreeStatus")
                    .getMethod("hideBanner", HashMap.class);
            for (String input : new String[]{null, "", "broken", "{}",
                    "{\"adPosition\":0,\"opaqueBackground\":false,\"custom\":42}",
                    "{\"adPosition\":1,\"giveBannerAdFullWidth\":true}",
                    "{\"adPosition\":-1}"}) {
                HashMap<String, Object> values = new HashMap<>();
                HashMap<String, Object> entry = new HashMap<>();
                values.put("unrelated", "preserved");
                if (input != null) {
                    entry.put("value", input.getBytes(StandardCharsets.UTF_8));
                    entry.put("source", "remote");
                    values.put("banner_ad_configuration", entry);
                }
                hide.invoke(null, values);
                Map<?, ?> patched = (Map<?, ?>) values.get("banner_ad_configuration");
                JSONObject config = new JSONObject(new String((byte[]) patched.get("value"), StandardCharsets.UTF_8));
                check(config.getInt("adPosition") == -1, "Banner position");
                check("preserved".equals(values.get("unrelated")), "Unrelated config changed");
                check((input == null ? "default" : "remote").equals(patched.get("source")), "Source changed");
                check(config.has("tvNameInline") && config.has("tabletAdaptiveBanner"), "Defaults missing");
                if (input != null && input.contains("custom")) {
                    check(config.getInt("custom") == 42 && !config.getBoolean("opaqueBackground"), "Existing fields changed");
                }
                if (input != null && input.contains("giveBannerAdFullWidth"))
                    check(config.getBoolean("giveBannerAdFullWidth"), "Existing flag changed");
                if (input != null)
                    check(input.equals(new String((byte[]) entry.get("value"), StandardCharsets.UTF_8)), "Input entry mutated");
                hide.invoke(null, values);
                check(config.toString().equals(new JSONObject(new String((byte[]) ((Map<?, ?>)
                        values.get("banner_ad_configuration")).get("value"), StandardCharsets.UTF_8)).toString()), "Not idempotent");
            }
            result.putString("result", "PASS: seven banner configurations, preservation and idempotence");
            finish(-1, result);
        } catch (Throwable error) {
            result.putString("error", error.toString());
            finish(0, result);
        }
    }

    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
}
