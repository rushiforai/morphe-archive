package app.jofslash.extension.quora;

import org.json.JSONObject;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@SuppressWarnings("unused")
public final class BlockTelemetryPatch {

    // Logging actions without a "log_" prefix. Every "log_*" action is blocked too,
    // such as log_reading_time, log_experiment and log_device_charging_status_changed.
    private static final Set<String> TELEMETRY_ACTIONS = new HashSet<>(Arrays.asList(
            "bottombar_tab_press",
            "switcher_tab_press",
            "deep_link_logging",
            "product_monitor_log",
            "share_extension_logging",
            "share_log_package",
            "share_log_facebook",
            "mobile_api_e2e_perf"
    ));

    /**
     * Injection point: start of QNetworkCalls.callApi.
     *
     * @return True if the API call only reports usage data, so it can be dropped.
     */
    public static boolean isTelemetry(JSONObject data) {
        if (data == null) return false;
        String action = data.optString("action", "");
        return action.startsWith("log_") || TELEMETRY_ACTIONS.contains(action);
    }
}
