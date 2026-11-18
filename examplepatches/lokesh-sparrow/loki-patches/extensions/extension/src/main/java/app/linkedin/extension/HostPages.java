/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.content.Context;

import app.loki.extension.LokiSwitches;
import app.loki.extension.MenuInfo;
import app.loki.extension.SplitwiseFeatures;

import java.util.List;

/**
 * The app's own pages on the Loki Patches screen, for every app except LinkedIn (whose pages are its feature
 * switches). Each page reads what the patches wrote into the manifest, so it only appears, and only says
 * "unlocked" or "hidden", when that patch really ran. These patches have no switches of their own: what they
 * do is chosen in Manager, so the pages report status.
 */
final class HostPages {
    private HostPages() {
    }

    static void add(Context context, List<SettingsActivity.Page> pages) {
        String pkg = context.getPackageName();
        boolean splitwise = pkg.startsWith("com.Splitwise.SplitwiseMobile");
        boolean truecaller = pkg.startsWith("com.truecaller");
        boolean docScanner = pkg.startsWith("com.cv.docscanner");
        boolean mx = pkg.startsWith("com.mxtech.videoplayer");

        if (on(context, "app.loki.menu.premium")) pages.add(premium(splitwise, truecaller, docScanner));
        if (splitwise && on(context, "app.loki.menu.amoled")) pages.add(appearance(context));
        if (truecaller && on(context, "app.loki.menu.aftercall")) pages.add(calls(context));
        if (mx && (on(context, "app.loki.menu.license") || on(context, "app.loki.menu.codec"))) {
            pages.add(player(context));
        }
        if (on(context, "app.loki.menu.ads") || on(context, "app.loki.menu.analytics")
                || on(context, "app.loki.menu.adid") || on(context, "app.loki.menu.proads")) {
            pages.add(privacy(context));
        }
        if (on(context, "app.loki.menu.gmscore")) pages.add(signIn(truecaller));
        if (on(context, "app.loki.menu.clone")) pages.add(clone(context));
    }

    private static SettingsActivity.Page premium(boolean splitwise, boolean truecaller, boolean docScanner) {
        SettingsActivity.Page page = new SettingsActivity.Page("Premium", IconDrawable.STAR);
        if (splitwise) {
            page.info("Splitwise Pro", () -> "Unlocked");
            page.info("Pro checks answered", () -> SplitwiseFeatures.premiumGrants > 0
                    ? SplitwiseFeatures.premiumGrants + " so far in this session"
                    : "None yet - open a group or tap scan, then come back");
            page.info("Included", () -> "Unlimited expenses, receipt scanning, charts, search, currency "
                    + "conversion, itemization, default splits, totals history and export.");
        } else if (truecaller) {
            page.info("Truecaller Premium", () -> "Unlocked");
            page.info("Included", () -> "No ads, premium badge, incognito, ghost call, extended spam blocking, "
                    + "call recording, announce call and family sharing.");
            page.info("Server features", () -> "Who viewed me, who searched for me, caller ID for unknown numbers "
                    + "and fraud insurance open but stay empty: their data comes from Truecaller's servers.");
        } else if (docScanner) {
            page.info("Full version", () -> "Activated");
        } else {
            page.info("Premium", () -> "Unlocked");
        }
        return page;
    }

    private static SettingsActivity.Page appearance(Context context) {
        SettingsActivity.Page page = new SettingsActivity.Page("Appearance", IconDrawable.PALETTE);
        page.toggle("AMOLED black", "Real black instead of dark grey in dark mode. AMOLED screens switch black "
                + "pixels off, which saves battery. Restart Splitwise to apply.", new SettingsActivity.Toggle() {
            public boolean get() {
                return LokiSwitches.get(context, "amoled_black");
            }

            public void set(boolean on) {
                LokiSwitches.set(context, "amoled_black", on);
            }
        }, true);
        return page;
    }

    private static SettingsActivity.Page calls(Context context) {
        SettingsActivity.Page page = new SettingsActivity.Page("Calls", IconDrawable.PHONE);
        page.toggle("Hide after-call screen", "Skips the screen Truecaller shows when a call ends, for contacts "
                + "and unknown numbers. Off: Truecaller decides, as usual.", new SettingsActivity.Toggle() {
            public boolean get() {
                return LokiSwitches.get(context, "hide_after_call");
            }

            public void set(boolean on) {
                LokiSwitches.set(context, "hide_after_call", on);
            }
        });
        page.info("Caller ID", () -> "Unchanged - the popup still shows who is calling");
        return page;
    }

    private static SettingsActivity.Page player(Context context) {
        SettingsActivity.Page page = new SettingsActivity.Page("Player", IconDrawable.STAR);
        if (on(context, "app.loki.menu.license")) {
            page.info("MX Player Pro", () -> "Licensed - the Google Play check is skipped");
        }
        if (on(context, "app.loki.menu.codec")) {
            page.info("All codecs", () -> "Built in - MX Player's own decoder is replaced by the 1.87.0 codec pack, "
                    + "so AC3, E-AC3, DTS, DTS-HD, TrueHD and MLP audio play");
            page.info("Check", () -> "MX Player \u203a Settings \u203a Decoder \u203a Custom codec reads 1.87.0");
        }
        return page;
    }

    private static SettingsActivity.Page privacy(Context context) {
        SettingsActivity.Page page = new SettingsActivity.Page("Privacy", IconDrawable.SHIELD);
        if (on(context, "app.loki.menu.proads")) page.info("Pro ads and upsells", () -> "Hidden");
        page.info("Ads", () -> on(context, "app.loki.menu.ads") ? "Removed" : "Left as they were");
        page.info("Analytics and crash reporting", () -> on(context, "app.loki.menu.analytics")
                ? "Turned off" : "Left as they were");
        page.info("Advertising ID", () -> on(context, "app.loki.menu.adid") ? "Removed" : "Left as it was");
        return page;
    }

    private static SettingsActivity.Page signIn(boolean truecaller) {
        SettingsActivity.Page page = new SettingsActivity.Page(truecaller ? "Sign-in & backup" : "Sign-in",
                IconDrawable.KEY);
        page.info("Google sign-in", () -> "Through MicroG-RE");
        if (truecaller) page.info("Google Drive backup", () -> "Through MicroG-RE");
        page.info("How to use it", () -> "Install MicroG-RE, add your Google account there, then sign in here.");
        return page;
    }

    private static SettingsActivity.Page clone(Context context) {
        SettingsActivity.Page page = new SettingsActivity.Page("Clone", IconDrawable.COPY);
        page.info("Package", context::getPackageName);
        page.info("Installed", () -> "Next to the original app, which stays untouched");
        return page;
    }

    private static boolean on(Context context, String flag) {
        return MenuInfo.on(context, flag);
    }
}
