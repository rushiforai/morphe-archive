package app.afterglow.extension.ui;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import app.afterglow.extension.i18n.L10n;
import app.afterglow.extension.navigation.NativeTabs;
import app.afterglow.extension.settings.TabStore;

/**
 * "Customize Tabs": the iOS YTAGTabBarEditorController (Settings.x:1118-1312).
 * Two sections, Shown tabs and Hidden tabs, every row with a drag handle.
 * Tapping a shown tab moves it to the top of Hidden; tapping a hidden tab
 * appends it to Shown. At least two tabs stay shown and at most
 * {@link TabStore#maximumActiveTabs()} (11 with the bonus row, else 6).
 * Every change is saved immediately through {@link TabStore#setActiveTabs}.
 */
final class TabEditorScreen extends SettingsScreen {
    private final AfterglowActivity host;
    private final List<String> active = new ArrayList<>();
    private final List<String> hidden = new ArrayList<>();
    private boolean loaded;
    private LinearLayout activeList;
    private LinearLayout hiddenList;

    // drag state
    private boolean dragging;
    private View dragRow;
    private String dragTab;
    private boolean dragFromShown;
    private ImageView ghost;
    private float downRawY;
    private float lastRawY;
    private float rowCenterAtDown;
    private boolean autoScrolling;

    /** Scrolls while the finger rests near the top or bottom edge (iOS reorder auto-scroll). */
    private final Runnable autoScroll = new Runnable() {
        @Override
        public void run() {
            int step = dragging ? edgeStep(lastRawY) : 0;
            if (step == 0) {
                autoScrolling = false;
                return;
            }
            host.scrollView().scrollBy(0, step);
            updateTarget(lastRawY);
            host.scrollView().postOnAnimation(this);
        }
    };

    TabEditorScreen(AfterglowActivity host) {
        this.host = host;
    }

    @Override
    String title() {
        return SettingsBehavior.page(SettingsSpec.TAB_EDITOR_PAGE).navTitle.get();
    }

    @Override
    boolean isBusy() {
        return dragging;
    }

    @Override
    boolean grouped() {
        return true;
    }

    @Override
    void build(LinearLayout content) {
        // Shown tabs always come from the store. Hidden tabs keep their order for the life of
        // the editor (iOS keeps its inactiveTabs array: a tapped tab goes to the top); new
        // hidden tabs are appended in ytag_allTabIds order, which is also the initial order.
        active.clear();
        active.addAll(TabStore.currentActiveTabs());
        List<String> supported = NativeTabs.supportedTabs();
        List<String> order = new ArrayList<>(loaded ? hidden : new ArrayList<String>());
        hidden.clear();
        for (String tab : order) if (supported.contains(tab) && !active.contains(tab) && !hidden.contains(tab)) hidden.add(tab);
        for (String tab : SettingsSpec.TAB_IDS) if (supported.contains(tab) && !active.contains(tab) && !hidden.contains(tab)) hidden.add(tab);
        loaded = true;

        RowViews views = host.views();
        content.addView(views.groupedHeader(SettingsSpec.TAB_SHOWN_HEADER.get()));
        activeList = list(views, active, true);
        content.addView(activeList, views.groupedCardParams());
        content.addView(views.groupedFooter(String.format(Locale.ROOT, SettingsSpec.TAB_SHOWN_FOOTER_FORMAT,
                TabStore.maximumActiveTabs())));
        content.addView(views.groupedHeader(SettingsSpec.TAB_HIDDEN_HEADER.get()));
        hiddenList = list(views, hidden, false);
        content.addView(hiddenList, views.groupedCardParams());
        content.addView(views.groupedFooter(SettingsSpec.TAB_HIDDEN_FOOTER.get()));
    }

    /** One inset-grouped section card holding its tab cells. */
    private LinearLayout list(RowViews views, List<String> tabs, boolean shown) {
        LinearLayout list = views.groupedCard();
        for (int i = 0; i < tabs.size(); i++) list.addView(tabRow(views, tabs.get(i), shown, i < tabs.size() - 1));
        return list;
    }

    private View tabRow(RowViews views, String tab, boolean shown, boolean separator) {
        LinearLayout row = new LinearLayout(views.context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(views.dp(60));
        row.setPadding(views.dp(16), views.dp(8), views.dp(4), views.dp(8));
        // Separator starts after the icon, like a UITableViewCell with an imageView.
        row.setBackground(views.groupedRowBackground(separator, views.dp(56)));
        row.setTag(tab);

        ImageView icon = new ImageView(views.context);
        icon.setImageDrawable(new TabIconDrawable(SettingsBehavior.tabSymbol(tab), RowViews.TINT, views.palette.groupedCell, views.dp(24)));
        LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(views.dp(24), views.dp(24));
        iconParams.rightMargin = views.dp(16);
        row.addView(icon, iconParams);

        LinearLayout texts = new LinearLayout(views.context);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.addView(views.text(SettingsBehavior.tabName(tab), 16, views.palette.groupedLabel, false));
        String detail = shown && !NativeTabs.supportedTabs().contains(tab)
                ? "Unavailable in this YouTube session. Your choice is saved."
                : (shown ? SettingsSpec.TAB_SHOWN_SUBTITLE : SettingsSpec.TAB_HIDDEN_SUBTITLE).get();
        TextView subtitle = views.text(detail,
                13, views.palette.groupedSecondaryLabel, false);
        subtitle.setPadding(0, views.dp(2), 0, 0);
        texts.addView(subtitle);
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));

        TextView handle = views.text("\u2261", 24, views.palette.groupedTertiaryLabel, false);
        handle.setGravity(Gravity.CENTER);
        handle.setOnTouchListener((v, event) -> onHandleTouch(row, event));
        row.addView(handle, new LinearLayout.LayoutParams(views.dp(48), views.dp(48)));

        row.setOnClickListener(v -> tap(tab));
        return row;
    }

    // ---------------------------------------------------------------- taps (Settings.x:1262-1289)

    private void tap(String tab) {
        if (active.contains(tab)) {
            if (active.size() <= TabStore.MINIMUM_ACTIVE_TABS) {
                host.alert(L10n.get("Warning", "Warning"), L10n.get("AtLeastOneTab", "At least two tabs must stay shown"));
                return;
            }
            active.remove(tab);
            hidden.add(0, tab);
        } else {
            if (active.size() >= TabStore.maximumActiveTabs()) {
                host.alert(L10n.get("Warning", "Warning"), L10n.get("TabsCountRestricted", "The shown tab limit has been reached"));
                return;
            }
            hidden.remove(tab);
            active.add(tab);
        }
        persist();
    }

    private void persist() {
        TabStore.setActiveTabs(new ArrayList<>(active));
        host.refresh();
    }

    // ---------------------------------------------------------------- drag (Settings.x:1229-1260)

    private boolean onHandleTouch(View row, MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                startDrag(row, event.getRawY());
                return true;
            case MotionEvent.ACTION_MOVE:
                if (dragging) moveDrag(event.getRawY());
                return true;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                if (dragging) endDrag();
                return true;
            default:
                return false;
        }
    }

    private void startDrag(View row, float rawY) {
        if (row.getWidth() == 0 || row.getHeight() == 0) return;
        dragging = true;
        dragRow = row;
        dragTab = (String) row.getTag();
        dragFromShown = active.contains(dragTab);
        host.scrollView().requestDisallowInterceptTouchEvent(true);

        Bitmap bitmap = Bitmap.createBitmap(row.getWidth(), row.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas snapshot = new Canvas(bitmap);
        snapshot.drawColor(host.views().palette.groupedCell); // the card supplies the cell color
        row.draw(snapshot);
        ghost = new ImageView(row.getContext());
        ghost.setImageBitmap(bitmap);
        ghost.setElevation(host.views().dp(8));
        FrameLayout overlay = host.overlay();
        int[] rowLocation = new int[2];
        int[] overlayLocation = new int[2];
        row.getLocationOnScreen(rowLocation);
        overlay.getLocationOnScreen(overlayLocation);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(row.getWidth(), row.getHeight());
        params.leftMargin = rowLocation[0] - overlayLocation[0];
        params.topMargin = rowLocation[1] - overlayLocation[1];
        overlay.addView(ghost, params);

        downRawY = rawY;
        rowCenterAtDown = rowLocation[1] + row.getHeight() / 2f;
        row.setVisibility(View.INVISIBLE);
    }

    private void moveDrag(float rawY) {
        lastRawY = rawY;
        updateTarget(rawY);
        if (!autoScrolling && edgeStep(rawY) != 0) {
            autoScrolling = true;
            host.scrollView().postOnAnimation(autoScroll);
        }
    }

    private int edgeStep(float rawY) {
        int[] location = new int[2];
        host.scrollView().getLocationOnScreen(location);
        int edge = host.views().dp(48);
        if (rawY < location[1] + edge) return -host.views().dp(12);
        if (rawY > location[1] + host.scrollView().getHeight() - edge) return host.views().dp(12);
        return 0;
    }

    /** Moves the ghost with the finger and the gap row to the slot under it. */
    private void updateTarget(float rawY) {
        float dy = rawY - downRawY;
        ghost.setTranslationY(dy);
        float center = rowCenterAtDown + dy;

        int[] activeLocation = new int[2];
        int[] hiddenLocation = new int[2];
        activeList.getLocationOnScreen(activeLocation);
        hiddenList.getLocationOnScreen(hiddenLocation);
        float boundary = (activeLocation[1] + activeList.getHeight() + hiddenLocation[1]) / 2f;
        boolean toShown = center <= boundary;

        // iOS targetIndexPathForMoveFromRowAtIndexPath: keep at least 2 shown and at most the maximum.
        if (dragFromShown && !toShown && active.size() <= TabStore.MINIMUM_ACTIVE_TABS) toShown = true;
        if (!dragFromShown && toShown && active.size() >= TabStore.maximumActiveTabs()) toShown = false;

        LinearLayout target = toShown ? activeList : hiddenList;
        int[] targetLocation = toShown ? activeLocation : hiddenLocation;
        int index = 0;
        for (int i = 0; i < target.getChildCount(); i++) {
            View child = target.getChildAt(i);
            if (child == dragRow) continue;
            float childCenter = targetLocation[1] + child.getTop() + child.getHeight() / 2f;
            if (childCenter < center) index++;
        }
        ViewGroup parent = (ViewGroup) dragRow.getParent();
        int currentIndex = parent == null ? -1 : parent.indexOfChild(dragRow);
        if (parent != target || currentIndex != index) {
            if (parent != null) parent.removeView(dragRow);
            target.addView(dragRow, Math.min(index, target.getChildCount()));
        }
    }

    private void endDrag() {
        host.scrollView().removeCallbacks(autoScroll);
        autoScrolling = false;
        host.overlay().removeView(ghost);
        ghost = null;
        dragRow.setVisibility(View.VISIBLE);
        host.scrollView().requestDisallowInterceptTouchEvent(false);
        ViewGroup parent = (ViewGroup) dragRow.getParent();
        boolean toShown = parent == activeList;
        int index = parent == null ? 0 : parent.indexOfChild(dragRow);
        dragging = false;

        List<String> source = dragFromShown ? active : hidden;
        List<String> destination = toShown ? active : hidden;
        source.remove(dragTab);
        destination.add(Math.max(0, Math.min(index, destination.size())), dragTab);
        dragRow = null;
        persist();
    }
}
