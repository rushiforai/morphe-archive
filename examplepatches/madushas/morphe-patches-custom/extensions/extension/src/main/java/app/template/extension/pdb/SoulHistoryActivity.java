package app.template.extension.pdb;

import android.app.Activity;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import app.template.extension.BuildConfig;

/**
 * The native Soul history screen: every Soul profile you saw or liked, newest
 * first, straight from the local record the "Soul history" patch maintains
 * ({@link PdbUi} upsert log in the app's MMKV). Unlike the in-app rewind
 * sheet, this list is not bounded by the server's short feed window.
 *
 * <p>Rows are styled with the app's own resources (content_bg_r8 cards, the
 * gray_01/main palette) so the screen reads native. Per row: tap opens the
 * profile (pdb://u/{id}), the Chat pill opens a 1:1 chat when a channel exists
 * locally ({@link PdbTools#openChat} → pdb://chat/{type}:{id}), long-press
 * copies the id.
 */
public final class SoulHistoryActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            PdbMmkv.init(this);
            setContentView(buildScreen());
        } catch (Throwable t) {
            PdbTools.toast(this, "Soul history: " + t);
            finish();
        }
    }

    private View buildScreen() {
        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        int pad = PdbUi.dp(this, 16);
        page.setPadding(pad, PdbUi.dp(this, 12), pad, 0);
        page.setBackgroundColor(PdbUi.pageBg(this));

        TextView title = PdbUi.text(this, "Soul history", 22,
            null, PdbUi.mainText(this));
        title.setPadding(0, 0, 0, PdbUi.dp(this, 2));
        page.addView(title);

        TextView sub = PdbUi.text(this,
            "Local record \u00b7 newest first \u00b7 tap = profile \u00b7 "
                + "long-press = copy id",
            12, null, PdbUi.subText(this));
        sub.setPadding(0, 0, 0, PdbUi.dp(this, 6));
        page.addView(sub);

        LinearLayout list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);

        java.util.List<PdbUi.SoulRow> rows = PdbUi.soulHistory();
        if (rows.isEmpty()) {
            LinearLayout emptyCard = PdbUi.themedCard(this);
            emptyCard.setPadding(PdbUi.dp(this, 16), PdbUi.dp(this, 16),
                PdbUi.dp(this, 16), PdbUi.dp(this, 16));
            emptyCard.addView(PdbUi.text(this,
                "No history yet \u2014 swipe the Soul feed and come back.",
                14, null, PdbUi.subText(this)));
            list.addView(emptyCard, PdbUi.cardParams(this));
        }
        int shown = 0;
        for (final PdbUi.SoulRow r : rows) {
            if (shown++ >= 200) break;
            list.addView(row(r), PdbUi.cardParams(this));
        }

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.addView(list);
        page.addView(scroll, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        return page;
    }

    /** One card row: who + when, tap = profile, long-press = copy, Chat/Profile pill.
     *  Honest UX: the pill says "Chat" only when a local channel exists (checked on
     *  a worker thread); otherwise it says "Profile" and opens the profile — the
     *  same place you complete the chat via the app's own button. No dead ends. */
    private View row(final PdbUi.SoulRow r) {
        LinearLayout row = PdbUi.themedCard(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        int pad = PdbUi.dp(this, 14);
        row.setPadding(pad, PdbUi.dp(this, 10), PdbUi.dp(this, 10), PdbUi.dp(this, 10));

        LinearLayout textCol = new LinearLayout(this);
        textCol.setOrientation(LinearLayout.VERTICAL);

        TextView name = PdbUi.text(this,
            (r.action.equals("like") ? "\uD83E\uDDE1 " : "") + r.name,
            15, null, PdbUi.mainText(this));
        name.setTypeface(name.getTypeface(), r.action.equals("like")
            ? Typeface.BOLD : Typeface.NORMAL);
        textCol.addView(name);

        String when = android.text.format.DateUtils.getRelativeTimeSpanString(
            r.ts).toString();
        TextView meta = PdbUi.text(this,
            "#" + r.id + "  \u00b7  " + when, 12, null, PdbUi.subText(this));
        meta.setPadding(0, PdbUi.dp(this, 2), 0, 0);
        textCol.addView(meta);

        LinearLayout.LayoutParams tp = new LinearLayout.LayoutParams(
            0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        tp.rightMargin = PdbUi.dp(this, 10);
        row.addView(textCol, tp);

        final TextView chat = new TextView(this);
        chat.setText("Profile");
        chat.setTextSize(13);
        chat.setTypeface(chat.getTypeface(), Typeface.BOLD);
        chat.setTextColor(0xFFFFFFFF);
        chat.setPadding(PdbUi.dp(this, 18), PdbUi.dp(this, 8),
            PdbUi.dp(this, 18), PdbUi.dp(this, 8));
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(0xFF6C5CE7);
        pill.setCornerRadius(PdbUi.dp(this, 20));
        chat.setBackground(pill);
        final Runnable openChat = () -> PdbTools.openChat(this, r.id);
        final Runnable openProfile = () ->
            PdbNav.openLink(this, "pdb://pdb.app/u/" + r.id);
        chat.setOnClickListener(v -> {
            if ("Chat".contentEquals(chat.getText())) openChat.run();
            else openProfile.run();
        });
        row.addView(chat, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        // Resolve the channel off the UI thread, then label the pill honestly.
        PdbTools.DB_EXECUTOR.execute(() -> {
            boolean hasChannel = PdbDatabase.channelForUser(this, r.id) != null;
            if (hasChannel) {
                runOnUiThread(() -> chat.setText("Chat"));
            }
        });

        row.setOnClickListener(v -> PdbNav.openLink(this, "pdb://pdb.app/u/" + r.id));
        row.setOnLongClickListener(v -> {
            PdbTools.copyToClipboard(this, r.id);
            PdbTools.toast(this, "Copied " + r.id);
            return true;
        });
        return row;
    }
}
