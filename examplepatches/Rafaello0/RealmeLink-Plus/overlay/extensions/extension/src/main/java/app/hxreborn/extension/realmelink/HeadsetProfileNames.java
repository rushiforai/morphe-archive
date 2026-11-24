/*
 * Copyright (C) 2026 RaFaeLL0
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Pure-Java display name helpers. Never expose a MAC as a user-facing label.
 */
package app.hxreborn.extension.realmelink;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public final class HeadsetProfileNames {
    private HeadsetProfileNames() {}

    public static String safeName(String raw) {
        if (raw == null) return null;
        String name = raw.replaceAll("[\\p{Cntrl}\\p{Cf}]", " ").trim().replaceAll("\\s{2,}", " ");
        if (name.isEmpty() || name.length() > 96) return null;
        String lowered = name.toLowerCase(Locale.ROOT);
        if (lowered.equals("null") || lowered.equals("unknown") || lowered.equals("unknown device")
                || lowered.equals("<unknown>") || lowered.equals("bluetooth device")
                || lowered.equals("unnamed") || lowered.equals("n/a")) return null;
        if (name.matches("(?i)[0-9a-f]{12}") ||
                name.matches("(?i)[0-9a-f]{2}([:-][0-9a-f]{2}){5}")) return null;
        return name;
    }

    /** getShowName/getBluetoothName/getName were verified in the target APK's Device DEX. */
    public static String vendorName(Object device) {
        if (device == null) return null;
        for (String getter : new String[]{"getShowName", "getAliaBluetoothName",
                "getBluetoothName", "getName"}) {
            try {
                Method method = device.getClass().getMethod(getter);
                if (method.getParameterCount() != 0 || method.getReturnType() != String.class) continue;
                String name = safeName((String) method.invoke(device));
                if (name != null) return name;
            } catch (ReflectiveOperationException | RuntimeException | LinkageError ignored) {
                // The base Device class and the vendor subclasses expose different getters.
            }
        }
        return null;
    }

    /** Duplicate Bluetooth names get stable labels within the currently displayed list. */
    public static String[] labels(String[] candidates, Locale locale) {
        String language = locale == null ? "" : locale.getLanguage();
        String fallback = "uk".equals(language) ? "Навушники"
                : "ru".equals(language) ? "Наушники" : "Earbuds";
        String[] normalized = new String[candidates.length];
        Map<String,Integer> totals = new HashMap<>();
        for (int i = 0; i < candidates.length; i++) {
            String label = safeName(candidates[i]);
            normalized[i] = label == null ? fallback : label;
            String key = normalized[i].toLowerCase(Locale.ROOT);
            totals.put(key, totals.getOrDefault(key, 0) + 1);
        }
        Map<String,Integer> counters = new HashMap<>();
        for (int i = 0; i < normalized.length; i++) {
            String key = normalized[i].toLowerCase(Locale.ROOT);
            if (totals.get(key) > 1) {
                int next = counters.getOrDefault(key, 0) + 1;
                counters.put(key, next);
                normalized[i] += " (" + next + ")";
            }
        }
        return normalized;
    }
}
