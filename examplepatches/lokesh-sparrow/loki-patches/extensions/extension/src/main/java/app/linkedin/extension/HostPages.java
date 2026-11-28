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
        boolean tasker = pkg.startsWith("net.dinglisch.android.taskerm");
        boolean photos = pkg.startsWith("com.google.android.apps.photos");
        boolean imo = pkg.startsWith("com.imo.android.imoimhd");

        if (on(context, "app.loki.menu.premium")) pages.add(premium(splitwise, truecaller, docScanner, tasker));
        if (splitwise && on(context, "app.loki.menu.amoled")) pages.add(appearance(context));
        if (truecaller && on(context, "app.loki.menu.aftercall")) pages.add(calls(context));
        if (photos && on(context, "app.loki.menu.pixelspoof")) pages.add(backup(context));
        if (mx && (on(context, "app.loki.menu.license") || on(context, "app.loki.menu.codec"))) {
            pages.add(player(context));
        }
        if (on(context, "app.loki.menu.ads") || on(context, "app.loki.menu.analytics")
                || on(context, "app.loki.menu.adid") || on(context, "app.loki.menu.proads")
                || on(context, "app.loki.menu.hideads") || (imo && on(context, "app.loki.menu.screenshots"))
                || (truecaller && on(context, "app.loki.menu.anonview"))) {
            pages.add(privacy(context));
        }
        if (imo) {
            // Same topics as the other apps: what the screen looks like, what you send, calls. Screenshots sit in Privacy.
            for (SettingsActivity.Page page : new SettingsActivity.Page[] {
                    imoAppearance(context), imoChats(context), imoCalls(context)}) {
                if (page != null) pages.add(page);
            }
        }
        if (on(context, "app.loki.menu.gmscore")) pages.add(signIn(truecaller));
        if (on(context, "app.loki.menu.clone")) pages.add(clone(context));
    }

    /** One IMO switch: shown only when its patch is in this install, stored where the patched code reads it. */
    private static void imoToggle(Context context, SettingsActivity.Page page, String flag, String title, String note,
                                  String key, boolean byDefault) {
        if (!on(context, flag)) return;
        page.toggle(title, note, new SettingsActivity.Toggle() {
            public boolean get() {
                return LokiSwitches.imo(key, byDefault);
            }

            public void set(boolean on) {
                LokiSwitches.set(context, key, on);
            }
        }, true); // IMO reads these when it starts, so the screen offers a restart after a change.
    }

    /** What IMO's screens show. A switch that is off puts IMO back to how it behaves unpatched. */
    private static SettingsActivity.Page imoAppearance(Context context) {
        SettingsActivity.Page page = new SettingsActivity.Page("Appearance", IconDrawable.PALETTE);
        imoToggle(context, page, "app.loki.menu.hidevoice", "Hide voice rooms tab",
                "Removes the voice rooms tab from the top bar, so only Chats and Contacts are left. Off: the tab "
                        + "comes back.", "imo_hide_voice", true);
        imoToggle(context, page, "app.loki.menu.hidepremium", "Hide Premium on Me page",
                "Removes the paid Premium entry from the Me page. Off: it comes back.", "imo_hide_premium", false);
        return page.rows.isEmpty() ? null : page;
    }

    private static SettingsActivity.Page imoChats(Context context) {
        SettingsActivity.Page page = new SettingsActivity.Page("Chats", IconDrawable.CHAT);
        imoToggle(context, page, "app.loki.menu.hidesuggest", "Hide emoji suggestions",
                "Removes the row of emojis (dice, lips, rose...) above the chat box, so a stray tap no longer sends "
                        + "one. Off: the row comes back.", "imo_hide_suggestions", true);
        imoToggle(context, page, "app.loki.menu.sendapk", "Allow sending apps",
                "Shows the Apps option in the chat attachment menu. Off: IMO decides, as usual.",
                "imo_send_apk", true);
        imoToggle(context, page, "app.loki.menu.burn", "Disappearing messages",
                "Turns on IMO's own disappearing-message option when you send in private and group chats. "
                        + "IMO's servers decide whether the other person gets it.", "imo_burn", false);
        return page.rows.isEmpty() ? null : page;
    }

    private static SettingsActivity.Page imoCalls(Context context) {
        SettingsActivity.Page page = new SettingsActivity.Page("Calls", IconDrawable.PHONE);
        imoToggle(context, page, "app.loki.menu.storycall", "Allow story recording during calls",
                "Lets you record and post a story while a call is going on. Off: IMO decides, as usual.",
                "imo_story_call", true);
        return page.rows.isEmpty() ? null : page;
    }

    private static SettingsActivity.Page premium(boolean splitwise, boolean truecaller, boolean docScanner,
                                                 boolean tasker) {
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
            page.info("Included", () -> "Premium badge, incognito, ghost call, extended spam blocking, "
                    + "call recording and announce call.");
            page.info("Server features", () -> "Who viewed me and who searched for me list whoever Truecaller's "
                    + "servers send to this account. Caller ID for unknown numbers and fraud insurance also depend on "
                    + "Truecaller's servers. Call Assistant and Family sharing stay off.");
        } else if (docScanner) {
            page.info("Full version", () -> "Activated");
        } else if (tasker) {
            page.info("Tasker licence", () -> "Unlocked");
            page.info("Included", () -> "No trial limit and no purchase prompt: the licence check reports Licensed, "
                    + "and the saved licence status is Licensed too, so it stays that way offline and after a "
                    + "restart. Plugins such as AutoApps have their own licences and are not covered.");
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

    /** Truecaller's profile switches, shown at the top of Privacy (as LinkedIn's anonymous viewing is). */
    private static void profileRows(Context context, SettingsActivity.Page page) {
        page.toggle("Anonymous profile viewing", "Opening someone's profile does not tell them you looked. "
                + "Off: Truecaller reports the view, as usual.", new SettingsActivity.Toggle() {
            public boolean get() {
                return LokiSwitches.get(context, "anonymous_profile_view");
            }

            public void set(boolean on) {
                LokiSwitches.set(context, "anonymous_profile_view", on);
            }
        });
        page.toggle("Anonymous search", "Searching someone's number does not tell them you searched. "
                + "Off: Truecaller reports the search, as usual.", new SettingsActivity.Toggle() {
            public boolean get() {
                return LokiSwitches.get(context, "anonymous_search");
            }

            public void set(boolean on) {
                LokiSwitches.set(context, "anonymous_search", on);
            }
        });
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

    private static SettingsActivity.Page backup(Context context) {
        SettingsActivity.Page page = new SettingsActivity.Page("Backup", IconDrawable.CLOUD);
        page.toggle("Unlimited backup (Pixel XL)", "Photos reads this phone as a Pixel XL, the device with unlimited "
                + "original-quality backup that does not count towards your Google storage. Off: the phone answers "
                + "as itself again and uploads count as usual.", new SettingsActivity.Toggle() {
            public boolean get() {
                return LokiSwitches.get(context, "pixel_spoof");
            }

            public void set(boolean on) {
                LokiSwitches.set(context, "pixel_spoof", on);
            }
        }, true);
        page.info("Check", () -> "Photos \u203a Settings \u203a Backup should read \"unlimited photos & videos at no charge\"");
        if (on(context, "app.loki.menu.pixelspoof")) {
            page.info("Uploads", () -> "Every upload says Pixel XL (Google marlin), so Google marks it free: swipe up on a "
                    + "newly backed-up photo and it reads \"doesn't take up space in your account storage\". "
                    + "Switch changes apply after restarting Photos");
        }
        if (on(context, "app.loki.menu.dcimcamera")) {
            page.toggle("Only real camera photos count as Camera", "Photos treats everything under DCIM as Camera, "
                    + "so screenshots and other apps' DCIM folders upload with it. On: only DCIM/Camera counts, and "
                    + "the rest become normal folders you choose in Photos \u203a Backup \u203a Backup device folders. "
                    + "Off: Photos' own rule.", new SettingsActivity.Toggle() {
                public boolean get() {
                    return LokiSwitches.get(context, "photos_camera_only");
                }

                public void set(boolean on) {
                    LokiSwitches.set(context, "photos_camera_only", on);
                }
            }, false);
        }
        page.info("Not covered", () -> "Creations Google renders on its servers (memories, collages) still use your quota");
        return page;
    }


    private static SettingsActivity.Page privacy(Context context) {
        SettingsActivity.Page page = new SettingsActivity.Page("Privacy", IconDrawable.SHIELD);
        if (context.getPackageName().startsWith("com.truecaller") && on(context, "app.loki.menu.anonview")) {
            profileRows(context, page);
        }
        if (context.getPackageName().startsWith("com.imo.android.imoimhd")) {
            imoToggle(context, page, "app.loki.menu.screenshots", "Allow screenshots",
                    "Screenshots and screen recording work everywhere in IMO, including protected chat media and "
                            + "profile photos. Off: IMO blocks them where it normally does.", "imo_screenshots", true);
        }
        if (on(context, "app.loki.menu.proads")) page.info("Pro ads and upsells", () -> "Hidden");
        // An app's own Hide ads patch (Truecaller, Doc Scanner) or the universal one: either removes them.
        // Only what is applied is listed, as on LinkedIn; Patch status shows what is not applied.
        if (on(context, "app.loki.menu.hideads") || on(context, "app.loki.menu.ads")) {
            page.info("Ads", () -> "Removed");
        }
        if (on(context, "app.loki.menu.analytics")) page.info("Analytics and crash reporting", () -> "Turned off");
        if (on(context, "app.loki.menu.adid")) page.info("Advertising ID", () -> "Removed");
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
