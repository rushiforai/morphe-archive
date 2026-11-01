package nl.johninnl.wuplay;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.ViewGroup;
import android.view.KeyEvent;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import java.util.HashSet;
import java.util.Set;

/** Native, D-pad accessible selector; its preferences belong to the patched Wuplay APK. */
public final class CatalogSettingsActivity extends Activity {
    private TextView status;
    private Button save;
    private ListView list;
    private NativeCatalogs.Snapshot snapshot;

    @Override public void onCreate(Bundle state) {
        setTheme(android.R.style.Theme_Material_NoActionBar);
        super.onCreate(state);
        LinearLayout root = new LinearLayout(this); root.setOrientation(LinearLayout.VERTICAL);
        int padding = (int) (24 * getResources().getDisplayMetrics().density);
        root.setPadding(padding, padding, padding, padding); root.setBackgroundColor(Color.rgb(18, 22, 29));
        TextView title = new TextView(this); title.setText("Wuplay TV channels"); title.setTextSize(26); root.addView(title);
        status = new TextView(this); status.setTextSize(16); status.setPadding(0, padding / 2, 0, padding / 2);
        status.setText("Loading the default profile's catalogs…"); root.addView(status);
        list = new ListView(this); list.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);
        root.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        LinearLayout buttons = new LinearLayout(this);
        save = new Button(this); save.setText("Save and refresh"); save.setEnabled(false);
        list.setOnKeyListener((view, key, event) -> {
            if (key == KeyEvent.KEYCODE_DPAD_RIGHT && event.getAction() == KeyEvent.ACTION_DOWN) {
                save.requestFocus(); return true;
            }
            return false;
        });
        save.setOnClickListener(view -> save()); buttons.addView(save);
        Button open = new Button(this); open.setText("Open Wuplay");
        open.setOnClickListener(view -> startActivity(new Intent().setClassName(getPackageName(), "app.wuplay.androidtv.MainActivity")));
        buttons.addView(open);
        Button reload = new Button(this); reload.setText("Reload catalogs"); reload.setOnClickListener(view -> load()); buttons.addView(reload);
        root.addView(buttons); setContentView(root);
        if (CatalogChannels.supported(this)) load();
        else status.setText("Preview channels require Android TV 8 or later.");
    }

    private void load() {
        save.setEnabled(false);
        CatalogChannels.WORKER.execute(() -> {
            try {
                NativeCatalogs.Snapshot result = new NativeCatalogs(getApplication()).snapshot();
                runOnUiThread(() -> {
                    if (isFinishing() || isDestroyed()) return;
                    snapshot = result;
                    String[] titles = new String[result.definitions.size()];
                    Set<String> selected = CatalogChannels.selected(this);
                    for (int i = 0; i < titles.length; i++) {
                        NativeCatalogs.Definition definition = result.definitions.get(i);
                        titles[i] = definition.name + " · " + definition.source + " · " + definition.key.substring(definition.key.lastIndexOf('/') + 1);
                    }
                    list.setAdapter(new ArrayAdapter<>(this, android.R.layout.simple_list_item_multiple_choice, titles));
                    for (int i = 0; i < titles.length; i++) list.setItemChecked(i, selected.contains(result.definitions.get(i).key));
                    status.setText("Default profile: " + result.profileName + ". Select catalogs; press Right for actions. Refreshes on foreground entry and every 30 minutes while Wuplay is open.\n" +
                        CatalogChannels.preferences(this).getString("status", "Nothing published yet."));
                    save.setEnabled(true); if (titles.length > 0) list.requestFocus();
                });
            } catch (Exception | LinkageError failure) {
                runOnUiThread(() -> {
                    if (!isFinishing() && !isDestroyed()) status.setText(failure instanceof IllegalStateException ? failure.getMessage() : "Cannot load catalogs. Open Wuplay's default profile, then reload.");
                });
            }
        });
    }

    private void save() {
        if (snapshot == null) return;
        Set<String> selected = new HashSet<>();
        for (int i = 0; i < snapshot.definitions.size(); i++) if (list.isItemChecked(i)) selected.add(snapshot.definitions.get(i).key);
        CatalogChannels.preferences(this).edit().putStringSet("selected", selected).apply();
        save.setEnabled(false); status.setText("Refreshing selected channels…");
        CatalogChannels.WORKER.execute(() -> {
            String result = CatalogChannels.refresh(getApplication());
            runOnUiThread(() -> { if (!isFinishing() && !isDestroyed()) { status.setText(result); save.setEnabled(true); } });
        });
    }
}
