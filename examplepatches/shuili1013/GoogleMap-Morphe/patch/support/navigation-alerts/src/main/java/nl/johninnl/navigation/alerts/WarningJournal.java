package nl.johninnl.navigation.alerts;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Process-local transport/state history. Replay candidates never authorize playback. */
public final class WarningJournal {
    public static final int MAX_EVENTS = 128, MAX_WARNINGS = 128;
    public static final long RETENTION_MS = 30000;
    public enum Append { ACCEPTED, DUPLICATE, CONFLICT, OUT_OF_ORDER, WRONG_SESSION, STALE_REVISION, OVERFLOW }

    /** Keep native authority/deadline separate from an updated unsaid payload. */
    public static final class Announcement {
        public final WarningEvent authority, payload;
        public final long announceUntil;
        private Announcement(WarningEvent authority, WarningEvent payload) {
            this.authority = authority; this.payload = payload; announceUntil = authority.announceUntil;
        }
    }

    public static final class Resume {
        public final String providerSession;
        public final long headSequence;
        public final boolean resyncRequired, overflow;
        public final List<WarningEvent> events, currentState;
        public final List<Announcement> announcements;
        private Resume(String session, long head, boolean resync, boolean overflow,
                       List<WarningEvent> events, List<WarningEvent> state, List<Announcement> announcements) {
            providerSession = session; headSequence = head; resyncRequired = resync; this.overflow = overflow;
            this.events = Collections.unmodifiableList(new ArrayList<>(events));
            currentState = Collections.unmodifiableList(new ArrayList<>(state));
            this.announcements = Collections.unmodifiableList(new ArrayList<>(announcements));
        }
    }

    private final String session;
    private final List<WarningEvent> history = new ArrayList<>();
    private final Map<String, WarningRecord> latest = new LinkedHashMap<>();
    // At most one accepted payload revision per retained ANNOUNCE authority (<=128).
    private final Map<Long, WarningEvent> announcementPayloads = new HashMap<>();
    private long head, lastNow = -1, lastIssued = -1;
    private boolean overflow;

    /** Metadata must outlive an expired/replaced payload while old authorities remain. */
    private static final class WarningRecord {
        WarningEvent payload;
        long revision, sequence, cancelledThrough;
        void update(WarningEvent event) {
            payload = event; revision = event.revision; sequence = event.sequence;
            if (event.operation == WarningEvent.Operation.CLEAR) cancelledThrough = event.sequence;
        }
    }

    public WarningJournal(String providerSession) {
        if (providerSession == null || !providerSession.matches("[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"))
            throw new IllegalArgumentException("IDENTITY");
        session = providerSession;
    }

    /** Reserve a sequence only after caller validation; rejected conflicts do not advance it.
     * Overflow advances the head and exposes a missing record, never a false contiguous cursor.
     */
    public synchronized Append append(WarningEvent event, long now) {
        advance(now);
        if (event == null) throw new IllegalArgumentException("EVENT_REQUIRED");
        if (!session.equals(event.providerSession)) return Append.WRONG_SESSION;
        if (event.issuedAt > now) throw new IllegalArgumentException("CLOCK");
        if (event.sequence <= head) {
            for (WarningEvent existing : history) if (existing.sequence == event.sequence)
                return existing.fields().equals(event.fields()) ? Append.DUPLICATE : Append.CONFLICT;
            return Append.CONFLICT; // An unretained identity cannot be proven identical.
        }
        if (head == Long.MAX_VALUE || event.sequence != head + 1 || event.issuedAt < lastIssued) return Append.OUT_OF_ORDER;
        WarningRecord previous = latest.get(event.warningId);
        if (previous != null && event.revision < previous.revision) return Append.STALE_REVISION;
        if (event.operation == WarningEvent.Operation.ANNOUNCE) {
            for (WarningEvent existing : history) if (sameAnnouncement(existing, event)) return Append.CONFLICT;
        }
        if (previous == null && latest.size() == MAX_WARNINGS) {
            head = event.sequence; lastIssued = event.issuedAt; overflow = true; return Append.OVERFLOW;
        }
        // Even an unretained CLEAR must revoke source-side playback authority.
        if (previous == null) { previous = new WarningRecord(); latest.put(event.warningId, previous); }
        previous.update(event);
        for (WarningEvent authority : history) {
            if (authority.operation != WarningEvent.Operation.ANNOUNCE || !authority.warningId.equals(event.warningId)) continue;
            if (event.operation == WarningEvent.Operation.CLEAR) announcementPayloads.remove(authority.sequence);
            else if (event.operation == WarningEvent.Operation.UPSERT && authority.sequence > previous.cancelledThrough
                    && authority.phase == event.phase && authority.announcementIndex == event.announcementIndex
                    && authority.revision <= event.revision && authority.announcementValid(now) && WarningEvent.hasText(event.message))
                announcementPayloads.put(authority.sequence, event);
        }
        head = event.sequence; lastIssued = event.issuedAt;
        if (history.size() == MAX_EVENTS) coalesceSupersededUpsert();
        if (history.size() == MAX_EVENTS) { overflow = true; return Append.OVERFLOW; }
        history.add(event);
        return Append.ACCEPTED;
    }

    /** Data-only state plus original retained records; explicit resync is mandatory on gaps.
     * A consumer must not interpret snapshots or candidate presence as a playback grant.
     */
    public synchronized Resume resume(String providerSession, long afterSequence, long now) {
        advance(now);
        if (afterSequence < 0) throw new IllegalArgumentException("CURSOR");
        boolean changedSession = !session.equals(providerSession);
        if (!changedSession && afterSequence > head) throw new IllegalArgumentException("CURSOR");
        long cursor = changedSession ? 0 : afterSequence;
        long position = cursor;
        boolean resync = changedSession;
        List<WarningEvent> records = new ArrayList<>();
        List<Announcement> announcements = new ArrayList<>();
        for (WarningEvent event : history) {
            if (event.sequence <= cursor) continue;
            if (event.sequence != position + 1) resync = true;
            position = event.sequence; records.add(event);
            Announcement announcement = eligible(event, now);
            if (announcement != null) announcements.add(announcement);
        }
        if (position != head) resync = true;
        List<WarningEvent> state = new ArrayList<>();
        for (WarningRecord record : latest.values()) {
            WarningEvent event = record.payload;
            if (event != null && event.stateValid(now)) state.add(event);
        }
        state.sort(Comparator.comparingLong(event -> event.sequence));
        return new Resume(session, head, resync, overflow, records, state, announcements);
    }

    /** Trusted source lookup for BEGIN_ATTEMPT; never rely on a caller's cached payload. */
    public synchronized Announcement announcement(String warningId, WarningEvent.Phase phase, long index, long now) {
        advance(now);
        for (WarningEvent event : history) {
            if (event.warningId.equals(warningId) && event.phase == phase && event.announcementIndex == index) {
                Announcement candidate = eligible(event, now);
                if (candidate != null) return candidate;
            }
        }
        return null;
    }
    /** Explicit parked recovery keeps visual state but retires every earlier playback authority. */
    synchronized void revokeAnnouncements(){
        for(WarningRecord record:latest.values())record.cancelledThrough=head;
        announcementPayloads.clear();
    }

    private Announcement eligible(WarningEvent authority, long now) {
        if (!authority.announcementValid(now)) return null;
        WarningRecord record = latest.get(authority.warningId);
        if (record != null && authority.sequence <= record.cancelledThrough) return null;
        WarningEvent payload = announcementPayloads.get(authority.sequence);
        if (payload == null) payload = authority;
        return new Announcement(authority, payload);
    }

    private static boolean sameAnnouncement(WarningEvent first, WarningEvent second) {
        return first.operation == WarningEvent.Operation.ANNOUNCE && second.operation == WarningEvent.Operation.ANNOUNCE
                && first.warningId.equals(second.warningId) && first.phase == second.phase
                && first.announcementIndex == second.announcementIndex;
    }

    private void coalesceSupersededUpsert() {
        for (int i=0;i<history.size();i++) {
            WarningEvent old = history.get(i); WarningRecord current = latest.get(old.warningId);
            if (old.operation == WarningEvent.Operation.UPSERT && current != null && current.sequence > old.sequence) {
                history.remove(i); return;
            }
        }
    }

    private void advance(long now) {
        if (now < 0 || now < lastNow) throw new IllegalArgumentException("CLOCK");
        lastNow = now;
        history.removeIf(event -> !retained(event, now));
        HashSet<String> retainedIds = new HashSet<>();
        HashSet<Long> liveAuthorities = new HashSet<>();
        for (WarningEvent event : history) {
            retainedIds.add(event.warningId);
            WarningRecord record = latest.get(event.warningId);
            if (event.announcementValid(now) && (record == null || event.sequence > record.cancelledThrough)) liveAuthorities.add(event.sequence);
        }
        announcementPayloads.keySet().removeIf(sequence -> !liveAuthorities.contains(sequence));
        latest.entrySet().removeIf(entry -> {
            WarningRecord record = entry.getValue();
            if (record.payload != null && !retained(record.payload, now)) record.payload = null;
            if (record.payload != null) return false;
            return !retainedIds.contains(entry.getKey());
        });
    }

    private static boolean retained(WarningEvent event, long now) {
        if (now < event.issuedAt || now - event.issuedAt >= RETENTION_MS) return false;
        return event.operation == WarningEvent.Operation.CLEAR || event.stateValid(now) || event.announcementValid(now);
    }
}
