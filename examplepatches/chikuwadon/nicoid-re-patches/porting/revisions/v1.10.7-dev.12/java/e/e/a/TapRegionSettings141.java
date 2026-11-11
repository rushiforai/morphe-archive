package e.e.a;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.ScrollView;
import android.widget.TextView;
import java.util.ArrayList;

public final class TapRegionSettings141 {
    private static final String ANCHOR = "gesture_quiet_controls";

    private TapRegionSettings141() {}

    private static String title(Context c) {
        return Dev112.tr(c, "シングルタップの操作部表示領域", "Single-tap control area", "單點切換控制項的區域");
    }

    private static String description(Context c) {
        return Dev112.tr(c, "シングルタップで再生コントロールを開閉できる領域を設定します",
                "Choose where a single tap toggles playback controls", "設定單點可開關播放控制項的區域");
    }

    private static String[] names(Context c) {
        return new String[]{
            Dev112.tr(c, "画面全体", "Entire video", "整個畫面"),
            Dev112.tr(c, "左右端", "Side edges", "左右兩側"),
            Dev112.tr(c, "上下端", "Top / bottom", "上下兩側"),
            Dev112.tr(c, "中央", "Center", "中央"),
            Dev112.tr(c, "カスタム", "Custom", "自訂")
        };
    }

    private static PreferenceGroup parent(PreferenceGroup group, Preference anchor) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference child = group.getPreference(i);
            if (child == anchor) return group;
            if (child instanceof PreferenceGroup) {
                PreferenceGroup result = parent((PreferenceGroup) child, anchor);
                if (result != null) return result;
            }
        }
        return null;
    }

    public static void install(PreferenceActivity activity) {
        if (activity.getPreferenceScreen() == null || activity.findPreference(TapControls141.KEY) != null) return;
        Preference anchor = activity.findPreference(ANCHOR);
        if (anchor == null) return;
        PreferenceGroup group = parent(activity.getPreferenceScreen(), anchor);
        if (group == null) return;
        ArrayList<Preference> siblings = new ArrayList<>();
        for (int i = 0; i < group.getPreferenceCount(); i++) siblings.add(group.getPreference(i));
        for (int i = 0; i < siblings.size(); i++) siblings.get(i).setOrder(i * 10);
        Preference item = new Preference(activity);
        item.setPersistent(false);
        item.setKey(TapControls141.KEY);
        item.setOrder(anchor.getOrder() + 1);
        item.setTitle(title(activity));
        item.setSummary(description(activity));
        item.setOnPreferenceClickListener(p -> { open(activity); return true; });
        group.addPreference(item);
    }

    private static void open(PreferenceActivity activity) {
        try {
            AlertDialog.Builder builder = (AlertDialog.Builder) Dev112.staticCall("e.e.a.UiDialogs", "builder",
                    new Class<?>[]{Context.class}, activity);
            Editor editor = new Editor(builder.getContext(), TapControls141.settings(activity));
            Dev112.show(builder.setTitle(title(activity)).setView(editor.scroll)
                    .setNegativeButton(android.R.string.cancel, null)
                    .setPositiveButton(android.R.string.ok, (dialog, which) ->
                            TapControls141.save(activity, editor.value())).create());
        } catch (Exception failure) {
            android.util.Log.w("nicoid-controls", "Cannot open single-tap area editor", failure);
        }
    }

    private static final class Editor {
        final Context context;
        final ScrollView scroll;
        final Preview preview;
        final int accent, foreground, secondary;
        final Button[] presets = new Button[5];
        final LinearLayout[] adjustments = new LinearLayout[4];
        final TextView[] coordinates = new TextView[4];
        final Button[] minus = new Button[4], plus = new Button[4];
        final Button areaSelector, add, remove;
        final TextView previewHeading, areaChevron;
        final String[] edgeNames;
        final ArrayList<int[]> ranges = new ArrayList<>();
        int mode, selected, boundary;

        Editor(Context context, TapRegions141 current) throws Exception {
            this.context = context;
            accent = (Integer) Dev112.staticCall("e.e.a.UiDialogs", "accent", new Class<?>[]{Context.class}, context);
            TextView sample = new TextView(context);
            foreground = sample.getTextColors().getDefaultColor();
            secondary = tint(foreground, 185);
            edgeNames = new String[]{tr("左", "Left", "左"), tr("右", "Right", "右"),
                    tr("上", "Top", "上"), tr("下", "Bottom", "下")};
            LinearLayout body = column();
            body.setPadding(dp(18), dp(2), dp(18), dp(8));
            scroll = new ScrollView(context);
            scroll.setClipToPadding(false);
            scroll.addView(body);
            body.addView(note(description(context)));

            section(body, "▦", tr("領域プリセット", "Presets", "區域預設"));
            String[] labels = names(context);
            String[] symbols = {"⛶", "↔", "↕", "⊙", "▣"};
            for (int start = 0; start < presets.length; start += 3) {
                LinearLayout row = row(body);
                for (int i = start; i < Math.min(start + 3, presets.length); i++) {
                    final int option = i;
                    presets[i] = button(row, symbols[i] + "  " + labels[i], () -> choose(option));
                    presets[i].setContentDescription(labels[i]);
                }
            }
            previewHeading = section(body, "▱", "");
            body.addView(note(tr("色付きの範囲で開閉。領域や枠はドラッグで調整できます",
                    "Colored areas toggle controls. Drag an area or its border to adjust.",
                    "著色範圍可開關控制項。拖曳區域或邊框以調整。")));
            preview = new Preview(this);
            body.addView(preview, new LinearLayout.LayoutParams(-1, dp(148)));

            section(body, "≡", tr("クイック調整", "Fine adjustment", "微調"));
            for (int i = 0; i < adjustments.length; i += 2) {
                if (i > 0) divider(body, 1, 1);
                LinearLayout pair = row(body);
                addAdjustment(pair, i);
                addAdjustment(pair, i + 1);
            }

            section(body, "▤", tr("領域", "Areas", "區域"));
            android.widget.FrameLayout selector = new android.widget.FrameLayout(context);
            body.addView(selector, new LinearLayout.LayoutParams(-1, -2));
            areaSelector = createButton("", this::showAreas);
            areaSelector.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
            areaSelector.setPadding(dp(14), dp(4), dp(32), dp(4));
            style(areaSelector, false);
            selector.addView(areaSelector, new android.widget.FrameLayout.LayoutParams(-1, -2));
            areaChevron = new TextView(context);
            areaChevron.setText("▾");
            areaChevron.setTextColor(secondary);
            areaChevron.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            android.widget.FrameLayout.LayoutParams chevron = new android.widget.FrameLayout.LayoutParams(
                    -2, -2, Gravity.END | Gravity.CENTER_VERTICAL);
            chevron.setMarginEnd(dp(14));
            selector.addView(areaChevron, chevron);
            LinearLayout actions = row(body);
            remove = button(actions, tr("領域を削除", "Delete area", "刪除區域"), this::removeArea);
            add = button(actions, tr("＋ 領域を追加", "+ Add area", "＋ 新增區域"), this::addArea);
            style(remove, false);
            style(add, false);
            Button reset = button(row(body), tr("初期値に戻す", "Restore default", "恢復預設"),
                    () -> set(TapRegions141.preset(TapRegions141.ALL)));
            reset.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
            reset.setTextColor(accent);
            set(current);
        }

        private LinearLayout column() {
            LinearLayout layout = new LinearLayout(context);
            layout.setOrientation(LinearLayout.VERTICAL);
            return layout;
        }

        private LinearLayout row(LinearLayout parent) {
            LinearLayout layout = new LinearLayout(context);
            layout.setGravity(Gravity.CENTER_VERTICAL);
            parent.addView(layout);
            return layout;
        }

        int dp(float value) { return Math.round(value * context.getResources().getDisplayMetrics().density); }
        String tr(String ja, String en, String zh) { return Dev112.tr(context, ja, en, zh); }

        private static int tint(int color, int alpha) {
            return (color & 0x00ffffff) | (alpha << 24);
        }

        private TextView note(String text) {
            TextView label = new TextView(context);
            label.setText(text);
            label.setTextSize(13);
            label.setTextColor(secondary);
            label.setPadding(dp(2), 0, dp(2), dp(4));
            return label;
        }

        private void divider(LinearLayout parent, int top, int bottom) {
            View divider = new View(context);
            divider.setBackgroundColor(tint(foreground, 31));
            LinearLayout.LayoutParams line = new LinearLayout.LayoutParams(-1, dp(1));
            line.setMargins(0, dp(top), 0, dp(bottom));
            parent.addView(divider, line);
        }

        private TextView section(LinearLayout parent, String symbol, String title) {
            divider(parent, 10, 8);
            LinearLayout heading = row(parent);
            TextView icon = new TextView(context);
            icon.setText(symbol);
            icon.setTextColor(foreground);
            icon.setTextSize(17);
            icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            icon.setPadding(dp(2), 0, dp(8), dp(4));
            heading.addView(icon);
            TextView text = new TextView(context);
            text.setText(title);
            text.setTextSize(15);
            text.setTextColor(foreground);
            text.setTypeface(null, Typeface.BOLD);
            text.setPadding(0, 0, 0, dp(4));
            if (android.os.Build.VERSION.SDK_INT >= 28) text.setAccessibilityHeading(true);
            heading.addView(text);
            return text;
        }

        private String areaName(int index) {
            return tr("領域", "Area", "區域") + " " + (index + 1);
        }

        private void showAreas() {
            PopupMenu menu = new PopupMenu(context, areaSelector);
            for (int i = 0; i < ranges.size(); i++) menu.getMenu().add(0, i, i, areaName(i));
            menu.getMenu().setGroupCheckable(0, true, true);
            menu.getMenu().findItem(selected).setChecked(true);
            menu.setOnMenuItemClickListener(item -> { select(item.getItemId()); return true; });
            menu.show();
        }

        private Button createButton(String text, Runnable action) {
            Button button = new Button(context, null, android.R.attr.borderlessButtonStyle);
            button.setText(text);
            button.setTextSize(14);
            button.setAllCaps(false);
            button.setMinWidth(0);
            button.setMinimumWidth(0);
            button.setMinHeight(dp(44));
            button.setMinimumHeight(0);
            button.setPadding(dp(4), dp(3), dp(4), dp(3));
            button.setStateListAnimator(null);
            button.setOnClickListener(v -> action.run());
            return button;
        }

        private Button button(LinearLayout row, String text, Runnable action) {
            Button button = createButton(text, action);
            LinearLayout.LayoutParams size = new LinearLayout.LayoutParams(0, -2, 1);
            size.setMargins(dp(2), dp(2), dp(2), dp(2));
            row.addView(button, size);
            return button;
        }

        private void addAdjustment(LinearLayout pair, int edge) {
            LinearLayout setting = new LinearLayout(context);
            setting.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout.LayoutParams size = new LinearLayout.LayoutParams(0, -2, 1);
            size.setMargins(dp(2), dp(1), dp(2), dp(1));
            pair.addView(setting, size);
            adjustments[edge] = setting;
            minus[edge] = stepButton(setting, "−", edge, -1);
            TextView coordinate = new TextView(context);
            coordinates[edge] = coordinate;
            coordinate.setTextSize(13);
            coordinate.setGravity(Gravity.CENTER);
            setting.addView(coordinate, new LinearLayout.LayoutParams(0, -2, 1));
            plus[edge] = stepButton(setting, "+", edge, 1);
        }

        private Button stepButton(LinearLayout row, String symbol, int edge, int delta) {
            Button button = createButton(symbol, () -> step(edge, delta));
            button.setContentDescription(edgeNames[edge] + " " + symbol + "1%");
            button.setTextSize(18);
            style(button, false);
            row.addView(button, new LinearLayout.LayoutParams(dp(44), -2));
            return button;
        }

        private void style(Button button, boolean active) {
            GradientDrawable background = new GradientDrawable();
            background.setCornerRadius(dp(20));
            background.setColor(active ? tint(accent, 62) : tint(foreground, 14));
            background.setStroke(dp(1), active ? accent : tint(foreground, 29));
            button.setBackground(new android.graphics.drawable.RippleDrawable(
                    android.content.res.ColorStateList.valueOf(tint(accent, 40)), background, null));
            button.setBackgroundTintList(null);
            button.setTextColor(foreground);
            button.setTypeface(null, active ? Typeface.BOLD : Typeface.NORMAL);
            button.setSelected(active);
        }

        void set(TapRegions141 value) {
            mode = value.mode;
            ranges.clear();
            for (int[] range : value.ranges) ranges.add(range.clone());
            selected = boundary = 0;
            refresh();
        }

        void choose(int option) {
            if (option == mode) return;
            if (option == TapRegions141.CUSTOM) {
                mode = option;
                refresh();
            } else set(TapRegions141.preset(option));
        }

        TapRegions141 value() {
            return mode == TapRegions141.CUSTOM
                    ? TapRegions141.custom(ranges.toArray(new int[0][])) : TapRegions141.preset(mode);
        }

        void select(int index) {
            if (index != selected) {
                selected = index;
                refresh();
            }
        }

        void addArea() {
            if (ranges.size() >= TapRegions141.LIMIT) return;
            TapRegions141 active = value();
            for (int y = 20; y <= 80; y += 30) {
                for (int x = 20; x <= 80; x += 30) {
                    if (!active.contains(x, y, 100, 100, 0)) {
                        append(x, y);
                        return;
                    }
                }
            }
            append(50, 50);
        }

        private void append(int x, int y) {
            ranges.add(new int[]{x - 12, x + 12, y - 12, y + 12});
            mode = TapRegions141.CUSTOM;
            selected = ranges.size() - 1;
            refresh();
        }

        void removeArea() {
            if (ranges.size() <= 1) return;
            ranges.remove(selected);
            mode = TapRegions141.CUSTOM;
            selected = Math.min(selected, ranges.size() - 1);
            refresh();
        }

        private void step(int edge, int delta) {
            boundary = edge;
            int[] updated = ranges.get(selected).clone();
            changeEdge(updated, edge, updated[edge] + delta);
            edit(updated);
        }

        void edit(int[] range) {
            if (java.util.Arrays.equals(range, ranges.get(selected))) return;
            ranges.set(selected, range);
            if (mode != TapRegions141.CUSTOM) {
                mode = TapRegions141.CUSTOM;
                refresh();
            } else updateCoordinates();
        }

        private void updateCoordinates() {
            int[] range = ranges.get(selected);
            for (int i = 0; i < coordinates.length; i++) {
                coordinates[i].setText(edgeNames[i] + " " + range[i] + "%");
                coordinates[i].setTextColor(i == boundary ? accent : foreground);
                adjustments[i].setBackgroundColor(i == boundary ? tint(accent, 25) : 0);
                adjustEnabled(minus[i], (i & 1) == 0 ? range[i] > 0 : range[i] > range[i - 1] + 1);
                adjustEnabled(plus[i], (i & 1) == 0 ? range[i] < range[i + 1] - 1 : range[i] < 100);
            }
            preview.invalidate();
        }

        private void adjustEnabled(Button button, boolean enabled) {
            button.setEnabled(enabled);
            button.setAlpha(enabled ? 1 : .42f);
        }

        void refresh() {
            for (int i = 0; i < presets.length; i++) style(presets[i], i == mode);
            previewHeading.setText(mode == TapRegions141.CUSTOM
                    ? tr("カスタム領域", "Custom area", "自訂區域")
                    : tr("領域プレビュー", "Area preview", "區域預覽"));
            areaSelector.setText(areaName(selected));
            areaSelector.setEnabled(ranges.size() > 1);
            areaChevron.setVisibility(ranges.size() > 1 ? View.VISIBLE : View.INVISIBLE);
            adjustEnabled(add, ranges.size() < TapRegions141.LIMIT);
            adjustEnabled(remove, ranges.size() > 1);
            updateCoordinates();
        }

    }

    static void changeEdge(int[] range, int edge, int value) {
        if ((edge & 1) == 0) range[edge] = clamp(value, 0, range[edge + 1] - 1);
        else range[edge] = clamp(value, range[edge - 1] + 1, 100);
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }

    /** A video-shaped preview with movable rectangles and four adjustable sides. */
    private static final class Preview extends View {
        final Editor editor;
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final android.graphics.RectF frame = new android.graphics.RectF();
        int[] original;
        int horizontal = -1, vertical = -1;
        float downX, downY;

        Preview(Editor editor) {
            super(editor.context);
            this.editor = editor;
            setContentDescription(editor.tr("領域プレビュー", "Area preview", "區域預覽"));
        }

        @Override protected void onSizeChanged(int w, int h, int oldW, int oldH) {
            float inset = editor.dp(10);
            float width = Math.max(0, Math.min(w - 2 * inset, (h - 2 * inset) * 16 / 9f));
            float height = width * 9 / 16f;
            frame.set((w - width) / 2, (h - height) / 2, (w + width) / 2, (h + height) / 2);
        }

        private float x(int percent) { return frame.left + frame.width() * percent / 100f; }
        private float y(int percent) { return frame.top + frame.height() * percent / 100f; }

        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            paint.setColor((editor.foreground & 0x00ffffff) | 0x20000000);
            canvas.drawRect(frame, paint);
            paint.setColor((editor.accent & 0x00ffffff) | 0x87000000);
            for (int[] r : editor.ranges) canvas.drawRect(x(r[0]), y(r[2]), x(r[1]), y(r[3]), paint);
            paint.setColor((editor.foreground & 0x00ffffff) | 0x28000000);
            for (int mark = 20; mark < 100; mark += 20) {
                canvas.drawLine(x(mark), frame.top, x(mark), frame.bottom, paint);
                canvas.drawLine(frame.left, y(mark), frame.right, y(mark), paint);
            }
            int[] r = editor.ranges.get(editor.selected);
            paint.setColor(editor.accent);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(editor.dp(2));
            canvas.drawRect(x(r[0]), y(r[2]), x(r[1]), y(r[3]), paint);
            paint.setStyle(Paint.Style.FILL);
            for (int h = 0; h < 2; h++) {
                for (int v = 2; v < 4; v++) canvas.drawCircle(x(r[h]), y(r[v]), editor.dp(4), paint);
            }
        }

        private boolean hit(int[] r, float x, float y, float pad) {
            return x >= x(r[0]) - pad && x <= x(r[1]) + pad
                    && y >= y(r[2]) - pad && y <= y(r[3]) + pad;
        }

        private static int near(float point, float first, float last, float pad, int edge) {
            float a = Math.abs(point - first), b = Math.abs(point - last);
            return Math.min(a, b) <= pad ? edge + (a <= b ? 0 : 1) : -1;
        }

        private boolean begin(float x, float y) {
            if (frame.isEmpty()) return false;
            float slop = editor.dp(12);
            int index = editor.selected;
            if (!hit(editor.ranges.get(index), x, y, slop)) {
                index = 0;
                while (index < editor.ranges.size() && !hit(editor.ranges.get(index), x, y, slop)) index++;
                if (index == editor.ranges.size()) return false;
            }
            editor.select(index);
            original = editor.ranges.get(index).clone();
            downX = x;
            downY = y;
            horizontal = near(x, x(original[0]), x(original[1]), slop, 0);
            vertical = near(y, y(original[2]), y(original[3]), slop, 2);
            getParent().requestDisallowInterceptTouchEvent(true);
            return true;
        }

        private void drag(float x, float y) {
            int dx = Math.round((x - downX) * 100 / frame.width());
            int dy = Math.round((y - downY) * 100 / frame.height());
            int[] next = original.clone();
            if (horizontal < 0 && vertical < 0) {
                dx = clamp(dx, -next[0], 100 - next[1]);
                dy = clamp(dy, -next[2], 100 - next[3]);
                next[0] += dx;
                next[1] += dx;
                next[2] += dy;
                next[3] += dy;
            } else {
                if (horizontal >= 0) changeEdge(next, horizontal, original[horizontal] + dx);
                if (vertical >= 0) changeEdge(next, vertical, original[vertical] + dy);
            }
            editor.edit(next);
        }

        @Override public boolean onTouchEvent(MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    return begin(event.getX(), event.getY());
                case MotionEvent.ACTION_MOVE:
                case MotionEvent.ACTION_UP:
                    if (original == null) return false;
                    drag(event.getX(), event.getY());
                    if (event.getActionMasked() == MotionEvent.ACTION_UP) endDrag();
                    return true;
                case MotionEvent.ACTION_CANCEL:
                case MotionEvent.ACTION_POINTER_DOWN:
                    if (original == null) return false;
                    endDrag();
                    return true;
                default:
                    return original != null;
            }
        }

        private void endDrag() {
            original = null;
            getParent().requestDisallowInterceptTouchEvent(false);
        }
    }
}
