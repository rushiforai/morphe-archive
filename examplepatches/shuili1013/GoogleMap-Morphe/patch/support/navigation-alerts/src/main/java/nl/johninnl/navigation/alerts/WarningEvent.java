package nl.johninnl.navigation.alerts;

import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/** Immutable WARNINGS_V1 primitives. Use WarningCodec at the Android IPC boundary. */
public final class WarningEvent {
    public enum Operation { UPSERT, ANNOUNCE, CLEAR }
    public enum Priority { P0, P1, P2 }
    public enum Phase { APPROACH, ENTER, ACTIVE, EXIT, NOTICE }
    public static final long STATE_WINDOW_MS = 30000;
    public final String providerSession, warningId, nativeType, nativeSubtype, category,
            message, languageTag, messageOrigin, relevance, relationship, supersedes, repeatReason;
    public final long sequence, revision, announcementIndex, observedAt, issuedAt, announceUntil, stateUntil;
    public final Operation operation;
    public final Priority priority;
    public final Phase phase;
    public final Integer distanceMeters, triggerMeters;
    public final Double latitude, longitude;
    public final Long distanceObservedAt, triggerObservedAt, positionObservedAt;
    public final boolean distanceEstimated, triggerEstimated, positionEstimated, nativeDeadline;
    public final int encodedBytes;
    private final Map<String, Object> fields;

    WarningEvent(Map<String, Object> values, long now, int bytes) {
        fields = Collections.unmodifiableMap(new LinkedHashMap<>(values));
        encodedBytes = bytes;
        if (required("protocol_version", Integer.class) != 1) throw invalid("PROTOCOL_VERSION");
        providerSession = required("provider_session", String.class);
        warningId = required("warning_id", String.class);
        sequence = required("sequence", Long.class);
        revision = required("revision", Long.class);
        announcementIndex = required("announcement_index", Long.class);
        if (!providerSession.matches("[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}")
                || warningId.trim().isEmpty() || sequence <= 0 || revision < 0 || announcementIndex < 0)
            throw invalid("IDENTITY");
        try { operation = Operation.valueOf(required("operation", String.class)); }
        catch (IllegalArgumentException error) { throw invalid("OPERATION"); }
        observedAt = required("observed_elapsed_ms", Long.class);
        issuedAt = required("issued_elapsed_ms", Long.class);
        if (now < 0 || observedAt < 0 || issuedAt < observedAt || issuedAt > now) throw invalid("CLOCK");
        boolean clear = operation == Operation.CLEAR;
        String phaseValue = clear ? optional("phase", String.class, "") : required("phase", String.class);
        if (phaseValue.isEmpty() && clear) phase = null;
        else {
            try {
                phase = Phase.valueOf(phaseValue.toUpperCase(Locale.ROOT));
                if (!phaseValue.equals(phase.name().toLowerCase(Locale.ROOT))) throw invalid("PHASE");
            } catch (IllegalArgumentException error) { throw invalid("PHASE"); }
        }
        Integer priorityValue = clear ? optional("priority", Integer.class, null) : required("priority", Integer.class);
        if (priorityValue != null && (priorityValue < 0 || priorityValue > 2)) throw invalid("PRIORITY");
        priority = priorityValue == null ? null : Priority.values()[priorityValue];
        nativeType = text("native_type", !clear);
        nativeSubtype = text("native_subtype", false);
        category = text("category", !clear);
        relevance = text("relevance", !clear);
        relationship = text("relationship", !clear);
        message = text("message", false);
        languageTag = text("language_tag", false);
        messageOrigin = text("message_origin", false);
        supersedes = text("supersedes", false);
        repeatReason = text("repeat_reason", false);
        if (utf8Bytes(message) > 4096) throw invalid("MESSAGE_SIZE");
        if (operation == Operation.ANNOUNCE && !hasText(message)) throw invalid("MESSAGE_REQUIRED");
        if (!message.isEmpty()) {
            if (languageTag.isEmpty()) throw invalid("LANGUAGE_TAG");
            try { new Locale.Builder().setLanguageTag(languageTag); }
            catch (RuntimeException error) { throw invalid("LANGUAGE_TAG"); }
            if (!(messageOrigin.equals("native_text") || messageOrigin.equals("native_resource") || messageOrigin.equals("template")))
                throw invalid("MESSAGE_ORIGIN");
        }
        nativeDeadline = optional("deadline_native", Boolean.class, false);
        announceUntil = operation == Operation.ANNOUNCE ? required("announce_until_elapsed_ms", Long.class)
                : optional("announce_until_elapsed_ms", Long.class, issuedAt);
        stateUntil = clear ? optional("state_until_elapsed_ms", Long.class, issuedAt)
                : required("state_until_elapsed_ms", Long.class);
        if (fields.containsKey("state_until_elapsed_ms") && (stateUntil < observedAt || stateUntil - observedAt > STATE_WINDOW_MS))
            throw invalid("STATE_DEADLINE");
        if (operation == Operation.ANNOUNCE) {
            long window = priority == Priority.P0 || relevance.equals("moving_emergency") ? 5000 : 10000;
            if (announceUntil < issuedAt || (!nativeDeadline && announceUntil - issuedAt > window))
                throw invalid("ANNOUNCE_DEADLINE");
        }
        distanceMeters = optional("distance_m", Integer.class, null);
        triggerMeters = optional("trigger_m", Integer.class, null);
        latitude = optional("latitude", Double.class, null);
        longitude = optional("longitude", Double.class, null);
        distanceObservedAt = optional("distance_observed_elapsed_ms", Long.class, null);
        triggerObservedAt = optional("trigger_observed_elapsed_ms", Long.class, null);
        positionObservedAt = optional("position_observed_elapsed_ms", Long.class, null);
        distanceEstimated = optional("distance_estimated", Boolean.class, false);
        triggerEstimated = optional("trigger_estimated", Boolean.class, false);
        positionEstimated = optional("position_estimated", Boolean.class, false);
        geometryGroup(distanceMeters != null, distanceObservedAt, "distance_estimated");
        geometryGroup(triggerMeters != null, triggerObservedAt, "trigger_estimated");
        geometryGroup(latitude != null || longitude != null, positionObservedAt, "position_estimated");
        if ((distanceMeters != null && distanceMeters < 0) || (triggerMeters != null && triggerMeters < 0)) throw invalid("GEOMETRY");
        if (latitude != null || longitude != null) {
            if (latitude == null || longitude == null) throw invalid("GEOMETRY_METADATA");
            if (!Double.isFinite(latitude) || !Double.isFinite(longitude) || latitude < -90 || latitude > 90 || longitude < -180 || longitude > 180)
                throw invalid("GEOMETRY");
        }
    }

    public Map<String, Object> fields() { return fields; }
    public boolean announcementValid(long now) { return operation == Operation.ANNOUNCE && now >= issuedAt && now < announceUntil; }
    public boolean stateValid(long now) { return operation != Operation.CLEAR && now >= observedAt && now < stateUntil; }

    private void geometryGroup(boolean present, Long observed, String estimatedKey) {
        if (present != (observed != null) || present != fields.containsKey(estimatedKey)) throw invalid("GEOMETRY_METADATA");
        if (observed != null && (observed < 0 || observed > issuedAt)) throw invalid("GEOMETRY_CLOCK");
    }
    private String text(String key, boolean required) {
        String result = required ? required(key, String.class) : optional(key, String.class, "");
        if (required && result.trim().isEmpty()) throw invalid("FIELD_REQUIRED:" + key);
        return result;
    }
    private <T> T required(String key, Class<T> type) {
        Object value = fields.get(key);
        if (value == null) throw invalid("FIELD_REQUIRED:" + key);
        if (value.getClass() != type) throw invalid("FIELD_TYPE:" + key);
        return type.cast(value);
    }
    private <T> T optional(String key, Class<T> type, T fallback) {
        return fields.containsKey(key) ? required(key, type) : fallback;
    }
    static int utf8Bytes(String text) {
        try { return StandardCharsets.UTF_8.newEncoder().encode(CharBuffer.wrap(text)).remaining(); }
        catch (CharacterCodingException error) { throw invalid("TEXT_ENCODING"); }
    }
    static boolean hasText(String text) {
        for (int at=0;at<text.length();) {
            int point = text.codePointAt(at), type = Character.getType(point);
            if (!Character.isWhitespace(point) && !Character.isSpaceChar(point)
                    && type != Character.FORMAT && type != Character.CONTROL) return true;
            at += Character.charCount(point);
        }
        return false;
    }
    static IllegalArgumentException invalid(String reason) { return new IllegalArgumentException(reason); }
}
