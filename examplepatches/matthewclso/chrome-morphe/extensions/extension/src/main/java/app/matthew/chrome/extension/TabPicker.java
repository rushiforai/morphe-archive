package app.matthew.chrome.extension;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Configuration;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.WeakHashMap;

/** An in-memory view of the current native model, inside Chrome's captured toolbar. */
public final class TabPicker {
    private static final WeakHashMap<Activity, WeakReference<TabPicker>> instances = new WeakHashMap<>();
    private static long revision;
    private final Activity activity;
    private final View toolbar;
    private final ViewGroup host;
    private final HorizontalScrollView scroll;
    private final LinearLayout tabs;
    private final ArrayList<Cell> cells = new ArrayList<>();
    private final ViewTreeObserver.OnPreDrawListener listener = this::update;
    private Object model;
    private long renderedRevision = -1;
    private int count = -1, selected = -1, lastMargin = Integer.MIN_VALUE, addedMargin;
    private boolean paused, shown, dark, privateMode;
    private View hairline;
    private int hairlineVisibility = -1;
    private Object pendingCloseModel;
    private int pendingCloseId;
    private long pendingCloseDeadline;

    private TabPicker(Activity activity, View toolbar, ViewGroup host) {
        this.activity = activity; this.toolbar = toolbar; this.host = host;
        scroll = new HorizontalScrollView(toolbar.getContext()) {
            @Override public boolean dispatchTouchEvent(android.view.MotionEvent event) {
                // Capture the down event even when a tab/close child receives the tap.
                // Otherwise Chrome's toolbar swipe handler switches pages instead of
                // allowing HorizontalScrollView to reveal off-screen tab buttons.
                if (event.getActionMasked() == android.view.MotionEvent.ACTION_DOWN)
                    getParent().requestDisallowInterceptTouchEvent(true);
                return super.dispatchTouchEvent(event);
            }
        };
        scroll.setTag("morphe.tab_picker");
        scroll.setHorizontalScrollBarEnabled(false);
        scroll.setOverScrollMode(View.OVER_SCROLL_NEVER);
        scroll.setFillViewport(false);
        scroll.setVisibility(View.GONE);
        tabs = new LinearLayout(toolbar.getContext());
        tabs.setGravity(Gravity.CENTER_VERTICAL);
        tabs.setPaddingRelative(dp(4), 0, dp(4), 0);
        scroll.addView(tabs, new ViewGroup.LayoutParams(-2, -1));
        host.addView(scroll, 0, new ViewGroup.LayoutParams(-1, dp(48)));
        toolbar.getViewTreeObserver().addOnPreDrawListener(listener);
        toolbar.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override public void onViewAttachedToWindow(View v) {
                v.getViewTreeObserver().removeOnPreDrawListener(listener);
                v.getViewTreeObserver().addOnPreDrawListener(listener);
            }
            @Override public void onViewDetachedFromWindow(View v) {
                if (v.getViewTreeObserver().isAlive()) v.getViewTreeObserver().removeOnPreDrawListener(listener);
                clear();
            }
        });
    }

    public static void install(View toolbar) {
        toolbar.post(() -> {
            Activity activity = activity(toolbar.getContext());
            if (activity == null || !activity.getClass().getName().equals(
                    "org.chromium.chrome.browser.ChromeTabbedActivity")) return;
            if (!(toolbar.getParent() instanceof ViewGroup)) return;
            ViewGroup host = (ViewGroup) toolbar.getParent();
            if (!host.getClass().getName().endsWith("ToolbarControlContainer$ToolbarViewResourceCoordinatorLayout")) return;
            if (host.findViewWithTag("morphe.tab_picker") != null) return;
            instances.put(activity, new WeakReference<>(new TabPicker(activity, toolbar, host)));
        });
    }

    public static void changed() { revision++; }
    private static TabPicker get(Activity activity) {
        WeakReference<TabPicker> ref = instances.get(activity);
        return ref == null ? null : ref.get();
    }
    public static void resume(Activity activity) {
        TabPicker picker = get(activity);
        if (picker != null) { picker.paused = false; picker.toolbar.invalidate(); }
    }
    public static void pause(Activity activity) {
        TabPicker picker = get(activity);
        if (picker != null) { picker.paused = true; picker.pendingCloseModel = null; picker.hide(); }
    }
    public static void destroy(Activity activity) {
        TabPicker picker = get(activity);
        if (picker != null) {
            if (picker.toolbar.getViewTreeObserver().isAlive())
                picker.toolbar.getViewTreeObserver().removeOnPreDrawListener(picker.listener);
            picker.clear();
            picker.pendingCloseModel = null;
        }
        instances.remove(activity);
    }

    /** Called immediately before native container measurement; its size supplier reserves content space. */
    public static void beforeMeasure(View container) {
        Activity activity = activity(container.getContext());
        TabPicker picker = get(activity);
        if (picker != null) picker.applyMargin();
    }
    private void applyMargin() {
        if (!(toolbar.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) toolbar.getLayoutParams();
        int base = lp.topMargin == lastMargin ? lp.topMargin - addedMargin : lp.topMargin;
        addedMargin = shown ? dp(48) : 0;
        lp.topMargin = lastMargin = base + addedMargin;
    }

    private boolean allowed() {
        if (paused || activity.isFinishing() || !activity.hasWindowFocus()
                || !PatchSettings.trueBottom() || !PatchSettings.enabled(PatchSettings.TAB_PICKER)
                || !NativeBridge.tabsReady(activity)
                || NativeBridge.hubPane(activity) >= 0 || NativeBridge.pickerLocked(activity)) return false;
        View url = toolbar.findViewById(id("url_bar"));
        if (url != null && url.hasFocus()) return false;
        // Chrome hides the Android toolbar while scrolling its captured texture. Keep the
        // measured row in that texture so the native controls offset includes its full height.
        // The controller can temporarily move the toolbar to the top (e.g. Find in page).
        View container = toolbar.getRootView().findViewById(id("control_container"));
        return container != null && NativeBridge.pickerAtBottom(container);
    }

    private boolean update() {
        try {
            finishPendingClose();
            if (!allowed()) { hide(); return true; }
            Object current = NativeBridge.pickerModel(activity);
            int currentCount = NativeBridge.pickerCount(current);
            int currentIndex = NativeBridge.pickerIndex(current);
            if (currentCount == 0 || currentIndex < 0) { hide(); return true; }
            boolean incognito = NativeBridge.isIncognito(activity);
            if (current != model || incognito != privateMode) {
                clear(); model = current; privateMode = incognito;
            }
            if (revision != renderedRevision || currentCount != count || currentIndex != selected) {
                render(currentCount, currentIndex);
            }
            if (!shown) {
                shown = true; scroll.setVisibility(View.VISIBLE);
                hideDivider(true);
                host.requestLayout();
                return false; // Measure the reserved row before drawing the first visible frame.
            }
            hideDivider(true);
        } catch (RuntimeException ignored) {
            // Native restoration or teardown can temporarily remove the model.
            hide();
        }
        return true;
    }

    private void hide() {
        if (shown) { shown = false; scroll.setVisibility(View.GONE); host.requestLayout(); }
        hideDivider(false);
        clear();
    }
    private void hideDivider(boolean hidden) {
        if (hairline == null) hairline = toolbar.getRootView().findViewById(id("toolbar_hairline"));
        if (hairline == null) return;
        if (hidden) {
            if (hairlineVisibility == -1) hairlineVisibility = hairline.getVisibility();
            hairline.setVisibility(View.INVISIBLE);
        } else if (hairlineVisibility != -1) {
            if (hairline.getVisibility() == View.INVISIBLE) hairline.setVisibility(hairlineVisibility);
            hairlineVisibility = -1;
        }
    }
    private void clear() {
        if (!cells.isEmpty()) { tabs.removeAllViews(); cells.clear(); }
        model = null; count = selected = -1; renderedRevision = -1;
    }

    private void render(int newCount, int newIndex) {
        dark = privateMode || NativeBridge.themeSetting() == 2 || (NativeBridge.themeSetting() == 0
                && (toolbar.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES);
        boolean black = dark && PatchSettings.enabled(PatchSettings.BLACK);
        int background = dark ? (black ? Color.BLACK : Color.rgb(32, 33, 36)) : Color.rgb(241, 243, 244);
        int foreground = dark ? Color.rgb(232, 234, 237) : Color.rgb(32, 33, 36);
        int accent = dark ? Color.rgb(168, 199, 250) : Color.rgb(26, 115, 232);
        scroll.setBackgroundColor(background);
        while (cells.size() > newCount) { tabs.removeViewAt(cells.size() - 1); cells.remove(cells.size() - 1); }
        while (cells.size() < newCount) { Cell cell = new Cell(); cells.add(cell); tabs.addView(cell.row); }
        for (int i = 0; i < newCount; i++) {
            Object tab = NativeBridge.pickerTab(model, i);
            Cell cell = cells.get(i);
            cell.tabId = NativeBridge.pickerId(tab);
            String title = NativeBridge.pickerTitle(tab);
            if (TextUtils.isEmpty(title)) title = privateMode ? "Incognito tab" : "New tab";
            cell.title.setText(title); cell.title.setTextColor(foreground);
            cell.choose.setContentDescription("Tab: " + title);
            cell.choose.setTooltipText(title);
            cell.choose.setSelected(i == newIndex);
            cell.choose.setStateDescription(i == newIndex ? "Active tab" : null);
            cell.close.setContentDescription("Close tab: " + title); cell.close.setTextColor(foreground);
            Bitmap bitmap = NativeBridge.pickerIcon(tab);
            if (bitmap != null) {
                cell.icon.setImageTintList(null); cell.icon.setImageBitmap(bitmap);
            } else {
                cell.icon.setImageResource(android.R.drawable.ic_menu_compass);
                cell.icon.setImageTintList(ColorStateList.valueOf(foreground));
            }
            GradientDrawable shape = new GradientDrawable();
            shape.setCornerRadius(dp(10));
            shape.setColor(i == newIndex ? (dark ? (black ? Color.BLACK : Color.rgb(53, 57, 64)) : Color.WHITE) : background);
            if (i == newIndex) shape.setStroke(dp(1), accent);
            cell.row.setBackground(new InsetDrawable(shape, 0, dp(6), 0, dp(6)));
            cell.row.setPadding(0, 0, 0, 0); // Inset only the outline, not the 48dp touch targets.
        }
        boolean selectionChanged = selected != newIndex || count != newCount;
        count = newCount; selected = newIndex; renderedRevision = revision;
        if (selectionChanged) scroll.post(() -> {
            if (selected < 0 || selected >= cells.size()) return;
            View cell = cells.get(selected).row;
            int start = cell.getLeft(), end = cell.getRight(), offset = scroll.getScrollX();
            if (start < offset || end > offset + scroll.getWidth())
                scroll.smoothScrollTo(Math.max(0, start - (scroll.getWidth() - cell.getWidth()) / 2), 0);
        });
    }

    private final class Cell {
        final LinearLayout row = new LinearLayout(toolbar.getContext());
        final LinearLayout choose = new LinearLayout(toolbar.getContext());
        final ImageView icon = new ImageView(toolbar.getContext());
        final TextView title = new TextView(toolbar.getContext());
        final Button close = new Button(toolbar.getContext());
        int tabId;
        Cell() {
            LinearLayout.LayoutParams rp = new LinearLayout.LayoutParams(dp(192), dp(48));
            rp.setMarginEnd(dp(4)); row.setLayoutParams(rp); row.setGravity(Gravity.CENTER_VERTICAL);
            choose.setGravity(Gravity.CENTER_VERTICAL); choose.setPaddingRelative(dp(10), 0, 0, 0);
            choose.setClickable(true); choose.setFocusable(true);
            // Samsung's RippleDrawable adds an underline for selected views. Keep the
            // accessibility selection state while drawing only our inset active outline.
            StateListDrawable feedback = new StateListDrawable();
            feedback.addState(new int[]{android.R.attr.state_pressed}, new ColorDrawable(0x33808080));
            feedback.addState(new int[]{android.R.attr.state_focused}, new ColorDrawable(0x33808080));
            feedback.addState(new int[]{}, new ColorDrawable(Color.TRANSPARENT));
            choose.setBackground(feedback);
            icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            choose.addView(icon, new LinearLayout.LayoutParams(dp(20), dp(20)));
            title.setSingleLine(true); title.setEllipsize(TextUtils.TruncateAt.END); title.setTextSize(13);
            title.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            LinearLayout.LayoutParams tp = new LinearLayout.LayoutParams(0, -2, 1); tp.setMarginStart(dp(8));
            choose.addView(title, tp); row.addView(choose, new LinearLayout.LayoutParams(0, -1, 1));
            close.setText("×"); close.setTextSize(24); close.setPadding(0, 0, 0, 0);
            close.setMinWidth(0); close.setMinimumWidth(0); close.setMinHeight(0); close.setMinimumHeight(0);
            close.setBackground(new RippleDrawable(ColorStateList.valueOf(0x33808080), null, null));
            row.addView(close, new LinearLayout.LayoutParams(dp(48), -1));
            choose.setOnClickListener(v -> act(false)); close.setOnClickListener(v -> act(true));
        }
        private void act(boolean closing) {
            if (!allowed() || model == null || model != NativeBridge.pickerModel(activity)) return;
            // Resolve by ID in the current model at click time; indices can change underneath a cell.
            if (closing && privateMode && NativeBridge.pickerCount(model) == 1) {
                // Focus Chrome's private viewer before ending the last private session.
                // The existing empty-pane hook can then retain that viewer normally.
                View switcher = toolbar.findViewById(id("tab_switcher_button"));
                if (switcher == null) return;
                pendingCloseModel = model; pendingCloseId = tabId;
                pendingCloseDeadline = android.os.SystemClock.uptimeMillis() + 2000;
                if (!switcher.performClick()) pendingCloseModel = null;
            } else if (closing) NativeBridge.pickerClose(model, tabId);
            else NativeBridge.pickerSelect(model, tabId);
            changed(); toolbar.invalidate();
        }
    }
    private void finishPendingClose() {
        if (pendingCloseModel == null) return;
        if (paused || activity.isFinishing() || !activity.hasWindowFocus()
                || android.os.SystemClock.uptimeMillis() > pendingCloseDeadline
                || NativeBridge.pickerModel(activity) != pendingCloseModel
                || NativeBridge.pickerLocked(activity)) {
            pendingCloseModel = null;
            return;
        }
        if (NativeBridge.hubPane(activity) == 1) {
            Object closingModel = pendingCloseModel;
            pendingCloseModel = null;
            NativeBridge.pickerClose(closingModel, pendingCloseId);
            changed();
        }
    }
    private int id(String name) { return toolbar.getResources().getIdentifier(name, "id", activity.getPackageName()); }
    private int dp(int value) { return Math.round(value * toolbar.getResources().getDisplayMetrics().density); }
    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            Context next = ((ContextWrapper) context).getBaseContext();
            if (next == context) break;
            context = next;
        }
        return null;
    }
}
