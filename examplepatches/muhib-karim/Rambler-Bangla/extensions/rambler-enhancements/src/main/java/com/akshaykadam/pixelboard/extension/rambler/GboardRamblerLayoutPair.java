/*
 * Rambler Bangla EN/BN multilingual layout pairing helper.
 *
 * Copyright (C) 2026 muhib-karim & Rambler Bangla contributors
 * Licensed under the GNU General Public License v3.0. See LICENSE and ATTRIBUTION.md.
 */
package com.akshaykadam.pixelboard.extension.rambler;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.inputmethod.InputMethodManager;
import android.view.inputmethod.InputMethodSubtype;

import java.util.List;

public final class GboardRamblerLayoutPair {
    public static final String PREF = "pref_rambler_enbn_multilingual";
    static final long TTL_MS = 3000L;
    static volatile Boolean jvmBnLatnEnabled = null;
    static volatile Boolean jvmToggleOn = null;
    private static volatile long checkedAt = 0L;
    private static volatile boolean cached = false;

    private GboardRamblerLayoutPair() {
    }

    static int adjust(int layoutKind, String locale, String languageTag) {
        if (layoutKind == 3) {
            try {
                if (isEnglish(locale, languageTag) && toggleOn() && bnLatnEnabled()) {
                    return 2;
                }
            } catch (Throwable ignored) {
                return layoutKind;
            }
        }
        return layoutKind;
    }

    static boolean toggleOn() {
        Boolean jvm = jvmToggleOn;
        if (jvm != null) {
            return jvm;
        }
        try {
            Context app = GboardRamblerScriptFixSettings.currentApplication();
            return isToggleOn(GboardRamblerScriptFixSettings.prefsOrNull(app));
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean showToggle() {
        try {
            return bnLatnEnabled();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean isToggleOn(Context context) {
        return isToggleOn(GboardRamblerScriptFixSettings.prefsOrNull(context));
    }

    public static boolean isToggleOn(SharedPreferences sharedPreferences) {
        if (sharedPreferences == null) {
            return false;
        }
        try {
            return sharedPreferences.getBoolean(PREF, false);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void setToggleOn(Context context, boolean enabled) {
        setToggleOn(GboardRamblerScriptFixSettings.prefsOrNull(context), enabled);
    }

    public static void setToggleOn(SharedPreferences sharedPreferences, boolean enabled) {
        if (sharedPreferences == null) {
            return;
        }
        try {
            sharedPreferences.edit().putBoolean(PREF, enabled).apply();
        } catch (Throwable ignored) {
        }
    }

    static boolean isEnglish(String locale, String languageTag) {
        String loc = locale == null ? "" : locale;
        String tag = languageTag == null ? "" : languageTag;
        return loc.startsWith("en") || (loc.isEmpty() && tag.startsWith("en"));
    }

    static boolean isBnLatn(String locale, String languageTag) {
        String loc = locale == null ? "" : locale.toLowerCase(java.util.Locale.US);
        String tag = languageTag == null ? "" : languageTag.toLowerCase(java.util.Locale.US);
        return loc.startsWith("bn") || tag.equals("bn") || tag.startsWith("bn-") || tag.startsWith("bn_");
    }

    static boolean bnLatnEnabled() {
        Boolean jvm = jvmBnLatnEnabled;
        if (jvm != null) {
            return jvm;
        }
        long now = System.currentTimeMillis();
        if (now - checkedAt < TTL_MS && checkedAt != 0L) {
            return cached;
        }
        boolean found = false;
        try {
            Context app = GboardRamblerScriptFixSettings.currentApplication();
            if (app != null) {
                Object svc = app.getSystemService("input_method");
                if (svc instanceof InputMethodManager) {
                    List<InputMethodSubtype> list =
                            ((InputMethodManager) svc).getEnabledInputMethodSubtypeList(null, true);
                    if (list != null) {
                        for (InputMethodSubtype sub : list) {
                            if (sub != null && isBnLatn(sub.getLocale(), sub.getLanguageTag())) {
                                found = true;
                                break;
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        cached = found;
        checkedAt = now;
        return found;
    }
}
