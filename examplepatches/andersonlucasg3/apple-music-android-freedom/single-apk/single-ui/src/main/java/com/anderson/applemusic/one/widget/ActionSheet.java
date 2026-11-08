package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.anderson.applemusic.one.media.MediaClient;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;

import java.util.List;

/**
 * Centred actions sheet: 56 dp rows for the session's {@code customActions}, a bullet per
 * action (accent for "Criar Estação"), a feedback line and a close pill. Replaces the
 * stock {@code AlertDialog} list so actions look like the companions' sheet.
 */
public final class ActionSheet extends FrameLayout {

    public interface Listener {
        void onAction(MediaClient.Action action);

        void onClose();
    }

    private static final String STATION = "CREATE_STATION";

    private final LinearLayout panel;
    private final LinearLayout rows;
    private final ScrollView scroll;
    private final TextView title;
    private final TextView subtitle;
    private final TextView feedback;

    public ActionSheet(Context context) {
        super(context);
        setBackgroundColor(0xD9000000);
        setClickable(true);
        setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                hide();
            }
        });

        panel = new LinearLayout(context);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setPadding(Tokens.dp(24), Tokens.dp(10), Tokens.dp(24), Tokens.dp(18));
        panel.setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_SHEET));
        panel.setClickable(true);
        Shapes.clip(panel, Tokens.RADIUS_SHEET);

        View grabber = new View(context);
        grabber.setBackground(Shapes.rounded(Tokens.TRACK, 2f));
        LinearLayout.LayoutParams grabberParams =
                new LinearLayout.LayoutParams(Tokens.dp(40), Tokens.dp(4));
        grabberParams.gravity = Gravity.CENTER_HORIZONTAL;
        grabberParams.topMargin = Tokens.dp(4);
        grabberParams.bottomMargin = Tokens.dp(18);
        panel.addView(grabber, grabberParams);

        title = Inter.text(context, "Ações", Tokens.SECTION, Inter.BOLD, Tokens.TEXT);
        panel.addView(title);

        subtitle = Inter.text(context, "", 13f, Inter.REGULAR, Tokens.TEXT_DIM);
        subtitle.setMaxLines(1);
        subtitle.setEllipsize(TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams subtitleParams = new LinearLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        subtitleParams.topMargin = Tokens.dp(4);
        subtitleParams.bottomMargin = Tokens.dp(12);
        panel.addView(subtitle, subtitleParams);

        scroll = new ScrollView(context);
        scroll.setVerticalScrollBarEnabled(false);
        rows = new LinearLayout(context);
        rows.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(rows);
        LinearLayout.LayoutParams scrollParams = new LinearLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        panel.addView(scroll, scrollParams);

        feedback = Inter.text(context, "", Tokens.CAPTION, Inter.MEDIUM, Tokens.TEXT_DIM);
        feedback.setMinHeight(Tokens.dp(18));
        LinearLayout.LayoutParams feedbackParams = new LinearLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        feedbackParams.topMargin = Tokens.dp(10);
        panel.addView(feedback, feedbackParams);

        TextView close = Inter.text(context, "Fechar", 13f, Inter.SEMIBOLD, Tokens.TEXT_DIM);
        close.setGravity(Gravity.CENTER);
        close.setPadding(Tokens.dp(18), Tokens.dp(12), Tokens.dp(18), Tokens.dp(12));
        close.setMinimumHeight(Tokens.dp(48));
        Focus.attach(close, Tokens.RADIUS_PILL, 0x00000000, Tokens.SURFACE_HOVER, null);
        close.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                hide();
            }
        });
        LinearLayout.LayoutParams closeParams = new LinearLayout.LayoutParams(
                LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        closeParams.gravity = Gravity.CENTER_HORIZONTAL;
        closeParams.topMargin = Tokens.dp(6);
        panel.addView(close, closeParams);

        int width = Math.min(Tokens.dp(560), Math.round(Tokens.screenWidth() * 0.86f));
        FrameLayout.LayoutParams panelParams = new FrameLayout.LayoutParams(
                width, LayoutParams.WRAP_CONTENT, Gravity.CENTER);
        addView(panel, panelParams);

        setVisibility(GONE);
    }

    public void show(String heading, String detail, List<MediaClient.Action> actions,
                     final Listener listener) {
        title.setText(heading);
        subtitle.setText(detail == null ? "" : detail);
        feedback.setText("");
        rows.removeAllViews();
        int limit = Math.min(8, actions.size());
        for (int i = 0; i < limit; i++) {
            final MediaClient.Action action = actions.get(i);
            rows.addView(actionRow(action, listener));
        }
        if (actions.size() > limit) {
            TextView more = Inter.text(getContext(),
                    "+" + (actions.size() - limit) + " ações", Tokens.CAPTION,
                    Inter.REGULAR, Tokens.TEXT_DIM);
            LinearLayout.LayoutParams moreParams = new LinearLayout.LayoutParams(
                    LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
            moreParams.topMargin = Tokens.dp(8);
            rows.addView(more, moreParams);
        }
        setVisibility(VISIBLE);
        setAlpha(0f);
        animate().alpha(1f).setDuration(140L).start();
        View first = rows.getChildAt(0);
        if (first != null) first.requestFocus();
        setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                listener.onClose();
            }
        });
        panel.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                // Consume: taps inside the sheet must not close it.
            }
        });
    }

    private View actionRow(final MediaClient.Action action, final Listener listener) {
        LinearLayout row = new LinearLayout(getContext());
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(Tokens.dp(10), 0, Tokens.dp(10), 0);
        row.setMinimumHeight(Tokens.dp(56));

        boolean station = action.action.endsWith(STATION);
        View bullet = new View(getContext());
        bullet.setBackground(Shapes.circle(station ? Tokens.ACCENT : Tokens.TEXT_DIM));
        LinearLayout.LayoutParams bulletParams =
                new LinearLayout.LayoutParams(Tokens.dp(6), Tokens.dp(6));
        bulletParams.rightMargin = Tokens.dp(14);
        row.addView(bullet, bulletParams);

        TextView label = Inter.text(getContext(),
                action.title.length() > 0 ? action.title : action.action,
                Tokens.BODY, Inter.MEDIUM, station ? Tokens.ACCENT : Tokens.TEXT);
        label.setSingleLine(true);
        label.setEllipsize(TextUtils.TruncateAt.END);
        row.addView(label, new LinearLayout.LayoutParams(0,
                LayoutParams.WRAP_CONTENT, 1f));

        final IconView check = new IconView(getContext(), Icons.CHECK, Tokens.ACCENT);
        check.setVisibility(View.INVISIBLE);
        row.addView(check, new LinearLayout.LayoutParams(Tokens.dp(18), Tokens.dp(18)));

        Focus.attach(row, 12f, 0x00000000, Tokens.SURFACE_HOVER, null);
        row.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                check.setVisibility(View.VISIBLE);
                listener.onAction(action);
            }
        });
        return row;
    }

    public void setFeedback(String message) {
        feedback.setTextColor(Tokens.ACCENT);
        feedback.setText(message);
    }

    public void hide() {
        setVisibility(GONE);
    }

    public boolean isOpen() {
        return getVisibility() == VISIBLE;
    }
}
