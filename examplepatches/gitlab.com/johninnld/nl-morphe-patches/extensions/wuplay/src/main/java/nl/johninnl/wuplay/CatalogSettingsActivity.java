package nl.johninnl.wuplay;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.KeyEvent;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckedTextView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import java.util.HashSet;
import java.util.Set;
import java.util.List;
import java.util.ArrayList;
import android.media.tv.TvContract;

/** Home-ordered draft selection. Done publishes and requests launcher visibility in one flow. */
public final class CatalogSettingsActivity extends Activity {
    private static final int REQUEST_CHANNEL = 17439;
    private static final int ACCENT = Color.rgb(103, 199, 255);
    private TextView status;
    private Button done, cancel;
    private ListView list;
    private NativeCatalogs.Snapshot snapshot;
    private Set<String> restoredDraft;
    private final List<Long> approvals = new ArrayList<>();
    private int approvalIndex, lastRow, restoredAction;
    private boolean approvalInFlight, busy, committed, resumeSave, loading, actionChosen;

    @Override public void onCreate(Bundle state) {
        setTheme(android.R.style.Theme_Material_NoActionBar);
        super.onCreate(state);
        LinearLayout root = new LinearLayout(this); root.setOrientation(LinearLayout.VERTICAL);
        int padding = dp(24);
        root.setPadding(padding, padding, padding, padding); root.setBackgroundColor(Color.rgb(18, 22, 29));
        TextView title = new TextView(this); title.setText("TV channels"); title.setTextColor(Color.WHITE); title.setTextSize(26); root.addView(title);
        status = new TextView(this); status.setTextColor(Color.rgb(206, 216, 229)); status.setTextSize(16);
        // Reserve space so status changes cannot move the list or action row.
        status.setMinHeight(dp(70)); status.setPadding(0, dp(8), 0, dp(8));
        status.setText("Loading your Home catalogs…"); root.addView(status);
        list = new ListView(this); list.setId(View.generateViewId()); list.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);
        list.setSelector(focusBackground()); list.setDividerHeight(dp(2));
        root.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        LinearLayout buttons = new LinearLayout(this); buttons.setGravity(android.view.Gravity.RIGHT);
        cancel = action("Cancel"); done = action("Done");
        cancel.setOnClickListener(view -> { if (!busy && !committed) finish(); });
        done.setOnClickListener(view -> { actionChosen = true; restoredAction = 0; save(); });
        LinearLayout.LayoutParams buttonSize = new LinearLayout.LayoutParams(dp(150), dp(52));
        buttonSize.setMargins(dp(12), dp(12), 0, 0);
        buttons.addView(cancel, new LinearLayout.LayoutParams(buttonSize)); buttons.addView(done, new LinearLayout.LayoutParams(buttonSize));
        root.addView(buttons); setContentView(root);
        list.setNextFocusRightId(done.getId()); list.setNextFocusDownId(done.getId());
        cancel.setNextFocusRightId(done.getId()); done.setNextFocusLeftId(cancel.getId());
        for (Button button : new Button[]{cancel, done}) button.setOnKeyListener((view, key, event) -> {
            if (event.getAction() != KeyEvent.ACTION_DOWN) return false;
            actionChosen = true; restoredAction = 0;
            if (key == KeyEvent.KEYCODE_DPAD_UP && list.getCount() > 0) {
                list.requestFocus(); list.setSelection(lastRow); return true;
            }
            return key == KeyEvent.KEYCODE_DPAD_DOWN || (view == cancel && key == KeyEvent.KEYCODE_DPAD_LEFT)
                || (view == done && key == KeyEvent.KEYCODE_DPAD_RIGHT);
        });
        list.setOnKeyListener((view, key, event) -> {
            if (event.getAction() != KeyEvent.ACTION_DOWN) return false;
            lastRow = Math.max(0, list.getSelectedItemPosition());
            if (key == KeyEvent.KEYCODE_DPAD_RIGHT || (key == KeyEvent.KEYCODE_DPAD_DOWN && lastRow == list.getCount() - 1)) {
                done.requestFocus(); return true;
            }
            return key == KeyEvent.KEYCODE_DPAD_LEFT;
        });
        if (state != null) {
            ArrayList<String> draft = state.getStringArrayList("draft");
            if (draft != null) restoredDraft = new HashSet<>(draft);
            lastRow = state.getInt("last_row", 0);
            restoredAction = state.getInt("focused_action", 0);
            actionChosen = restoredAction != 0;
            long[] ids = state.getLongArray("channel_approvals");
            if (ids != null) for (long id : ids) approvals.add(id);
            approvalIndex = state.getInt("channel_approval_index", 0);
            approvalInFlight = state.getBoolean("channel_approval_pending", false);
            committed = state.getBoolean("committed", false);
            resumeSave = state.getBoolean("saving", false);
            busy = committed;
        }
        if (CatalogChannels.supported(this)) load();
        else status.setText("Preview channels require Android TV 8 or later.");
    }

    private int dp(int value) { return Math.round(value * getResources().getDisplayMetrics().density); }

    private GradientDrawable shape(int color, boolean outlined) {
        GradientDrawable result = new GradientDrawable(); result.setColor(color); result.setCornerRadius(dp(6));
        if (outlined) result.setStroke(dp(3), ACCENT);
        return result;
    }

    private StateListDrawable focusBackground() {
        StateListDrawable result = new StateListDrawable();
        result.addState(new int[]{android.R.attr.state_focused}, shape(Color.rgb(32, 76, 105), true));
        result.addState(new int[]{android.R.attr.state_pressed}, shape(Color.rgb(32, 76, 105), true));
        result.addState(new int[]{}, shape(Color.TRANSPARENT, false)); return result;
    }

    private Button action(String label) {
        Button button = new Button(this); button.setId(View.generateViewId()); button.setText(label); button.setAllCaps(false);
        button.setTextSize(18); button.setTextColor(new ColorStateList(
            new int[][]{new int[]{android.R.attr.state_focused}, new int[]{}}, new int[]{Color.BLACK, Color.WHITE}));
        StateListDrawable background = new StateListDrawable();
        background.addState(new int[]{android.R.attr.state_focused}, shape(ACCENT, true));
        background.addState(new int[]{android.R.attr.state_pressed}, shape(ACCENT, true));
        background.addState(new int[]{}, shape(Color.rgb(43, 54, 69), false)); button.setBackground(background);
        return button;
    }

    private boolean alive() { return !isFinishing() && !isDestroyed(); }

    private void load() {
        if (loading) return;
        loading = true;
        CatalogChannels.WORKER.execute(() -> {
            try {
                NativeCatalogs.Snapshot result = new NativeCatalogs(getApplication()).snapshot();
                runOnUiThread(() -> {
                    if (!alive()) return;
                    loading = false;
                    snapshot = result;
                    String[] titles = new String[result.definitions.size()];
                    Set<String> selected = restoredDraft == null ? CatalogChannels.selected(this) : restoredDraft;
                    for (int i = 0; i < titles.length; i++) {
                        NativeCatalogs.Definition definition = result.definitions.get(i);
                        String provider = "";
                        if ("preset".equals(definition.source) && definition.sourceId != null) {
                            String[] parts = definition.sourceId.split(":");
                            if (parts.length > 1) provider = "trakt".equals(parts[1]) ? "Trakt" : "tmdb".equals(parts[1]) ? "TMDB" : parts[1];
                        }
                        titles[i] = definition.name;
                        if (!provider.isEmpty() && !definition.name.toLowerCase(java.util.Locale.ROOT).contains(provider.toLowerCase(java.util.Locale.ROOT))) titles[i] += " · " + provider;
                    }
                    list.setAdapter(new ArrayAdapter<String>(this, android.R.layout.simple_list_item_multiple_choice, titles) {
                        @Override public View getView(int position, View convertView, ViewGroup parent) {
                            CheckedTextView row = (CheckedTextView) super.getView(position, convertView, parent);
                            row.setTextSize(19); row.setTextColor(Color.WHITE); row.setMinHeight(dp(56));
                            row.setPadding(dp(16), dp(8), dp(16), dp(8));
                            row.setCheckMarkTintList(ColorStateList.valueOf(ACCENT)); return row;
                        }
                    });
                    for (int i = 0; i < titles.length; i++) list.setItemChecked(i, selected.contains(result.definitions.get(i).key));
                    restoredDraft = null;
                    if (resumeSave) { resumeSave = false; save(); return; }
                    if (!approvalInFlight && committed) { busy = true; requestNextApproval(); return; }
                    status.setText("Choose the Home rows to show on your TV · " + result.profileName + ".\nDone saves and adds your channels. Cancel discards changes.");
                    if (restoredAction != 0) {
                        (restoredAction == 1 ? cancel : done).requestFocus(); restoredAction = 0;
                    } else if (titles.length > 0 && !approvalInFlight && !actionChosen) {
                        list.requestFocus(); list.setSelection(Math.min(lastRow, titles.length - 1));
                    }
                });
            } catch (Exception | LinkageError failure) {
                runOnUiThread(() -> { if (alive()) { loading = false; status.setText(failure instanceof IllegalStateException ? failure.getMessage() : "Cannot load Home catalogs. Open the default profile and try again."); } });
            }
        });
    }

    private void save() {
        if (busy || approvalInFlight) return;
        if (snapshot == null) { status.setText("Retrying Home catalogs…"); load(); return; }
        Set<String> selected = checkedCatalogs();
        busy = true; status.setText("Saving your channels…");
        // Freeze draft edits while publishing without disabling the focused action.
        list.setEnabled(false);
        CatalogChannels.preferences(this).edit().putStringSet("selected", selected).apply();
        CatalogChannels.WORKER.execute(() -> {
            CatalogChannels.RefreshResult result = CatalogChannels.refreshResult(getApplication());
            try {
                if (!result.success) { runOnUiThread(() -> { if (alive()) { busy = false; list.setEnabled(true); status.setText(result.message + "\nPress Done to retry."); } }); return; }
                NativeCatalogs.Snapshot current = new NativeCatalogs(getApplication()).snapshot();
                Set<String> eligible = new HashSet<>();
                for (NativeCatalogs.Definition definition : current.definitions) if (selected.contains(definition.key)) eligible.add(definition.key);
                List<Long> ids = new CatalogPublisher(getApplication()).pendingBrowsable(eligible);
                runOnUiThread(() -> {
                    if (!alive()) return;
                    committed = true; approvals.clear(); approvals.addAll(ids); approvalIndex = 0; requestNextApproval();
                });
            } catch (Exception | LinkageError failure) {
                runOnUiThread(() -> { if (alive()) { busy = false; list.setEnabled(true); status.setText("Channels saved. Could not request TV Home visibility. Press Done to retry."); } });
            }
        });
    }

    private Set<String> checkedCatalogs() {
        Set<String> selected = new HashSet<>();
        if (snapshot != null) for (int i = 0; i < snapshot.definitions.size(); i++) if (list.isItemChecked(i)) selected.add(snapshot.definitions.get(i).key);
        return selected;
    }

    private void requestNextApproval() {
        if (!alive()) return;
        if (approvalIndex >= approvals.size()) { finish(); return; }
        try {
            approvalInFlight = true;
            startActivityForResult(new Intent(TvContract.ACTION_REQUEST_CHANNEL_BROWSABLE)
                .putExtra(TvContract.EXTRA_CHANNEL_ID, approvals.get(approvalIndex).longValue()), REQUEST_CHANNEL);
        } catch (ActivityNotFoundException | SecurityException unsupported) {
            Toast.makeText(this, "Channels saved. Enable them in your launcher's channel settings.", Toast.LENGTH_LONG).show(); finish();
        }
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != REQUEST_CHANNEL) return;
        approvalInFlight = false;
        if (result == RESULT_OK) { approvalIndex++; requestNextApproval(); }
        else { Toast.makeText(this, "Channels saved. TV Home visibility can be enabled later in launcher settings.", Toast.LENGTH_LONG).show(); finish(); }
    }

    @Override public void onBackPressed() { if (!busy && !approvalInFlight) super.onBackPressed(); }

    @Override protected void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        if (snapshot != null) state.putStringArrayList("draft", new ArrayList<>(checkedCatalogs()));
        else if (restoredDraft != null) state.putStringArrayList("draft", new ArrayList<>(restoredDraft));
        state.putInt("focused_action", cancel.hasFocus() ? 1 : done.hasFocus() ? 2 : 0);
        state.putInt("last_row", Math.max(0, list.getSelectedItemPosition()));
        long[] ids = new long[approvals.size()]; for (int i = 0; i < ids.length; i++) ids[i] = approvals.get(i);
        state.putLongArray("channel_approvals", ids); state.putInt("channel_approval_index", approvalIndex);
        state.putBoolean("channel_approval_pending", approvalInFlight); state.putBoolean("committed", committed);
        state.putBoolean("saving", busy && !committed);
    }
}
