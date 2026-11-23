package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

/**
 * One drag-and-drop list in zones: "On the bar", "In the menu", "Hidden" and the like. Rows move
 * within a zone to reorder, and between zones to change where they show. Every screen gives it
 * the zones, the rules for what may go where, and a callback for when something changed.
 */
final class ZoneEditor {
    interface Rules {
        /** Whether the item may sit in this zone. */
        boolean allowed(String id, int zone);
    }

    interface Look {
        String label(String id);

        /** A drawable name for a small icon beside the label, or null. */
        String icon(String id);
    }

    private static final String HEADER = "#header";
    private static final String EMPTY = "#empty";

    private final Activity activity;
    private final String[] titles;
    private final String[] empties;
    private final List<List<String>> zones;
    private final Rules rules;
    private final Look look;
    private final Runnable changed;
    private final float d;
    private final ScrollView scroll;
    private final LinearLayout list;
    private final View marker;
    private final FrameLayout content;

    ZoneEditor(Activity activity, String[] titles, String[] empties, List<List<String>> zones,
               Rules rules, Look look, Runnable changed) {
        this.activity = activity;
        this.titles = titles;
        this.empties = empties;
        this.zones = zones;
        this.rules = rules;
        this.look = look;
        this.changed = changed;
        this.d = activity.getResources().getDisplayMetrics().density;
        list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        marker = new View(activity);
        GradientDrawable line = new GradientDrawable();
        line.setColor(MorpheDialog.accent(activity));
        line.setCornerRadius(2 * d);
        marker.setBackground(line);
        marker.setVisibility(View.GONE);
        content = new FrameLayout(activity);
        content.addView(list, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        content.addView(marker, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.max(2, Math.round(3 * d))));
        scroll = new ScrollView(activity);
        scroll.setNestedScrollingEnabled(true);
        scroll.addView(content, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        rebuild();
    }

    /** The scrolling list. Give it the space left under the preview. */
    View view() {
        return scroll;
    }

    /** A full-height page: heading, preview on top, the list taking the rest, buttons below. */
    static LinearLayout screen(Activity activity, String title, String info, View top,
                               ZoneEditor editor, TextView... buttons) {
        LinearLayout page = MorpheDialog.page(activity, title, info);
        if (top != null) page.addView(top);
        LinearLayout.LayoutParams fill = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        fill.topMargin = Math.round(6 * activity.getResources().getDisplayMetrics().density);
        page.addView(editor.view(), fill);
        page.addView(MorpheDialog.actions(activity, buttons));
        return page;
    }

    void rebuild() {
        list.removeAllViews();
        int text = MorpheDialog.text(activity);
        int sub = MorpheDialog.sub(activity);
        for (int zone = 0; zone < zones.size(); zone++) {
            TextView header = MorpheDialog.section(activity, titles[zone], MorpheDialog.accent(activity));
            header.setTag(HEADER);
            list.addView(header);
            List<String> ids = zones.get(zone);
            if (ids.isEmpty()) {
                TextView none = new TextView(activity);
                none.setTag(EMPTY);
                none.setText(empties[zone]);
                none.setTextColor(sub);
                none.setTextSize(13);
                none.setGravity(Gravity.CENTER_VERTICAL);
                none.setMinimumHeight(Math.round(44 * d));
                none.setPadding(Math.round(12 * d), 0, 0, 0);
                GradientDrawable dash = new GradientDrawable();
                dash.setCornerRadius(8 * d);
                dash.setStroke(Math.max(1, Math.round(d)), (sub & 0x00FFFFFF) | 0x88000000,
                        Math.round(4 * d), Math.round(4 * d));
                none.setBackground(dash);
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                lp.topMargin = Math.round(2 * d);
                lp.bottomMargin = Math.round(2 * d);
                list.addView(none, lp);
                continue;
            }
            for (String id : ids) list.addView(row(id, text, sub));
        }
    }

    private View row(String id, int text, int sub) {
        LinearLayout line = new LinearLayout(activity);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setGravity(Gravity.CENTER_VERTICAL);
        line.setTag(id);
        line.setMinimumHeight(Math.round(48 * d));
        String icon = look.icon(id);
        if (icon != null) {
            ImageView image = BarPreview.icon(activity, icon, text, 22);
            line.addView(image, new LinearLayout.LayoutParams(Math.round(40 * d), Math.round(40 * d)));
        }
        TextView label = new TextView(activity);
        label.setText(look.label(id));
        label.setTextColor(text);
        label.setTextSize(15);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        if (icon == null) lp.leftMargin = Math.round(4 * d);
        line.addView(label, lp);
        TextView handle = new TextView(activity);
        handle.setText("☰");
        handle.setTextSize(18);
        handle.setTextColor(sub);
        handle.setGravity(Gravity.CENTER);
        int pad = Math.round(12 * d);
        handle.setPadding(pad, pad, pad, pad);
        handle.setOnTouchListener(new Drag(line, id));
        line.addView(handle);
        return line;
    }

    /** Where a drop would land: the child it goes before, the zone, and the place in that zone. */
    private int[] slot(View dragged, float centerY) {
        int before = list.getChildCount();
        for (int i = 0; i < list.getChildCount(); i++) {
            View child = list.getChildAt(i);
            if (child == dragged) continue;
            if (child.getTop() + child.getHeight() / 2f > centerY) {
                before = i;
                break;
            }
        }
        int zone = -1;
        for (int i = 0; i < Math.min(before, list.getChildCount()); i++) {
            if (HEADER.equals(list.getChildAt(i).getTag())) zone++;
        }
        if (zone < 0) zone = 0;
        int position = 0;
        int header = -1;
        int seen = -1;
        for (int i = 0; i < list.getChildCount(); i++) {
            if (HEADER.equals(list.getChildAt(i).getTag())) {
                seen++;
                if (seen == zone) {
                    header = i;
                    break;
                }
            }
        }
        for (int i = header + 1; i < before && i < list.getChildCount(); i++) {
            View child = list.getChildAt(i);
            if (child == dragged || HEADER.equals(child.getTag()) || EMPTY.equals(child.getTag())) continue;
            position++;
        }
        return new int[]{before, zone, position};
    }

    private void showMarker(int before) {
        float y;
        if (before >= list.getChildCount()) {
            View last = list.getChildAt(list.getChildCount() - 1);
            y = last == null ? 0 : last.getBottom();
        } else {
            y = list.getChildAt(before).getTop();
        }
        marker.setTranslationY(y - marker.getLayoutParams().height / 2f);
        marker.setVisibility(View.VISIBLE);
    }

    private final class Drag implements View.OnTouchListener {
        private final View row;
        private final String id;
        private float startRaw;
        private int startScroll;
        private int[] landing;

        Drag(View row, String id) {
            this.row = row;
            this.id = id;
        }

        @Override
        public boolean onTouch(View v, MotionEvent event) {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                startRaw = event.getRawY();
                startScroll = scroll.getScrollY();
                landing = null;
                scroll.requestDisallowInterceptTouchEvent(true);
                row.setAlpha(0.7f);
                row.setElevation(8 * d);
                return true;
            }
            if (action == MotionEvent.ACTION_MOVE) {
                float dy = event.getRawY() - startRaw + (scroll.getScrollY() - startScroll);
                row.setTranslationY(dy);
                int[] at = new int[2];
                scroll.getLocationOnScreen(at);
                float inside = event.getRawY() - at[1];
                int edge = Math.round(48 * d);
                if (inside < edge) scroll.scrollBy(0, -Math.round(14 * d));
                else if (inside > scroll.getHeight() - edge) scroll.scrollBy(0, Math.round(14 * d));
                landing = slot(row, row.getTop() + dy + row.getHeight() / 2f);
                showMarker(landing[0]);
                return true;
            }
            if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                scroll.requestDisallowInterceptTouchEvent(false);
                marker.setVisibility(View.GONE);
                row.setAlpha(1f);
                row.setTranslationY(0f);
                row.setElevation(0f);
                if (action == MotionEvent.ACTION_UP && landing != null) drop(id, landing[1], landing[2]);
                landing = null;
                return true;
            }
            return true;
        }
    }

    private void drop(String id, int zone, int position) {
        if (!rules.allowed(id, zone)) {
            Toast.makeText(activity, look.label(id) + " can't go in " + titles[zone].toLowerCase(), Toast.LENGTH_SHORT).show();
            rebuild();
            return;
        }
        int from = -1;
        int at = -1;
        for (int z = 0; z < zones.size(); z++) {
            at = zones.get(z).indexOf(id);
            if (at >= 0) {
                from = z;
                break;
            }
        }
        if (from < 0) return;
        zones.get(from).remove(id);
        List<String> target = zones.get(zone);
        target.add(Math.max(0, Math.min(position, target.size())), id);
        changed.run();
        rebuild();
    }

    /** A copy of the zones, for screens that keep their own storage. */
    static List<List<String>> lists(int count) {
        List<List<String>> out = new ArrayList<>();
        for (int i = 0; i < count; i++) out.add(new ArrayList<>());
        return out;
    }
}
