/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.info;

import android.content.Context;
import android.preference.Preference;
import android.preference.PreferenceCategory;

import androidx.annotation.Nullable;

import java.util.Arrays;
import java.util.List;
import java.util.Set;

import app.morphe.extension.facebook.settings.SettingsRows.Row;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.settings.BooleanSetting;

/**
 * Where ads and tracking are blocked, at the end of Privacy in every build. The switches for ads
 * sit on six pages and three patches have none, so the map lists each place Facebook shows ads or
 * reports what you do, read off {@link PatchFamily}. A line whose patch is in and has a switch goes
 * to that switch, one set when you patched says so, and one whose patch is out names the patch to
 * choose. A block that costs something says what.
 */
@SuppressWarnings("deprecation")
final class AdsMap {
    private AdsMap() {
    }

    /** One place on the map: its name here, its patch, the page its switch is on, and what blocking it costs. */
    static final class Line {
        final String title;
        final PatchFamily family;
        /** The section the family's first switch is in, or null for a patch with no switch. */
        @Nullable final String section;
        @Nullable final String sideEffect;

        Line(String title, PatchFamily family, @Nullable String section, @Nullable String sideEffect) {
            this.title = title;
            this.family = family;
            this.section = section;
            this.sideEffect = sideEffect;
        }

        /** The switch a tap goes to, or null when the patch has none. */
        @Nullable
        BooleanSetting setting() {
            return family.switches.isEmpty() ? null : family.switches.get(0);
        }
    }

    /** The map's lines in the order they're shown, translated. */
    static List<Line> lines() {
        return Arrays.asList(
                new Line(L10n.t("Ads in the feed"), PatchFamily.SPONSORED_POSTS, L10n.t("News feed"), null),
                new Line(L10n.t("Ads on profiles"), PatchFamily.SPONSORED_PROFILE_POSTS, L10n.t("News feed"), null),
                new Line(L10n.t("Ads in Stories"), PatchFamily.SPONSORED_STORIES, L10n.t("Stories"), null),
                new Line(L10n.t("Ads in Reels"), PatchFamily.SPONSORED_REELS, L10n.t("Reels and Watch"), null),
                new Line(L10n.t("Ads in search results"), PatchFamily.SPONSORED_SEARCH, L10n.t("Search"), null),
                new Line(L10n.t("Ads in Marketplace"), PatchFamily.SPONSORED_MARKETPLACE, L10n.t("Marketplace"), null),
                new Line(L10n.t("Ads in Instant Games"), PatchFamily.GAME_ADS, L10n.t("Menu"), null),
                new Line(L10n.t("Ads downloaded in advance"), PatchFamily.AD_PREFETCH, null, null),
                new Line(L10n.t("Ad tracking"), PatchFamily.AD_TELEMETRY, null, null),
                new Line(L10n.t("Facebook's ads in other apps"), PatchFamily.AUDIENCE_NETWORK, null,
                        L10n.t("Those apps show their own ads or none, and their rewarded ads may fail.")),
                new Line(L10n.t("Usage statistics uploads"), PatchFamily.ANALYTICS_UPLOADS, L10n.t("Privacy"),
                        L10n.t("Facebook's on-phone learning jobs stop too, and a change applies after Facebook restarts.")),
                new Line(L10n.t("Reel watch history"), PatchFamily.REEL_WATCH_HISTORY, L10n.t("Reels and Watch"),
                        L10n.t("Reels you've already seen may come back.")));
    }

    /** Adds the map's heading and lines to [privacy]. */
    static void add(HushfacebookPreferenceFragment page, PreferenceCategory privacy, Context context,
                    Set<PatchFamily> build) {
        privacy.addPreference(info(context, L10n.t("Where ads and tracking are blocked"),
                L10n.t("The places Facebook shows ads or reports what you do, and what this build does about each. "
                        + "A line with a switch takes you to it.")));
        for (Line line : lines()) privacy.addPreference(row(page, context, build, line));
    }

    /** What a line says under its name: where its switch is, that patching set it, or the patch to choose. */
    static String summary(Line line, Set<PatchFamily> build) {
        BooleanSetting setting = line.setting();
        String status;
        if (!build.contains(line.family)) {
            status = L10n.f("Not in this build. To block this, choose the %1$s patch in Morphe Manager and patch again.",
                    L10n.isolate(line.family.patchName));
        } else if (setting == null) {
            status = L10n.t("Blocked since you patched. There's no switch for it.");
        } else {
            status = L10n.f("Its switch is %1$s, in %2$s.", L10n.isolate(SwitchLabels.title(setting)),
                    L10n.isolate(line.section));
        }
        return line.sideEffect == null ? status : status + " " + line.sideEffect;
    }

    /**
     * A line a tap takes to its switch's row, changing nothing, while its patch is in and has a
     * switch. Any other line is text.
     */
    private static Preference row(HushfacebookPreferenceFragment page, Context context, Set<PatchFamily> build,
                                  Line line) {
        BooleanSetting setting = line.setting();
        if (setting == null || !build.contains(line.family)) return info(context, line.title, summary(line, build));
        Row row = new Row(context);
        row.setKey("action_show_" + setting.key);
        row.setPersistent(false);
        row.setTitle(line.title);
        row.setSummary(summary(line, build));
        row.setOnPreferenceClickListener(ignored -> {
            Preference target = page.findPreference(setting.key);
            return target != null && page.jumpTo(target);
        });
        return row;
    }
}
