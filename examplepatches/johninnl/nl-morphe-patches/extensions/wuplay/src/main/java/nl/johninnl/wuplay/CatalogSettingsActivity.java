package nl.johninnl.wuplay;

import android.app.Activity;
import android.content.ActivityNotFoundException;
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
import java.util.List;
import java.util.ArrayList;
import android.media.tv.TvContract;

/** Native, D-pad accessible selector; its preferences belong to the patched Wuplay APK. */
public final class CatalogSettingsActivity extends Activity {
    private TextView status;
    private Button save;
    private Button addToHome;
    private ListView list;
    private NativeCatalogs.Snapshot snapshot;
    private final List<Long> approvals = new ArrayList<>();
    private int approvalIndex;
    private boolean approvalInFlight;
    private static final int REQUEST_CHANNEL = 17439;

    @Override public void onCreate(Bundle state) {
        setTheme(android.R.style.Theme_Material_NoActionBar);
        super.onCreate(state);
        LinearLayout root = new LinearLayout(this); root.setOrientation(LinearLayout.VERTICAL);
        int padding = (int) (24 * getResources().getDisplayMetrics().density);
        root.setPadding(padding, padding, padding, padding); root.setBackgroundColor(Color.rgb(18, 22, 29));
        TextView title = new TextView(this); title.setText("TV channels · Home catalogs"); title.setTextSize(26); root.addView(title);
        status = new TextView(this); status.setTextSize(16); status.setPadding(0, padding / 2, 0, padding / 2);
        status.setText("Loading the default profile's Home catalogs…"); root.addView(status);
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
        addToHome = new Button(this); addToHome.setText("Add to TV Home"); addToHome.setEnabled(false);
        addToHome.setOnClickListener(view -> addToHome()); buttons.addView(addToHome);
        Button reload = new Button(this); reload.setText("Reload catalogs"); reload.setOnClickListener(view -> load()); buttons.addView(reload);
        Button done = new Button(this); done.setText("Done"); done.setOnClickListener(view -> finish()); buttons.addView(done);
        root.addView(buttons); setContentView(root);
        if (state != null) {
            long[] ids = state.getLongArray("channel_approvals");
            if (ids != null) for (long id : ids) approvals.add(id);
            approvalIndex = state.getInt("channel_approval_index", 0);
            approvalInFlight = state.getBoolean("channel_approval_pending", false);
        }
        if (CatalogChannels.supported(this)) load();
        else status.setText("Preview channels require Android TV 8 or later.");
    }

    private void load() {
        if (approvalInFlight) return;
        save.setEnabled(false); addToHome.setEnabled(false);
        if (!CatalogChannels.supported(this)) { status.setText("Preview channels require Android TV 8 or later."); return; }
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
                    status.setText("Home catalogs · " + result.profileName + ". Only checked catalogs are published. Press Right for actions.\n" +
                        "Save first; Add to TV Home asks your launcher to show the published channels.\n" +
                        CatalogChannels.preferences(this).getString("status", "Nothing published yet."));
                    save.setEnabled(true); addToHome.setEnabled(!selected.isEmpty()); if (titles.length > 0) list.requestFocus();
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
        Set<String> selected = checkedCatalogs();
        CatalogChannels.preferences(this).edit().putStringSet("selected", selected).apply();
        save.setEnabled(false); addToHome.setEnabled(false); status.setText("Refreshing selected Home channels…");
        CatalogChannels.WORKER.execute(() -> {
            String result = CatalogChannels.refresh(getApplication());
            runOnUiThread(() -> { if (!isFinishing() && !isDestroyed()) { status.setText(result); save.setEnabled(true); addToHome.setEnabled(!selected.isEmpty()); } });
        });
    }

    private Set<String> checkedCatalogs() {
        Set<String> selected = new HashSet<>();
        for (int i = 0; i < snapshot.definitions.size(); i++) if (list.isItemChecked(i)) selected.add(snapshot.definitions.get(i).key);
        return selected;
    }

    private void addToHome() {
        if (snapshot == null || approvalInFlight) return;
        if (!checkedCatalogs().equals(CatalogChannels.selected(this))) { status.setText("Save and refresh your selection first."); return; }
        save.setEnabled(false); addToHome.setEnabled(false);
        CatalogChannels.WORKER.execute(() -> {
            try {
                NativeCatalogs.Snapshot current = new NativeCatalogs(getApplication()).snapshot();
                Set<String> selected = CatalogChannels.selected(this), eligible = new HashSet<>();
                for (NativeCatalogs.Definition definition : current.definitions) if (selected.contains(definition.key)) eligible.add(definition.key);
                List<Long> ids = new CatalogPublisher(getApplication()).pendingBrowsable(eligible);
                runOnUiThread(() -> {
                    if (isFinishing() || isDestroyed()) return;
                    approvals.clear(); approvals.addAll(ids); approvalIndex = 0;
                    if (ids.isEmpty()) finishApproval("No additional published channels need approval. Save and refresh first if you changed the selection.");
                    else requestNextApproval();
                });
            } catch (Exception | LinkageError failure) {
                runOnUiThread(() -> { if (!isFinishing() && !isDestroyed()) finishApproval("Could not read published Home channels. Open the default profile and try again."); });
            }
        });
    }

    private void requestNextApproval() {
        if (isFinishing() || isDestroyed()) return;
        if (approvalIndex >= approvals.size()) { finishApproval("Channel approvals complete. Your launcher controls their Home-screen visibility."); return; }
        try {
            approvalInFlight = true;
            startActivityForResult(new Intent(TvContract.ACTION_REQUEST_CHANNEL_BROWSABLE)
                .putExtra(TvContract.EXTRA_CHANNEL_ID, approvals.get(approvalIndex).longValue()), REQUEST_CHANNEL);
        } catch (ActivityNotFoundException | SecurityException unsupported) {
            finishApproval("Channels are published. Enable them in your launcher's settings; this launcher does not offer Android's channel approval screen.");
        }
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != REQUEST_CHANNEL) return;
        approvalInFlight = false;
        if (result == RESULT_OK) { approvalIndex++; requestNextApproval(); }
        else finishApproval("Channel approval stopped. Published content is kept; you can try Add to TV Home again later.");
    }

    private void finishApproval(String message) {
        approvalInFlight = false; approvals.clear(); approvalIndex = 0;
        status.setText(message); save.setEnabled(snapshot != null); addToHome.setEnabled(snapshot != null && !CatalogChannels.selected(this).isEmpty());
        if (snapshot == null) load();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        long[] ids = new long[approvals.size()]; for (int i = 0; i < ids.length; i++) ids[i] = approvals.get(i);
        state.putLongArray("channel_approvals", ids); state.putInt("channel_approval_index", approvalIndex);
        state.putBoolean("channel_approval_pending", approvalInFlight);
    }
}
