package nl.johninnl.navigation.alerts;

import static org.junit.Assert.*;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=32, manifest=Config.NONE)
public class WarningCodecTest {
    private static final long NOW = 100000;
    private static final String SESSION = "027db481-898f-4e5d-b314-fb5d0f8a77a2";

    private Bundle warning(long sequence) {
        Bundle b = new Bundle();
        b.putInt("protocol_version", 1); b.putString("provider_session", SESSION);
        b.putLong("sequence", sequence); b.putString("warning_id", "early-42");
        b.putLong("revision", 1); b.putLong("announcement_index", 1);
        b.putString("operation", "ANNOUNCE"); b.putString("phase", "notice");
        b.putString("native_type", "EarlyWarningReport"); b.putString("native_subtype", "AMBULANCE");
        b.putString("category", "emergency"); b.putInt("priority", 0);
        b.putString("message", "Ambulance achter u"); b.putString("language_tag", "nl-NL");
        b.putString("message_origin", "native_text");
        b.putLong("observed_elapsed_ms", NOW - 100); b.putLong("issued_elapsed_ms", NOW);
        b.putLong("announce_until_elapsed_ms", NOW + 5000); b.putLong("state_until_elapsed_ms", NOW + 29900);
        b.putString("relevance", "moving_emergency"); b.putString("relationship", "behind");
        return b;
    }

    private Bundle parcelCopy(Bundle b) {
        Parcel p = Parcel.obtain();
        try { p.writeBundle(b); p.setDataPosition(0); return p.readBundle(null); }
        finally { p.recycle(); }
    }

    private void rejects(Bundle b, String reason) {
        try { WarningCodec.decode(b, NOW); fail("Expected " + reason); }
        catch (IllegalArgumentException expected) { assertTrue(expected.getMessage(), expected.getMessage().contains(reason)); }
    }

    @Test public void nativeEmergencyBehindPreservesMeaningWithoutCoordinatesOrSpeed() {
        WarningEvent e = WarningCodec.decode(parcelCopy(warning(1)), NOW);
        assertEquals("Ambulance achter u", e.message); assertEquals("nl-NL", e.languageTag);
        assertEquals("AMBULANCE", e.nativeSubtype); assertEquals("behind", e.relationship);
        assertEquals(WarningEvent.Priority.P0, e.priority); assertNull(e.distanceMeters); assertNull(e.latitude);
        assertEquals(NOW + 5000, e.announceUntil); assertEquals(NOW - 100, e.observedAt);
        assertEquals("native_text", e.messageOrigin);
        assertEquals(e.fields(), WarningCodec.decode(parcelCopy(WarningCodec.encode(e)), NOW).fields());
    }

    @Test public void callerCannotMutateAnAcceptedEventOrItsEncodedCopy() {
        Bundle b = warning(1); WarningEvent e = WarningCodec.decode(b, NOW);
        b.putString("message", "changed"); Bundle copy = WarningCodec.encode(e); copy.putString("warning_id", "changed");
        assertEquals("Ambulance achter u", e.message); assertEquals("early-42", e.warningId);
        try { e.fields().put("message", "changed"); fail("Immutable fields required"); }
        catch (UnsupportedOperationException expected) { }
    }

    @Test public void strictTypesAndClockBoundsRejectMalformedNativePackets() {
        Bundle b = warning(1); b.putInt("sequence", 1); rejects(b, "FIELD_TYPE:sequence");
        b = warning(1); b.putLong("issued_elapsed_ms", NOW + 1); rejects(b, "CLOCK");
        b = warning(1); b.putLong("observed_elapsed_ms", NOW + 1); rejects(b, "CLOCK");
        b = warning(1); b.putLong("state_until_elapsed_ms", NOW + 29901); rejects(b, "STATE_DEADLINE");
        b = warning(1); b.putLong("announce_until_elapsed_ms", NOW + 5001); rejects(b, "ANNOUNCE_DEADLINE");
        b = warning(1); b.putLong("sequence", 0); rejects(b, "IDENTITY");
        b = warning(1); b.putLong("revision", -1); rejects(b, "IDENTITY");
        b = warning(1); b.putInt("protocol_version", 2); rejects(b, "PROTOCOL_VERSION");
    }

    @Test public void nativeDeadlinesAndExpiredPacketsKeepIndependentOriginalClocks() {
        Bundle b = warning(1); b.putBoolean("deadline_native", true);
        b.putLong("announce_until_elapsed_ms", NOW + 12000); b.putLong("state_until_elapsed_ms", NOW);
        WarningEvent e = WarningCodec.decode(b, NOW + 20000);
        assertEquals(NOW, e.stateUntil); assertEquals(NOW + 12000, e.announceUntil);
        assertEquals(NOW, e.issuedAt); // Decode/replay never manufactures a new observation.
    }

    @Test public void onlyAnnounceRequiresAUsableSpokenPayload() {
        Bundle b = warning(1); b.putString("message", "  "); rejects(b, "MESSAGE_REQUIRED");
        b = warning(1); b.putString("message", "\u00a0\u2003\u200b"); rejects(b, "MESSAGE_REQUIRED");
        b = warning(1); b.putString("operation", "UPSERT"); b.remove("message"); b.remove("language_tag"); b.remove("message_origin");
        assertEquals(WarningEvent.Operation.UPSERT, WarningCodec.decode(b, NOW).operation);
        Bundle clear = new Bundle(); clear.putInt("protocol_version", 1); clear.putString("provider_session", SESSION);
        clear.putLong("sequence", 2); clear.putString("warning_id", "early-42"); clear.putLong("revision", 2);
        clear.putLong("announcement_index", 1); clear.putString("operation", "CLEAR");
        clear.putLong("observed_elapsed_ms", NOW); clear.putLong("issued_elapsed_ms", NOW);
        WarningEvent e = WarningCodec.decode(clear, NOW);
        assertEquals(WarningEvent.Operation.CLEAR, e.operation); assertNull(e.phase); assertEquals("", e.message);
        assertFalse(WarningCodec.encode(e).containsKey("message"));
    }

    @Test public void utf8LimitCountsBytesAndNeverTruncatesNativeInstructions() {
        Bundle b = warning(1); b.putString("message", repeat("é", 2048));
        assertEquals(2048, WarningCodec.decode(b, NOW).message.length());
        b.putString("message", repeat("é", 2049)); rejects(b, "MESSAGE_SIZE");
        b = warning(1); b.putString("message", "\uD800"); rejects(b, "TEXT_ENCODING");
    }

    @Test public void optionalGeometryRequiresFiniteValuesAndItsOwnObservationMetadata() {
        Bundle b = warning(1); b.putInt("distance_m", 0); rejects(b, "GEOMETRY_METADATA");
        b.putLong("distance_observed_elapsed_ms", NOW); b.putBoolean("distance_estimated", false);
        assertEquals(Integer.valueOf(0), WarningCodec.decode(b, NOW).distanceMeters);
        b.putDouble("latitude", 52); rejects(b, "GEOMETRY_METADATA");
        b.putDouble("longitude", 5); b.putLong("position_observed_elapsed_ms", NOW); b.putBoolean("position_estimated", true);
        assertEquals(Double.valueOf(52), WarningCodec.decode(b, NOW).latitude);
        b.putDouble("longitude", Double.NaN); rejects(b, "GEOMETRY");
        b.putDouble("longitude", 181); rejects(b, "GEOMETRY");
    }

    @Test public void minorUnknownScalarsRoundTripButCustomOrNestedValuesFail() {
        Bundle b = warning(1); b.putInt("future_minor", 3); b.putString("future_detail", "native detail");
        assertEquals("native detail", WarningCodec.encode(WarningCodec.decode(b, NOW)).getString("future_detail"));
        b.putBundle("nested", new Bundle()); rejects(b, "FIELD_TYPE:nested");
        b.remove("nested"); b.putByteArray("opaque", new byte[5]); rejects(b, "FIELD_TYPE:opaque");
        b = warning(1); b.putString("large_future_field", repeat("x", 24000)); rejects(b, "EVENT_SIZE");
    }

    @Test public void batchesRespectBothActualParcelBytesAndEightEventLimit() {
        List<WarningEvent> events = new ArrayList<>();
        for (int i = 1; i <= 9; i++) events.add(WarningCodec.decode(warning(i), NOW));
        List<Bundle> batches = WarningCodec.splitBatches(events);
        assertEquals(2, batches.size()); assertEquals(8, WarningCodec.decodeBatch(parcelCopy(batches.get(0)), NOW).size());
        assertEquals(9, WarningCodec.decodeBatch(parcelCopy(batches.get(1)), NOW).get(0).sequence);
        try { WarningCodec.encodeBatch(events); fail("Nine-event batch accepted"); }
        catch (IllegalArgumentException expected) { assertTrue(expected.getMessage().contains("BATCH_COUNT")); }
        events.clear();
        for (int i = 1; i <= 8; i++) {
            Bundle b = warning(i); b.putString("future_detail", repeat("x", 9500));
            events.add(WarningCodec.decode(b, NOW));
        }
        batches = WarningCodec.splitBatches(events); assertTrue(batches.size() > 1);
        int count = 0; for (Bundle batch : batches) { assertTrue(WarningCodec.encodedSize(batch) <= 128 * 1024); count += WarningCodec.decodeBatch(parcelCopy(batch), NOW).size(); }
        assertEquals(8, count);
    }

    @Test public void batchReorderingAndMixedProviderSessionsAreRejected() {
        WarningEvent a = WarningCodec.decode(warning(1), NOW), b = WarningCodec.decode(warning(2), NOW);
        try { WarningCodec.encodeBatch(Arrays.asList(b, a)); fail("Reordered batch accepted"); }
        catch (IllegalArgumentException expected) { assertTrue(expected.getMessage().contains("BATCH_ORDER")); }
        Bundle other = warning(3); other.putString("provider_session", "f93132ad-b6c9-4598-8c8f-d9c748c2635f");
        try { WarningCodec.encodeBatch(Arrays.asList(a, WarningCodec.decode(other, NOW))); fail("Mixed session accepted"); }
        catch (IllegalArgumentException expected) { assertTrue(expected.getMessage().contains("BATCH_SESSION")); }
    }

    public static final class SerializationProbe implements Parcelable {
        static int writes;
        @Override public int describeContents() { return 0; }
        @Override public void writeToParcel(Parcel out, int flags) { writes++; out.writeInt(1); }
    }

    @Test public void malformedBatchNeverInvokesACustomParcelableSerializer() {
        SerializationProbe.writes = 0;
        Bundle batch = new Bundle(); batch.putInt("protocol_version", 1);
        ArrayList<Parcelable> values = new ArrayList<>(); values.add(new SerializationProbe());
        batch.putParcelableArrayList("events", values);
        try { WarningCodec.decodeBatch(batch, NOW); fail("Custom Parcelable accepted"); }
        catch (IllegalArgumentException expected) { assertTrue(expected.getMessage().contains("BATCH_TYPE")); }
        assertEquals("Reject the object before measuring a malformed batch", 0, SerializationProbe.writes);
    }

    @Test public void decodeChecksBatchCountBytesOrderAndElementTypes() {
        ArrayList<Bundle> values = new ArrayList<>();
        for (int i=1;i<=9;i++) values.add(warning(i));
        Bundle batch = new Bundle(); batch.putInt("protocol_version", 1); batch.putParcelableArrayList("events", values);
        try { WarningCodec.decodeBatch(batch, NOW); fail("Oversized count accepted"); }
        catch (IllegalArgumentException expected) { assertTrue(expected.getMessage().contains("BATCH_COUNT")); }
        batch = WarningCodec.encodeBatch(Arrays.asList(WarningCodec.decode(warning(1), NOW)));
        batch.putString("future_detail", repeat("x", 128 * 1024));
        try { WarningCodec.decodeBatch(batch, NOW); fail("Oversized bytes accepted"); }
        catch (IllegalArgumentException expected) { assertTrue(expected.getMessage().contains("BATCH_SIZE")); }
        batch = new Bundle(); batch.putInt("protocol_version", 1);
        values.clear(); values.add(warning(2)); values.add(warning(1)); batch.putParcelableArrayList("events", values);
        try { WarningCodec.decodeBatch(batch, NOW); fail("Reordered packet accepted"); }
        catch (IllegalArgumentException expected) { assertTrue(expected.getMessage().contains("BATCH_ORDER")); }
    }

    private static String repeat(String s, int n) { StringBuilder out = new StringBuilder(); for (int i=0;i<n;i++) out.append(s); return out.toString(); }
}
