package dev.alastorkaneki.morphe.extension.operagx.icons;

import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.GridLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/** Native selector for all 56 launcher icons from Opera Software's GX Icon Pack. */
public final class GxIconPackActivity extends Activity {
    private static final int BACKGROUND = 0xFF0E0A13;
    private static final int SURFACE = 0xFF1A1422;
    private static final int SURFACE_SELECTED = 0xFF2A1532;
    private static final int TEXT = 0xFFF8F4FB;
    private static final int MUTED = 0xFFB9AFC3;
    private static final int ACCENT = 0xFFFF2E93;

    private LinearLayout content;
    private int columns;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().setStatusBarColor(BACKGROUND);
        getWindow().setNavigationBarColor(BACKGROUND);
        columns = getResources().getConfiguration().screenWidthDp >= 600 ? 5 : 3;
        buildUi();
        GxIconPackInitProvider.publishShortcut(this);
    }

    private void buildUi() {
        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(BACKGROUND);

        content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(18), dp(18), dp(18), dp(32));
        scroll.addView(content, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        content.addView(text("GX Icon Pack", 28, TEXT, true));

        TextView subtitle = text(
                "Choose the real Opera GX launcher icon. Reopen this screen by long-pressing the Opera GX icon and selecting GX Icon Pack.",
                14,
                MUTED,
                false
        );
        LinearLayout.LayoutParams subtitleParams = wrapParams();
        subtitleParams.topMargin = dp(6);
        subtitleParams.bottomMargin = dp(18);
        content.addView(subtitle, subtitleParams);

        addDefaultCard();
        String currentGroup = "";
        GridLayout grid = null;
        for (GxIconPackRegistry.Entry entry : GxIconPackRegistry.entries(this)) {
            if (!entry.group.equals(currentGroup)) {
                currentGroup = entry.group;
                addSectionTitle(entry.group);
                grid = new GridLayout(this);
                grid.setColumnCount(columns);
                content.addView(grid, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT
                ));
            }
            addIconCard(grid, entry);
        }

        setContentView(scroll);
    }

    private void addDefaultCard() {
        LinearLayout card = card(GxIconPackRegistry.DEFAULT_ALIAS.equals(
                GxIconPackRegistry.selectedAlias(this)));
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setPadding(dp(16), dp(12), dp(16), dp(12));

        ImageView image = new ImageView(this);
        image.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        try {
            ApplicationInfo info = getApplicationInfo();
            image.setImageResource(info.icon);
        } catch (Throwable ignored) { }
        card.addView(image, new LinearLayout.LayoutParams(dp(54), dp(54)));

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams labelsParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelsParams.leftMargin = dp(14);
        card.addView(labels, labelsParams);
        labels.addView(text("Default Opera GX", 16, TEXT, true));
        labels.addView(text("Restore the icon bundled with the APK", 13, MUTED, false));

        card.setOnClickListener(v -> apply(
                GxIconPackRegistry.DEFAULT_ALIAS, "Default Opera GX"));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        params.bottomMargin = dp(10);
        content.addView(card, params);
    }

    private void addSectionTitle(String label) {
        TextView title = text(label, 19, TEXT, true);
        LinearLayout.LayoutParams params = wrapParams();
        params.topMargin = dp(18);
        params.bottomMargin = dp(8);
        content.addView(title, params);
    }

    private void addIconCard(GridLayout grid, GxIconPackRegistry.Entry entry) {
        String alias = entry.alias;
        boolean selected = alias.equals(GxIconPackRegistry.selectedAlias(this));
        LinearLayout card = card(selected);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setGravity(Gravity.CENTER_HORIZONTAL);
        card.setPadding(dp(8), dp(10), dp(8), dp(10));

        ImageView image = new ImageView(this);
        image.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        int id = getResources().getIdentifier(
                entry.resourceName,
                "drawable",
                getPackageName()
        );
        if (id != 0) image.setImageResource(id);
        card.addView(image, new LinearLayout.LayoutParams(dp(70), dp(70)));

        TextView label = text(entry.name, 12, TEXT, false);
        label.setGravity(Gravity.CENTER);
        label.setMaxLines(2);
        LinearLayout.LayoutParams labelParams = wrapParams();
        labelParams.topMargin = dp(6);
        card.addView(label, labelParams);

        card.setOnClickListener(v -> apply(alias, entry.name));

        GridLayout.LayoutParams params = new GridLayout.LayoutParams();
        params.width = 0;
        params.height = ViewGroup.LayoutParams.WRAP_CONTENT;
        params.columnSpec = GridLayout.spec(GridLayout.UNDEFINED, 1f);
        params.setMargins(dp(4), dp(4), dp(4), dp(4));
        grid.addView(card, params);
    }

    private void apply(String alias, String label) {
        try {
            GxIconPackRegistry.applySelection(this, alias);
            Toast.makeText(
                    this,
                    label + " selected. Your launcher may take a few seconds to refresh.",
                    Toast.LENGTH_LONG
            ).show();
            buildUi();
        } catch (Throwable error) {
            Toast.makeText(this,
                    "Could not change icon: " + error.getMessage(),
                    Toast.LENGTH_LONG).show();
        }
    }

    private LinearLayout card(boolean selected) {
        LinearLayout view = new LinearLayout(this);
        GradientDrawable background = new GradientDrawable();
        background.setColor(selected ? SURFACE_SELECTED : SURFACE);
        background.setCornerRadius(dp(18));
        background.setStroke(dp(selected ? 2 : 1),
                selected ? ACCENT : 0xFF3B3145);
        view.setBackground(background);
        view.setClickable(true);
        view.setFocusable(true);
        view.setElevation(dp(selected ? 5 : 1));
        return view;
    }

    private TextView text(String value, int sp, int color, boolean bold) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(sp);
        view.setTextColor(color);
        view.setLineSpacing(0f, 1.08f);
        if (bold) view.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        return view;
    }

    private LinearLayout.LayoutParams wrapParams() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
