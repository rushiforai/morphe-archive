package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import app.morphe.extension.sabp.EppyTheme;

/**
 * A full screen pushed over the current tab (History, Statistics, Characters, Diagnostics...).
 * Pages live on one back stack in EppyActivity: Back pops the top page, so every native screen
 * returns to where the user came from instead of dropping into a classic SABP screen.
 *
 * <p>A page is identified by a key (+ optional argument) so the activity can rebuild the stack
 * after rotation or a theme change without each page saving its own views.
 */
public abstract class Page {
    protected final Host host;
    protected final Context c;
    protected final EppyTheme t;
    public final LinearLayout root;
    protected final LinearLayout actions;
    protected final LinearLayout body;
    protected final ScrollView scroll;
    public final String key;
    public final String arg;

    protected Page(Host host, String key, String arg, String title, boolean scrolls) {
        this.host = host;
        this.c = host.activity();
        this.t = host.theme();
        this.key = key;
        this.arg = arg;
        root = Ui.column(c);
        root.setBackground(t.background());
        root.setClickable(true); // don't let touches fall through to the tab underneath

        LinearLayout bar = Ui.row(c);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(Ui.dp(c, 4), Ui.dp(c, 4), Ui.dp(c, 8), Ui.dp(c, 4));
        bar.addView(Ui.iconButton(c, t, EppyIcon.BACK, t.onSurface, 0, "Back", v -> host.popPage()),
                new LinearLayout.LayoutParams(Ui.dp(c, 48), Ui.dp(c, 48)));
        TextView h = Ui.singleLine(Ui.label(c, t, title, 22, 600, t.onSurface));
        h.setAccessibilityHeading(true);
        h.setPadding(Ui.dp(c, 4), 0, 0, 0);
        bar.addView(h, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        actions = Ui.row(c);
        actions.setGravity(Gravity.CENTER_VERTICAL);
        bar.addView(actions);
        root.addView(bar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(c, 64)));

        body = Ui.column(c);
        if (scrolls) {
            scroll = new ScrollView(c);
            scroll.setFillViewport(true);
            scroll.setClipToPadding(false);
            scroll.addView(body, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            body.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), Ui.dp(c, 24));
            root.addView(scroll, Ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        } else {
            scroll = null;
            root.addView(body, Ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        }
    }

    /** Space the activity keeps clear at the bottom (mini-player + navigation + system bar). */
    public void setBottomInset(int px) {
        View target = scroll != null ? scroll : body;
        target.setPadding(target.getPaddingLeft(), target.getPaddingTop(), target.getPaddingRight(), px);
        if (scroll != null) ((View) scroll).setPadding(0, 0, 0, px);
    }

    /** Back pressed while this page is on top; return true if handled inside the page. */
    public boolean onBack() {
        return false;
    }

    /** Called about once a second while visible. */
    public void tick() {
    }

    public void onRemoved() {
    }

    // ---- small builders shared by pages ------------------------------------------------------

    protected TextView sectionTitle(String s) {
        TextView tv = Ui.text(c, t, s, 14, 600, t.primary);
        tv.setAccessibilityHeading(true);
        tv.setPadding(Ui.dp(c, 4), Ui.dp(c, 20), 0, Ui.dp(c, 8));
        body.addView(tv);
        return tv;
    }

    protected LinearLayout card() {
        LinearLayout box = Ui.column(c);
        box.setBackground(Ui.rounded(t.surfaceContainer, Ui.dp(c, 24)));
        box.setPadding(0, Ui.dp(c, 8), 0, Ui.dp(c, 8));
        body.addView(box, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return box;
    }

    protected TextView note(ViewGroup parent, String s) {
        TextView tv = Ui.text(c, t, s, 13, 400, t.onSurfaceVariant);
        tv.setPadding(Ui.dp(c, 16), Ui.dp(c, 6), Ui.dp(c, 16), Ui.dp(c, 6));
        parent.addView(tv);
        return tv;
    }

    /** A settings row with a switch; the whole row toggles. */
    protected View switchRow(String title, String summary, boolean value, android.widget.CompoundButton.OnCheckedChangeListener l) {
        return Ui.switchRow(c, t, title, summary, value, l);
    }

    /** A tappable row with an icon, title and summary. */
    protected View linkRow(int icon, String title, String summary, View.OnClickListener l) {
        return Ui.linkRow(c, t, icon, title, summary, l);
    }

    /** Empty / error state: icon, headline, explanation and an optional action. */
    protected View emptyState(int icon, String headline, String text, String actionLabel, View.OnClickListener action) {
        LinearLayout col = Ui.column(c);
        col.setGravity(Gravity.CENTER_HORIZONTAL);
        col.setPadding(Ui.dp(c, 24), Ui.dp(c, 48), Ui.dp(c, 24), Ui.dp(c, 24));
        android.widget.ImageView iv = new android.widget.ImageView(c);
        iv.setImageDrawable(new EppyIcon(icon, t.onSurfaceVariant));
        col.addView(iv, new LinearLayout.LayoutParams(Ui.dp(c, 48), Ui.dp(c, 48)));
        TextView h = Ui.text(c, t, headline, 18, 600, t.onSurface);
        h.setGravity(Gravity.CENTER);
        h.setPadding(0, Ui.dp(c, 16), 0, Ui.dp(c, 8));
        col.addView(h);
        TextView b = Ui.text(c, t, text, 14, 400, t.onSurfaceVariant);
        b.setGravity(Gravity.CENTER);
        col.addView(b);
        if (actionLabel != null && action != null) {
            TextView btn = Ui.filledButton(c, t, actionLabel, action);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, Ui.dp(c, 48));
            lp.topMargin = Ui.dp(c, 20);
            col.addView(btn, lp);
        }
        return col;
    }
}
