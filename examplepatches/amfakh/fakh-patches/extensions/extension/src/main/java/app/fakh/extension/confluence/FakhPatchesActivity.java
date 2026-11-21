package app.fakh.extension.confluence;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import app.fakh.extension.shared.I18n;
import app.fakh.extension.shared.RestartBar;

/**
 * The Fakh Patches page, opened from the row that takes the place of "Rate us" in Confluence's Account screen. Its
 * header, section title and rows follow the Account screen's: a centered title, an uppercase gray section title, and
 * large labels with a switch at the end.
 */
public final class FakhPatchesActivity extends Activity {
    private float density;
    private int textPrimary;
    private int textSecondary;
    private int accent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        density = getResources().getDisplayMetrics().density;
        boolean night = app.fakh.extension.shared.MaterialYou.night(this);
        // The Account screen's page color, as Material You and pitch black paint it.
        int canvas = MaterialYou.prop(night ? 0xFF1F1F21 : 0xFFFFFFFF);
        textPrimary = night ? 0xFFCECFD2 : 0xFF292A2E;
        textSecondary = night ? 0xFFA9ABAF : 0xFF505258;
        accent = app.fakh.extension.shared.MaterialYou.accent(this, MaterialYou.materialYou(), 0xFF1868DB, 0xFF669DF1);

        Window window = getWindow();
        window.setStatusBarColor(canvas);
        window.setNavigationBarColor(canvas);
        window.getDecorView().setSystemUiVisibility(
                night ? 0 : View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);

        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(canvas);
        page.setFitsSystemWindows(true);
        page.addView(header());

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(0, 0, 0, dp(24));
        ScrollView scroll = new ScrollView(this);
        scroll.addView(content);
        page.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        setContentView(page);

        content.addView(sectionTitle("Appearance"));
        if (MaterialYou.isMaterialYouIncluded()) content.addView(row("Material You", MaterialYou.MATERIAL_YOU, null, true));
        if (MaterialYou.isPitchBlackIncluded()) content.addView(row("Pitch black", MaterialYou.PITCH_BLACK, null, true));
        if (GlassNavigationBar.isIncluded()) {
            content.addView(sectionTitle("Navigation bar"));
            content.addView(row("Liquid Glass navigation bar", MaterialYou.GLASS, null, true));
            content.addView(row("Background blur", MaterialYou.LIQUID_GLASS,
                    "Blurs what's behind the glass. Uses more battery and might stutter.", false));
        }
    }

    /** A section's title, uppercase and gray like the Account screen's. */
    private TextView sectionTitle(String title) {
        TextView section = text(I18n.tr(title).toUpperCase(), 15, textSecondary);
        section.setPadding(dp(16), dp(24), dp(16), dp(8));
        return section;
    }

    /** The bar at the top: a back arrow and the page's title in the middle. */
    private View header() {
        FrameLayout bar = new FrameLayout(this);
        bar.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(64)));
        TextView title = text("Fakh Patches", 20, textPrimary);
        title.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        bar.addView(title, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        View back = new BackArrow(this, textPrimary);
        back.setContentDescription("Back");
        TypedValue ripple = new TypedValue();
        getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, ripple, true);
        back.setBackgroundResource(ripple.resourceId);
        back.setOnClickListener(view -> finish());
        bar.addView(back, new FrameLayout.LayoutParams(dp(48), dp(48), Gravity.CENTER_VERTICAL | Gravity.START));
        ((FrameLayout.LayoutParams) back.getLayoutParams()).leftMargin = dp(8);
        return bar;
    }

    /**
     * A row with the switch's label, the line under it when the label does not say what the switch costs, and the
     * switch; a change is saved at once and applies after a restart.
     */
    private View row(String label, String key, String subtitle, boolean on) {
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(14), dp(16), dp(14));
        LinearLayout texts = new LinearLayout(this);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.addView(text(I18n.tr(label), 18, textPrimary));
        if (subtitle != null) texts.addView(text(I18n.tr(subtitle), 14, textSecondary));
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        Switch toggle = new Switch(this);
        toggle.setChecked(MaterialYou.prefs(this).getBoolean(key, on));
        int[][] states = {{android.R.attr.state_checked}, {}};
        toggle.setThumbTintList(new ColorStateList(states, new int[] {accent, 0xFFB9B9B9}));
        toggle.setTrackTintList(new ColorStateList(states, new int[] {accent & 0x66FFFFFF, 0x66808080}));
        toggle.setOnCheckedChangeListener((view, checked) -> {
            MaterialYou.prefs(this).edit().putBoolean(key, checked).apply();
            RestartBar.show(this, 0, MaterialYou.materialYou());
        });
        row.addView(toggle);
        row.setOnClickListener(view -> toggle.toggle());
        return row;
    }

    private TextView text(String value, int sp, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        return view;
    }

    private int dp(int value) {
        return Math.round(value * density);
    }

    /** A left arrow in the header's text color, like the Account screen's own back arrows. */
    private static final class BackArrow extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        BackArrow(Context context, int color) {
            super(context);
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float unit = getWidth() / 48f;
            paint.setStrokeWidth(2.5f * unit);
            path.reset();
            path.moveTo(32 * unit, 24 * unit);
            path.lineTo(16 * unit, 24 * unit);
            path.moveTo(23 * unit, 17 * unit);
            path.lineTo(16 * unit, 24 * unit);
            path.lineTo(23 * unit, 31 * unit);
            canvas.drawPath(path, paint);
        }
    }
}
