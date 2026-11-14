package app.hushmessenger.extension;

import android.util.AtomicFile;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * One account's special contacts (#163): who's tracked and what was seen of them, one file per person in the account's
 * folder. The methods take turns on the store, and {@link #ids} is the copy the hooks read on every presence update
 * without waiting for them.
 */
final class SpecialContactsStore {
    static final int MAX_PEOPLE = 50;
    static final int MAX_EVENTS = 500;
    /** Typing comes in a burst of updates, so one event per person this often. */
    static final long TYPING_BURST_MILLIS = 30_000;
    /** An offline update whose last active time moved on by more than this means they were on again in between. */
    static final long SEEN_AGAIN_MILLIS = 60_000;

    static final String TRACKED = "tracked";
    static final String ONLINE = "online";
    static final String OFFLINE = "offline";
    static final String TYPING = "typing";
    static final String NAME = "name";

    enum Result { ADDED, ALREADY, FULL, FAILED }

    static final class Event {
        final long at;
        final String kind;
        /** Offline: the last active time in milliseconds, or empty. Name: the old name, a newline, the new one. */
        final String detail;

        Event(long at, String kind, String detail) {
            this.at = at;
            this.kind = kind;
            this.detail = detail;
        }
    }

    static final class Person {
        final String id;
        final String name;
        final long since;
        /** The newest event, or null once the history is cleared. */
        final Event latest;

        Person(String id, String name, long since, Event latest) {
            this.id = id;
            this.name = name;
            this.since = since;
            this.latest = latest;
        }
    }

    private static final class Record {
        final String id;
        final long since;
        String name;
        /** The newest last active time seen, in milliseconds. */
        long lastActive;
        /** Online or offline, from the newest presence event, or null before the first one. */
        String presence;
        long typedAt;
        final ArrayList<Event> events = new ArrayList<>();

        Record(String id, String name, long since) {
            this.id = id;
            this.name = name;
            this.since = since;
        }
    }

    /** The account this store belongs to, its user id. */
    final String account;
    private final File folder;
    private final LinkedHashMap<String, Record> records = new LinkedHashMap<>();
    private boolean loaded;
    private volatile Set<String> ids = Collections.emptySet();

    SpecialContactsStore(File folder) {
        this.folder = folder;
        account = folder.getName();
    }

    static boolean validId(String id) {
        return id != null && id.length() <= 20 && !id.isEmpty() && id.chars().allMatch(c -> c >= '0' && c <= '9');
    }

    /** The people tracked, for a check that can't wait on the store. */
    Set<String> ids() {
        return ids;
    }

    /** Reads the folder once. A file that can't be read keeps its person tracked with a fresh history. */
    synchronized void load() {
        if (loaded) return;
        loaded = true;
        File[] files = folder.listFiles();
        TreeSet<String> found = new TreeSet<>();
        if (files != null) {
            for (File file : files) {
                String name = file.getName();
                int dot = name.indexOf('.');
                String rest = dot < 0 ? "" : name.substring(dot);
                // AtomicFile leaves a .bak or .new beside the file when a write didn't finish, and reads it back.
                if (dot > 0 && validId(name.substring(0, dot)) && (rest.equals(".json") || rest.equals(".json.bak") || rest.equals(".json.new")))
                    found.add(name.substring(0, dot));
            }
        }
        for (String id : found) {
            if (records.size() >= MAX_PEOPLE) break;
            Record record = read(id);
            if (record == null) {
                record = new Record(id, "", System.currentTimeMillis());
                records.put(id, record);
                save(record);
            } else {
                records.put(id, record);
            }
        }
        publish();
    }

    synchronized Result track(String id, String name, long now) {
        load();
        if (!validId(id)) return Result.FAILED;
        if (records.containsKey(id)) return Result.ALREADY;
        if (records.size() >= MAX_PEOPLE) return Result.FULL;
        Record record = new Record(id, clean(name), now);
        append(record, now, TRACKED, "");
        records.put(id, record);
        if (!save(record)) {
            records.remove(id);
            new AtomicFile(file(id)).delete();
            return Result.FAILED;
        }
        publish();
        return Result.ADDED;
    }

    /** Stops tracking and deletes what was seen. False when they weren't tracked or the file wouldn't go. */
    synchronized boolean untrack(String id) {
        load();
        if (!records.containsKey(id)) return false;
        new AtomicFile(file(id)).delete();
        if (file(id).exists()) return false;
        records.remove(id);
        publish();
        return true;
    }

    synchronized boolean clearHistory(String id) {
        load();
        Record record = records.get(id);
        if (record == null) return false;
        record.events.clear();
        record.presence = null;
        return save(record);
    }

    synchronized int count() {
        load();
        return records.size();
    }

    /** Everyone tracked, the one seen most lately first. */
    synchronized List<Person> people() {
        load();
        List<Person> people = new ArrayList<>();
        for (Record record : records.values()) {
            Event latest = record.events.isEmpty() ? null : record.events.get(record.events.size() - 1);
            people.add(new Person(record.id, record.name, record.since, latest));
        }
        people.sort((a, b) -> Long.compare(at(b), at(a)));
        return people;
    }

    /** What was seen of one person, newest first. */
    synchronized List<Event> history(String id) {
        load();
        Record record = records.get(id);
        if (record == null) return Collections.emptyList();
        List<Event> events = new ArrayList<>(record.events);
        Collections.reverse(events);
        return events;
    }

    /**
     * A presence update. Online is written when the last thing seen wasn't online. Offline needs a last active time,
     * since an update without one can come from this phone losing its own connection, and is written after online or
     * when the time moved on, which means they were on again in between. True when an event was written.
     */
    synchronized boolean presence(String id, boolean active, long lastActive, long now) {
        load();
        Record record = records.get(id);
        if (record == null) return false;
        long last = lastActive <= 0 ? 0 : lastActive > 100_000_000_000L ? lastActive : lastActive * 1000;
        long before = record.lastActive;
        if (last > before) record.lastActive = last;
        if (active) {
            if (ONLINE.equals(record.presence)) return false;
            append(record, now, ONLINE, "");
            return save(record);
        }
        if (last <= 0) return false;
        if (ONLINE.equals(record.presence) || record.presence == null || last > before + SEEN_AGAIN_MILLIS) {
            append(record, now, OFFLINE, Long.toString(last));
            return save(record);
        }
        return false;
    }

    synchronized boolean typing(String id, long now) {
        load();
        Record record = records.get(id);
        if (record == null) return false;
        if (record.typedAt > 0 && now >= record.typedAt && now - record.typedAt < TYPING_BURST_MILLIS) return false;
        record.typedAt = now;
        append(record, now, TYPING, "");
        return save(record);
    }

    /** The name the chat list shows for them. The first one is kept quietly, and a change after that goes in the history. */
    synchronized boolean named(String id, String name, long now) {
        load();
        Record record = records.get(id);
        String clean = clean(name);
        if (record == null || clean.isEmpty() || clean.equals(record.name)) return false;
        if (!record.name.isEmpty()) append(record, now, NAME, record.name + "\n" + clean);
        record.name = clean;
        return save(record);
    }

    private static long at(Person person) {
        return person.latest == null ? person.since : person.latest.at;
    }

    private static void append(Record record, long at, String kind, String detail) {
        record.events.add(new Event(at, kind, detail));
        if (record.events.size() > MAX_EVENTS) record.events.remove(0);
        if (ONLINE.equals(kind) || OFFLINE.equals(kind)) record.presence = kind;
    }

    private void publish() {
        ids = Collections.unmodifiableSet(new HashSet<>(records.keySet()));
    }

    private File file(String id) {
        return new File(folder, id + ".json");
    }

    private static String clean(String name) {
        return name == null ? "" : name.replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim();
    }

    private Record read(String id) {
        try {
            JSONObject json = new JSONObject(new String(new AtomicFile(file(id)).readFully(), StandardCharsets.UTF_8));
            if (json.optInt("v") != 1 || !id.equals(json.optString("id"))) return null;
            Record record = new Record(id, clean(json.optString("name")), json.optLong("since"));
            record.lastActive = json.optLong("last");
            JSONArray events = json.optJSONArray("events");
            for (int i = 0; events != null && i < events.length(); i++) {
                JSONArray event = events.optJSONArray(i);
                if (event == null || event.length() != 3) continue;
                String kind = event.optString(1);
                if (!kind.equals(TRACKED) && !kind.equals(ONLINE) && !kind.equals(OFFLINE) && !kind.equals(TYPING) && !kind.equals(NAME)) continue;
                append(record, event.optLong(0), kind, event.optString(2));
            }
            return record;
        } catch (IOException | JSONException | RuntimeException unreadable) {
            android.util.Log.w("HushMessenger", "Special contacts: a history file couldn't be read: " + unreadable.getClass().getSimpleName());
            return null;
        }
    }

    private boolean save(Record record) {
        AtomicFile atomic = new AtomicFile(file(record.id));
        FileOutputStream out = null;
        try {
            if (!folder.mkdirs() && !folder.isDirectory()) throw new IOException("No folder for special contacts");
            JSONArray events = new JSONArray();
            for (Event event : record.events) events.put(new JSONArray().put(event.at).put(event.kind).put(event.detail));
            JSONObject json = new JSONObject().put("v", 1).put("id", record.id).put("name", record.name)
                .put("since", record.since).put("last", record.lastActive).put("events", events);
            out = atomic.startWrite();
            out.write(json.toString().getBytes(StandardCharsets.UTF_8));
            atomic.finishWrite(out);
            return true;
        } catch (IOException | JSONException | RuntimeException failure) {
            if (out != null) atomic.failWrite(out);
            android.util.Log.w("HushMessenger", "Special contacts: a history file couldn't be saved: " + failure.getClass().getSimpleName());
            return false;
        }
    }
}
