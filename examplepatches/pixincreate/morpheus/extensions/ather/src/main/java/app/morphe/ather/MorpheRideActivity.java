package app.morphe.ather;

import android.os.Bundle;
import android.widget.LinearLayout;

/**
 * The details of one ride recorded on this phone.
 *
 * <p>The app's own ride detail screen asks Ather's servers for the ride by id. A ride recorded here
 * exists only on the phone, so the app's screen cannot find it and shows an error. Tapping one of
 * those rides opens this screen instead.
 *
 * <pre>adb shell am start -n com.athermobileapp/app.morphe.ather.MorpheRideActivity \
 *     --el rideId &lt;negative id&gt;</pre>
 */
public final class MorpheRideActivity extends MorpheScreen {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        long rideId = getIntent() == null ? 0L : getIntent().getLongExtra("rideId", 0L);
        String[] record = RideLog.rideRecord(rideId);

        LinearLayout root = page();
        root.addView(title("Ride"));

        LinearLayout card = card();
        boolean exact = true;
        if (record == null) {
            card.addView(emptyText("This ride is no longer in the recorded history."));
        } else {
            long start = asLong(record[0]);
            long end = asLong(record[1]);
            exact = !"0".equals(record[5]);
            card.addView(kvRow("Date", dayLabel(exact ? start : end)));
            if (exact) {
                card.addView(kvRow("Started", clock(start)));
                card.addView(kvRow("Ended", clock(end)));
                card.addView(kvRow("Duration", duration(start, end)));
            } else {
                card.addView(kvRow("Recorded at", clock(end)));
            }
            card.addView(kvRow("Distance", orUnknown(record[2]) + " km"));
            card.addView(kvRow("Start odometer", orUnknown(record[3]) + " km"));
            card.addView(kvRow("End odometer", orUnknown(record[4]) + " km"));
            String usage = RideLog.efficiency(record);
            if (!usage.isEmpty()) {
                card.addView(kvRow("Usage", usage));
            }
        }
        root.addView(card);

        LinearLayout note = body();
        note.addView(description(exact
                ? "This ride was recorded on this phone from the odometer the scooter sends. "
                        + "Ather's servers have no record of it, so it has no route or location "
                        + "information."
                : "This ride was recorded on this phone from the odometer the scooter sends. The "
                        + "app was not running while you rode, so it only saw the odometer before "
                        + "and after: the distance is exact, the start and end times are not "
                        + "known."));
        root.addView(note);

        LinearLayout link = body();
        link.addView(linkRow("All recorded history", MorpheHistoryActivity.class, "ride"));
        root.addView(link);

        show(root);
    }
}
