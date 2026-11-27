package app.ayham.extension.music.features;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.preference.Preference;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.Gravity;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * Canvas sources (canvas.md §13 rule 2): one row per source in the order tried, each with up and
 * down and its own switch; a source whose master switch is off is greyed out. Turning a source off
 * keeps its place.
 */
public class CanvasSourcesPreference extends Preference {
    public CanvasSourcesPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        refresh();
    }

    public CanvasSourcesPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        refresh();
    }

    public CanvasSourcesPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        refresh();
    }

    public CanvasSourcesPreference(Context context) {
        super(context);
        refresh();
    }

    private SharedPreferences prefs() {
        return getContext().getSharedPreferences("morphe_prefs", Context.MODE_PRIVATE);
    }

    private void refresh() {
        setTitle("Canvas sources");
        SharedPreferences sp = prefs();
        List<String> order = CanvasSettings.parseOrder(sp.getString(CanvasSettings.KEY_ORDER, ""));
        List<String> on = CanvasSettings.parseEnabled(sp.getString(CanvasSettings.KEY_ON, ""));
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < order.size(); i++) {
            String s = order.get(i);
            b.append(i + 1).append(". ").append(CanvasSettings.label(s)).append(on.contains(s) ? "" : " (off)").append('\n');
        }
        setSummary(b.append("Tried in this order; the first the song has shows. Tap to reorder or switch one off.").toString());
    }

    @Override
    protected void onBindView(android.view.View view) {
        super.onBindView(view);
        TextView s = view.findViewById(android.R.id.summary);
        if (s != null) s.setMaxLines(Integer.MAX_VALUE);
    }

    @Override
    protected void onClick() {
        final Context c = getContext();
        final SharedPreferences sp = prefs();
        final List<String> order = new ArrayList<>(CanvasSettings.parseOrder(sp.getString(CanvasSettings.KEY_ORDER, "")));
        final List<String> on = new ArrayList<>(CanvasSettings.parseEnabled(sp.getString(CanvasSettings.KEY_ON, "")));
        TypedArray ta = c.obtainStyledAttributes(new int[]{android.R.attr.textColorPrimary});
        final int text = ta.getColor(0, 0xFFFFFFFF);
        ta.recycle();
        final LinearLayout list = new LinearLayout(c);
        list.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(c, 20);
        list.setPadding(pad, dp(c, 8), pad, 0);
        final Runnable[] draw = new Runnable[1];
        draw[0] = () -> {
            list.removeAllViews();
            boolean canvasMaster = sp.getBoolean("ayham_canvasSpotify", true), coversMaster = sp.getBoolean("ayham_canvas", true);
            for (int i = 0; i < order.size(); i++) {
                final int at = i;
                final String s = order.get(i);
                boolean master = CanvasSettings.APPLE.equals(s) ? coversMaster : canvasMaster;
                LinearLayout row = new LinearLayout(c);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setPadding(0, dp(c, 6), 0, dp(c, 6));
                TextView t = new TextView(c);
                t.setText(CanvasSettings.label(s) + (master ? "" : "\n(its master switch is off)"));
                t.setTextColor(text);
                t.setAlpha(master ? 1f : 0.4f);
                t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
                row.addView(t, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
                for (final int dir : new int[]{-1, 1}) {
                    Button m = new Button(c, null, android.R.attr.borderlessButtonStyle);
                    m.setText(dir < 0 ? "↑" : "↓");
                    m.setTextColor(text);
                    m.setMinWidth(0);
                    m.setMinimumWidth(dp(c, 44));
                    int to = at + dir;
                    m.setEnabled(to >= 0 && to < order.size());
                    m.setAlpha(m.isEnabled() ? 1f : 0.3f);
                    m.setContentDescription(dir < 0 ? "Move up" : "Move down");
                    m.setOnClickListener(v -> {
                        order.set(at, order.get(to));
                        order.set(to, s);
                        save(sp, order, on);
                        draw[0].run();
                    });
                    row.addView(m);
                }
                Switch sw = new Switch(c);
                sw.setChecked(on.contains(s));
                sw.setEnabled(master);
                sw.setContentDescription(CanvasSettings.label(s));
                sw.setOnCheckedChangeListener((v, checked) -> {
                    if (checked && !on.contains(s)) on.add(s);
                    if (!checked) on.remove(s);
                    save(sp, order, on);
                });
                row.addView(sw);
                list.addView(row);
            }
        };
        draw[0].run();
        new AlertDialog.Builder(c)
                .setTitle("Canvas sources")
                .setView(list)
                .setPositiveButton("Done", null)
                .setOnDismissListener(d -> refresh())
                .show();
    }

    private static void save(SharedPreferences sp, List<String> order, List<String> on) {
        sp.edit().putString(CanvasSettings.KEY_ORDER, String.join(",", order)).putString(CanvasSettings.KEY_ON, CanvasSettings.storeEnabled(on)).apply();
        Features.invalidate();
    }

    private static int dp(Context c, int v) {
        return Math.round(v * c.getResources().getDisplayMetrics().density);
    }
}
