package patches.gearslip;

import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Insets;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

/** One row per drawer tile, ticked while the tile is shown, like Android Auto's launcher setting. */
public final class DrawerAppsActivity extends Activity {
    private final List<Row> rows = new ArrayList<>();
    private final Adapter adapter = new Adapter();
    private boolean changed;

    private static final class Row {
        final String id;
        final String label;
        final Bitmap icon;

        Row(String id, String label, Bitmap icon) {
            this.id = id;
            this.label = label;
            this.icon = icon;
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setTitle(DrawerApps.text("Apps in de auto", "Apps in the car"));
        if (getActionBar() != null) getActionBar().setDisplayHomeAsUpEnabled(true);

        ListView list = new ListView(this);
        list.setAdapter(adapter);
        list.setDivider(null);
        list.setClipToPadding(false);
        // Gearslip targets an Android version that draws edge to edge, under the top bar too.
        // The top inset already counts that bar.
        list.setOnApplyWindowInsetsListener((view, insets) -> {
            Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
            view.setPadding(0, bars.top, 0, bars.bottom);
            return insets;
        });
        list.setOnItemClickListener((parent, view, position, id) -> toggle(rows.get(position)));

        TextView empty = new TextView(this);
        empty.setGravity(Gravity.CENTER);
        empty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        empty.setText(DrawerApps.text("Apps zoeken…", "Finding apps…"));
        ViewGroup root = new LinearLayout(this);
        root.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        root.addView(empty, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        list.setEmptyView(empty);
        setContentView(root);

        Context app = getApplicationContext();
        new Thread(() -> {
            List<Row> found = new ArrayList<>();
            for (Object entry : DrawerApps.scan(app)) {
                String id = DrawerApps.componentId(entry);
                if (id != null) found.add(new Row(id, DrawerApps.label(entry), DrawerApps.icon(entry)));
            }
            runOnUiThread(() -> {
                if (isDestroyed()) return;
                rows.addAll(found);
                adapter.notifyDataSetChanged();
                if (found.isEmpty()) empty.setText(DrawerApps.text("Geen auto-apps gevonden", "No car apps found"));
            });
        }, "gearslip-drawer-apps").start();
    }

    @Override
    protected void onPause() {
        super.onPause();
        if (!changed) return;
        changed = false;
        // A rescan republishes the tile list, so a drawer that's already on the car screen redraws.
        Context app = getApplicationContext();
        new Thread(() -> DrawerApps.scan(app), "gearslip-drawer-refresh").start();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() != android.R.id.home) return super.onOptionsItemSelected(item);
        finish();
        return true;
    }

    private void toggle(Row row) {
        DrawerApps.setHidden(this, row.id, !DrawerApps.isHidden(this, row.id));
        changed = true;
        adapter.notifyDataSetChanged();
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics()));
    }

    private int themeColor(int attribute) {
        TypedArray values = obtainStyledAttributes(new int[]{attribute});
        int color = values.getColor(0, Color.BLACK);
        values.recycle();
        return color;
    }

    private final class Adapter extends BaseAdapter {
        @Override
        public int getCount() {
            return rows.size();
        }

        @Override
        public Row getItem(int position) {
            return rows.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View reused, ViewGroup parent) {
            LinearLayout line = reused instanceof LinearLayout ? (LinearLayout) reused : newLine();
            Row row = rows.get(position);
            ImageView icon = (ImageView) line.getChildAt(0);
            if (row.icon == null) icon.setImageDrawable(null);
            else icon.setImageBitmap(row.icon);
            ((TextView) line.getChildAt(1)).setText(row.label);
            CheckBox box = (CheckBox) line.getChildAt(2);
            box.setChecked(!DrawerApps.isHidden(DrawerAppsActivity.this, row.id));
            box.setContentDescription(row.label);
            return line;
        }

        private LinearLayout newLine() {
            LinearLayout line = new LinearLayout(DrawerAppsActivity.this);
            line.setGravity(Gravity.CENTER_VERTICAL);
            line.setMinimumHeight(dp(64));
            line.setPadding(dp(20), dp(8), dp(12), dp(8));

            ImageView icon = new ImageView(DrawerAppsActivity.this);
            line.addView(icon, new LinearLayout.LayoutParams(dp(40), dp(40)));

            TextView label = new TextView(DrawerAppsActivity.this);
            label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            label.setTextColor(themeColor(android.R.attr.textColorPrimary));
            label.setPadding(dp(16), 0, dp(8), 0);
            line.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));

            // The whole row takes the tap, so the box only shows the state.
            CheckBox box = new CheckBox(DrawerAppsActivity.this);
            box.setClickable(false);
            box.setFocusable(false);
            line.addView(box);
            return line;
        }
    }
}
