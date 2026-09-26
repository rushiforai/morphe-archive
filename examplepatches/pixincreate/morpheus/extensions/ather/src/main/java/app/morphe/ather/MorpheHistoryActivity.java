package app.morphe.ather;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.LinearLayout;

import java.util.ArrayList;
import java.util.List;

/**
 * Everything the patch has recorded over time: rides, charging sessions, and battery plus wear
 * readings. Kept off the settings screen so that screen stays short as the history grows.
 *
 * <pre>adb shell am start -n com.athermobileapp/app.morphe.ather.MorpheHistoryActivity \
 *     --es page ride|charge|health</pre>
 *
 * The {@code page} extra decides which section opens expanded. Every section can be expanded or
 * collapsed by tapping its heading.
 */
public final class MorpheHistoryActivity extends MorpheScreen {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        String page = getIntent() == null ? null : getIntent().getStringExtra("page");

        LinearLayout root = page();
        root.addView(title("History"));

        addRides(root, "ride".equals(page));
        addCharging(root, "charge".equals(page));
        addHealth(root, "health".equals(page));

        root.addView(actionRow("Export as CSV", new View.OnClickListener() {
            @Override
            public void onClick(View clicked) {
                export();
            }
        }));
        root.addView(actionRow("Clear recorded history", new View.OnClickListener() {
            @Override
            public void onClick(View clicked) {
                confirmClear();
            }
        }));

        show(root);
    }

    /** Writes the three tables to Downloads and says where they went. */
    private void export() {
        List<String> saved = new ArrayList<>();
        add(saved, saveCsv("ather-rides.csv", RideLog.ridesCsv()));
        add(saved, saveCsv("ather-charging.csv", RideLog.chargingCsv()));
        add(saved, saveCsv("ather-health.csv", HealthLog.healthCsv()));
        if (saved.isEmpty()) {
            toast("Export failed. Nothing could be written.");
            return;
        }
        toast("Saved " + saved.size() + " files to " + saved.get(0).replaceAll("/[^/]*$", ""));
    }

    private static void add(List<String> saved, String location) {
        if (location != null) {
            saved.add(location);
        }
    }

    private void confirmClear() {
        int theme = isNight()
                ? android.R.style.Theme_Material_Dialog_Alert
                : android.R.style.Theme_Material_Light_Dialog_Alert;
        new AlertDialog.Builder(this, theme)
                .setTitle("Clear recorded history?")
                .setMessage("Every recorded ride, charging session and health reading is deleted. "
                        + "This cannot be undone.")
                .setNegativeButton("Cancel", null)
                .setPositiveButton("Clear", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        RideLog.clear();
                        HealthLog.clear();
                        recreate();
                    }
                })
                .show();
    }

    private void addRides(LinearLayout root, boolean expanded) {
        LinearLayout body = body();
        List<String[]> records = RideLog.historyRecords();
        if (records.isEmpty()) {
            body.addView(emptyText("No rides recorded yet. A ride is recorded when the odometer "
                    + "moves and the scooter then stops."));
        } else {
            String day = null;
            for (String[] r : records) {
                long start = asLong(r[0]);
                long end = asLong(r[1]);
                boolean exact = !"0".equals(r[5]);
                // An unobserved ride is filed under the day the app saw it, not the day its
                // window opens, which can be much earlier.
                long filed = exact ? start : end;
                String key = dayKey(filed);
                if (!key.equals(day)) {
                    body.addView(dateHeader(dayLabel(filed)));
                    day = key;
                }
                // A ride the app did not watch has no start time, and the time it was noticed is
                // not the ride's time, so the card carries no clock at all. The day comes from the
                // heading above it.
                String usage = RideLog.efficiency(r);
                body.addView(record(
                        exact ? clock(start) + " – " + clock(end) : orUnknown(r[2]) + " km",
                        exact ? orUnknown(r[2]) + " km" : "",
                        exact ? duration(start, end) : "",
                        "Odo " + orUnknown(r[3]) + " → " + orUnknown(r[4]) + " km"
                                + (usage.isEmpty() ? "" : "  ·  " + usage)));
            }
        }
        root.addView(section("Rides", body, expanded));
    }

    private void addCharging(LinearLayout root, boolean expanded) {
        LinearLayout body = body();
        List<String[]> records = RideLog.chargeRecords();
        if (records.isEmpty()) {
            body.addView(emptyText("No charging sessions recorded yet."));
        } else {
            String day = null;
            for (String[] r : records) {
                long start = asLong(r[0]);
                long end = asLong(r[1]);
                String key = dayKey(start);
                if (!key.equals(day)) {
                    body.addView(dateHeader(dayLabel(start)));
                    day = key;
                }
                body.addView(record(
                        clock(start) + " – " + clock(end),
                        orUnknown(r[2]) + " → " + orUnknown(r[3]) + "%",
                        duration(start, end) + " charging",
                        null));
            }
        }
        root.addView(section("Charging sessions", body, expanded));
    }

    private void addHealth(LinearLayout root, boolean expanded) {
        LinearLayout body = body();

        body.addView(subHeader("Battery"));
        List<String[]> soh = HealthLog.sohRows();
        if (soh.isEmpty()) {
            body.addView(emptyText("No battery readings captured yet."));
        } else {
            for (String[] row : soh) {
                body.addView(dataRow(row[0], row[1]));
            }
        }

        body.addView(subHeader("Wear and tear"));
        List<String[]> wear = HealthLog.wearHistoryRows();
        if (wear.isEmpty()) {
            body.addView(emptyText("No wear readings captured yet."));
        } else {
            for (String[] row : wear) {
                body.addView(dataRow(row[0], row[1]));
            }
        }
        root.addView(section("Battery and wear", body, expanded));
    }
}
