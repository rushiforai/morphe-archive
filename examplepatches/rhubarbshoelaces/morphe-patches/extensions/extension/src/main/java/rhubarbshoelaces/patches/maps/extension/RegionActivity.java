package rhubarbshoelaces.patches.maps.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

public final class RegionActivity extends Activity {

    private static final int BG = 0xFFFFFFFF, TEXT = 0xFF1B1B1F, SUMMARY = 0xFF5F6368;
    private static final int BG_D = 0xFF131314, TEXT_D = 0xFFE3E3E3, SUMMARY_D = 0xFFC4C7C5;
    private boolean dark;

    private int bg() { return dark ? BG_D : BG; }
    private int text() { return dark ? TEXT_D : TEXT; }
    private int summary() { return dark ? SUMMARY_D : SUMMARY; }

    private String initialRegion;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        SharedPreferences prefs = getSharedPreferences("ungoogled_prefs", MODE_PRIVATE);
        initialRegion = prefs.getString("forced_region", "OFF");

        // --- TASKER / ADB DIRECT INTENT EXTRA HANDLER ---
        Intent incomingIntent = getIntent();
        if (incomingIntent != null && incomingIntent.hasExtra("region")) {
            String targetRegion = incomingIntent.getStringExtra("region");
            if (targetRegion != null && !targetRegion.trim().isEmpty()) {
                targetRegion = targetRegion.trim().toUpperCase(Locale.ROOT);
                if (!targetRegion.equalsIgnoreCase(initialRegion)) {
                    prefs.edit().putString("forced_region", targetRegion).apply();

                    Toast.makeText(getApplicationContext(), "Setting region to " + targetRegion + "...", Toast.LENGTH_SHORT).show();
                    getSharedPreferences("settings_preference", MODE_PRIVATE).edit().remove("dark_mode").apply();

                    new Handler(Looper.getMainLooper()).postDelayed(() -> {
                        Intent launchIntent = getPackageManager().getLaunchIntentForPackage(getPackageName());
                        if (launchIntent != null) {
                            launchIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                            startActivity(launchIntent);
                        }
                        Runtime.getRuntime().exit(0);
                    }, 600);
                }
                finish(); // Close activity immediately without drawing UI
                return;
            }
        }

        // Calculate Dark Mode
        String darkMode = getSharedPreferences("settings_preference", MODE_PRIVATE).getString("dark_mode", "FOLLOW_SYSTEM");
        boolean systemNight = (getResources().getConfiguration().uiMode & android.content.res.Configuration.UI_MODE_NIGHT_MASK) == android.content.res.Configuration.UI_MODE_NIGHT_YES;
        dark = "ON".equals(darkMode) || (!"OFF".equals(darkMode) && systemNight);

        setTitle("Cartographic Region");
        if (getActionBar() != null) getActionBar().hide();

        getWindow().getDecorView().setBackgroundColor(bg());
        getWindow().setStatusBarColor(bg());
        getWindow().setNavigationBarColor(bg());

        // Root Layout
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(bg());
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            android.graphics.Insets sb = insets.getInsets(WindowInsets.Type.systemBars());
            v.setPadding(sb.left, sb.top, sb.right, sb.bottom);
            return insets;
        });

        // 1. Header View
        FrameLayout header = new FrameLayout(this);
        header.setPadding(dp(20), dp(20), dp(20), dp(12));

        TextView title = new TextView(this);
        title.setText("Cartographic Region");
        title.setTextColor(text());
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        title.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
        header.addView(title, new FrameLayout.LayoutParams(-2, -2, Gravity.START | Gravity.CENTER_VERTICAL));

        ImageView close = new ImageView(this);
        int closeRes = getResources().getIdentifier("gs_close_vd_theme_24", "drawable", getPackageName());
        close.setImageResource(closeRes != 0 ? closeRes : android.R.drawable.ic_menu_close_clear_cancel);
        close.setColorFilter(text());
        close.setContentDescription(getString(android.R.string.cancel));
        close.setOnClickListener(v -> finish());
        header.addView(close, new FrameLayout.LayoutParams(dp(24), dp(24), Gravity.END | Gravity.CENTER_VERTICAL));
        root.addView(header);

        // 2. Master List Setup
        List<CountryItem> allItems = new ArrayList<>();
        allItems.add(new CountryItem("OFF", "System Default (Unmodified)"));

        for (String code : Locale.getISOCountries()) {
            String name = new Locale("", code).getDisplayCountry();
            if (name != null && !name.trim().isEmpty()) {
                allItems.add(new CountryItem(code, name + " (" + code + ")"));
            }
        }

        if (allItems.size() > 1) {
            Collections.sort(allItems.subList(1, allItems.size()), (o1, o2) -> o1.displayName.compareToIgnoreCase(o2.displayName));
        }

        List<CountryItem> filteredItems = new ArrayList<>(allItems);
        List<String> displayNames = new ArrayList<>();
        for (CountryItem item : filteredItems) displayNames.add(item.displayName);

        // 3. Body View
        LinearLayout body = new LinearLayout(this);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(dp(20), dp(4), dp(20), dp(16));

        EditText searchBox = new EditText(this);
        searchBox.setHint("Search...");
        searchBox.setSingleLine(true);
        searchBox.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        searchBox.setTextColor(text());
        searchBox.setHintTextColor(summary());
        searchBox.setPadding(dp(12), dp(12), dp(12), dp(12));
        body.addView(searchBox, new LinearLayout.LayoutParams(-1, -2));

        ListView listView = new ListView(this);
        listView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
        listView.setDivider(null);

        ArrayAdapter<String> adapter = new ArrayAdapter<>(
                this,
                android.R.layout.simple_list_item_single_choice,
                displayNames
        );
        listView.setAdapter(adapter);

        int initialSelection = getSelectedIndex(filteredItems, initialRegion);
        if (initialSelection != -1) {
            listView.setItemChecked(initialSelection, true);
            listView.setSelection(initialSelection);
        }

        body.addView(listView, new LinearLayout.LayoutParams(-1, -1));

        // 4. Live Search Filtering
        searchBox.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                String query = s.toString().trim().toLowerCase(Locale.ROOT);
                filteredItems.clear();
                displayNames.clear();

                for (CountryItem item : allItems) {
                    if (query.isEmpty() || item.displayName.toLowerCase(Locale.ROOT).contains(query) || item.code.toLowerCase(Locale.ROOT).contains(query)) {
                        filteredItems.add(item);
                        displayNames.add(item.displayName);
                    }
                }

                adapter.notifyDataSetChanged();

                String current = prefs.getString("forced_region", "OFF");
                int checkedIdx = getSelectedIndex(filteredItems, current);
                if (checkedIdx != -1) {
                    listView.setItemChecked(checkedIdx, true);
                } else {
                    listView.clearChoices();
                }
            }

            @Override public void afterTextChanged(Editable s) {}
        });

        // 5. Instant Tap Selection Listener
        listView.setOnItemClickListener((parent, view, position, id) -> {
            if (position < filteredItems.size()) {
                String chosenCode = filteredItems.get(position).code;
                prefs.edit().putString("forced_region", chosenCode).apply();
                finish(); // Saves selection & closes immediately
            }
        });

        root.addView(body, new LinearLayout.LayoutParams(-1, -1));
        setContentView(root);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        SharedPreferences prefs = getSharedPreferences("ungoogled_prefs", MODE_PRIVATE);
        String currentRegion = prefs.getString("forced_region", "OFF");

        if (isFinishing() && initialRegion != null && !initialRegion.equalsIgnoreCase(currentRegion)) {
            Context app = getApplicationContext();
            Toast.makeText(app, "Restarting Maps to apply region...", Toast.LENGTH_SHORT).show();

            getSharedPreferences("settings_preference", MODE_PRIVATE).edit().remove("dark_mode").apply();

            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                Intent intent = app.getPackageManager().getLaunchIntentForPackage(app.getPackageName());
                if (intent != null) {
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                    app.startActivity(intent);
                }
                Runtime.getRuntime().exit(0);
            }, 600);
        }
    }

    private int getSelectedIndex(List<CountryItem> list, String code) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).code.equalsIgnoreCase(code)) return i;
        }
        return -1;
    }

    private int dp(int v) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, getResources().getDisplayMetrics());
    }

    public static void addRegionRow(Activity customizationActivity) {
        try {
            ViewGroup root = (ViewGroup) customizationActivity.findViewById(android.R.id.content);
            if (root != null && root.getChildCount() > 0) {
                ViewGroup mainLayout = (ViewGroup) root.getChildAt(0);

                for (int i = 0; i < mainLayout.getChildCount(); i++) {
                    View child = mainLayout.getChildAt(i);
                    if (child instanceof ScrollView) {
                        ScrollView sv = (ScrollView) child;
                        if (sv.getChildCount() > 0 && sv.getChildAt(0) instanceof LinearLayout) {
                            LinearLayout body = (LinearLayout) sv.getChildAt(0);

                            // Calculate Dark Mode directly
                            SharedPreferences settingsPrefs = customizationActivity.getSharedPreferences("settings_preference", Context.MODE_PRIVATE);
                            String darkMode = settingsPrefs.getString("dark_mode", "FOLLOW_SYSTEM");
                            boolean systemNight = (customizationActivity.getResources().getConfiguration().uiMode & android.content.res.Configuration.UI_MODE_NIGHT_MASK) == android.content.res.Configuration.UI_MODE_NIGHT_YES;
                            boolean isDark = "ON".equals(darkMode) || (!"OFF".equals(darkMode) && systemNight);

                            int titleColor = isDark ? 0xFFE3E3E3 : 0xFF1B1B1F;
                            int subtitleColor = isDark ? 0xFFC4C7C5 : 0xFF5F6368;

                            LinearLayout rowLayout = new LinearLayout(customizationActivity);
                            rowLayout.setOrientation(LinearLayout.VERTICAL);
                            rowLayout.setPadding(dp(customizationActivity, 20), dp(customizationActivity, 14), dp(customizationActivity, 20), dp(customizationActivity, 14));
                            rowLayout.setClickable(true);
                            rowLayout.setFocusable(true);

                            TypedValue outValue = new TypedValue();
                            customizationActivity.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, outValue, true);
                            rowLayout.setBackgroundResource(outValue.resourceId);

                            TextView title = new TextView(customizationActivity);
                            title.setText("Cartographic Region");
                            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
                            title.setTextColor(titleColor);

                            SharedPreferences prefs = customizationActivity.getSharedPreferences("ungoogled_prefs", Context.MODE_PRIVATE);
                            String currentCode = prefs.getString("forced_region", "OFF");
                            String subtitleText = "OFF".equalsIgnoreCase(currentCode)
                                    ? "Off"
                                    : new Locale("", currentCode).getDisplayCountry() + " (" + currentCode + ")";

                            TextView subtitle = new TextView(customizationActivity);
                            subtitle.setText(subtitleText);
                            subtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                            subtitle.setTextColor(subtitleColor);
                            subtitle.setPadding(0, dp(customizationActivity, 2), 0, 0);

                            rowLayout.addView(title);
                            rowLayout.addView(subtitle);

                            rowLayout.setOnClickListener(v -> {
                                Intent intent = new Intent(customizationActivity, RegionActivity.class);
                                customizationActivity.startActivity(intent);
                            });

                            body.addView(rowLayout);
                            break;
                        }
                    }
                }
            }
        } catch (Exception ignored) {}
    }

    private static int dp(Context context, int value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics());
    }

    private static class CountryItem {
        final String code;
        final String displayName;

        CountryItem(String code, String displayName) {
            this.code = code;
            this.displayName = displayName;
        }
    }

    public static String getForcedRegion(String original) {
        try {
            android.app.Application app = (android.app.Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);

            if (app != null) {
                SharedPreferences prefs = app.getSharedPreferences("ungoogled_prefs", Context.MODE_PRIVATE);
                String region = prefs.getString("forced_region", "OFF");
                if (region != null && !"OFF".equalsIgnoreCase(region)) {
                    return region;
                }
            }
        } catch (Exception ignored) {}
        return original;
    }
}