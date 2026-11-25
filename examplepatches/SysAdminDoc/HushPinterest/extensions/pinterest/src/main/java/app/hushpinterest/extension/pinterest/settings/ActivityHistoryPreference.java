/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.preference.DialogPreference;
import android.text.format.DateFormat;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import app.hushpinterest.extension.pinterest.privacy.ActivityHistory;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * #48: the list Like and comment history keeps, newest first. A filter across the top shows
 * everything, only likes, or only comments and replies. A tap opens the pin in Pinterest, and
 * Clear empties the list at once with a toast to say so.
 */
@SuppressWarnings("deprecation")
public final class ActivityHistoryPreference extends DialogPreference {
    /** The most of a comment a row shows. The pin itself has all of it. */
    private static final int SHOWN_TEXT = 160;
    /** Marks a comment the row cut short. */
    private static final String CUT = "...";

    private Session session;

    public ActivityHistoryPreference(Context context) {
        super(HushPinterestPreferenceFragment.themed(context));
        setKey("action_like_comment_history");
        setPersistent(false);
        setTitle(L10n.t(context, "Your likes and comments"));
        setSummary(L10n.t(context, "See the pins you liked and commented on, newest first. The list keeps the newest 500."));
        setDialogTitle(getTitle());
        setNegativeButtonText(L10n.t(context, "Close"));
        setPositiveButtonText(L10n.t(context, "Clear"));
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        HushPinterestPreferenceFragment.showAllText(view);
        ScreenColors.row(view, this);
        view.setAccessibilityDelegate(new HushPinterestPreferenceFragment.RowSemantics(this, Button.class));
    }

    @Override protected View onCreateDialogView() {
        session = new Session();
        return session.content;
    }

    @Override protected void onBindDialogView(View view) {
        super.onBindDialogView(view);
        // DialogPreference hides the view with the message id when the row has no dialog message of
        // its own, and this screen's explanation is that view, which show() fills in.
        if (session != null) session.message.setVisibility(View.VISIBLE);
    }

    @Override protected void showDialog(Bundle state) {
        try {
            super.showDialog(state);
            Session opened = session;
            opened.dialog = (AlertDialog) getDialog();
            ScreenColors.dialog(opened.dialog);
            ScreenColors.controls(opened.filters);
            // Set after show so a tap clears the list and the screen stays open to show it empty.
            opened.dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> opened.clear());
            opened.show();
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.LIKE_COMMENT_HISTORY, "open like and comment history", failure);
            if (getDialog() != null) getDialog().dismiss();
            session = null;
            Utils.showToastLong(L10n.t(getContext(), "Couldn't open the list. Try again."));
        }
    }

    @Override protected void onDialogClosed(boolean positiveResult) {
        session = null;
        super.onDialogClosed(positiveResult);
    }

    @Override protected void onPrepareForRemoval() {
        onActivityDestroy();
        super.onPrepareForRemoval();
    }

    private String name(ActivityHistory.Entry entry) {
        return entry.title != null ? L10n.isolate(entry.title) : L10n.f(getContext(), "Pin %s", L10n.isolate(entry.pinId));
    }

    private String detail(ActivityHistory.Entry entry) {
        String what = L10n.t(getContext(), entry.kind == ActivityHistory.Kind.LIKE ? "Liked"
                : entry.kind == ActivityHistory.Kind.REPLY ? "Replied" : "Commented");
        Date when = new Date(entry.time);
        Context dated = L10n.localized(getContext());
        String time = DateFormat.getDateFormat(dated).format(when) + " " + DateFormat.getTimeFormat(dated).format(when);
        String said = entry.text;
        if (said != null && said.length() > SHOWN_TEXT) {
            int end = Character.isHighSurrogate(said.charAt(SHOWN_TEXT - 1)) ? SHOWN_TEXT - 1 : SHOWN_TEXT;
            said = said.substring(0, end) + CUT;
        }
        return what + "\n" + L10n.isolate(time) + (said == null ? "" : "\n" + L10n.isolate(said));
    }

    /** One open screen. A tap from a dismissed or replaced screen can't change its successor. */
    private final class Session {
        static final int ALL = 0;
        static final int LIKES = 1;
        static final int COMMENTS = 2;

        final LinearLayout content = new LinearLayout(getContext());
        final RadioGroup filters = new RadioGroup(getContext());
        final TextView message = new TextView(getContext());
        final ListView list = new ListView(getContext());
        List<ActivityHistory.Entry> shown = Collections.emptyList();
        int filter = ALL;
        AlertDialog dialog;

        Session() {
            content.setOrientation(LinearLayout.VERTICAL);
            filters.setOrientation(RadioGroup.HORIZONTAL);
            filters.setPaddingRelative(dp(ScreenColors.SIDE_DP), dp(8), dp(ScreenColors.SIDE_DP), 0);
            String[] labels = {L10n.t(getContext(), "All"), L10n.t(getContext(), "Likes"), L10n.t(getContext(), "Comments")};
            for (int i = 0; i < labels.length; i++) {
                RadioButton option = new RadioButton(getContext());
                option.setId(View.generateViewId());
                option.setTag(i);
                option.setText(labels[i]);
                option.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                option.setPaddingRelative(dp(4), 0, dp(12), 0);
                filters.addView(option, new RadioGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT));
                if (i == ALL) filters.check(option.getId());
            }
            filters.setOnCheckedChangeListener((group, checked) -> {
                View option = group.findViewById(checked);
                if (option == null || !(option.getTag() instanceof Integer)) return;
                filter = (Integer) option.getTag();
                show();
            });
            content.addView(filters, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            message.setId(android.R.id.message);
            message.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            message.setTextColor(ScreenColors.DEFAULT.summary);
            message.setSingleLine(false);
            message.setMaxLines(Integer.MAX_VALUE);
            message.setEllipsize(null);
            message.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG);
            message.setLineSpacing(dp(2), 1);
            message.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            messageStyle(true);
            content.addView(message, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            list.setId(android.R.id.list);
            list.setDivider(null);
            list.setSelector(new ColorDrawable(Color.TRANSPARENT));
            list.setVisibility(View.GONE);
            // The list scrolls inside the screen, so Close and Clear stay in reach however long it is.
            int height = Math.min(dp(320), getContext().getResources().getDisplayMetrics().heightPixels / 3);
            content.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
            list.setOnItemClickListener((parent, view, position, id) -> {
                if (alive() && position >= 0 && position < shown.size()) open(shown.get(position));
            });
        }

        boolean alive() { return session == this && dialog != null && dialog.isShowing(); }

        void messageStyle(boolean empty) {
            int inset = dp(ScreenColors.SIDE_DP);
            int vertical = dp(empty ? 24 : 12);
            message.setPaddingRelative(inset, vertical, inset, vertical);
            message.setMinHeight(empty ? dp(144) : 0);
            message.setGravity(empty ? Gravity.CENTER : Gravity.START | Gravity.CENTER_VERTICAL);
            message.setTextAlignment(empty ? View.TEXT_ALIGNMENT_CENTER : View.TEXT_ALIGNMENT_VIEW_START);
        }

        /** Reads the list again and shows what the filter lets through. */
        void show() {
            if (!alive()) return;
            List<ActivityHistory.Entry> all = ActivityHistory.entries(getContext());
            Button clear = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
            if (all == null) {
                shown = Collections.emptyList();
                list.setAdapter(null);
                list.setVisibility(View.GONE);
                messageStyle(true);
                message.setText(L10n.t(getContext(), "Couldn't open the list. Try again."));
                if (clear != null) clear.setEnabled(true);
                return;
            }
            List<ActivityHistory.Entry> kept = new ArrayList<>();
            for (ActivityHistory.Entry entry : all) {
                boolean like = entry.kind == ActivityHistory.Kind.LIKE;
                if (filter == ALL || (filter == LIKES) == like) kept.add(entry);
            }
            shown = kept;
            CharSequence[] names = new CharSequence[kept.size()];
            CharSequence[] details = new CharSequence[kept.size()];
            boolean[] opens = new boolean[kept.size()];
            for (int i = 0; i < kept.size(); i++) {
                names[i] = name(kept.get(i));
                details[i] = detail(kept.get(i));
                opens[i] = true;
            }
            list.setAdapter(new ChoiceCards(ScreenColors.DEFAULT, names, details, opens));
            list.setVisibility(kept.isEmpty() ? View.GONE : View.VISIBLE);
            messageStyle(kept.isEmpty());
            message.setText(kept.isEmpty() ? emptyText() : L10n.quantity(getContext(), kept.size(),
                    "One entry. Tap it to open its pin.", "%1$d entries, newest first. Tap one to open its pin."));
            if (clear != null) clear.setEnabled(!all.isEmpty());
        }

        String emptyText() {
            if (filter == LIKES) return L10n.t(getContext(), "No likes in the list.");
            if (filter == COMMENTS) return L10n.t(getContext(), "No comments in the list.");
            return L10n.t(getContext(), Settings.LIKE_COMMENT_HISTORY.savedValue()
                    ? "Nothing here yet. Pins you like and comments you post show up here."
                    : "Nothing here yet. Turn on Like and comment history to start a list.");
        }

        void open(ActivityHistory.Entry entry) {
            Context context = getContext();
            try {
                context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(entry.pinUrl()))
                        .addCategory(Intent.CATEGORY_BROWSABLE).setPackage(context.getPackageName())
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            } catch (RuntimeException failure) {
                HookStatus.threw(FamilyNames.LIKE_COMMENT_HISTORY, "open a pin from the history", failure);
                Utils.showToastLong(L10n.t(context, "Couldn't open this pin."));
            }
        }

        void clear() {
            if (!alive()) return;
            if (ActivityHistory.clear(getContext())) {
                Utils.showToastShort(L10n.t(getContext(), "Cleared your likes and comments."));
            } else {
                Utils.showToastLong(L10n.t(getContext(), "Couldn't clear the list. Try again."));
            }
            show();
        }

        int dp(int value) {
            return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                    getContext().getResources().getDisplayMetrics()));
        }
    }
}
