package app.morphe.ather;

import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.os.Bundle;
import android.os.PowerManager;
import android.provider.Settings;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

/**
 * Settings screen for the Morphe patches. Reachable from the account screen's "Morphe settings"
 * row, or with:
 *
 * <pre>adb shell am start -n com.athermobileapp/app.morphe.ather.MorpheMapSettingsActivity</pre>
 *
 * Writes to {@link MapPref}; the patched Ather code reads those values. Recorded history lives on
 * {@link MorpheHistoryActivity} so this screen stays short.
 */
public final class MorpheMapSettingsActivity extends MorpheScreen {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if (backfill()) {
            return;
        }

        // Re-apply the ride service, so a preference that is on but whose service died comes back.
        RideService.apply(this);

        LinearLayout page = page();
        page.addView(title("Morphe settings"));

        addMapProvider(page);
        addAnalytics(page);
        addVehicle(page);
        addRideLog(page);
        addChargeLog(page);
        addHealth(page);

        TextView footer = new TextView(this);
        footer.setText("Changes apply as you make them. The map provider takes effect after a "
                + "restart; analytics blocking is immediate.");
        footer.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        footer.setTextColor(MUTED);
        footer.setPadding(dp(20), dp(24), dp(20), dp(32));
        page.addView(footer);

        show(page);
    }

    private void addMapProvider(LinearLayout page) {
        page.addView(sectionLabel("Map provider"));
        LinearLayout card = card();
        card.addView(description("Choose which map the Ather app uses. \"Auto\" keeps Ather's "
                + "choice but replaces the providers that cannot work here with OpenStreetMap. "
                + "Mappls is not offered: it needs a licence tied to Ather's own signature, so it "
                + "cannot load in this build."));

        final RadioGroup group = new RadioGroup(this);
        group.setOrientation(RadioGroup.VERTICAL);
        addOption(group, 1, "Auto (recommended)");
        addOption(group, 2, "OpenStreetMap");
        addOption(group, 3, "Google Maps (requires Play Services)");
        String stored = MapPref.getProvider(this);
        if (MapPref.MMI.equals(stored)) {
            // Mappls needs Ather's licence, which a re-signed build cannot obtain, so it never
            // loads. Move a stored Mappls choice to OpenStreetMap.
            MapPref.setProvider(this, MapPref.OSM);
            stored = MapPref.OSM;
        }
        group.check(idFor(stored));
        group.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup radioGroup, int checkedId) {
                MapPref.setProvider(MorpheMapSettingsActivity.this, valueFor(checkedId));
            }
        });
        card.addView(group);
        page.addView(card);
    }

    private void addAnalytics(LinearLayout page) {
        page.addView(sectionLabel("Analytics"));
        LinearLayout card = card();
        card.addView(description("When on, the app stops sending its own analytics events to "
                + "MoEngage, PostHog and Firebase. Crashlytics is not touched: crash reports still "
                + "reach Ather, so bugs stay reportable. The PostHog session recorder is part of "
                + "PostHog, so it stops too."));

        final CheckBox analytics = new CheckBox(this);
        analytics.setText("Block analytics events");
        analytics.setTextColor(TEXT);
        analytics.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        analytics.setChecked(!MapPref.analyticsEnabled(this));
        analytics.setPadding(0, dp(8), 0, dp(8));
        // The button drawable is drawn at the top of the view unless the gravity says
        // otherwise, which leaves the box above the label. Centre it.
        analytics.setGravity(Gravity.CENTER_VERTICAL);
        analytics.setButtonTintList(ColorStateList.valueOf(ACCENT));
        analytics.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                MapPref.setAnalyticsEnabled(MorpheMapSettingsActivity.this, !isChecked);
            }
        });
        card.addView(analytics);
        page.addView(card);
    }

    private void addVehicle(LinearLayout page) {
        LinearLayout body = body();
        body.addView(description("Live values the scooter sends over the app's own connection. "
                + "Nothing here is fetched from Ather's servers."));

        List<String[]> rows = RideLog.vehicleRows();
        if (rows.isEmpty()) {
            body.addView(emptyText("No telemetry yet. Open this screen while the scooter is "
                    + "switched on."));
        } else {
            for (String[] row : rows) {
                body.addView(kvRow(row[0], row[1]));
            }
        }

        body.addView(actionRow("Battery optimization", new View.OnClickListener() {
            @Override
            public void onClick(View clicked) {
                openBatteryOptimization();
            }
        }));
        page.addView(section("Vehicle", body, false));
    }

    /** Opens the system exemption list, or says the app is already exempt. */
    private void openBatteryOptimization() {
        PowerManager manager = (PowerManager) getSystemService(Context.POWER_SERVICE);
        if (manager != null && manager.isIgnoringBatteryOptimizations(getPackageName())) {
            toast("This app is already exempt from battery optimization.");
            return;
        }
        try {
            startActivity(new Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS));
        } catch (Throwable t) {
            toast("Could not open the battery optimization settings.");
        }
    }

    private void addRideLog(LinearLayout page) {
        LinearLayout body = body();
        body.addView(description("Ather's ride API returns no trips while the scooter is in "
                + "incognito mode. This log uses the live odometer the app already receives."));

        List<String[]> current = RideLog.currentTripRows();
        if (current.isEmpty()) {
            body.addView(emptyText("No trip in progress."));
        } else {
            for (String[] row : current) {
                body.addView(kvRow(row[0], row[1]));
            }
        }

        final CheckBox background = new CheckBox(this);
        background.setText("Record rides while the app is closed");
        background.setTextColor(TEXT);
        background.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        background.setChecked(MapPref.rideServiceEnabled(this));
        background.setPadding(0, dp(8), 0, dp(8));
        background.setGravity(Gravity.CENTER_VERTICAL);
        background.setButtonTintList(ColorStateList.valueOf(ACCENT));
        background.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                MapPref.setRideServiceEnabled(MorpheMapSettingsActivity.this, isChecked);
                RideService.apply(MorpheMapSettingsActivity.this);
            }
        });
        body.addView(background);
        body.addView(description("Off, the app records rides only while it is running, so two "
                + "rides taken while it was closed are joined into one. On, it keeps the app's "
                + "own connection open, which costs a silent ongoing notification and no extra "
                + "network traffic or polling."));

        final EditText pack = new EditText(this);
        pack.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_DECIMAL);
        pack.setText(String.format(java.util.Locale.US, "%.1f", MapPref.packKwh()));
        pack.setTextColor(TEXT);
        pack.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        pack.setPadding(0, dp(8), 0, dp(8));
        pack.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence text, int start, int count, int after) {
                // Nothing to do.
            }

            @Override
            public void onTextChanged(CharSequence text, int start, int before, int count) {
                // Nothing to do.
            }

            @Override
            public void afterTextChanged(Editable text) {
                try {
                    double kwh = Double.parseDouble(text.toString().trim());
                    if (kwh > 0.0 && kwh < 100.0) {
                        MapPref.setPackKwh(MorpheMapSettingsActivity.this, kwh);
                    }
                } catch (Throwable ignored) {
                    // Keep the last good value until the field holds a number again.
                }
            }
        });
        body.addView(kvRow("Battery pack (kWh)", ""));
        body.addView(pack);
        body.addView(description("Turns a ride's charge drop into km/unit. The %/km figure is "
                + "measured, so it needs no setting."));

        body.addView(linkRow("Ride history", MorpheHistoryActivity.class, "ride"));
        page.addView(section("Ride log", body, false));
    }

    private void addChargeLog(LinearLayout page) {
        LinearLayout body = body();
        body.addView(description("A session is bounded by the scooter reporting and then leaving "
                + "\"charging\", so it is recorded even when the app is closed while the scooter "
                + "charges."));

        List<String[]> current = RideLog.currentChargeRows();
        if (current.isEmpty()) {
            body.addView(emptyText("Not charging."));
        } else {
            for (String[] row : current) {
                body.addView(kvRow(row[0], row[1]));
            }
        }
        body.addView(linkRow("Charging history", MorpheHistoryActivity.class, "charge"));
        page.addView(section("Charge log", body, false));
    }

    private void addHealth(LinearLayout page) {
        LinearLayout body = body();
        body.addView(description("Ather's servers score each part of the scooter. They generate "
                + "the report on the 1st of each month, and the app receives it when you open the "
                + "True Health report."));

        long reportTime = HealthLog.reportTime();
        if (reportTime == 0L) {
            body.addView(emptyText("Open the True Health report in the app to capture it."));
        } else {
            body.addView(kvRow("Report from", RideLog.stamp(reportTime)));

            List<String[]> parts = HealthLog.healthRows();
            for (String[] row : parts) {
                body.addView(kvRow(row[0], row[1]));
            }

            List<String[]> wear = HealthLog.wearRows();
            if (!wear.isEmpty()) {
                body.addView(subHeader("Wear and tear"));
                for (String[] row : wear) {
                    body.addView(kvRow(row[0], row[1]));
                }
            }
        }
        body.addView(linkRow("Battery and wear history", MorpheHistoryActivity.class, "health"));
        page.addView(section("Health report", body, false));
    }

    /**
     * Adds a ride to the log from an intent extra, then closes. Used to backfill a ride the app
     * could not observe live, for example one taken before this log existed.
     *
     * <pre>adb shell am start -n com.athermobileapp/app.morphe.ather.MorpheMapSettingsActivity \
     *     --es backfill "startOdo,endOdo,distanceKm,startMillis,endMillis"</pre>
     */
    private boolean backfill() {
        String spec = getIntent() == null ? null : getIntent().getStringExtra("backfill");
        if (spec == null) {
            return false;
        }
        String message;
        try {
            String[] parts = spec.split(",");
            double startOdo = Double.parseDouble(parts[0].trim());
            double endOdo = Double.parseDouble(parts[1].trim());
            double distance = Double.parseDouble(parts[2].trim());
            long start = Long.parseLong(parts[3].trim());
            long end = Long.parseLong(parts[4].trim());
            boolean added = RideLog.addRecord(start, end, distance,
                    String.valueOf(startOdo), String.valueOf(endOdo));
            message = added ? "Ride added to the log." : "Could not add the ride.";
        } catch (Throwable t) {
            message = "Could not read the backfill value.";
        }
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
        finish();
        return true;
    }

    private void addOption(RadioGroup group, int id, String label) {
        RadioButton rb = new RadioButton(this);
        rb.setId(id);
        rb.setText(label);
        rb.setTextColor(TEXT);
        rb.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        rb.setPadding(0, dp(8), 0, dp(8));
        rb.setButtonTintList(ColorStateList.valueOf(ACCENT));
        group.addView(rb);
    }

    private int idFor(String value) {
        if (MapPref.OSM.equals(value)) {
            return 2;
        }
        if (MapPref.MMI.equals(value)) {
            // Mappls is no longer offered; an old choice falls back to OpenStreetMap.
            return 2;
        }
        if (MapPref.GOOGLE.equals(value)) {
            return 3;
        }
        return 1;
    }

    private String valueFor(int id) {
        switch (id) {
            case 2:
                return MapPref.OSM;
            case 3:
                return MapPref.GOOGLE;
            default:
                return MapPref.AUTO;
        }
    }
}
