package local.wazemaps.badges;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.Gravity;
import android.view.View;
import android.widget.*;

/** A local cosmetic preference. No profile requests or account data are changed. */
public final class BadgeSelector {
    private static final String PREFS = "morphe_badge_appearance";
    private static final String ROW_TAG = "morphe_badge_selector_row";
    private static final int[] VALUES = {-2, -1, 0, 1, 2, 3, 6};
    private static final String[] LABELS = {"Automatic (account badge)", "No badge", "Crown", "Sword", "Shield", "Map editor", "Wings"};
    private static final String[] DRAWABLES = {"crown", "sword", "shield", "edit", null, null, "wings"};
    private static int resource(Context context, String type, String name) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }
    public static int selection(Context context) {
        int value = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getInt("badge", -2);
        for (int allowed : VALUES) if (value == allowed && available(context, value)) return value;
        return -2;
    }
    public static boolean available(Context context, int value) {
        return value == -2 || value == -1 || (value >= 0 && value < DRAWABLES.length &&
            DRAWABLES[value] != null && resource(context, "drawable", DRAWABLES[value]) != 0);
    }
    public static Drawable drawable(Context context, int value) {
        if (value < 0 || value >= DRAWABLES.length || DRAWABLES[value] == null) return null;
        int id = resource(context, "drawable", DRAWABLES[value]);
        return id == 0 ? null : context.getDrawable(id);
    }
    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
    private static int selectedPosition(Context context) {
        int selected = selection(context);
        for (int i = 0; i < VALUES.length; i++) if (VALUES[i] == selected) return i;
        return 0;
    }
    public static void install(Activity activity) {
        View listView = activity.findViewById(resource(activity, "id", "moodList"));
        if (listView == null || !(listView.getParent() instanceof RelativeLayout)) return;
        RelativeLayout parent = (RelativeLayout) listView.getParent();
        if (parent.findViewWithTag(ROW_TAG) != null) return;

        LinearLayout row = new LinearLayout(activity);
        row.setId(View.generateViewId());
        row.setTag(ROW_TAG);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(activity, 20), dp(activity, 12), dp(activity, 20), dp(activity, 12));
        row.setMinimumHeight(dp(activity, 76));
        row.setClickable(true);
        row.setFocusable(true);
        android.util.TypedValue background = new android.util.TypedValue();
        activity.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, background, true);
        if (background.resourceId != 0) row.setBackgroundResource(background.resourceId);

        LinearLayout text = new LinearLayout(activity);
        text.setOrientation(LinearLayout.VERTICAL);
        TextView title = new TextView(activity);
        title.setTextSize(16);
        TextView subtitle = new TextView(activity);
        subtitle.setTextSize(12);
        subtitle.setText("Only visible on this phone");
        subtitle.setAlpha(0.75f);
        text.addView(title);
        text.addView(subtitle);
        row.addView(text, new LinearLayout.LayoutParams(0, -2, 1));
        ImageView preview = new ImageView(activity);
        preview.setScaleType(ImageView.ScaleType.FIT_CENTER);
        preview.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.addView(preview, new LinearLayout.LayoutParams(dp(activity, 52), dp(activity, 52)));
        Runnable update = () -> {
            String label = LABELS[selectedPosition(activity)];
            title.setText("Badge appearance: " + label);
            row.setContentDescription("Badge appearance: " + label + ". Only visible on this phone. Change badge");
            preview.setImageDrawable(drawable(activity, selection(activity)));
        };
        update.run();
        row.setOnClickListener(view -> {
            java.util.List<String> labels = new java.util.ArrayList<>();
            java.util.List<Integer> values = new java.util.ArrayList<>();
            for (int i = 0; i < VALUES.length; i++) if (available(activity, VALUES[i])) {
                labels.add(LABELS[i]); values.add(VALUES[i]);
            }
            new AlertDialog.Builder(activity).setTitle("Badge appearance")
            .setSingleChoiceItems(labels.toArray(new String[0]), values.indexOf(selection(activity)), (dialog, position) -> {
                activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().putInt("badge", values.get(position)).apply();
                activity.setResult(4);
                update.run();
                dialog.dismiss();
            }).setNegativeButton("Cancel", null).show();
        });

        RelativeLayout.LayoutParams rowParams = new RelativeLayout.LayoutParams(-1, -2);
        int header = resource(activity, "id", "headerView");
        if (header != 0) rowParams.addRule(RelativeLayout.BELOW, header);
        parent.addView(row, rowParams);
        RelativeLayout.LayoutParams listParams = (RelativeLayout.LayoutParams) listView.getLayoutParams();
        listParams.addRule(RelativeLayout.BELOW, row.getId());
        listView.setLayoutParams(listParams);
    }
}
