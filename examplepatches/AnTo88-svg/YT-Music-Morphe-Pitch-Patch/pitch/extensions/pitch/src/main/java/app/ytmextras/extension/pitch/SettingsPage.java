package app.ytmextras.extension.pitch;

import android.app.Activity;
import android.graphics.Color;
import android.util.TypedValue;
import android.view.Gravity;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

/**
 * A dark page with a title and rows of switches, in the style of the Morphe settings.
 */
final class SettingsPage {

    private static final int ROW_HEIGHT_DP = 56;
    private static final int PADDING_DP = 18;
    private static final int TITLE_SIZE_SP = 22;
    private static final int TEXT_SIZE_SP = 16;

    private final Activity activity;
    private final LinearLayout page;

    SettingsPage(Activity activity, String title) {
        this.activity = activity;

        activity.getWindow().setStatusBarColor(Color.BLACK);
        activity.getWindow().setNavigationBarColor(Color.BLACK);

        page = new LinearLayout(activity);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(Color.BLACK);
        // The app targets a version of Android that draws below the system bars.
        page.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(0, insets.getSystemWindowInsetTop(), 0, insets.getSystemWindowInsetBottom());
            return insets;
        });

        TextView back = text("←", TITLE_SIZE_SP);
        back.setOnClickListener(view -> activity.finish());

        TextView heading = text(title, TITLE_SIZE_SP);

        LinearLayout header = row();
        header.addView(back);
        header.addView(heading, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        ((LinearLayout.LayoutParams) heading.getLayoutParams()).setMarginStart(dp(PADDING_DP));
        page.addView(header);

        activity.setContentView(page);
    }

    Switch addSwitch(String title) {
        Switch toggle = new Switch(activity);

        LinearLayout row = row();
        row.addView(text(title, TEXT_SIZE_SP),
                new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(toggle);
        row.setOnClickListener(view -> toggle.toggle());
        page.addView(row);

        return toggle;
    }

    private LinearLayout row() {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(ROW_HEIGHT_DP));
        row.setPadding(dp(PADDING_DP), 0, dp(PADDING_DP), 0);
        return row;
    }

    private TextView text(String value, int size) {
        TextView view = new TextView(activity);
        view.setText(value);
        view.setTextColor(Color.WHITE);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, size);
        return view;
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, activity.getResources().getDisplayMetrics()));
    }
}
