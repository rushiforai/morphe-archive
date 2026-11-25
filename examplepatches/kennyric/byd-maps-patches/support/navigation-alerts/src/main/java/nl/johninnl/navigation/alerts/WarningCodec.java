package nl.johninnl.navigation.alerts;

import android.os.Bundle;
import android.os.Parcel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Primitive-only, size-checked Bundle boundary for the independent WARNINGS_V1 API. */
public final class WarningCodec {
    public static final int VERSION = 1, MAX_EVENT_BYTES = 24 * 1024, MAX_BATCH_BYTES = 128 * 1024, MAX_BATCH_EVENTS = 8;
    private WarningCodec() { }

    public static WarningEvent decode(Bundle input, long now) {
        if (input == null) throw WarningEvent.invalid("EVENT_REQUIRED");
        try {
            Bundle copy = new Bundle(input);
            copy.setClassLoader(null);
            Map<String, Object> fields = new LinkedHashMap<>();
            for (String key : copy.keySet()) {
                Object value = copy.get(key);
                checkScalar(key, value);
                fields.put(key, value);
            }
            int size = encodedSize(copy);
            if (size > MAX_EVENT_BYTES) throw WarningEvent.invalid("EVENT_SIZE");
            return new WarningEvent(fields, now, size);
        } catch (IllegalArgumentException error) { throw error; }
        catch (RuntimeException error) { throw WarningEvent.invalid("EVENT_PAYLOAD"); }
    }

    public static Bundle encode(WarningEvent event) {
        if (event == null) throw WarningEvent.invalid("EVENT_REQUIRED");
        Bundle out = new Bundle();
        for (Map.Entry<String, Object> entry : event.fields().entrySet()) {
            Object value = entry.getValue(); String key = entry.getKey();
            if (value instanceof String) out.putString(key, (String) value);
            else if (value instanceof Long) out.putLong(key, (Long) value);
            else if (value instanceof Integer) out.putInt(key, (Integer) value);
            else if (value instanceof Double) out.putDouble(key, (Double) value);
            else if (value instanceof Boolean) out.putBoolean(key, (Boolean) value);
            else throw WarningEvent.invalid("EVENT_PAYLOAD");
        }
        if (encodedSize(out) > MAX_EVENT_BYTES) throw WarningEvent.invalid("EVENT_SIZE");
        return out;
    }

    public static Bundle encodeBatch(List<WarningEvent> events) {
        if (events == null || events.size() > MAX_BATCH_EVENTS) throw WarningEvent.invalid("BATCH_COUNT");
        checkOrder(events);
        Bundle out = batch(events);
        if (encodedSize(out) > MAX_BATCH_BYTES) throw WarningEvent.invalid("BATCH_SIZE");
        return out;
    }

    public static List<WarningEvent> decodeBatch(Bundle input, long now) {
        if (input == null) throw WarningEvent.invalid("BATCH_REQUIRED");
        try {
            Bundle copy = new Bundle(input); copy.setClassLoader(null);
            Object version = copy.get("protocol_version");
            if (!(version instanceof Integer) || (Integer) version != VERSION) throw WarningEvent.invalid("PROTOCOL_VERSION");
            Object raw = copy.get("events");
            if (!(raw instanceof ArrayList)) throw WarningEvent.invalid("BATCH_TYPE");
            ArrayList<?> values = (ArrayList<?>) raw;
            if (values.size() > MAX_BATCH_EVENTS) throw WarningEvent.invalid("BATCH_COUNT");
            for (String key : copy.keySet()) if (!key.equals("events")) checkScalar(key, copy.get(key));
            List<WarningEvent> events = new ArrayList<>();
            for (Object value : values) {
                if (!(value instanceof Bundle)) throw WarningEvent.invalid("BATCH_TYPE");
                events.add(decode((Bundle) value, now));
            }
            if (encodedSize(copy) > MAX_BATCH_BYTES) throw WarningEvent.invalid("BATCH_SIZE");
            checkOrder(events);
            return Collections.unmodifiableList(events);
        } catch (IllegalArgumentException error) { throw error; }
        catch (RuntimeException error) { throw WarningEvent.invalid("BATCH_PAYLOAD"); }
    }

    public static List<Bundle> splitBatches(List<WarningEvent> events) {
        if (events == null) throw WarningEvent.invalid("BATCH_REQUIRED");
        checkOrder(events);
        List<Bundle> out = new ArrayList<>(); List<WarningEvent> pending = new ArrayList<>();
        for (WarningEvent event : events) {
            if (pending.size() == MAX_BATCH_EVENTS) { out.add(encodeBatch(pending)); pending.clear(); }
            pending.add(event);
            if (encodedSize(batch(pending)) > MAX_BATCH_BYTES) {
                pending.remove(pending.size() - 1);
                if (pending.isEmpty()) throw WarningEvent.invalid("BATCH_SIZE");
                out.add(encodeBatch(pending)); pending.clear(); pending.add(event);
            }
        }
        if (!pending.isEmpty()) out.add(encodeBatch(pending));
        return Collections.unmodifiableList(out);
    }

    public static int encodedSize(Bundle value) {
        Parcel parcel = Parcel.obtain();
        try { parcel.writeBundle(value); return parcel.dataSize(); }
        finally { parcel.recycle(); }
    }

    private static Bundle batch(List<WarningEvent> events) {
        ArrayList<Bundle> values = new ArrayList<>();
        for (WarningEvent event : events) values.add(encode(event));
        Bundle out = new Bundle(); out.putInt("protocol_version", VERSION); out.putParcelableArrayList("events", values);
        return out;
    }
    private static void checkOrder(List<WarningEvent> events) {
        String session = null; long previous = 0;
        for (WarningEvent event : events) {
            if (event == null) throw WarningEvent.invalid("EVENT_REQUIRED");
            if (session != null && !session.equals(event.providerSession)) throw WarningEvent.invalid("BATCH_SESSION");
            if (event.sequence <= previous) throw WarningEvent.invalid("BATCH_ORDER");
            session = event.providerSession; previous = event.sequence;
        }
    }
    private static void checkScalar(String key, Object value) {
        if (key == null) throw WarningEvent.invalid("FIELD_NAME");
        WarningEvent.utf8Bytes(key);
        if (!(value instanceof String || value instanceof Integer || value instanceof Long || value instanceof Double || value instanceof Boolean))
            throw WarningEvent.invalid("FIELD_TYPE:" + (key.matches("[a-z][a-z0-9_]{0,127}") ? key : "unknown"));
        if (value instanceof String) WarningEvent.utf8Bytes((String) value);
    }
}
