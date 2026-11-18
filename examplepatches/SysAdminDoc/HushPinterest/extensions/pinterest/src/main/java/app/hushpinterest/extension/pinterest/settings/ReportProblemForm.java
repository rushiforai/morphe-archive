/*
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 *
 * Built on https://github.com/SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushpinterest.extension.pinterest.settings;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.TwoStatePreference;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.Setting;
import app.hushpinterest.extension.shared.settings.preference.ReportProblem;

/**
 * HushPinterest's half of Report a problem: the repository, its bug form's field ids
 * (.github/ISSUE_TEMPLATE/bug_report.yml) and the names that go in the versions line.
 * {@link ReportProblem} builds the address.
 */
@SuppressWarnings("deprecation")
final class ReportProblemForm {
    /** owner/name, read off the Source code link so the two can't drift apart. */
    static final String REPOSITORY = HushPinterestPreferenceFragment.SOURCE_URL
            .substring(HushPinterestPreferenceFragment.SOURCE_URL.indexOf("github.com/") + "github.com/".length());

    /** The bug form and the ids of the fields filled in. A renamed id in the form has to change here too. */
    static final ReportProblem.Form FORM = new ReportProblem.Form(REPOSITORY, "bug_report.yml",
            "versions", "device", "bug_description", "additional_context");

    private ReportProblemForm() {
    }

    /** The titles of the switches that are on, as the screen shows them and in its order. */
    static List<String> switchesOn(PreferenceGroup group) {
        List<String> titles = new ArrayList<>();
        collect(group, titles);
        return titles;
    }

    private static void collect(PreferenceGroup group, List<String> titles) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference row = group.getPreference(i);
            if (row instanceof PreferenceGroup) {
                collect((PreferenceGroup) row, titles);
            } else if (row instanceof TwoStatePreference && ((TwoStatePreference) row).isChecked()
                    && row.hasKey() && Setting.getSettingFromPath(row.getKey()) != null && row.getTitle() != null) {
                titles.add(row.getTitle().toString());
            }
        }
    }

    /** The new bug report's address, with this install's facts and [screen]'s switches filled in. */
    static String issueUrl(PreferenceGroup screen) {
        return ReportProblem.issueUrl(FORM, ReportProblem.facts("HushPinterest", "Pinterest", switchesOn(screen)));
    }

    /** Opens the report in a browser, in a task of its own, or says no app here can. */
    static void open(Context context, PreferenceGroup screen) {
        try {
            context.startActivity(browserIntent(context, issueUrl(screen)));
        } catch (ActivityNotFoundException | SecurityException missing) {
            // No browser, or none switched on. Uncaught, Android's exception closed Pinterest.
            Logger.printInfo(() -> "No app opened the bug report link");
            Utils.showToastLong(L10n.f("No app can open %1$s.",
                    L10n.isolate(HushPinterestPreferenceFragment.SOURCE_ADDRESS)));
        }
    }

    /**
     * GitHub's own app takes github.com links, shows its template list and drops every filled-in
     * value, so the report is aimed at a browser.
     */
    static Intent browserIntent(Context context, String url) {
        PackageManager packages = context.getPackageManager();
        // A neutral address finds the browsers, not the app that claims github.com.
        Intent probe = new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.com/"))
                .addCategory(Intent.CATEGORY_BROWSABLE);
        Set<String> browsers = new LinkedHashSet<>();
        for (ResolveInfo handler : packages.queryIntentActivities(probe, 0)) {
            if (handler.activityInfo != null && handler.activityInfo.exported
                    && !context.getPackageName().equals(handler.activityInfo.packageName)) {
                browsers.add(handler.activityInfo.packageName);
            }
        }
        ResolveInfo preferred = packages.resolveActivity(probe, 0);
        return route(url, browsers, preferred == null || preferred.activityInfo == null
                ? null : preferred.activityInfo.packageName);
    }

    /** The default browser, the only one, or a choice of them. With none found Android decides. */
    static Intent route(String url, Set<String> browsers, String preferred) {
        Intent target = new Intent(Intent.ACTION_VIEW, Uri.parse(url))
                .addCategory(Intent.CATEGORY_BROWSABLE)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        if (browsers.isEmpty()) return target;
        if (browsers.contains(preferred)) return target.setPackage(preferred);
        if (browsers.size() == 1) return target.setPackage(browsers.iterator().next());
        List<Intent> choices = new ArrayList<>();
        for (String browser : browsers) choices.add(new Intent(target).setPackage(browser));
        Intent chooser = Intent.createChooser(choices.remove(0), L10n.t("Report a problem"));
        chooser.putExtra(Intent.EXTRA_INITIAL_INTENTS, choices.toArray(new Intent[0]));
        return chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    }
}
