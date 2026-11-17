/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.icu.text.DateFormat;
import android.icu.util.TimeZone;
import android.view.View;
import android.widget.Toast;

import androidx.annotation.Nullable;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Shows about when a person's account was made, in the same profile menu as the ID row and under
 * it (#79). Telegram hands out user IDs in rising order, so the month comes from the ID alone: a
 * table of IDs whose sign-up date is publicly known, with a straight line drawn between the two
 * nearest. Nothing is asked of Telegram. Bots, channels and groups get no row, and an ID past the
 * table's last entry reads "after" that entry's month.
 */
public final class RegistrationDate {
    private RegistrationDate() {}

    private static final long DAY_MS = 86_400_000L;

    /**
     * User ID and the day (since 1970-01-01, UTC) it signed up, rising in both. The points are the
     * public ones collected in jobians/telegram-id-age (MIT), smoothed so the date never falls as
     * the ID grows and thinned to about one every six weeks.
     */
    static final long[][] ANCHORS = {
            {0L, 15931}, // 2013-08-14
            {2768409L, 16010}, // 2013-11-01
            {7679610L, 16070}, // 2013-12-31
            {15835244L, 16121}, // 2014-02-20
            {44634663L, 16196}, // 2014-05-06
            {54845238L, 16333}, // 2014-09-20
            {101260938L, 16500}, // 2015-03-06
            {103204956L, 16586}, // 2015-05-31
            {117597704L, 16647}, // 2015-07-31
            {127929227L, 16697}, // 2015-09-19
            {143445125L, 16770}, // 2015-12-01
            {171295414L, 16869}, // 2016-03-09
            {222021233L, 16960}, // 2016-06-08
            {278941742L, 17054}, // 2016-09-10
            {294851037L, 17124}, // 2016-11-19
            {328594461L, 17194}, // 2017-01-28
            {369669043L, 17256}, // 2017-03-31
            {400169472L, 17378}, // 2017-07-31
            {805158066L, 18092}, // 2019-07-15
            {1974255900L, 18912}, // 2021-10-12
            {5027173742L, 18969}, // 2021-12-08
            {5058656439L, 19049}, // 2022-02-26
            {5308260177L, 19107}, // 2022-04-25
            {5387226589L, 19163}, // 2022-06-20
            {5531378275L, 19216}, // 2022-08-12
            {5578621357L, 19264}, // 2022-09-29
            {5767004208L, 19336}, // 2022-12-10
            {5832370132L, 19382}, // 2023-01-25
            {6136110037L, 19477}, // 2023-04-30
            {6326011828L, 19545}, // 2023-07-07
            {6462226143L, 19664}, // 2023-11-03
            {6540611293L, 19722}, // 2023-12-31
            {7002435197L, 19819}, // 2024-04-06
            {7091188196L, 19886}, // 2024-06-12
            {7283525500L, 19949}, // 2024-08-14
            {7454492493L, 19998}, // 2024-10-02
            {7692193285L, 20097}, // 2025-01-09
            {7866754510L, 20252}, // 2025-06-13
            {8200159552L, 20343}, // 2025-09-12
            {8330469738L, 20388}, // 2025-10-27
            {8490936174L, 20434}, // 2025-12-12
            {8625334644L, 20579}, // 2026-05-06
            {8947299429L, 20660}, // 2026-07-26
            {8976922282L, 20701}, // 2026-09-05
    };

    /** About when an ID signed up: a day, and whether the ID is newer than every anchor. */
    static final class Estimate {
        final long day;
        final boolean after;

        Estimate(long day, boolean after) {
            this.day = day;
            this.after = after;
        }
    }

    /** The estimate for a user ID from {@link #ANCHORS}, null for an ID that isn't a user's. */
    @Nullable
    static Estimate estimate(long userId) {
        return estimate(userId, ANCHORS);
    }

    /**
     * The estimate from [anchors]: an anchor's own day at an anchor, a straight line between the
     * two around it, the first day at or before the first anchor, and the last day marked after
     * past the last.
     */
    @Nullable
    static Estimate estimate(long userId, long[][] anchors) {
        if (userId <= 0 || anchors.length == 0) return null;
        if (userId <= anchors[0][0]) return new Estimate(anchors[0][1], false);
        int last = anchors.length - 1;
        if (userId > anchors[last][0]) return new Estimate(anchors[last][1], true);
        int low = 0, high = last;
        while (high - low > 1) {
            int middle = (low + high) >>> 1;
            if (anchors[middle][0] < userId) low = middle;
            else high = middle;
        }
        if (anchors[high][0] == userId) return new Estimate(anchors[high][1], false);
        double share = (double) (userId - anchors[low][0]) / (double) (anchors[high][0] - anchors[low][0]);
        return new Estimate(anchors[low][1] + Math.round(share * (anchors[high][1] - anchors[low][1])), false);
    }

    /** Month and year of [day] the way [locale] writes them, such as "March 2016". */
    static String month(long day, Locale locale) {
        Date date = new Date(day * DAY_MS);
        try {
            DateFormat format = DateFormat.getInstanceForSkeleton(DateFormat.YEAR_MONTH, locale);
            format.setTimeZone(TimeZone.getTimeZone("UTC"));
            return format.format(date);
        } catch (Throwable unavailable) {
            SimpleDateFormat format = new SimpleDateFormat("LLLL yyyy", locale);
            format.setTimeZone(java.util.TimeZone.getTimeZone("UTC"));
            return format.format(date);
        }
    }

    /** The row's text for [userId], null when it gets no row. */
    @Nullable
    static String label(Context context, long userId) {
        Estimate estimate = estimate(userId);
        if (estimate == null) return null;
        String month = month(estimate.day, Locale.getDefault());
        return estimate.after ? L10n.f(context, "Registered after %1$s", month)
                : L10n.f(context, "Registered about %1$s", month);
    }

    /** Called by {@link LocalIds#addToProfile} after its own row, whatever the ID switch says. */
    static void addToProfile(View menu, long userId, long chatId) {
        if (menu == null || userId <= 0 || chatId != 0 || !on()) return;
        try {
            if (!isPerson(userId)) return;
            String text = label(menu.getContext(), userId);
            if (text == null) return;
            View row = LocalIds.nativeAddRow(menu, text);
            if (row == null) return;
            bindRow(menu, row, text);
            HookStatus.counted(FamilyNames.SHOW_LOCAL_IDS, "registration date shown");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "registration date row", failure);
        }
    }

    static void bindRow(View menu, View row, String text) {
        row.setContentDescription(L10n.f(row.getContext(), "Copy %1$s", text));
        row.setOnClickListener(clicked -> {
            if (!on()) return;
            try {
                ClipboardManager clipboard = (ClipboardManager) clicked.getContext().getSystemService(Context.CLIPBOARD_SERVICE);
                if (clipboard == null) return;
                clipboard.setPrimaryClip(ClipData.newPlainText(text, text));
                LocalIds.nativeDismiss(menu);
                Toast.makeText(clicked.getContext(), L10n.t(clicked.getContext(), "Registration date copied"), Toast.LENGTH_SHORT).show();
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "registration date copy", failure);
            }
        });
        // A switch change, Pause or safe mode hides an already built menu before its next draw.
        row.getViewTreeObserver().addOnPreDrawListener(() -> {
            row.setVisibility(on() ? View.VISIBLE : View.GONE);
            return true;
        });
        row.setVisibility(on() ? View.VISIBLE : View.GONE);
    }

    static boolean on() {
        try {
            return Utils.settingsReady() && Settings.REGISTRATION_DATE.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "registration date switch", failure);
            return false;
        }
    }

    /** Replaced when patching: whether the selected account's cache holds [userId] as a person, not a bot. */
    public static boolean isPerson(long userId) { return false; }
}
