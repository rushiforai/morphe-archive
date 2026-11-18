package nl.johninnl.warningprobe;

import android.app.Instrumentation;
import android.os.Bundle;
import android.os.Parcel;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.List;
import nl.johninnl.navigation.alerts.WarningCodec;
import nl.johninnl.navigation.alerts.WarningEvent;
import org.json.JSONArray;
import org.json.JSONObject;

/** Exercises the production shared source on real Android Parcel, without app audio. */
public final class WarningCodecProbe {
    public static JSONObject run(Instrumentation probe, Bundle args) throws Exception {
        long now = SystemClock.elapsedRealtime();
        Bundle input = warning(1, now);
        WarningEvent event = WarningCodec.decode(copy(input), now);
        check(event.message.equals("Synthetic warning codec test"), "Message changed");
        check(event.nativeSubtype.equals("AMBULANCE") && event.relationship.equals("behind"), "Semantics changed");
        check(event.latitude == null && event.distanceMeters == null, "Absent geometry invented");
        check(WarningCodec.decode(copy(WarningCodec.encode(event)), now).fields().equals(event.fields()), "Parcel round-trip changed fields");
        input.putString("message", "changed");
        check(event.message.equals("Synthetic warning codec test"), "Caller mutated the accepted event");
        Bundle oversized = warning(1, now); oversized.putString("message", repeat("é", 2049));
        try { WarningCodec.decode(oversized, now); throw new AssertionError("Oversized UTF-8 message accepted"); }
        catch (IllegalArgumentException expected) { check(expected.getMessage().equals("MESSAGE_SIZE"), "Wrong message rejection"); }
        List<WarningEvent> events = new ArrayList<>();
        for (int i=1;i<=8;i++) {
            Bundle b = warning(i, now); b.putString("future_detail", repeat("x", 9500));
            events.add(WarningCodec.decode(copy(b), now));
        }
        List<Bundle> batches = WarningCodec.splitBatches(events); JSONArray sizes = new JSONArray(); int count = 0;
        check(batches.size() > 1, "Actual binary limit did not split the batch");
        for (Bundle batch : batches) {
            int bytes = WarningCodec.encodedSize(batch); sizes.put(bytes);
            check(bytes <= 128*1024, "Oversized batch"); count += WarningCodec.decodeBatch(copy(batch), now).size();
        }
        check(count == 8, "Batch splitting lost an event");
        return new JSONObject().put("probe", "WarningCodecProbe").put("status", "observed")
                .put("codec_source", "Production support/navigation-alerts sources compiled into test instrumentation")
                .put("actual_android_parcel", true).put("native_behind_without_geometry", true)
                .put("utf8_limit_rejection", true).put("immutable_copy", true)
                .put("event_bytes", event.encodedBytes).put("batch_sizes", sizes).put("events_preserved", count)
                .put("scope", "Synthetic codec values only; does not prove native FM capture, IPC authentication or audio output");
    }

    private static Bundle warning(long sequence, long now) {
        Bundle b = new Bundle(); b.putInt("protocol_version", 1);
        b.putString("provider_session", "05518de4-4eb3-4841-bcdc-697fc0a02049"); b.putLong("sequence", sequence);
        b.putString("warning_id", "synthetic-codec"); b.putLong("revision", 1); b.putLong("announcement_index", 1);
        b.putString("operation", "ANNOUNCE"); b.putString("phase", "notice");
        b.putString("native_type", "EarlyWarningReport"); b.putString("native_subtype", "AMBULANCE");
        b.putString("category", "emergency"); b.putInt("priority", 0);
        b.putString("message", "Synthetic warning codec test"); b.putString("language_tag", "en"); b.putString("message_origin", "template");
        b.putLong("observed_elapsed_ms", now); b.putLong("issued_elapsed_ms", now);
        b.putLong("announce_until_elapsed_ms", now+5000); b.putLong("state_until_elapsed_ms", now+30000);
        b.putString("relevance", "moving_emergency"); b.putString("relationship", "behind"); return b;
    }
    private static Bundle copy(Bundle value) {
        Parcel p = Parcel.obtain();
        try { p.writeBundle(value); p.setDataPosition(0); return p.readBundle(null); }
        finally { p.recycle(); }
    }
    private static String repeat(String value, int count) { StringBuilder b=new StringBuilder(); for(int i=0;i<count;i++) b.append(value); return b.toString(); }
    private static void check(boolean value, String reason) { if (!value) throw new AssertionError(reason); }
}
