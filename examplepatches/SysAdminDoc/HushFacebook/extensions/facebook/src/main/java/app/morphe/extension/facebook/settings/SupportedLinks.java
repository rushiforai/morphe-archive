/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.verify.domain.DomainVerificationManager;
import android.content.pm.verify.domain.DomainVerificationUserState;
import android.net.Uri;
import android.os.Build;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Which of Facebook's web addresses Android sends to this app, read for this app alone.
 *
 * <p>Android verifies an app's web links against the signing key the site names, so a re-signed
 * Facebook loses Meta's verification and facebook.com links can stop opening in it (Morphe Manager
 * #1028). From Android 12 a person can select the addresses for the app in its Open by default
 * page, and Android says which are selected. That sends the links here again without making the
 * build verified. Android 11 says nothing about it, so there the row only opens the app's page.
 */
final class SupportedLinks {
    enum State { VERIFIED, SELECTED, SOME, NONE, DISABLED, UNKNOWN, NOT_REPORTED }

    /**
     * Meta App Manager, which comes on many phones (#30). Android verifies it for facebook.com with
     * Meta's key, and while it holds an address Android won't let a person select that address for
     * another app: the switch on this app's Open by default page turns itself back off. Facebook's
     * manifest queries it by name, so this app can see whether it's there.
     */
    static final String APP_MANAGER = "com.facebook.appmanager";

    static final LogBufferManager.ReportSection REPORT = new LogBufferManager.ReportSection() {
        @Override public String title() { return "SUPPORTED LINKS"; }
        @Override public List<String> lines() { return reportLines(Utils.getContext()); }
        @Override public boolean isAppState() { return true; }
        @Override public Set<String> declaredDomainHosts(List<String> lines) {
            Set<String> hosts = new HashSet<>();
            for (String line : lines) {
                int arrow = line.lastIndexOf(" -> ");
                if (arrow >= 0) hosts.add(line.substring(0, arrow));
            }
            return hosts;
        }
    };

    private SupportedLinks() {}

    /** What Android says about this app's links, or UNKNOWN when it couldn't be read. */
    static State read(Context context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) return userState(context);
        return State.NOT_REPORTED;
    }

    @RequiresApi(Build.VERSION_CODES.S)
    private static State userState(Context context) {
        try {
            DomainVerificationManager manager = context.getSystemService(DomainVerificationManager.class);
            if (manager == null) return State.UNKNOWN;
            DomainVerificationUserState user = manager.getDomainVerificationUserState(context.getPackageName());
            return user == null ? State.UNKNOWN : state(user.isLinkHandlingAllowed(), user.getHostToStateMap());
        } catch (PackageManager.NameNotFoundException | RuntimeException unreadable) {
            Logger.printInfo(() -> "Supported links unreadable: " + unreadable.getClass().getSimpleName());
            return State.UNKNOWN;
        }
    }

    /**
     * Only manifest domains and their per-user selection, never visited links or verifier IDs, then
     * whether Meta App Manager is on the phone.
     */
    static List<String> reportLines(Context context) {
        List<String> lines = new ArrayList<>(domainLines(context));
        lines.add("meta_app_manager: " + appManager(context));
        return lines;
    }

    private static List<String> domainLines(Context context) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
            return Arrays.asList("availability: not_reported (API below 31)",
                    "link_handling_allowed: not_reported", "domains: not_reported");
        }
        try {
            DomainVerificationManager manager = context == null ? null : context.getSystemService(DomainVerificationManager.class);
            DomainVerificationUserState user = manager == null ? null : manager.getDomainVerificationUserState(context.getPackageName());
            if (user != null) {
                List<String> lines = new ArrayList<>();
                lines.add("availability: reported");
                lines.add("link_handling_allowed: " + user.isLinkHandlingAllowed());
                Map<String, Integer> hosts = user.getHostToStateMap();
                if (hosts == null) lines.add("domains: unknown");
                else if (hosts.isEmpty()) lines.add("domains: none_declared");
                else {
                    Map<String, String> sorted = new TreeMap<>();
                    boolean invalid = false;
                    for (Map.Entry<String, Integer> host : hosts.entrySet()) {
                        String name = host.getKey();
                        // Keep Unicode/wildcard manifest hosts, but refuse URLs, userinfo and line injection.
                        if (name == null || name.isEmpty() || !name.matches("[\\p{L}\\p{M}\\p{N}_.*-]+")) {
                            invalid = true;
                            continue;
                        }
                        Integer value = host.getValue();
                        String state = "unknown";
                        if (value != null) {
                            switch (value) {
                                case DomainVerificationUserState.DOMAIN_STATE_VERIFIED: state = "verified"; break;
                                case DomainVerificationUserState.DOMAIN_STATE_SELECTED: state = "selected"; break;
                                case DomainVerificationUserState.DOMAIN_STATE_NONE: state = "none"; break;
                            }
                        }
                        sorted.put(name, state);
                    }
                    if (invalid) lines.add("domains: unknown (invalid host data)");
                    for (Map.Entry<String, String> host : sorted.entrySet()) lines.add(host.getKey() + " -> " + host.getValue());
                }
                return lines;
            }
        } catch (PackageManager.NameNotFoundException | RuntimeException unreadable) {
            Logger.printInfo(() -> "Supported link report unreadable: " + unreadable.getClass().getSimpleName());
        }
        return Arrays.asList("availability: unknown", "link_handling_allowed: unknown", "domains: unknown");
    }

    /** The whole app's answer from each address's; a state this code doesn't know is UNKNOWN. */
    @RequiresApi(Build.VERSION_CODES.S)
    private static State state(boolean allowed, Map<String, Integer> hosts) {
        if (!allowed) return State.DISABLED;
        if (hosts == null || hosts.isEmpty()) return State.UNKNOWN;
        int verified = 0;
        int open = 0;
        for (Integer state : hosts.values()) {
            if (state == null) return State.UNKNOWN;
            switch (state) {
                case DomainVerificationUserState.DOMAIN_STATE_VERIFIED:
                    verified++;
                    open++;
                    break;
                case DomainVerificationUserState.DOMAIN_STATE_SELECTED:
                    open++;
                    break;
                case DomainVerificationUserState.DOMAIN_STATE_NONE:
                    break;
                default:
                    return State.UNKNOWN;
            }
        }
        if (verified == hosts.size()) return State.VERIFIED;
        if (open == hosts.size()) return State.SELECTED;
        return open == 0 ? State.NONE : State.SOME;
    }

    static String summary(State state) {
        switch (state) {
            case VERIFIED:
                return L10n.t("Android verified this app for Facebook's web addresses, so their links open here.");
            case SELECTED:
                return L10n.t("Facebook's web addresses are selected for this app in Android's settings, so their links open here.");
            case SOME:
                return L10n.t("Only some of Facebook's web addresses are selected for this app, and links to the rest open "
                        + "elsewhere. Tap to select them in Android's settings.");
            case NONE:
                return L10n.t("None of Facebook's web addresses are selected for this app, so their links open elsewhere. "
                        + "Tap to select them in Android's settings.");
            case DISABLED:
                return L10n.t("Opening supported links is off for this app in Android's settings. Tap to turn it on.");
            case NOT_REPORTED:
                return L10n.t("Android 11 doesn't say which links open here. Tap to open this app's settings, then Open by default.");
            default:
                return L10n.t("Android didn't say which links open here. Tap to check in Android's settings.");
        }
    }

    /** Whether Meta App Manager is installed and enabled for this user. Never throws. */
    static boolean appManagerOn(@Nullable Context context) {
        return "enabled".equals(appManager(context));
    }

    /** Meta App Manager for this user: enabled, disabled, absent or unknown. Never throws. */
    private static String appManager(@Nullable Context context) {
        if (context == null) return "unknown";
        try {
            return context.getPackageManager().getApplicationInfo(APP_MANAGER, 0).enabled ? "enabled" : "disabled";
        } catch (PackageManager.NameNotFoundException absent) {
            return "absent";
        } catch (RuntimeException unreadable) {
            return "unknown";
        }
    }

    /**
     * Whether the Meta App Manager row belongs on the page: it's on the phone, and Facebook's
     * addresses don't all open here, or Android 11 doesn't say whether they do.
     */
    static boolean appManagerMayHoldLinks(State state, boolean appManagerOn) {
        return appManagerOn && (state == State.NONE || state == State.SOME || state == State.NOT_REPORTED);
    }

    static String appManagerSummary(State state) {
        if (state == State.VERIFIED || state == State.SELECTED) {
            return L10n.t("Facebook's web addresses open here now.");
        }
        return L10n.t("Meta App Manager can keep Facebook's web addresses for itself, so their links skip this app. "
                + "Tap and turn off Open supported links there, then check Supported links above.");
    }

    /**
     * Android's pages for this app's links, to try in order: Open by default from Android 12, and the
     * app's own page, which leads there, as the fallback and as all Android 11 has.
     */
    static List<Intent> settingsIntents(Context context) {
        return linkPages(context.getPackageName());
    }

    /** The same pages for Meta App Manager, which is a system app and so hidden from most app lists. */
    static List<Intent> appManagerIntents() {
        return linkPages(APP_MANAGER);
    }

    private static List<Intent> linkPages(String packageName) {
        Uri app = Uri.fromParts("package", packageName, null);
        List<Intent> intents = new ArrayList<>(2);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            intents.add(new Intent(android.provider.Settings.ACTION_APP_OPEN_BY_DEFAULT_SETTINGS, app));
        }
        intents.add(new Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, app));
        return intents;
    }
}
