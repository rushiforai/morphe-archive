/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.preference.Preference;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.media.RecentlyWatched;
import app.morphe.extension.facebook.media.RecentlyWatched.Entry;
import app.morphe.extension.facebook.settings.SettingsRows.Row;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * The Recently watched row on the Playback page and the list it opens (#183): the reels, videos and
 * stories {@link RecentlyWatched} kept, the one watched last first, with a chip for each kind. A tap
 * opens one in Facebook through its own link handler and closes the settings, so it shows. Clear
 * empties the list at once.
 */
@SuppressWarnings("deprecation") // Framework preferences and fragments, as the rest of the screen.
final class RecentlyWatchedScreen {
    /** The row's key, for the settings search. No setting is behind it. */
    static final String ROW = "action_recently_watched";

    /** Facebook's own handler for the links it opens, a manifest component that keeps its name. */
    static final String URI_HANDLER = "com.facebook.katana.IntentUriHandler";

    /** The chips, in their order: every kind, then each one. Null stands for every kind. */
    private static final String[] KINDS = {null, RecentlyWatched.REEL, RecentlyWatched.VIDEO, RecentlyWatched.STORY};

    private static final String DOT = " " + (char) 0x00B7 + " ";

    private RecentlyWatchedScreen() {
    }

    static Preference row(HushfacebookPreferenceFragment page, Context context) {
        Row row = new Row(context);
        row.setKey(ROW);
        row.setTitle(L10n.t("Recently watched"));
        row.setSummary(L10n.t("Reels, videos and stories you watched, newest first. Tap one to open it again."));
        row.setPersistent(false);
        row.setOnPreferenceClickListener(p -> {
            show(page, context);
            return true;
        });
        return row;
    }

    /** The list, through the page, so it closes with the page's view and takes the screen's colours. */
    @Nullable
    static AlertDialog show(HushfacebookPreferenceFragment page, Context context) {
        ScreenColors palette = ScreenColors.current();
        Listing listing = new Listing(context, palette, RecentlyWatched.entries());

        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        HorizontalScrollView chipRow = new HorizontalScrollView(context);
        chipRow.setHorizontalScrollBarEnabled(false);
        RadioGroup chips = new RadioGroup(context);
        chips.setOrientation(RadioGroup.HORIZONTAL);
        chips.setPaddingRelative(dp(context, 20), dp(context, 4), dp(context, 20), dp(context, 8));
        for (int index = 0; index < KINDS.length; index++) {
            RadioButton chip = chip(context, palette, chipLabel(KINDS[index]));
            chip.setId(View.generateViewId());
            String kind = KINDS[index];
            chip.setOnCheckedChangeListener((button, checked) -> {
                paintChip(button, palette, checked);
                if (checked) listing.only(kind);
            });
            RadioGroup.LayoutParams place = new RadioGroup.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            place.setMarginEnd(dp(context, 8));
            chips.addView(chip, place);
            if (index == 0) chips.check(chip.getId());
        }
        chipRow.addView(chips);
        content.addView(chipRow);

        ListView list = new ListView(context);
        list.setDivider(null);
        list.setAdapter(listing);
        content.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        TextView empty = new TextView(context);
        empty.setTextColor(palette.summary);
        empty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        empty.setPaddingRelative(dp(context, 24), dp(context, 16), dp(context, 24), dp(context, 16));
        content.addView(empty, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        list.setEmptyView(empty);
        listing.emptyText = empty;
        listing.showEmptyText();

        AlertDialog dialog = page.show(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Recently watched"))
                .setView(content)
                .setNeutralButton(L10n.t("Clear"), null)
                .setPositiveButton(L10n.t("OK"), null));
        if (dialog == null) return null;
        list.setOnItemClickListener((parent, view, position, id) -> open(page, dialog, context, listing.getItem(position)));
        Button clear = dialog.getButton(DialogInterface.BUTTON_NEUTRAL);
        listing.clearButton = clear;
        if (clear != null) {
            clear.setEnabled(!listing.all.isEmpty());
            clear.setOnClickListener(button -> {
                RecentlyWatched.clear();
                listing.replace(Collections.emptyList());
                Utils.showToastShort(L10n.t("List cleared"));
            });
        }
        return dialog;
    }

    /**
     * Opens [entry] in Facebook and, once it's on its way, closes the list and the settings over
     * it, so what opens isn't hidden behind them. Says so when nothing opens it.
     */
    static void open(HushfacebookPreferenceFragment page, @Nullable AlertDialog list, Context context, Entry entry) {
        Activity activity = page.getActivity();
        Context from = activity != null && !activity.isFinishing() ? activity : context;
        String link = entry.link();
        if (link == null || !startView(from, link)) {
            String address = link == null ? "" : link;
            Utils.showToastLong(L10n.f("No app on this phone can open the link. The address is %1$s.",
                    L10n.isolate(address)));
            return;
        }
        Logger.printDebug(() -> "Recently watched: opened a " + entry.kind);
        if (list != null) list.dismiss();
        Fragment screen = page.getParentFragment();
        if (screen instanceof SettingsDialog) {
            SettingsEntry.onClosedByUser();
            ((SettingsDialog) screen).dismissAllowingStateLoss();
        }
    }

    /** The view intent [link] opens with: Facebook's own link handler, in this app. */
    static Intent viewIntent(Context from, String link) {
        Intent view = new Intent(Intent.ACTION_VIEW, Uri.parse(link)).setClassName(from.getPackageName(), URI_HANDLER);
        if (!(from instanceof Activity)) view.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return view;
    }

    /** Starts [link] in this app: its link handler first, then whatever in it takes the link. */
    private static boolean startView(Context from, String link) {
        try {
            from.startActivity(viewIntent(from, link));
            return true;
        } catch (ActivityNotFoundException | SecurityException noHandler) {
            Logger.printInfo(() -> "Recently watched: the link handler didn't take the link");
        }
        Intent anyScreen = new Intent(Intent.ACTION_VIEW, Uri.parse(link)).setPackage(from.getPackageName());
        if (!(from instanceof Activity)) anyScreen.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            from.startActivity(anyScreen);
            return true;
        } catch (ActivityNotFoundException | SecurityException noScreen) {
            Logger.printInfo(() -> "Recently watched: nothing in Facebook took the link");
            return false;
        }
    }

    // ------------------------------------------------------------------ what a row says

    /** The chip for [kind], or for every kind when it's null. */
    static String chipLabel(@Nullable String kind) {
        if (kind == null) return L10n.t("All");
        switch (kind) {
            case RecentlyWatched.REEL:
                return L10n.t("Reels");
            case RecentlyWatched.VIDEO:
                return L10n.t("Videos");
            default:
                return L10n.t("Stories");
        }
    }

    /** One of [kind]. */
    static String kindLabel(String kind) {
        switch (kind) {
            case RecentlyWatched.REEL:
                return L10n.t("Reel");
            case RecentlyWatched.VIDEO:
                return L10n.t("Video");
            default:
                return L10n.t("Story");
        }
    }

    /** The row's first line: who posted it, or its kind when that isn't known. */
    static String title(Entry entry) {
        return entry.owner != null ? L10n.isolate(entry.owner) : kindLabel(entry.kind);
    }

    /** The row's second line: its kind when the title is its poster, its length, and when it was watched. */
    static String detail(Entry entry, long now) {
        List<String> parts = new ArrayList<>();
        if (entry.owner != null) parts.add(kindLabel(entry.kind));
        if (entry.durationMs > 0) parts.add(DateUtils.formatElapsedTime(Math.max(1, entry.durationMs / 1000)));
        // Under a minute, Android's own words would be "0 min. ago".
        if (now - entry.watchedAt < DateUtils.MINUTE_IN_MILLIS) {
            parts.add(L10n.t("Just now"));
        } else {
            parts.add(DateUtils.getRelativeTimeSpanString(entry.watchedAt, now, DateUtils.MINUTE_IN_MILLIS,
                    DateUtils.FORMAT_ABBREV_RELATIVE).toString());
        }
        return TextUtils.join(DOT, parts);
    }

    /** The entries of [kind] in [entries], in their order, or all of them when it's null. */
    static List<Entry> only(List<Entry> entries, @Nullable String kind) {
        if (kind == null) return entries;
        List<Entry> shown = new ArrayList<>();
        for (Entry entry : entries) {
            if (kind.equals(entry.kind)) shown.add(entry);
        }
        return shown;
    }

    // ------------------------------------------------------------------ the list

    /** The rows under the chips. */
    static final class Listing extends BaseAdapter {
        private final Context context;
        private final ScreenColors palette;
        List<Entry> all;
        List<Entry> shown;
        @Nullable String kind;
        @Nullable TextView emptyText;
        @Nullable Button clearButton;

        Listing(Context context, ScreenColors palette, List<Entry> entries) {
            this.context = context;
            this.palette = palette;
            this.all = entries;
            this.shown = entries;
        }

        /** Shows only [kind], or every kind when it's null. */
        void only(@Nullable String kind) {
            this.kind = kind;
            shown = RecentlyWatchedScreen.only(all, kind);
            showEmptyText();
            notifyDataSetChanged();
        }

        /** Shows [entries] in place of what was there, with the same chip picked. */
        void replace(List<Entry> entries) {
            all = entries;
            if (clearButton != null) clearButton.setEnabled(!entries.isEmpty());
            only(kind);
        }

        /** What the list says while it has no rows: nothing at all yet, or nothing of this kind. */
        String emptyMessage() {
            return all.isEmpty()
                    ? L10n.t("Nothing here yet. With Remember what you watch on, the reels, videos and stories you watch show up here.")
                    : L10n.t("Nothing of this kind yet.");
        }

        void showEmptyText() {
            if (emptyText != null) emptyText.setText(emptyMessage());
        }

        @Override
        public int getCount() {
            return shown.size();
        }

        @Override
        public Entry getItem(int position) {
            return shown.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, @Nullable View reused, ViewGroup parent) {
            LinearLayout row = reused instanceof LinearLayout ? (LinearLayout) reused : newRow();
            Entry entry = getItem(position);
            TextView title = (TextView) row.getChildAt(0);
            TextView detail = (TextView) row.getChildAt(1);
            TextView caption = (TextView) row.getChildAt(2);
            title.setText(title(entry));
            detail.setText(detail(entry, System.currentTimeMillis()));
            caption.setText(entry.caption == null ? "" : entry.caption);
            caption.setVisibility(entry.caption == null ? View.GONE : View.VISIBLE);
            return row;
        }

        private LinearLayout newRow() {
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.VERTICAL);
            row.setMinimumHeight(dp(context, 56));
            row.setPaddingRelative(dp(context, 24), dp(context, 10), dp(context, 24), dp(context, 10));
            TextView title = new TextView(context);
            title.setTextColor(palette.title);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            title.setMaxLines(1);
            title.setEllipsize(TextUtils.TruncateAt.END);
            row.addView(title);
            TextView detail = new TextView(context);
            detail.setTextColor(palette.summary);
            detail.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            row.addView(detail);
            TextView caption = new TextView(context);
            caption.setTextColor(palette.summary);
            caption.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            caption.setMaxLines(2);
            caption.setEllipsize(TextUtils.TruncateAt.END);
            row.addView(caption);
            return row;
        }
    }

    private static RadioButton chip(Context context, ScreenColors palette, String label) {
        RadioButton chip = new RadioButton(context);
        chip.setButtonDrawable(null);
        chip.setText(label);
        chip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        chip.setGravity(android.view.Gravity.CENTER);
        chip.setMinHeight(dp(context, 48));
        chip.setPaddingRelative(dp(context, 16), dp(context, 6), dp(context, 16), dp(context, 6));
        paintChip(chip, palette, false);
        return chip;
    }

    private static void paintChip(android.widget.CompoundButton chip, ScreenColors palette, boolean picked) {
        GradientDrawable surface = new GradientDrawable();
        surface.setCornerRadius(dp(chip.getContext(), 8));
        surface.setColor(picked ? palette.accent : Color.TRANSPARENT);
        surface.setStroke(dp(chip.getContext(), 1), picked ? palette.accent : palette.outline);
        android.graphics.drawable.InsetDrawable inset = new android.graphics.drawable.InsetDrawable(
                surface, 0, dp(chip.getContext(), 6), 0, dp(chip.getContext(), 6));
        chip.setBackground(inset);
        // The inset's padding replaced the chip's own, so it goes back on.
        chip.setPaddingRelative(dp(chip.getContext(), 16), dp(chip.getContext(), 6),
                dp(chip.getContext(), 16), dp(chip.getContext(), 6));
        chip.setTextColor(picked ? palette.onAccent : palette.title);
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }
}
