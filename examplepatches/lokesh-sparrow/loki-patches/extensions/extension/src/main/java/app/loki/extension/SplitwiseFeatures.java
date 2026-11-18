/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Splitwise reads every feature switch from one server document through FeatureAvailability.loadFeatureData(name,
 * status). The patches call in here right after that method has filled the status, and force it on or off by name.
 *
 * Names are the server's feature keys (FeatureAvailability constants in 26.11.1).
 */
@SuppressWarnings("unused")
public final class SplitwiseFeatures {

    /**
     * Paid features. Forced visible and enabled, so the app opens the feature instead of the "Get Pro" page.
     * Some of them still ask the server for their data (charts, currency conversion, export); the server has the
     * last word there.
     */
    private static final Set<String> PREMIUM = new HashSet<>(Arrays.asList(
            // The + button: DashboardActivity.launchAddExpenseFlow -> accessFeature("add_expense"). The server
            // turns this off when the daily limit is reached, and the app then shows the Pro countdown instead.
            "add_expense",
            "search",
            "charts",
            "expense_details_chart",
            "group_totals_additional_stats",
            "group_totals_history",
            "currency_conversion",
            "relationship_export",
            "default_splits",
            "settle_up_reminders",
            "balance_alerts",
            "trip_dates",
            "receipt_upload",
            "receipt_scanning",
            "itemization"
    ));

    /** Ads for Pro, upsell cards and nags. Forced hidden. */
    private static final Set<String> ADS = new HashSet<>(Arrays.asList(
            "post_add_bill_ad",
            "recent_activity_ad",
            "pro_root_screen_ad",
            "pro_settings_ad",
            // The "Splitwise Pro" row in the Account tab: AccountItemsViewModelConfiguration shows it when
            // getAdFeature("pro_settings").getVisible().
            "pro_settings",
            "pro_account_card",
            "pro_duo_carousel_button",
            "pro_duo_settings_upsell",
            "group_redeem_pro_pass_carousel_button",
            "group_settings_redeem_pro_pass",
            "core_tour_pro_screen",
            "splitwise_hiring_promo",
            "app_store_review_prompt"
    ));

    /**
     * loadFeatureData's (name, status) captured at method entry. R8 reuses the name's register for temporaries,
     * so by the time the method returns the register no longer holds the name. Same thread enters and exits.
     */
    private static final ThreadLocal<Object[]> CURRENT = new ThreadLocal<>();

    /** How many feature checks the premium patch has answered "yes" since the app started. Read by the menu. */
    public static volatile int premiumGrants;

    /** feature name -> "server on|off -> forced on|off", for the diagnostic report. Latest answer per name. */
    private static final java.util.Map<String, String> SEEN =
            java.util.Collections.synchronizedMap(new java.util.TreeMap<String, String>());

    /** One line per feature the app asked about this session, for the diagnostic report. */
    public static String summary() {
        StringBuilder sb = new StringBuilder();
        synchronized (SEEN) {
            for (java.util.Map.Entry<String, String> entry : SEEN.entrySet()) {
                sb.append("  ").append(entry.getKey()).append(": ").append(entry.getValue()).append('\n');
            }
        }
        return sb.toString();
    }

    private static String state(Object status) {
        try {
            Class<?> type = status.getClass();
            boolean visible = (Boolean) type.getMethod("getVisible").invoke(status);
            boolean enabled = (Boolean) type.getMethod("getEnabled").invoke(status);
            return visible && enabled ? "on" : visible ? "visible-only" : "off";
        } catch (Throwable error) {
            return "?";
        }
    }

    private static void record(Object[] current, String forced) {
        try {
            recordUnsafe(current, forced);
        } catch (Throwable ignored) {
            // The report is a convenience; it must never break the feature check it describes.
        }
    }

    private static void recordUnsafe(Object[] current, String forced) {
        if (current == null || current[0] == null || current[1] == null) return;
        String server = state(current[1]);
        String previous = SEEN.get((String) current[0]);
        // Keep the server's value from the first patch that looked, so the line reads server -> final.
        if (previous != null && previous.startsWith("server ")) {
            int end = previous.indexOf(' ', 7);
            server = end < 0 ? previous.substring(7) : previous.substring(7, end);
        }
        String line = "server " + server + (forced == null ? "" : " -> forced " + forced);
        String old = SEEN.put((String) current[0], line);
        // The log survives the process; the in-memory list does not. Write each feature once per change.
        if (!line.equals(old)) LokiLog.note("feature " + current[0] + ": " + line); // audit: keep
    }

    private SplitwiseFeatures() {
    }

    /** Called first thing in loadFeatureData. */
    private static volatile boolean announced;

    public static void enter(String name, Object status) {
        if (!announced) {
            announced = true;
            LokiLog.debug("Splitwise feature hook active (first check: " + name + ")");
        }
        CURRENT.set(new Object[]{name, status});
    }

    /** Called before each return of loadFeatureData by "Enable premium features (Splitwise)". */
    public static void exitPremium() {
        Object[] current = CURRENT.get();
        boolean hit = current != null && premium((String) current[0]);
        // Ad switches are recorded once, by exitAds, with their forced value; recording them here too wrote
        // every one twice ("server off", then "server off -> forced off") and flooded the 200-line report.
        if (hit || current == null || !ads((String) current[0])) record(current, hit ? "on" : null);
        if (hit) {
            set(current[1], true);
            premiumGrants++;
        }
    }

    /** Called before each return of loadFeatureData by "Hide Pro ads and upsells". */
    public static void exitAds() {
        Object[] current = CURRENT.get();
        boolean hit = current != null && ads((String) current[0]);
        if (hit) {
            record(current, "off");
            set(current[1], false);
        }
    }

    /** FeatureStatus.setVisible / setEnabled. The app's names are not obfuscated in 26.11.1. */
    private static void set(Object status, boolean value) {
        if (status == null) return;
        try {
            Class<?> type = status.getClass();
            Method visible = type.getMethod("setVisible", boolean.class);
            Method enabled = type.getMethod("setEnabled", boolean.class);
            visible.invoke(status, value);
            enabled.invoke(status, value);
        } catch (Throwable error) {
            android.util.Log.e("Loki", "Splitwise feature override failed", error);
        }
    }

    /** True when the feature should be forced on. */
    public static boolean premium(String name) {
        return name != null && PREMIUM.contains(name);
    }

    /** True when the feature should be forced off. */
    public static boolean ads(String name) {
        return name != null && ADS.contains(name);
    }
}
