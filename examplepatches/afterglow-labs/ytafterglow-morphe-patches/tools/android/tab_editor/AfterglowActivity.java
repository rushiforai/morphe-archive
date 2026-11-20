package app.afterglow.extension.ui;

import android.app.Activity;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.util.Arrays;
import app.afterglow.extension.settings.TabStore;

/** Only the editor's application dependencies are fixtures; all views and dispatch are Android's. */
public final class AfterglowActivity extends Activity {
    FrameLayout root, layer;
    ScrollView scroll;
    LinearLayout content;
    TabEditorScreen screen;
    RowViews rowViews;
    Throwable dispatchFailure;
    private final Handler handler = new Handler();
    private boolean refreshPosted;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        rowViews = new RowViews(this);
        root = new FrameLayout(this);
        scroll = new ScrollView(this);
        content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(content, new ScrollView.LayoutParams(-1, -2));
        root.addView(scroll, new FrameLayout.LayoutParams(-1, -1));
        layer = new FrameLayout(this);
        root.addView(layer, new FrameLayout.LayoutParams(-1, -1));
        setContentView(root);
        prepare(11, "home", "subscriptions", "library", "afterglow");
    }

    @Override public boolean dispatchTouchEvent(MotionEvent event) {
        try { return super.dispatchTouchEvent(event); }
        catch (Throwable error) {
            // Preserve the actual framework/production exception for the report,
            // instead of letting the isolated probe process die without a result.
            dispatchFailure = error;
            return true;
        }
    }

    void prepare(int maximum, String... active) {
        content.removeAllViews();
        layer.removeAllViews();
        scroll.scrollTo(0, 0);
        scroll.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        TabStore.reset(maximum, Arrays.asList(active));
        screen = new TabEditorScreen(this);
        screen.build(content);
        dispatchFailure = null;
    }

    RowViews views() { return rowViews; }
    ScrollView scrollView() { return scroll; }
    FrameLayout overlay() { return layer; }
    void alert(String title, String text) {}

    void refresh() {
        if (refreshPosted) return;
        refreshPosted = true;
        handler.post(() -> {
            refreshPosted = false;
            if (screen.isBusy()) { handler.postDelayed(this::refresh, 25); return; }
            content.removeAllViews();
            screen.build(content);
        });
    }

    View row(String tag) { return content.findViewWithTag(tag); }
}

abstract class SettingsScreen {
    abstract String title();
    boolean isBusy() { return false; }
    boolean grouped() { return false; }
    abstract void build(LinearLayout content);
}

final class RowViews {
    static final int TINT = 0xffa366ff;
    final Activity context;
    final Palette palette = new Palette();
    RowViews(Activity context) { this.context = context; }
    int dp(int value) { return Math.round(value * context.getResources().getDisplayMetrics().density); }
    static final class Palette {
        int groupedCell = 0xfff4f4fa, groupedLabel = 0xff181820;
        int groupedSecondaryLabel = 0xff555560, groupedTertiaryLabel = 0xff777780;
    }
    TextView text(String value, int size, int color, boolean bold) {
        TextView view = new TextView(context);
        view.setText(value); view.setTextSize(size); view.setTextColor(color);
        return view;
    }
    View groupedHeader(String value) {
        TextView v = text(value, 17, palette.groupedLabel, false);
        v.setPadding(dp(16), dp(10), dp(16), dp(10));
        return v;
    }
    View groupedFooter(String value) {
        TextView v = text(value, 12, palette.groupedSecondaryLabel, false);
        v.setPadding(dp(16), dp(2), dp(16), dp(2));
        return v;
    }
    LinearLayout groupedCard() {
        LinearLayout view = new LinearLayout(context);
        view.setOrientation(LinearLayout.VERTICAL);
        view.setBackgroundColor(palette.groupedCell);
        return view;
    }
    LinearLayout.LayoutParams groupedCardParams() { return new LinearLayout.LayoutParams(-1, -2); }
    ColorDrawable groupedRowBackground(boolean separator, int start) { return new ColorDrawable(palette.groupedCell); }
}

final class TabIconDrawable extends ColorDrawable {
    TabIconDrawable(String symbol, int tint, int background, int size) { super(tint); }
}

final class SettingsSpec {
    static final String TAB_EDITOR_PAGE = "tabs";
    static final String[] TAB_IDS = {"home", "subscriptions", "library", "afterglow", "history", "watchlater", "posts", "messages", "shorts", "hype", "create"};
    static final Label TAB_SHOWN_HEADER = new Label("Shown tabs");
    static final Label TAB_HIDDEN_HEADER = new Label("Hidden tabs");
    static final Label TAB_SHOWN_SUBTITLE = new Label("Drag to reorder");
    static final Label TAB_HIDDEN_SUBTITLE = new Label("Drag to show");
    static final Label TAB_HIDDEN_FOOTER = new Label("Hidden tabs");
    static final String TAB_SHOWN_FOOTER_FORMAT = "Maximum %d tabs";
    static final class Label {
        final String value;
        Label(String value) { this.value = value; }
        String get() { return value; }
    }
}

final class SettingsBehavior {
    static final class Page { final SettingsSpec.Label navTitle = new SettingsSpec.Label("Customize tabs"); }
    static Page page(String id) { return new Page(); }
    static String tabName(String id) { return id; }
    static String tabSymbol(String id) { return id; }
}
