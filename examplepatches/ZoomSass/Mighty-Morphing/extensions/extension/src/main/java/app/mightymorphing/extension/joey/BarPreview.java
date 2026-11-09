package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Preview chrome. The strip is drawn at dialog size. The width only changes what fits. */
final class BarPreview {
    private static final int[] WIDTH_DP = {360, 411, 840};
    private static final String[] WIDTH_NAME = {"Small phone", "Phone", "Large"};
    private static final int[] SLOTS = {3, 4, 6};

    private BarPreview() {
    }

    static int widthIndex(Activity activity) {
        float density = activity.getResources().getDisplayMetrics().density;
        int dp = Math.round(activity.getResources().getDisplayMetrics().widthPixels / density);
        int best = 0;
        int gap = Integer.MAX_VALUE;
        for (int i = 0; i < WIDTH_DP.length; i++) {
            int next = Math.abs(WIDTH_DP[i] - dp);
            if (next < gap) {
                gap = next;
                best = i;
            }
        }
        return best;
    }

    /** A settings row. The value is the screen size the preview is measured against. */
    static View widthRow(Activity activity, int[] index, Runnable refresh) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        int pad = Math.round(8 * density);
        row.setPadding(0, pad, 0, pad);
        TextView label = new TextView(activity);
        label.setText("Screen size");
        label.setTextColor(MorpheDialog.text(activity));
        label.setTextSize(15);
        row.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView value = new TextView(activity);
        value.setTextColor(MorpheDialog.accent(activity));
        value.setTextSize(15);
        Runnable paint = () -> value.setText(WIDTH_NAME[index[0]] + "  ›");
        paint.run();
        row.setOnClickListener(v -> MorpheDialog.choices(activity, "Screen size", WIDTH_NAME, index[0], picked -> {
            index[0] = picked;
            paint.run();
            refresh.run();
        }));
        row.addView(value);
        LinearLayout block = new LinearLayout(activity);
        block.setOrientation(LinearLayout.VERTICAL);
        block.addView(row);
        block.addView(note(activity,
                "An estimate of what fits. A different screen may need a small change."));
        return block;
    }

    static TextView note(Activity activity, String text) {
        TextView view = new TextView(activity);
        view.setText(text);
        view.setTextColor(MorpheDialog.sub(activity));
        view.setTextSize(13);
        view.setTypeface(Typeface.defaultFromStyle(Typeface.ITALIC));
        int pad = Math.round(6 * activity.getResources().getDisplayMetrics().density);
        view.setPadding(0, pad, 0, pad);
        return view;
    }

    /** How many icons fit at the chosen screen size, after the overflow button. */
    static int slots(Activity activity, int index) {
        int at = Math.max(0, Math.min(index, SLOTS.length - 1));
        return SLOTS[at];
    }

    static int previewDp(Activity activity, int index) {
        return WIDTH_DP[index];
    }

    /** Puts the strip in the dialog at its own size. Nothing is scaled down. */
    static void show(Activity activity, FrameLayout stage, View content) {
        stage.removeAllViews();
        float density = activity.getResources().getDisplayMetrics().density;
        int available = Math.max(Math.round(240 * density), stage.getWidth());
        if (available <= 0) {
            available = Math.min(
                    activity.getResources().getDisplayMetrics().widthPixels - Math.round(80 * density),
                    Math.round(920 * density));
        }
        content.measure(
                View.MeasureSpec.makeMeasureSpec(available, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        int height = Math.max(content.getMeasuredHeight(), Math.round(56 * density));
        stage.addView(content, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, height));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, height);
        lp.topMargin = Math.round(8 * density);
        stage.setLayoutParams(lp);
    }

    static ImageView icon(Activity activity, String drawable, int color, int dp) {
        float density = activity.getResources().getDisplayMetrics().density;
        int size = Math.round(dp * density);
        ImageView view = new ImageView(activity);
        view.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        int id = drawable == null ? 0 : activity.getResources().getIdentifier(
                drawable, "drawable", activity.getPackageName());
        if (id != 0) {
            Drawable image = activity.getDrawable(id);
            if (image != null) {
                image = image.mutate();
                image.setTint(color);
                view.setImageDrawable(image);
            }
        }
        int pad = Math.round(8 * density);
        view.setPadding(pad, pad, pad, pad);
        view.setLayoutParams(new LinearLayout.LayoutParams(size + pad, size + pad));
        return view;
    }

    /** Filled pin sits on the bar. An outline pin sits in the menu. A dim pin is hidden. */
    static ImageView pin(Activity activity, int mode) {
        ImageView view = icon(activity, "pin", mode == 0
                ? MorpheDialog.sub(activity) : MorpheDialog.accent(activity), 22);
        view.setAlpha(mode == 0 ? 0.35f : mode == 1 ? 0.55f : 1f);
        view.setClickable(true);
        view.setFocusable(true);
        return view;
    }

    static TextView step(Activity activity, String label, boolean selected, boolean enabled, Runnable action) {
        TextView view = new TextView(activity);
        view.setText(label);
        view.setTextSize(14);
        view.setTextColor(!enabled ? MorpheDialog.sub(activity)
                : selected ? MorpheDialog.accent(activity) : MorpheDialog.text(activity));
        view.setGravity(Gravity.CENTER);
        int pad = Math.round(8 * activity.getResources().getDisplayMetrics().density);
        view.setPadding(pad, pad, pad, pad);
        view.setEnabled(enabled);
        view.setClickable(enabled);
        if (enabled && action != null) view.setOnClickListener(v -> action.run());
        return view;
    }

    /** Bar rows first, then overflow rows. Up and down stay inside one group. */
    static void nudge(List<String> order, String id, int dir, java.util.Set<String> onBar) {
        boolean bar = onBar.contains(id);
        List<String> group = new ArrayList<>();
        for (String item : order) {
            if (onBar.contains(item) == bar) group.add(item);
        }
        int index = group.indexOf(id);
        int next = index + dir;
        if (index < 0 || next < 0 || next >= group.size()) return;
        Collections.swap(order, order.indexOf(group.get(index)), order.indexOf(group.get(next)));
    }

    static void moveTo(List<String> order, String id, boolean bar, java.util.Set<String> onBar) {
        order.remove(id);
        int at = order.size();
        if (bar) {
            at = 0;
            for (int i = 0; i < order.size(); i++) {
                if (!onBar.contains(order.get(i))) {
                    at = i;
                    break;
                }
            }
        }
        order.add(at, id);
    }

    static void grid(LinearLayout rows, List<LinearLayout> cells) {
        rows.removeAllViews();
        for (int i = 0; i < cells.size(); ) {
            LinearLayout line = new LinearLayout(rows.getContext());
            line.setOrientation(LinearLayout.HORIZONTAL);
            for (int column = 0; column < 2 && i < cells.size(); column++, i++) {
                line.addView(cells.get(i), new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            }
            if (line.getChildCount() == 1) {
                line.addView(new View(rows.getContext()), new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            }
            rows.addView(line);
        }
    }

    static TextView handle(Activity activity, List<String> order, String id, Runnable moved) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView handle = new TextView(activity);
        handle.setText("☰");
        handle.setTextSize(18);
        handle.setTextColor(MorpheDialog.sub(activity));
        handle.setGravity(Gravity.CENTER);
        int pad = Math.round(8 * density);
        handle.setPadding(pad, pad, pad, pad);
        handle.setOnTouchListener(new View.OnTouchListener() {
            float startY;
            float startX;
            int home = -1;
            boolean settling;

            @Override
            public boolean onTouch(View v, MotionEvent event) {
                if (settling) return true;
                int action = event.getActionMasked();
                if (action == MotionEvent.ACTION_DOWN) {
                    home = order.indexOf(id);
                    startY = event.getRawY();
                    startX = event.getRawX();
                    ViewParent parent = v.getParent();
                    while (parent != null) {
                        parent.requestDisallowInterceptTouchEvent(true);
                        parent = parent.getParent();
                    }
                    return home >= 0;
                }
                if (action == MotionEvent.ACTION_MOVE) {
                    View line = v.getParent() instanceof View ? (View) v.getParent() : v;
                    line.setTranslationY(event.getRawY() - startY);
                    line.setTranslationX(event.getRawX() - startX);
                    return true;
                }
                if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                    settling = true;
                    try {
                        View line = v.getParent() instanceof View ? (View) v.getParent() : v;
                        line.setTranslationX(0);
                        line.setTranslationY(0);
                        float dy = event.getRawY() - startY;
                        float dx = event.getRawX() - startX;
                        int height = Math.max(line.getHeight(), Math.round(48 * density));
                        int width = Math.max(line.getWidth(), 1);
                        int row = Math.round(dy / height);
                        int col = Math.round(dx / width);
                        int target = (home / 2 + row) * 2 + Math.max(0, Math.min(1, home % 2 + col));
                        if (target < 0) target = 0;
                        if (target >= order.size()) target = order.size() - 1;
                        int from = order.indexOf(id);
                        while (from >= 0 && from < target) {
                            Collections.swap(order, from, from + 1);
                            from++;
                        }
                        while (from > target && from > 0) {
                            Collections.swap(order, from, from - 1);
                            from--;
                        }
                        moved.run();
                    } finally {
                        settling = false;
                    }
                    return true;
                }
                return true;
            }
        });
        return handle;
    }

    static android.widget.ScrollView options(Activity activity, View content) {
        android.widget.ScrollView scroll = new android.widget.ScrollView(activity);
        scroll.setFillViewport(true);
        scroll.addView(content, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        float density = activity.getResources().getDisplayMetrics().density;
        int height = Math.round(Math.min(200, activity.getResources().getDisplayMetrics().heightPixels / density * 0.28f) * density);
        scroll.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
        return scroll;
    }

    /** The overflow menu as it opens from the dots: one row per item, sitting under them. */
    static LinearLayout menu(Activity activity, List<String[]> rows) {
        float density = activity.getResources().getDisplayMetrics().density;
        int text = MorpheDialog.text(activity);
        int sub = MorpheDialog.sub(activity);
        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        int pad = Math.round(4 * density);
        card.setPadding(0, pad, 0, pad);
        card.setMinimumWidth(Math.round(200 * density));
        GradientDrawable background = new GradientDrawable();
        background.setColor(ModernUi.isModernUiEnabled(activity)
                ? ModernUi.getPalette(activity).containerHigh : 0xFF2C261F);
        background.setCornerRadius(8 * density);
        card.setBackground(background);
        for (String[] row : rows) {
            LinearLayout line = new LinearLayout(activity);
            line.setOrientation(LinearLayout.HORIZONTAL);
            line.setGravity(Gravity.CENTER_VERTICAL);
            int inset = Math.round(14 * density);
            line.setPadding(inset, Math.round(10 * density), inset, Math.round(10 * density));
            boolean spill = row.length > 1 && "spill".equals(row[1]);
            boolean caret = row.length > 2 && "caret".equals(row[2]);
            TextView label = new TextView(activity);
            label.setText(row[0]);
            label.setTextColor(text);
            label.setTextSize(15);
            line.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            if (caret) {
                TextView mark = new TextView(activity);
                mark.setText("›");
                mark.setTextColor(text);
                mark.setTextSize(16);
                line.addView(mark);
            }
            card.addView(line);
        }
        return card;
    }

    static int canvas(Activity activity) {
        return ModernUi.isModernUiEnabled(activity)
                ? ModernUi.getPalette(activity).canvas : 0xFF102022;
    }
}
