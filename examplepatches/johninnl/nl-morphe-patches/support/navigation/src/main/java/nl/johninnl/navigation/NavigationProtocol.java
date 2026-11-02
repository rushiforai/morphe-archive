package nl.johninnl.navigation;
import android.app.BroadcastOptions;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

/** Primitive-only schema shared by navigation providers. */
public final class NavigationProtocol {
 private NavigationProtocol() {}
 public static final String ACTION = "nl.johninnl.navigation.NAVIGATION_STATE";
 public static final String REQUEST = "nl.johninnl.navigation.NAVIGATION_STATE_REQUEST";
 public static Intent snapshot(String action, String sourcePackage, String session, long sequence,
         NavigationState.Snapshot n, long now) {
        Intent i = new Intent(action).putExtra("schema_version", 1)
                .putExtra("source_package", sourcePackage).putExtra("publisher_session_id", session)
                .putExtra("sequence", sequence).putExtra("sent_elapsed_ms", now)
                .putExtra("sent_unix_ms", System.currentTimeMillis())
                .putExtra("road_speed_limit_status", n.roadStatus).putExtra("road_updated_elapsed_ms", n.roadAt)
                .putExtra("road_max_age_ms", NavigationState.ROAD_TTL_MS)
                .putExtra("zone_status", n.zoneStatus).putExtra("zone_updated_elapsed_ms", n.zoneAt)
                .putExtra("zone_max_age_ms", NavigationState.ZONE_TTL_MS);
        i.putExtra("current_speed_status", n.currentStatus)
                .putExtra("current_speed_updated_elapsed_ms", n.currentAt)
                .putExtra("current_speed_max_age_ms", NavigationState.SPEED_TTL_MS);
        if (!Double.isNaN(n.currentKmh)) i.putExtra("current_speed_kmh", n.currentKmh);
        if (!Double.isNaN(n.limitKmh)) i.putExtra("road_speed_limit_kmh", n.limitKmh)
                .putExtra("road_speed_limit_display", n.rawLimit).putExtra("road_speed_limit_display_unit", n.unit);
        if (n.zoneStatus.equals("active")) {
            i.putExtra("zone_source", n.source).putExtra("zone_segment_id", n.segment)
                    .putExtra("zone_session", n.zoneSession).putExtra("zone_remaining_m", n.remaining)
                    .putExtra("zone_progress_percent", n.progress).putExtra("zone_progress_estimated", n.progressEstimated)
                    .putExtra("zone_observation_start_elapsed_ms", n.observationStart)
                    .putExtra("zone_observed_distance_m", n.observedMeters).putExtra("zone_average_partial", true)
                    .putExtra("zone_average_method", "observed_distance_over_elapsed_time");
            if (!Double.isNaN(n.averageKmh)) i.putExtra("zone_average_speed_kmh", n.averageKmh);
        }
        return i;
 }
 public static void send(Context context, Intent intent, String target) {
    intent.addFlags(Intent.FLAG_RECEIVER_FOREGROUND);
    if (target != null && !target.isEmpty()) intent.setPackage(target);
    deliver(context, intent);
    if (!ACTION.equals(intent.getAction())) deliver(context, new Intent(intent).setAction(ACTION));
 }
 private static void deliver(Context context, Intent intent) {
    if (Build.VERSION.SDK_INT >= 34)
        context.sendBroadcast(intent, null, BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());
    else context.sendBroadcast(intent);
 }
}
