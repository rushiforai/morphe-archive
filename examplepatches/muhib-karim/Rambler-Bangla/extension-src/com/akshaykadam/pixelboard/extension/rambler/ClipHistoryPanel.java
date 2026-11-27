package com.akshaykadam.pixelboard.extension.rambler;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.ScrollView;
import android.widget.TextView;
import java.util.List;

/**
 * One reversible wrapper around the stock clip list: a Recent | History tab row on top, the untouched stock
 * RecyclerView (adapter, touch, drag and order hooks unchanged) inside a holder we own, and the History list.
 */
final class ClipHistoryPanel {
    private static final int PREVIEW_CHARS = 300;
    private static final int MENU_PIN = 1, MENU_UNPIN = 2, MENU_DELETE = 3;
    final View stock;
    boolean history;
    private final ViewGroup parent;
    private final int index;
    private final ViewGroup.LayoutParams originalParams;
    private final FrameLayout wrapper;
    private final FrameLayout stockHolder; // Gboard toggles the list's own visibility/alpha; we toggle this instead.
    private final LinearLayout tabs;
    private final ScrollView scroll;
    private final LinearLayout rows;
    private final TextView recentTab;
    private final TextView historyTab;
    private final int color;
    private boolean installed;
    private PopupMenu menu;

    ClipHistoryPanel(View stock) {
        this.stock = stock;
        parent = (ViewGroup) stock.getParent();
        if (parent == null || !parent.getClass().getName().equals("androidx.constraintlayout.widget.ConstraintLayout"))
            throw new IllegalArgumentException("Unexpected clipboard parent");
        index = parent.indexOfChild(stock);
        originalParams = stock.getLayoutParams();
        Context context = stock.getContext();
        color = textColor(parent);
        wrapper = new FrameLayout(context);
        wrapper.setId(View.generateViewId());
        wrapper.setSaveEnabled(false);
        stockHolder = new FrameLayout(context);
        stockHolder.setSaveEnabled(false);
        tabs = new LinearLayout(context);
        tabs.setGravity(Gravity.CENTER);
        tabs.setPadding(dp(8), dp(6), dp(8), dp(6));
        recentTab = tab("Recent");
        historyTab = tab("History");
        LinearLayout.LayoutParams first = new LinearLayout.LayoutParams(dp(104), dp(32));
        first.rightMargin = dp(8);
        tabs.addView(recentTab, first);
        tabs.addView(historyTab, new LinearLayout.LayoutParams(dp(104), dp(32)));
        rows = new LinearLayout(context);
        rows.setOrientation(LinearLayout.VERTICAL);
        rows.setPadding(dp(8), dp(4), dp(8), dp(8));
        scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        scroll.setSaveEnabled(false);
        scroll.addView(rows, new ScrollView.LayoutParams(-1, -2));
        scroll.setVisibility(View.GONE);
        recentTab.setOnClickListener(v -> guard(this::recent));
        historyTab.setOnClickListener(v -> guard(() -> {
            if (history) return;
            history = true;
            rows.removeAllViews();
            rows.addView(label("Loading history…"));
            stockHolder.setVisibility(View.INVISIBLE);
            scroll.scrollTo(0, 0);
            scroll.setVisibility(View.VISIBLE);
            selectTabs();
            GboardRamblerClipHistory.load(this);
        }));
    }

    boolean installed() { return installed; }

    void install() {
        try {
            parent.removeView(stock);
            installed = true; // Allows rollback after any subsequent addView failure.
            parent.addView(wrapper, index, originalParams);
            stockHolder.addView(stock, new FrameLayout.LayoutParams(-1, -1));
            wrapper.addView(stockHolder, below());
            wrapper.addView(scroll, below());
            wrapper.addView(tabs, new FrameLayout.LayoutParams(-1, dp(44), Gravity.TOP));
            recent();
        } catch (Throwable failure) { restore(); throw failure; }
    }

    void recent() {
        history = false;
        scroll.setVisibility(View.GONE);
        rows.removeAllViews();
        stockHolder.setVisibility(View.VISIBLE);
        selectTabs();
    }

    void showRows(List<String> clips, List<String> pinned, boolean canPin) {
        if (!installed || !history) return;
        rows.removeAllViews();
        if (clips.isEmpty()) rows.addView(label("No clipboard history yet"));
        for (String text : clips) {
            boolean isPinned = pinned.contains(text);
            String preview = text.length() > PREVIEW_CHARS ? text.substring(0, PREVIEW_CHARS) + "…" : text;
            TextView row = label(isPinned ? "📌 " + preview : preview);
            row.setMaxLines(3);
            row.setEllipsize(TextUtils.TruncateAt.END);
            row.setMinHeight(dp(48));
            row.setBackground(pill(isPinned ? 0x1c : 0x10));
            row.setContentDescription((isPinned ? "Pinned clip: " : "Clip: ") + preview);
            row.setOnClickListener(v -> guard(() -> GboardRamblerClipHistory.paste(text)));
            row.setOnLongClickListener(v -> {
                try {
                    if (menu != null) menu.dismiss();
                    PopupMenu menu = new PopupMenu(stock.getContext(), row);
                    this.menu = menu;
                    if (isPinned) menu.getMenu().add(Menu.NONE, MENU_UNPIN, Menu.NONE, "Unpin");
                    else if (canPin) menu.getMenu().add(Menu.NONE, MENU_PIN, Menu.NONE, "Pin");
                    menu.getMenu().add(Menu.NONE, MENU_DELETE, Menu.NONE, "Delete");
                    menu.setOnMenuItemClickListener(item -> {
                        int id = item.getItemId();
                        guard(() -> {
                            if (id == MENU_DELETE) GboardRamblerClipHistory.delete(text);
                            else GboardRamblerClipHistory.pin(text, id == MENU_PIN);
                        });
                        return true;
                    });
                    menu.show();
                    return true;
                } catch (Throwable ignored) { return false; }
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2);
            lp.bottomMargin = dp(4);
            rows.addView(row, lp);
        }
    }

    /** Puts the stock list back exactly where it was. Safe to call repeatedly. */
    void restore() {
        if (!installed) return;
        if (menu != null) { menu.dismiss(); menu = null; }
        // Keep installed true until restoration finishes, so a caller may retry after a failure.
        if (stock.getParent() == stockHolder) stockHolder.removeView(stock);
        if (wrapper.getParent() == parent) parent.removeView(wrapper);
        if (stock.getParent() == null) parent.addView(stock, Math.min(index, parent.getChildCount()), originalParams);
        installed = false;
        history = false;
        rows.removeAllViews();
    }

    private FrameLayout.LayoutParams below() {
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(-1, -1);
        params.topMargin = dp(44);
        return params;
    }

    private TextView label(String text) {
        TextView view = new TextView(stock.getContext());
        view.setText(text);
        view.setTextColor(color);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        view.setGravity(Gravity.CENTER_VERTICAL);
        view.setPadding(dp(12), dp(10), dp(12), dp(10));
        view.setSaveEnabled(false);
        return view;
    }

    private TextView tab(String text) {
        TextView view = label(text);
        view.setPadding(dp(10), 0, dp(10), 0);
        view.setGravity(Gravity.CENTER);
        view.setSingleLine(true);
        view.setFocusable(true);
        view.setContentDescription(text + " clipboard tab");
        return view;
    }

    private void selectTabs() {
        recentTab.setSelected(!history);
        historyTab.setSelected(history);
        recentTab.setTypeface(null, history ? Typeface.NORMAL : Typeface.BOLD);
        historyTab.setTypeface(null, history ? Typeface.BOLD : Typeface.NORMAL);
        recentTab.setBackground(pill(history ? 0x0a : 0x2a));
        historyTab.setBackground(pill(history ? 0x2a : 0x0a));
    }

    /** Tinted from the panel's own text colour, so it follows light, dark and custom themes. */
    private GradientDrawable pill(int alpha) {
        GradientDrawable background = new GradientDrawable();
        background.setCornerRadius(dp(16));
        background.setColor((color & 0xffffff) | (alpha << 24));
        return background;
    }

    private static int textColor(View view) {
        TextView found = findText(view);
        if (found != null) return found.getCurrentTextColor();
        TypedArray colors = view.getContext().obtainStyledAttributes(new int[] {android.R.attr.textColorPrimary});
        try {
            ColorStateList value = colors.getColorStateList(0);
            if (value == null) throw new IllegalStateException("No panel text color");
            return value.getDefaultColor();
        } finally { colors.recycle(); }
    }

    private static TextView findText(View view) {
        if (view instanceof TextView && view.getVisibility() == View.VISIBLE) return (TextView) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = findText(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private int dp(int value) { return Math.round(value * stock.getResources().getDisplayMetrics().density); }

    private void guard(Runnable action) {
        try { action.run(); } catch (Throwable ignored) { GboardRamblerClipHistory.closePanel(); }
    }
}
