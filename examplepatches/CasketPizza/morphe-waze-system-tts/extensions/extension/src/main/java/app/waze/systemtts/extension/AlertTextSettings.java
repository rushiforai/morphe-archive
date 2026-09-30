package app.waze.systemtts.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.SharedPreferences;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.InputType;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/** Edits recognized static phrases; shared wording intentionally shares an override. */
final class AlertTextSettings {
    static void show(Activity activity, PromptTextCatalog catalog) {
        LinearLayout layout = layout(activity);
        TextView note = new TextView(activity);
        note.setText("Choose an alert to change its spoken text. Alerts with identical default wording share an override. Only recognized static phrases are listed; sound effects and dynamic messages are unchanged.");
        layout.addView(note);
        EditText search = new EditText(activity);
        search.setSingleLine(true);
        search.setHint("Search alerts");
        layout.addView(search);
        ListView list = new ListView(activity);
        layout.addView(list, new LinearLayout.LayoutParams(-1, (int) (320 * activity.getResources().getDisplayMetrics().density)));
        List<Map.Entry<String, String>> entries = new ArrayList<>(catalog.alerts().entrySet());
        entries.sort((a, b) -> a.getValue().compareToIgnoreCase(b.getValue()));
        List<Map.Entry<String, String>> visible = new ArrayList<>();
        ArrayAdapter<String> adapter = new ArrayAdapter<>(activity, android.R.layout.simple_list_item_1);
        list.setAdapter(adapter);
        Runnable filter = () -> {
            String query = search.getText().toString().toLowerCase(Locale.ROOT);
            visible.clear();
            adapter.clear();
            for (Map.Entry<String, String> entry : entries) {
                if ((entry.getKey() + " " + entry.getValue()).toLowerCase(Locale.ROOT).contains(query)) {
                    visible.add(entry);
                    adapter.add(entry.getValue());
                }
            }
        };
        search.addTextChangedListener(new TextWatcher() {
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            public void onTextChanged(CharSequence s, int start, int before, int count) { filter.run(); }
            public void afterTextChanged(Editable value) {}
        });
        filter.run();
        list.setOnItemClickListener((parent, view, position, id) -> edit(activity, visible.get(position)));
        new AlertDialog.Builder(activity).setTitle("Customize alert text").setView(layout)
                .setNegativeButton("Close", null).show();
    }

    private static void edit(Activity activity, Map.Entry<String, String> entry) {
        SharedPreferences preferences = activity.getSharedPreferences("system_tts_alerts", 0);
        LinearLayout layout = layout(activity);
        TextView defaults = new TextView(activity);
        defaults.setText("Default: " + entry.getValue() + "\n\nEnter what Android TTS should say (up to 1,000 characters):");
        layout.addView(defaults);
        EditText input = new EditText(activity);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
        input.setMinLines(3);
        input.setMaxLines(6);
        input.setText(preferences.getString(entry.getKey(), entry.getValue()));
        layout.addView(input);
        AlertDialog dialog = new AlertDialog.Builder(activity).setTitle("Alert text").setView(layout)
                .setPositiveButton("Save", null)
                .setNeutralButton("Reset to default", (d, which) -> preferences.edit().remove(entry.getKey()).apply())
                .setNegativeButton("Cancel", null).create();
        dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            String text = input.getText().toString().trim();
            if (text.isEmpty() || text.length() > 1000) {
                input.setError("Enter between 1 and 1,000 characters");
                return;
            }
            preferences.edit().putString(entry.getKey(), text).apply();
            dialog.dismiss();
        }));
        dialog.show();
    }

    private static LinearLayout layout(Activity activity) {
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int padding = (int) (20 * activity.getResources().getDisplayMetrics().density);
        layout.setPadding(padding, padding, padding, padding);
        return layout;
    }
}
