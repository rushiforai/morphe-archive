package app.template.extension.timemark;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import android.app.Activity;
import android.app.Dialog;
import android.location.Address;
import android.location.Geocoder;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

/**
 * The Timemark patch settings screen: the location picker from hxreborn's
 * BeReal patch (a "Custom location" switch, a place search, and an
 * OpenStreetMap view with a fixed center pin — drag or tap to move the pin,
 * the position under the pin is saved automatically), plus a clear/reset.
 *
 * hxreborn hosts this UI in a PatchesSettingsActivity registered in the host
 * manifest. Timemark's stock binary manifest declares
 * android:extractNativeLibs twice on &lt;application&gt;, which makes the
 * decoded manifest not well-formed XML, so Morphe's document()-based manifest
 * editing fails on this app (SAXParseException) and the activity cannot be
 * registered that way. The same screen is therefore shown as a full-screen
 * dialog hosted by the resumed settings activity — identical user flow, no
 * manifest mutation. Saved state lives in PatchSettings either way.
 */
public final class PatchesSettingsDialog {

    private static final int TEXT = 0xFFFFFFFF;
    private static final int TEXT_SECONDARY = 0xFFB0B0B5;
    private static final int SURFACE = 0xFF1C1C1E;
    private static final int FIELD = 0xFF2C2C2E;

    private PatchesSettingsDialog() {
    }

    public static void show(Activity activity) {
        final Dialog dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_Dialog_NoActionBar);
        final Picker picker = new Picker(activity, dialog);
        dialog.setContentView(picker.root);
        dialog.setOnDismissListener(ignored -> picker.shutdown());
        dialog.show();
        final Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.MATCH_PARENT);
            window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(SURFACE));
        }
    }

    private static final class Picker implements MapPickerListener {

        private final Activity activity;
        private final Dialog dialog;
        private final ExecutorService executor = Executors.newSingleThreadExecutor();
        private final Handler main = new Handler(Looper.getMainLooper());

        final LinearLayout root;
        private final TextView stateText;
        private final Switch customSwitch;
        private final LinearLayout body;
        private final EditText searchInput;
        private final MapPickerView map;
        private final TextView chosenText;
        private boolean searching;

        Picker(Activity activity, Dialog dialog) {
            this.activity = activity;
            this.dialog = dialog;

            root = new LinearLayout(activity);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(SURFACE);
            final int padding = Dimensions.dp(activity, 16);
            root.setPadding(padding, padding, padding, padding);

            final TextView title = text("Timemark patches", 20, TEXT);
            title.setTypeface(title.getTypeface(), android.graphics.Typeface.BOLD);
            root.addView(title);

            stateText = text("", 14, TEXT_SECONDARY);
            stateText.setPadding(0, Dimensions.dp(activity, 6), 0, Dimensions.dp(activity, 12));
            root.addView(stateText);

            final LinearLayout switchRow = new LinearLayout(activity);
            switchRow.setOrientation(LinearLayout.HORIZONTAL);
            switchRow.setGravity(Gravity.CENTER_VERTICAL);
            final TextView switchLabel = text("Use custom location", 16, TEXT);
            switchRow.addView(switchLabel, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            customSwitch = new Switch(activity);
            customSwitch.setChecked(PatchSettings.customLocation());
            switchRow.addView(customSwitch);
            root.addView(switchRow);

            body = new LinearLayout(activity);
            body.setOrientation(LinearLayout.VERTICAL);
            body.setPadding(0, Dimensions.dp(activity, 12), 0, 0);

            final LinearLayout searchRow = new LinearLayout(activity);
            searchRow.setOrientation(LinearLayout.HORIZONTAL);
            searchInput = new EditText(activity);
            searchInput.setHint("Search for a place");
            searchInput.setSingleLine(true);
            searchInput.setTextColor(TEXT);
            searchInput.setHintTextColor(TEXT_SECONDARY);
            searchInput.setBackgroundColor(FIELD);
            searchInput.setPadding(Dimensions.dp(activity, 10), 0, Dimensions.dp(activity, 10), 0);
            searchRow.addView(searchInput,
                    new LinearLayout.LayoutParams(0, Dimensions.dp(activity, 44), 1f));
            final Button searchButton = button("Search");
            final LinearLayout.LayoutParams searchParams =
                    new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, Dimensions.dp(activity, 44));
            searchParams.leftMargin = Dimensions.dp(activity, 8);
            searchRow.addView(searchButton, searchParams);
            body.addView(searchRow);

            map = new MapPickerView(activity);
            map.setListener(this);
            final LinearLayout.LayoutParams mapParams =
                    new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Dimensions.dp(activity, 320));
            mapParams.topMargin = Dimensions.dp(activity, 12);
            body.addView(map, mapParams);

            final LinearLayout zoomRow = new LinearLayout(activity);
            zoomRow.setOrientation(LinearLayout.HORIZONTAL);
            zoomRow.setGravity(Gravity.END);
            final Button zoomOut = button("−");
            final Button zoomIn = button("+");
            zoomRow.addView(zoomOut, new LinearLayout.LayoutParams(
                    Dimensions.dp(activity, 44), Dimensions.dp(activity, 44)));
            final LinearLayout.LayoutParams zoomInParams = new LinearLayout.LayoutParams(
                    Dimensions.dp(activity, 44), Dimensions.dp(activity, 44));
            zoomInParams.leftMargin = Dimensions.dp(activity, 8);
            zoomRow.addView(zoomIn, zoomInParams);
            body.addView(zoomRow);
            zoomOut.setOnClickListener(view -> map.zoomBy(-1f));
            zoomIn.setOnClickListener(view -> map.zoomBy(1f));

            chosenText = text("", 14, TEXT);
            chosenText.setPadding(0, Dimensions.dp(activity, 10), 0, 0);
            body.addView(chosenText);

            final TextView hint = text("Drag the map or tap to move the pin. The location under the pin "
                    + "is saved automatically and stamped on new photos instead of your real GPS location.",
                    13, TEXT_SECONDARY);
            hint.setPadding(0, Dimensions.dp(activity, 6), 0, 0);
            body.addView(hint);

            final Button clearButton = button("Clear saved location");
            final LinearLayout.LayoutParams clearParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, Dimensions.dp(activity, 48));
            clearParams.topMargin = Dimensions.dp(activity, 16);
            body.addView(clearButton, clearParams);
            clearButton.setOnClickListener(view -> {
                PatchSettings.clearLocation();
                customSwitch.setChecked(false);
                refresh();
            });

            final ScrollView scroll = new ScrollView(activity);
            scroll.addView(body);
            root.addView(scroll, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

            final Button doneButton = button("Done");
            final LinearLayout.LayoutParams doneParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, Dimensions.dp(activity, 48));
            doneParams.topMargin = Dimensions.dp(activity, 12);
            root.addView(doneButton, doneParams);
            doneButton.setOnClickListener(view -> dialog.dismiss());

            searchButton.setOnClickListener(view -> search());

            customSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
                PatchSettings.setCustomLocation(isChecked);
                refresh();
            });

            final Coordinates saved = Coordinates.parse(PatchSettings.latitude(), PatchSettings.longitude());
            if (saved != null) {
                map.moveTo(saved.latitude, saved.longitude, 15f);
            }
            refresh();
        }

        void shutdown() {
            executor.shutdownNow();
        }

        private void refresh() {
            final boolean enabled = PatchSettings.customLocation();
            body.setVisibility(enabled ? View.VISIBLE : View.GONE);
            final Coordinates saved = Coordinates.parse(PatchSettings.latitude(), PatchSettings.longitude());
            if (!enabled) {
                stateText.setText("Custom location is off — photos use your real GPS location.");
                return;
            }
            if (saved == null) {
                stateText.setText("Custom location is on — pick a location on the map below.");
                chosenText.setText("No location picked yet.");
                return;
            }
            final LocationSummary summary = LocationSummary.of(PatchSettings.label(), saved);
            stateText.setText("Custom location is on — new photos are stamped with this location.");
            chosenText.setText(summary.label.isEmpty()
                    ? summary.coordinates
                    : summary.label + "\n" + summary.coordinates);
        }

        @Override
        public void onChosen(double latitude, double longitude) {
            PatchSettings.saveCoordinates(format(latitude), format(longitude), "");
            refresh();
        }

        private void search() {
            final String query = searchInput.getText().toString().trim();
            if (query.isEmpty() || searching || !Geocoder.isPresent()) {
                return;
            }
            searching = true;
            chosenText.setText("Searching…");
            executor.execute(() -> {
                Address found = null;
                try {
                    final List<Address> results = new Geocoder(activity).getFromLocationName(query, 1);
                    if (results != null && !results.isEmpty()) {
                        found = results.get(0);
                    }
                } catch (IOException | IllegalArgumentException ignored) {
                }
                final Address result = found;
                main.post(() -> {
                    searching = false;
                    if (result == null) {
                        chosenText.setText("No results for \"" + query + "\".");
                        return;
                    }
                    final String label = labelFor(result);
                    PatchSettings.saveCoordinates(format(result.getLatitude()), format(result.getLongitude()), label);
                    map.moveTo(result.getLatitude(), result.getLongitude(), 15f);
                    refresh();
                });
            });
        }

        private static String labelFor(Address address) {
            final String thoroughfare = address.getThoroughfare();
            if (thoroughfare != null && !thoroughfare.trim().isEmpty()) {
                final String sub = address.getSubThoroughfare();
                return sub == null || sub.trim().isEmpty() ? thoroughfare : sub + " " + thoroughfare;
            }
            final String feature = address.getFeatureName();
            if (feature != null && !feature.trim().isEmpty()
                    && (address.getLocality() == null || !feature.equals(address.getLocality()))) {
                return feature;
            }
            final String line = address.getMaxAddressLineIndex() >= 0 ? address.getAddressLine(0) : null;
            return line == null ? "" : line;
        }

        private static String format(double value) {
            return String.format(Locale.US, "%.6f", value);
        }

        private TextView text(String value, int sp, int color) {
            final TextView view = new TextView(activity);
            view.setText(value);
            view.setTextSize(sp);
            view.setTextColor(color);
            return view;
        }

        private Button button(String label) {
            final Button button = new Button(activity);
            button.setText(label);
            button.setTextColor(TEXT);
            button.setBackgroundColor(FIELD);
            return button;
        }
    }
}
