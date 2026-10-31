package app.local.extension.curve;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/** A local settings screen using Curve's existing theme and design components. */
public final class PatchesActivity extends AppCompatActivity {
    private static final String DRAFT = "morphe.hide_flex_draft";
    private static final String ERROR = "morphe.save_error";
    private static final String LAUNCHPAD = "morphe.launchpad_draft";
    private static final String CRINGE = "morphe.remove_cringe_draft";
    private static final String BATCH = "morphe.batch_gbit_draft";
    private static final String EXPANDED = "morphe.tiles_expanded";
    private CompoundButton cringe;
    private CompoundButton batch;
    private static final String HIDDEN = "morphe.hidden_tiles_draft";
    private CompoundButton toggle;
    private CompoundButton launchpad;
    private final Set<String> hidden = new HashSet<>();
    private final Map<String, CompoundButton> choices = new LinkedHashMap<>();
    private View reset;
    private View picker;
    private TextView manage;
    private View apply;
    private TextView error;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        PatchSettings.initialize(getApplicationContext());
        setContentView(resource("morphe_patches", "layout"));

        Toolbar toolbar = findViewById(resource("morphe_patches_toolbar", "id"));
        toolbar.setNavigationOnClickListener(view -> finish());
        View row = findViewById(resource("morphe_patches_row", "id"));
        TextView title = row.findViewById(resource("txtTitle", "id"));
        title.setMaxLines(Integer.MAX_VALUE);
        title.setEllipsize(null);
        toggle = row.findViewById(resource("swiToggle", "id"));
        // Reused Curve rows share child IDs; our draft bundle owns their checked state.
        toggle.setSaveEnabled(false);
        apply = findViewById(resource("morphe_patches_apply", "id"));
        View actions = findViewById(resource("morphe_patches_actions", "id"));
        error = actions.findViewById(resource("txtCaption", "id"));
        error.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        if (state != null && state.containsKey(ERROR)) showError(state.getString(ERROR));

        toggle.setChecked(state == null ? PatchSettings.isFlexHidden()
            : state.getBoolean(DRAFT, PatchSettings.isFlexHidden()));
        View launchpadRow = findViewById(resource("morphe_launchpad_row", "id"));
        TextView launchpadTitle = launchpadRow.findViewById(resource("txtTitle", "id"));
        launchpadTitle.setMaxLines(Integer.MAX_VALUE);
        launchpadTitle.setEllipsize(null);
        launchpadTitle.setText(RemoveCringe.menuLabel(getResources(), "morphe_hide_tiles_title", launchpadTitle.getText().toString()));
        TextView empty = findViewById(resource("morphe_launchpad_empty", "id"));
        empty.setText(RemoveCringe.menuLabel(getResources(), "morphe_empty_tiles", empty.getText().toString()));
        launchpad = launchpadRow.findViewById(resource("swiToggle", "id"));
        launchpad.setSaveEnabled(false);
        launchpad.setChecked(state == null ? PatchSettings.isLaunchpadHidden()
            : state.getBoolean(LAUNCHPAD, PatchSettings.isLaunchpadHidden()));
        View cringePanel = findViewById(resource("morphe_cringe_panel", "id"));
        View cringeRow = findViewById(resource("morphe_cringe_row", "id"));
        ((CompoundButton) cringeRow.findViewById(resource("swiToggle", "id"))).setSaveEnabled(false);
        if (RemoveCringe.isIncluded()) {
            cringePanel.setVisibility(View.VISIBLE);
            TextView cringeTitle = cringeRow.findViewById(resource("txtTitle", "id"));
            cringeTitle.setMaxLines(Integer.MAX_VALUE);
            cringeTitle.setEllipsize(null);
            ((TextView) cringeRow.findViewById(resource("txtSubtitle", "id"))).setText(RemoveCringe.summary(getResources()));
            cringe = cringeRow.findViewById(resource("swiToggle", "id"));
            cringe.setChecked(state == null ? PatchSettings.isCringeRemoved()
                : state.getBoolean(CRINGE, PatchSettings.isCringeRemoved()));
            cringe.setOnCheckedChangeListener((button, checked) -> updateActions());
            cringeRow.setOnClickListener(view -> cringe.toggle());
        }
        View batchRow = findViewById(resource("morphe_batch_setting_row", "id"));
        CompoundButton batchSwitch = batchRow.findViewById(resource("swiToggle", "id"));
        batchSwitch.setSaveEnabled(false);
        if (BatchGbitActivity.isIncluded()) {
            findViewById(resource("morphe_batch_panel", "id")).setVisibility(View.VISIBLE);
            TextView batchTitle = batchRow.findViewById(resource("txtTitle", "id"));
            batchTitle.setMaxLines(Integer.MAX_VALUE);
            batchTitle.setEllipsize(null);
            batch = batchSwitch;
            batch.setChecked(state == null ? PatchSettings.isBatchEnabled()
                : state.getBoolean(BATCH, PatchSettings.isBatchEnabled()));
            batch.setOnCheckedChangeListener((button, checked) -> updateActions());
            batchRow.setOnClickListener(view -> batch.toggle());
        }
        hidden.addAll(PatchSettings.hiddenTiles());
        if (state != null && state.containsKey(HIDDEN)) {
            hidden.clear();
            hidden.addAll(state.getStringArrayList(HIDDEN));
        }
        reset = findViewById(resource("morphe_launchpad_reset", "id"));
        picker = findViewById(resource("morphe_launchpad_picker", "id"));
        picker.setVisibility(state != null && state.getBoolean(EXPANDED) ? View.VISIBLE : View.GONE);
        manage = findViewById(resource("morphe_launchpad_manage", "id"));
        manage.setOnClickListener(view -> {
            picker.setVisibility(picker.getVisibility() == View.VISIBLE ? View.GONE : View.VISIBLE);
            updateActions();
        });
        addChoices();
        updateActions();
        toggle.setOnCheckedChangeListener((button, checked) -> updateActions());
        launchpad.setOnCheckedChangeListener((button, checked) -> updateActions());
        row.setOnClickListener(view -> toggle.toggle());
        launchpadRow.setOnClickListener(view -> launchpad.toggle());
        reset.setOnClickListener(view -> {
            hidden.clear();
            for (CompoundButton choice : choices.values()) choice.setChecked(false);
            updateActions();
        });
        apply.setOnClickListener(view -> saveAndReopen());
    }

    @Override public void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        state.putBoolean(DRAFT, toggle.isChecked());
        state.putBoolean(LAUNCHPAD, launchpad.isChecked());
        if (cringe != null) state.putBoolean(CRINGE, cringe.isChecked());
        if (batch != null) state.putBoolean(BATCH, batch.isChecked());
        state.putBoolean(EXPANDED, picker.getVisibility() == View.VISIBLE);
        state.putStringArrayList(HIDDEN, new ArrayList<>(hidden));
        if (error.getVisibility() == View.VISIBLE) state.putString(ERROR, error.getText().toString());
    }

    private void saveAndReopen() {
        Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
        if (launch == null) {
            showError("Could not reopen Curve. Your changes have not been saved.");
            return;
        }
        if (!PatchSettings.saveSettings(toggle.isChecked(), launchpad.isChecked(), hidden,
                cringe == null ? PatchSettings.isCringeRemoved() : cringe.isChecked(),
                batch == null ? PatchSettings.isBatchEnabled() : batch.isChecked())) {
            showError("Could not save your changes. Try again.");
            return;
        }
        apply.setEnabled(false);
        // A fresh activity task discards cached UI state without clearing credentials or killing the process.
        launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        try {
            startActivity(launch);
            finish();
        } catch (ActivityNotFoundException | SecurityException failure) {
            showError("Changes saved. Close and reopen Curve to apply them.");
        }
    }

    private void addChoices() {
        View panel = findViewById(resource("morphe_launchpad_choices", "id"));
        ViewGroup content = panel.findViewById(resource("linear_layout", "id"));
        for (Map.Entry<String, String> tile : LaunchpadTiles.catalog().entrySet()) {
            View row = getLayoutInflater().inflate(resource("morphe_launchpad_tile", "layout"), content, false);
            TextView title = row.findViewById(resource("txtTitle", "id"));
            title.setText(tile.getValue());
            title.setMaxLines(Integer.MAX_VALUE);
            title.setEllipsize(null);
            title.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            CompoundButton check = row.findViewById(resource("swiCheck", "id"));
            check.setSaveEnabled(false);
            check.setContentDescription(tile.getValue());
            check.setMinWidth(Math.round(48 * getResources().getDisplayMetrics().density));
            check.setMinHeight(Math.round(48 * getResources().getDisplayMetrics().density));
            check.setChecked(hidden.contains(tile.getKey()));
            check.setOnCheckedChangeListener((button, checked) -> {
                if (checked) hidden.add(tile.getKey());
                else hidden.remove(tile.getKey());
                updateActions();
            });
            row.setOnClickListener(view -> check.toggle());
            choices.put(tile.getKey(), check);
            content.addView(row);
        }
        findViewById(resource("morphe_launchpad_empty", "id"))
            .setVisibility(choices.isEmpty() ? View.VISIBLE : View.GONE);
    }

    private void updateActions() {
        apply.setEnabled(toggle.isChecked() != PatchSettings.isFlexHidden()
            || launchpad.isChecked() != PatchSettings.isLaunchpadHidden()
            || !hidden.equals(PatchSettings.hiddenTiles())
            || batch != null && batch.isChecked() != PatchSettings.isBatchEnabled()
            || cringe != null && cringe.isChecked() != PatchSettings.isCringeRemoved());
        reset.setEnabled(!hidden.isEmpty());
        manage.setText((picker.getVisibility() == View.VISIBLE ? "Close tile list" : "Choose tiles to hide")
            + " · " + hidden.size() + " selected");
    }

    private void showError(String message) {
        error.setText(message);
        error.setVisibility(View.VISIBLE);
    }

    private int resource(String name, String type) {
        // IDs are assigned when Morphe merges the layout into Curve, not by the extension build.
        int id = getResources().getIdentifier(name, type, getPackageName());
        if (id == 0) throw new IllegalStateException("Curve resource missing: " + type + "/" + name);
        return id;
    }
}
