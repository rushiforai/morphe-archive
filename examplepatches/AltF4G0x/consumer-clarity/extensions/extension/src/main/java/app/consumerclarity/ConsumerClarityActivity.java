package app.consumerclarity;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public final class ConsumerClarityActivity extends Activity {
    private static final int BACKGROUND = Color.rgb(18, 19, 23);
    private static final int CARD = Color.rgb(30, 32, 38);
    private static final int TEXT = Color.rgb(244, 244, 246);
    private static final int MUTED = Color.rgb(174, 177, 186);
    private static final int ACCENT = Color.rgb(255, 90, 0);

    private SharedPreferences preferences;
    private LinearLayout content;
    private List<Entry> entries;
    private final Map<View, String> searchableRows = new HashMap<>();

    private static final class Entry {
        String key;
        String title;
        String description;
        String category;
        String kind;
        boolean initial;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        preferences = ConsumerClaritySettings.get(this);
        getWindow().setStatusBarColor(BACKGROUND);
        getWindow().setNavigationBarColor(BACKGROUND);

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(BACKGROUND);
        content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(36, 40, 36, 56);
        content.setBackgroundColor(BACKGROUND);
        scroll.addView(content, new ScrollView.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView eyebrow = text("CONSUMER CLARITY", 13, ACCENT);
        content.addView(eyebrow, margins(0, 0, 0, 8));
        content.addView(text("Choose what reaches you.", 28, TEXT), margins(0, 0, 0, 8));
        content.addView(text("Patch controls, privacy, discovery and diagnostics. Only patches selected in Morphe appear here.", 16, MUTED), margins(0, 0, 0, 28));

        entries = loadEntries();
        if (hasKey(entries, "settings_search")) addSearchBox();
        if (hasRuntime(entries, "Promotions") || hasKind(entries, "sorting")) {
            section("Quick setup");
            cardButton("Use Calm feed", "Hide sponsored entries and enable selected promotion controls.", view -> {
                preferences.edit().putInt("sponsored_mode", 1).apply();
                enableCategory(entries, "Promotions");
                recreate();
            });
        }
        if (hasRuntime(entries, "Privacy") || hasRuntime(entries, "Diagnostics")) {
            cardButton("Use Maximum privacy", "Enable selected analytics and diagnostic privacy switches.", view -> {
                enableCategory(entries, "Privacy");
                enableCategory(entries, "Diagnostics");
                recreate();
            });
        }

        Map<String, List<Entry>> categories = new LinkedHashMap<>();
        for (Entry entry : entries) {
            if (!categories.containsKey(entry.category)) categories.put(entry.category, new ArrayList<>());
            categories.get(entry.category).add(entry);
        }
        for (Map.Entry<String, List<Entry>> category : categories.entrySet()) {
            section(category.getKey());
            for (Entry entry : category.getValue()) {
                if (entry.kind.equals("sorting")) addSortingControls();
                else if (entry.kind.equals("restaurant_filter")) addRestaurantRatingFilter();
                else if (entry.kind.equals("review_filter")) addReviewFilters();
                else if (entry.kind.equals("preferred_language")) addPreferredLanguage();
                else if (entry.kind.equals("text_scale")) addTextScale();
                else if (entry.kind.equals("build")) addBuildRow(entry);
                else addRuntimeRow(entry);
            }
        }

        section("Settings tools");
        if (hasKey(entries, "settings_backup")) {
            cardButton("Export settings", "Save patch preferences as JSON without account or order data.", view -> exportSettings());
            cardButton("Import settings", "Restore patch preferences from a Consumer Clarity JSON backup.", view -> importSettings());
        }
        cardButton("Reset live switches", "Restore original app behavior for live hooks. Build-time changes require repatching without those patches.", view -> {
            for (Entry entry : entries) {
                if (entry.kind.equals("runtime")) preferences.edit().putBoolean(entry.key, false).apply();
            }
            preferences.edit().putInt("sponsored_mode", 2).putInt("review_sort_mode", 3).apply();
            recreate();
        });

        section("Developer information");
        TextView developer = text("Native hooks check app version and instruction bytes before activating. Server experiments are not safe universal switches. Build-time permission and component controls are fixed in the patched APK; live switches can be changed here.", 16, MUTED);
        developer.setPadding(24, 24, 24, 24);
        developer.setBackgroundColor(CARD);
        content.addView(developer, margins(0, 0, 0, 16));
        addLink("Talabat FAQ", "https://www.talabat.com/en/uae/faq?src=app&v=2");
        addLink("Talabat on Facebook", "https://www.facebook.com/talabat");
        addLink("Research and limitations", "https://github.com/AltF4G0x/consumer-clarity-research");
        addLink("Patch source and releases", "https://github.com/AltF4G0x/consumer-clarity/releases/latest");
        setContentView(scroll);
    }

    private List<Entry> loadEntries() {
        List<Entry> entries = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(
            getAssets().open("consumerclarity/settings.tsv"), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] fields = line.split("\\t", -1);
                if (fields.length != 6) continue;
                Entry entry = new Entry();
                entry.key = fields[0];
                entry.title = fields[1];
                entry.description = fields[2];
                entry.category = fields[3];
                entry.kind = fields[4];
                entry.initial = Boolean.parseBoolean(fields[5]);
                entries.add(entry);
            }
        } catch (Exception error) {
            section("Settings error");
            content.addView(text("The selected-patch catalog could not be read: " + error, 16, TEXT));
        }
        return entries;
    }

    private boolean hasRuntime(List<Entry> entries, String category) {
        for (Entry entry : entries) if (entry.kind.equals("runtime") && entry.category.equals(category)) return true;
        return false;
    }

    private boolean hasKind(List<Entry> entries, String kind) {
        for (Entry entry : entries) if (entry.kind.equals(kind)) return true;
        return false;
    }

    private boolean hasKey(List<Entry> entries, String key) {
        for (Entry entry : entries) if (entry.key.equals(key)) return true;
        return false;
    }

    private void addSearchBox() {
        EditText search = new EditText(this);
        search.setSingleLine(true);
        search.setInputType(android.text.InputType.TYPE_CLASS_TEXT |
            android.text.InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        search.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);
        search.setHint("Search settings");
        search.setHintTextColor(MUTED);
        search.setTextColor(TEXT);
        search.setPadding(24, 24, 24, 24);
        search.setBackgroundColor(CARD);
        content.addView(search, margins(0, 0, 0, 16));
        search.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence value, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence value, int start, int before, int count) {
                String query = value.toString().toLowerCase().trim();
                for (Map.Entry<View, String> row : searchableRows.entrySet()) {
                    row.getKey().setVisibility(row.getValue().contains(query) ? View.VISIBLE : View.GONE);
                }
            }
            @Override public void afterTextChanged(android.text.Editable value) {}
        });
    }

    private void registerSearchRow(View view, String title, String description, String category) {
        searchableRows.put(view, (title + " " + description + " " + category).toLowerCase());
    }

    private void enableCategory(List<Entry> entries, String category) {
        for (Entry entry : entries) {
            if (entry.kind.equals("runtime") && entry.category.equals(category)) {
                preferences.edit().putBoolean(entry.key, true).apply();
            }
        }
    }

    private void addSortingControls() {
        LinearLayout card = card();
        card.addView(text("Sponsored restaurants", 19, TEXT));
        Spinner sponsored = new Spinner(this);
        String[] sponsoredValues = {"Demote sponsored", "Hide sponsored", "Original order"};
        sponsored.setAdapter(new ArrayAdapter<>(this, android.R.layout.simple_spinner_dropdown_item, sponsoredValues));
        sponsored.setSelection(preferences.getInt("sponsored_mode", 0));
        sponsored.setOnItemSelectedListener(new SimpleSelectionListener() {
            @Override public void selected(int position) {
                preferences.edit().putInt("sponsored_mode", position).apply();
            }
        });
        card.addView(sponsored, margins(0, 8, 0, 24));
        card.addView(text("Review order", 19, TEXT));
        Spinner reviews = new Spinner(this);
        String[] reviewValues = {"Newest first", "Oldest first", "Highest rated", "Original order"};
        reviews.setAdapter(new ArrayAdapter<>(this, android.R.layout.simple_spinner_dropdown_item, reviewValues));
        reviews.setSelection(preferences.getInt("review_sort_mode", 0));
        reviews.setOnItemSelectedListener(new SimpleSelectionListener() {
            @Override public void selected(int position) {
                preferences.edit().putInt("review_sort_mode", position).apply();
            }
        });
        card.addView(reviews, margins(0, 8, 0, 0));
        content.addView(card, margins(0, 0, 0, 16));
        registerSearchRow(card, "Restaurant and review ordering", "Sponsored restaurants review order", "Discovery");
    }

    private void addRestaurantRatingFilter() {
        LinearLayout card = card();
        card.addView(text("Minimum restaurant rating", 19, TEXT));
        card.addView(text("Only show restaurants at or above the selected rating.", 14, MUTED), margins(0, 8, 0, 12));
        card.addView(ratingSpinner("restaurant_min_rating"));
        content.addView(card, margins(0, 0, 0, 16));
        registerSearchRow(card, "Restaurant rating filter", "Minimum restaurant rating", "Discovery");
    }

    private void addReviewFilters() {
        LinearLayout card = card();
        card.addView(text("Minimum review rating", 19, TEXT));
        card.addView(ratingSpinner("review_min_rating"), margins(0, 0, 0, 20));
        card.addView(text("Review content", 19, TEXT));
        String[] values = {"All reviews", "Reviews with text", "Reviews with a rating"};
        int[] stored = {0, 1, 2};
        card.addView(optionSpinner("review_content_mode", values, stored, 0));
        content.addView(card, margins(0, 0, 0, 16));
        registerSearchRow(card, "Review content filter", "Minimum rating reviews with text", "Discovery");
    }

    private Spinner ratingSpinner(String key) {
        String[] values = {"Any rating", "4.0+ stars", "4.5+ stars", "5.0 stars"};
        int[] stored = {0, 40, 45, 50};
        return optionSpinner(key, values, stored, 0);
    }

    private Spinner optionSpinner(String key, String[] values, int[] stored, int defaultIndex) {
        Spinner spinner = new Spinner(this);
        spinner.setAdapter(new ArrayAdapter<>(this, android.R.layout.simple_spinner_dropdown_item, values));
        int current = preferences.getInt(key, stored[defaultIndex]);
        int selection = defaultIndex;
        for (int index = 0; index < stored.length; index++) if (stored[index] == current) selection = index;
        spinner.setSelection(selection);
        spinner.setOnItemSelectedListener(new SimpleSelectionListener() {
            @Override public void selected(int position) {
                preferences.edit().putInt(key, stored[position]).apply();
            }
        });
        return spinner;
    }

    private void addPreferredLanguage() {
        LinearLayout card = card();
        card.addView(text("Preferred app language", 19, TEXT));
        String[] values = {"System default", "English", "العربية", "کوردی"};
        int[] stored = {0, 1, 2, 3};
        card.addView(optionSpinner("preferred_language", values, stored, 0));
        content.addView(card, margins(0, 0, 0, 16));
        registerSearchRow(card, "Preferred app language", "English Arabic Kurdish", "Accessibility");
    }

    private void addTextScale() {
        LinearLayout card = card();
        card.addView(text("Text size", 19, TEXT));
        String[] values = {"System default", "85%", "100%", "115%", "130%"};
        int[] stored = {0, 85, 100, 115, 130};
        card.addView(optionSpinner("text_scale", values, stored, 0));
        content.addView(card, margins(0, 0, 0, 16));
        registerSearchRow(card, "Text size", "Font scaling accessibility", "Accessibility");
    }

    private void addRuntimeRow(Entry entry) {
        LinearLayout card = card();
        card.addView(text(entry.title, 19, TEXT));
        card.addView(text(entry.description, 14, MUTED), margins(0, 8, 0, 12));
        Switch toggle = new Switch(this);
        toggle.setText("Enabled");
        toggle.setTextColor(TEXT);
        toggle.setChecked(preferences.getBoolean(entry.key, entry.initial));
        toggle.setOnCheckedChangeListener((button, checked) ->
            preferences.edit().putBoolean(entry.key, checked).apply());
        card.addView(toggle);
        content.addView(card, margins(0, 0, 0, 16));
        registerSearchRow(card, entry.title, entry.description, entry.category);
    }

    private void addBuildRow(Entry entry) {
        LinearLayout card = card();
        card.addView(text(entry.title, 19, TEXT));
        card.addView(text(entry.description, 14, MUTED), margins(0, 8, 0, 12));
        card.addView(text("APPLIED DURING PATCHING", 12, ACCENT));
        content.addView(card, margins(0, 0, 0, 16));
        registerSearchRow(card, entry.title, entry.description, entry.category);
    }

    private LinearLayout card() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(24, 24, 24, 24);
        card.setBackgroundColor(CARD);
        return card;
    }

    private TextView text(String value, int size, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        view.setLineSpacing(0, 1.15f);
        return view;
    }

    private void section(String title) {
        content.addView(text(title, 15, ACCENT), margins(0, 28, 0, 12));
    }

    private void cardButton(String title, String description, View.OnClickListener listener) {
        LinearLayout card = card();
        card.addView(text(title, 19, TEXT));
        card.addView(text(description, 14, MUTED), margins(0, 8, 0, 12));
        Button button = new Button(this);
        button.setText(title);
        button.setOnClickListener(listener);
        card.addView(button);
        content.addView(card, margins(0, 0, 0, 16));
    }

    private void exportSettings() {
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/json");
        intent.putExtra(Intent.EXTRA_TITLE, "consumer-clarity-settings.json");
        startActivityForResult(intent, 41);
    }

    private void importSettings() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/json");
        startActivityForResult(intent, 42);
    }

    private JSONObject settingsJson() throws Exception {
        JSONObject json = new JSONObject();
        for (Map.Entry<String, ?> entry : preferences.getAll().entrySet()) {
            Object value = entry.getValue();
            if (value instanceof Set) value = new org.json.JSONArray((Set<?>) value);
            json.put(entry.getKey(), value);
        }
        return json;
    }

    private String readAll(Uri uri) throws Exception {
        StringBuilder result = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(
            getContentResolver().openInputStream(uri), StandardCharsets.UTF_8))) {
            char[] buffer = new char[4096];
            int count;
            while ((count = reader.read(buffer)) >= 0) {
                result.append(buffer, 0, count);
                if (result.length() > 1024 * 1024) throw new IllegalArgumentException("Backup is too large");
            }
        }
        return result.toString();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
        try {
            Uri uri = data.getData();
            if (requestCode == 41) {
                try (OutputStream output = getContentResolver().openOutputStream(uri, "wt")) {
                    output.write(settingsJson().toString(2).getBytes(StandardCharsets.UTF_8));
                }
                Toast.makeText(this, "Settings exported", Toast.LENGTH_SHORT).show();
            } else if (requestCode == 42) {
                JSONObject json = new JSONObject(readAll(uri));
                SharedPreferences.Editor editor = preferences.edit().clear();
                Iterator<String> keys = json.keys();
                while (keys.hasNext()) {
                    String key = keys.next();
                    Object value = json.get(key);
                    if (value instanceof Boolean) editor.putBoolean(key, (Boolean) value);
                    else if (value instanceof Integer) editor.putInt(key, (Integer) value);
                    else if (value instanceof Long) editor.putLong(key, (Long) value);
                    else if (value instanceof Float || value instanceof Double) editor.putFloat(key, ((Number) value).floatValue());
                    else if (value instanceof String) editor.putString(key, (String) value);
                    else if (value instanceof org.json.JSONArray) {
                        org.json.JSONArray array = (org.json.JSONArray) value;
                        Set<String> values = new java.util.HashSet<>();
                        for (int index = 0; index < array.length(); index++) values.add(array.getString(index));
                        editor.putStringSet(key, values);
                    }
                }
                editor.apply();
                Toast.makeText(this, "Settings imported", Toast.LENGTH_SHORT).show();
                recreate();
            }
        } catch (Exception error) {
            Toast.makeText(this, "Settings transfer failed: " + error.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    private LinearLayout.LayoutParams margins(int left, int top, int right, int bottom) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.setMargins(left, top, right, bottom);
        return params;
    }

    private void addLink(String label, String url) {
        Button button = new Button(this);
        button.setText(label);
        button.setOnClickListener(view -> startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url))));
        content.addView(button, margins(0, 0, 0, 8));
    }

    private abstract static class SimpleSelectionListener implements android.widget.AdapterView.OnItemSelectedListener {
        @Override public void onItemSelected(android.widget.AdapterView<?> parent, View view, int position, long id) {
            selected(position);
        }
        @Override public void onNothingSelected(android.widget.AdapterView<?> parent) {}
        abstract void selected(int position);
    }
}
