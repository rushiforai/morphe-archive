/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.util.AtomicFile;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import app.hushtelegram.extension.shared.Logger;

/**
 * The people Special contacts follows and what was seen of each, kept on the phone only: a folder
 * for each account and a file for each person, under storage Android never backs up. Each file
 * holds what was last seen of the person and their history, oldest first, capped at
 * {@link #MAX_EVENTS}. A file that can't be read starts that person's history over.
 *
 * <p>Every change goes through one lock. The hooks ask {@link #anyTracked} and {@link #trackedNow}
 * first, which read arrays swapped in whole and take no lock, so a user nobody tracks costs a
 * binary search.
 */
final class SpecialContactsStore {
    static final int MAX_PEOPLE = 50;
    static final int MAX_EVENTS = 500;
    /** Typing in one chat counts once until it has stopped this long. */
    static final long TYPING_BURST_MILLIS = 30_000L;
    /** An offline time this far before the online seen last is an older copy, not news. */
    static final long STALE_MILLIS = 60_000L;

    /** What a user's status says, as {@link Seen#status} and the snapshot keep it. */
    static final int UNKNOWN = 0;
    static final int ONLINE = 1;
    static final int OFFLINE = 2;
    static final int RECENTLY = 3;
    static final int WEEK = 4;
    static final int MONTH = 5;
    /** Last seen a long time ago: Telegram shows no status at all. */
    static final int HIDDEN = 6;

    static final String TRACKED = "tracked";
    static final String ONLINE_NOW = "online";
    static final String OFFLINE_AT = "offline";
    static final String SEEN_RECENTLY = "recently";
    static final String SEEN_WEEK = "week";
    static final String SEEN_MONTH = "month";
    static final String SEEN_LONG_AGO = "long_ago";
    static final String TYPING = "typing";
    static final String NAME = "name";
    static final String USERNAME = "username";
    static final String PHONE = "phone";
    static final String PHOTO_ADDED = "photo_added";
    static final String PHOTO_REMOVED = "photo_removed";
    static final String PHOTO_CHANGED = "photo_changed";
    static final String CONTACT_SAVED = "contact_saved";
    static final String CONTACT_REMOVED = "contact_removed";
    static final String MUTUAL_ON = "mutual_on";
    static final String MUTUAL_OFF = "mutual_off";
    static final String MAYBE_BLOCKED = "maybe_blocked";
    static final String MAYBE_UNBLOCKED = "maybe_unblocked";
    static final String DELETED = "deleted";

    enum Result { ADDED, ALREADY, FULL, FAILED }

    /** One line of a person's history. A change keeps the old and the new value in [detail], a line apart. */
    static final class Event {
        final long at;
        final String kind;
        final String detail;

        Event(long at, String kind, String detail) {
            this.at = at;
            this.kind = kind;
            this.detail = detail == null ? "" : detail;
        }
    }

    /**
     * What one look at a user showed. A null text, an {@link #UNKNOWN} status or a false known flag
     * means that look didn't carry it, and the snapshot keeps what it had.
     */
    static final class Seen {
        String name;
        /** Every active username, sorted, as "@a, @b"; empty for none. */
        String usernames;
        /** Empty when Telegram didn't show one, which says nothing about a change. */
        String phone;
        boolean photoKnown;
        long photoId;
        /** A photo you set for this contact yourself, which isn't theirs. */
        boolean personalPhoto;
        int status = UNKNOWN;
        /**
         * In seconds: for {@link #OFFLINE} when they were last online, for {@link #ONLINE} when that
         * online runs out (0 when unknown). An online that ran out a while ago counts as offline then,
         * the way Telegram shows it.
         */
        long lastSeen;
        boolean contactKnown;
        boolean contact;
        boolean mutual;
        boolean bot;
        boolean deleted;
    }

    /** A tracked person as a list shows them. */
    static final class Person {
        final int account;
        final long id;
        final String name;
        final String username;
        final long since;
        final long lastAt;
        final int events;

        Person(int account, long id, String name, String username, long since, long lastAt, int events) {
            this.account = account;
            this.id = id;
            this.name = name;
            this.username = username;
            this.since = since;
            this.lastAt = lastAt;
            this.events = events;
        }
    }

    private static final class Snapshot {
        String name;
        String usernames;
        String phone;
        boolean photoKnown;
        long photoId;
        int status = UNKNOWN;
        long lastSeen;
        long statusAt;
        boolean contactKnown;
        boolean contact;
        boolean mutual;
        boolean maybeBlocked;
        boolean deleted;
    }

    private static final class Record {
        final int account;
        final long id;
        String name = "";
        String username = "";
        long since;
        Snapshot snap = new Snapshot();
        final ArrayList<Event> events = new ArrayList<>();
        boolean loaded;
        /** When typing was last seen in each chat. Not saved: a burst doesn't outlive the process. */
        final HashMap<String, Long> typing = new HashMap<>();

        Record(int account, long id) {
            this.account = account;
            this.id = id;
        }

        long lastAt() {
            return events.isEmpty() ? since : events.get(events.size() - 1).at;
        }
    }

    private static final Pattern ACCOUNT_DIR = Pattern.compile("\\d{1,2}");
    private static final String[] SUFFIXES = {".json", ".json.bak", ".json.new"};

    private final File root;
    private final Map<Integer, LinkedHashMap<Long, Record>> people = new HashMap<>();
    /** Each account's tracked ids, sorted; swapped whole on every change. */
    private volatile long[][] byAccount = new long[Accounts.MAX][];
    /** Every account's tracked ids together, sorted. */
    private volatile long[] anyAccount = new long[0];

    /** Lists who is tracked from the file names alone; a person's file is read when it's needed. */
    SpecialContactsStore(File root) {
        this.root = root;
        File[] accounts = root.listFiles();
        if (accounts != null) {
            Arrays.sort(accounts);
            for (File dir : accounts) {
                if (!dir.isDirectory() || !ACCOUNT_DIR.matcher(dir.getName()).matches()) continue;
                int account = Integer.parseInt(dir.getName());
                if (!validAccount(account)) continue;
                File[] files = dir.listFiles();
                if (files == null) continue;
                Arrays.sort(files);
                Map<Long, Record> map = mapOf(account);
                for (File file : files) {
                    long id = idOf(file.getName());
                    if (id <= 0 || map.containsKey(id) || map.size() >= MAX_PEOPLE) continue;
                    map.put(id, new Record(account, id));
                }
            }
        }
        reindex();
    }

    // ---- Lock-free checks for the hooks --------------------------------------------------

    boolean nobody() {
        return anyAccount.length == 0;
    }

    boolean anyTracked(long id) {
        long[] all = anyAccount;
        return all.length > 0 && Arrays.binarySearch(all, id) >= 0;
    }

    boolean trackedNow(int account, long id) {
        if (!validAccount(account)) return false;
        long[] ids = byAccount[account];
        return ids != null && Arrays.binarySearch(ids, id) >= 0;
    }

    // ---- Who is tracked -------------------------------------------------------------------

    /** Starts tracking [id] for [account], taking [seen] (when there is one) as what it looks like now. */
    synchronized Result track(int account, long id, Seen seen, long now) {
        if (!validAccount(account) || id <= 0) return Result.FAILED;
        Map<Long, Record> map = mapOf(account);
        if (map.containsKey(id)) return Result.ALREADY;
        if (map.size() >= MAX_PEOPLE) return Result.FULL;
        Record record = new Record(account, id);
        record.loaded = true;
        record.since = now;
        if (seen != null) diff(record, seen, now, true, new ArrayList<>());
        record.events.add(new Event(now, TRACKED, ""));
        if (!save(record)) {
            new AtomicFile(fileOf(account, id)).delete();
            return Result.FAILED;
        }
        map.put(id, record);
        reindex();
        return Result.ADDED;
    }

    /** Stops tracking and deletes everything kept about them. False when they weren't tracked. */
    synchronized boolean untrack(int account, long id) {
        if (!validAccount(account)) return false;
        Map<Long, Record> map = people.get(account);
        if (map == null || map.remove(id) == null) return false;
        new AtomicFile(fileOf(account, id)).delete();
        reindex();
        return true;
    }

    /** Empties a person's history and keeps tracking them. False when they aren't tracked or it couldn't be saved. */
    synchronized boolean clear(int account, long id) {
        Record record = record(account, id);
        if (record == null) return false;
        load(record);
        record.events.clear();
        record.typing.clear();
        return save(record);
    }

    synchronized boolean tracked(int account, long id) {
        return record(account, id) != null;
    }

    /** How many people [account] tracks, without reading their files. */
    synchronized int count(int account) {
        Map<Long, Record> map = validAccount(account) ? people.get(account) : null;
        return map == null ? 0 : map.size();
    }

    /** Everyone tracked for [account], the most recently active first. */
    synchronized List<Person> list(int account) {
        List<Person> found = new ArrayList<>();
        Map<Long, Record> map = validAccount(account) ? people.get(account) : null;
        if (map == null) return found;
        for (Record record : map.values()) {
            load(record);
            found.add(new Person(account, record.id, record.name, record.username, record.since, record.lastAt(), record.events.size()));
        }
        Collections.sort(found, (a, b) -> a.lastAt != b.lastAt ? Long.compare(b.lastAt, a.lastAt) : Long.compare(a.id, b.id));
        return found;
    }

    /** One tracked person, or null. */
    synchronized Person person(int account, long id) {
        Record record = record(account, id);
        if (record == null) return null;
        load(record);
        return new Person(account, id, record.name, record.username, record.since, record.lastAt(), record.events.size());
    }

    /** A person's history, newest first. Empty when they aren't tracked. */
    synchronized List<Event> history(int account, long id) {
        Record record = record(account, id);
        if (record == null) return new ArrayList<>();
        load(record);
        List<Event> newestFirst = new ArrayList<>(record.events);
        Collections.reverse(newestFirst);
        return newestFirst;
    }

    // ---- What was seen ----------------------------------------------------------------------

    /**
     * Compares [seen] with what was last seen of a tracked person and adds an event for each change.
     * A user read from Telegram's own database ([fromCache]) only fills in what isn't known yet: it
     * can be older than what was already seen. Answers the events added.
     */
    synchronized List<Event> observe(int account, long id, Seen seen, long now, boolean fromCache) {
        Record record = record(account, id);
        if (record == null || seen == null) return Collections.emptyList();
        load(record);
        List<Event> added = new ArrayList<>();
        boolean changed = diff(record, seen, now, fromCache, added);
        for (Event event : added) append(record, event);
        if (changed || !added.isEmpty()) save(record);
        return added;
    }

    /**
     * Typing seen in one chat: [where] names it for the history, empty for a private chat, and
     * [chat] keys the burst. Only the first update of a burst is kept. Answers the event, or null.
     */
    synchronized Event typing(int account, long id, String where, String chat, long now) {
        Record record = record(account, id);
        if (record == null) return null;
        load(record);
        Long last = record.typing.put(chat, now);
        if (last != null && now >= last && now - last < TYPING_BURST_MILLIS) return null;
        if (record.typing.size() > 32) {
            for (Iterator<Long> each = record.typing.values().iterator(); each.hasNext(); ) {
                if (now - each.next() >= TYPING_BURST_MILLIS) each.remove();
            }
        }
        Event event = new Event(now, TYPING, where);
        append(record, event);
        save(record);
        return event;
    }

    private boolean diff(Record record, Seen seen, long now, boolean fromCache, List<Event> into) {
        Snapshot s = record.snap;
        boolean changed = false;
        // How the list shows them. A stored copy can be older, so it only fills in a blank.
        if (seen.name != null && !seen.name.isEmpty() && !seen.name.equals(record.name) && (!fromCache || record.name.isEmpty())) {
            record.name = seen.name;
            changed = true;
        }
        if (seen.usernames != null && !seen.usernames.equals(record.username) && (!fromCache || s.usernames == null)) {
            record.username = seen.usernames;
            changed = true;
        }

        if (seen.deleted) {
            if (!s.deleted) {
                s.deleted = true;
                if (!fromCache && s.status != UNKNOWN) into.add(new Event(now, DELETED, ""));
                return true;
            }
            return changed;
        }
        if (s.deleted && !fromCache) {
            s.deleted = false;
            changed = true;
        }

        // Contacts: whether you saved them, and whether they saved you back, which Telegram only
        // tells you about someone you saved.
        boolean savedName = s.contactKnown && s.contact;
        if (seen.contactKnown && !(fromCache && s.contactKnown)) {
            boolean mutual = seen.contact && seen.mutual;
            if (!s.contactKnown || fromCache) {
                s.contactKnown = true;
                s.contact = seen.contact;
                s.mutual = mutual;
                changed = true;
            } else if (s.contact != seen.contact) {
                into.add(new Event(now, seen.contact ? CONTACT_SAVED : CONTACT_REMOVED, ""));
                s.contact = seen.contact;
                s.mutual = mutual;
                changed = true;
            } else if (s.contact && s.mutual != mutual) {
                into.add(new Event(now, mutual ? MUTUAL_ON : MUTUAL_OFF, ""));
                s.mutual = mutual;
                changed = true;
            }
        }
        savedName |= s.contactKnown && s.contact;

        // A saved contact shows the name you gave them, so a change there is yours, not theirs.
        if (seen.name != null && !seen.name.isEmpty() && !(fromCache && s.name != null)) {
            if (s.name != null && !fromCache && !savedName && !s.name.equals(seen.name)) {
                into.add(new Event(now, NAME, s.name + "\n" + seen.name));
            }
            if (!seen.name.equals(s.name)) {
                s.name = seen.name;
                changed = true;
            }
        }
        if (seen.usernames != null && !(fromCache && s.usernames != null)) {
            if (s.usernames != null && !fromCache && !s.usernames.equals(seen.usernames)) {
                into.add(new Event(now, USERNAME, s.usernames + "\n" + seen.usernames));
            }
            if (!seen.usernames.equals(s.usernames)) {
                s.usernames = seen.usernames;
                changed = true;
            }
        }
        // A phone number comes and goes with privacy settings, so only one number replacing another counts.
        if (seen.phone != null && !seen.phone.isEmpty() && !(fromCache && s.phone != null)) {
            if (s.phone != null && !fromCache && !s.phone.equals(seen.phone)) {
                into.add(new Event(now, PHONE, s.phone + "\n" + seen.phone));
            }
            if (!seen.phone.equals(s.phone)) {
                s.phone = seen.phone;
                changed = true;
            }
        }

        // A guess at a block: someone who blocks you shows no status and no photo, all at once.
        // It takes a look that carried both, and a status and photo seen before.
        boolean photo = seen.photoKnown && !seen.personalPhoto;
        boolean baselined = s.status != UNKNOWN && s.photoKnown;
        boolean quiet = false;
        if (!fromCache && baselined && !seen.bot) {
            boolean wasHidden = s.status == HIDDEN && s.photoId == 0;
            boolean hidden = seen.status == HIDDEN && photo && seen.photoId == 0;
            boolean shows = (seen.status != UNKNOWN && seen.status != HIDDEN) || (photo && seen.photoId != 0);
            if (hidden && !wasHidden && !s.maybeBlocked) {
                into.add(new Event(now, MAYBE_BLOCKED, ""));
                s.maybeBlocked = true;
                changed = quiet = true;
            } else if (shows && s.maybeBlocked) {
                into.add(new Event(now, MAYBE_UNBLOCKED, ""));
                s.maybeBlocked = false;
                changed = quiet = true;
            }
        }

        if (seen.status == ONLINE && seen.lastSeen > 0 && seen.lastSeen * 1000L < now - STALE_MILLIS) {
            seen.status = OFFLINE;
        }
        if (seen.status != UNKNOWN && !(fromCache && s.status != UNKNOWN)) {
            boolean stale = seen.status == OFFLINE
                    && ((s.status == OFFLINE && seen.lastSeen < s.lastSeen)
                    || (s.status == ONLINE && seen.lastSeen * 1000L < s.statusAt - STALE_MILLIS));
            boolean differs = seen.status != s.status || (seen.status == OFFLINE && seen.lastSeen != s.lastSeen);
            if (!stale && differs) {
                if (s.status != UNKNOWN && !fromCache && !quiet) into.add(statusEvent(seen, now));
                s.status = seen.status;
                s.lastSeen = seen.status == OFFLINE ? seen.lastSeen : 0;
                s.statusAt = now;
                changed = true;
            }
        }

        if (photo && !(fromCache && s.photoKnown)) {
            if (s.photoKnown && !fromCache && !quiet && s.photoId != seen.photoId) {
                String kind = s.photoId == 0 ? PHOTO_ADDED : seen.photoId == 0 ? PHOTO_REMOVED : PHOTO_CHANGED;
                into.add(new Event(now, kind, ""));
            }
            if (!s.photoKnown || s.photoId != seen.photoId) {
                s.photoKnown = true;
                s.photoId = seen.photoId;
                changed = true;
            }
        }
        return changed;
    }

    private static Event statusEvent(Seen seen, long now) {
        switch (seen.status) {
            case ONLINE: return new Event(now, ONLINE_NOW, "");
            case OFFLINE: return new Event(now, OFFLINE_AT, Long.toString(seen.lastSeen));
            case RECENTLY: return new Event(now, SEEN_RECENTLY, "");
            case WEEK: return new Event(now, SEEN_WEEK, "");
            case MONTH: return new Event(now, SEEN_MONTH, "");
            default: return new Event(now, SEEN_LONG_AGO, "");
        }
    }

    private static void append(Record record, Event event) {
        record.events.add(event);
        int over = record.events.size() - MAX_EVENTS;
        if (over > 0) record.events.subList(0, over).clear();
    }

    // ---- Files ----------------------------------------------------------------------------

    private Record record(int account, long id) {
        if (!validAccount(account)) return null;
        Map<Long, Record> map = people.get(account);
        return map == null ? null : map.get(id);
    }

    private LinkedHashMap<Long, Record> mapOf(int account) {
        LinkedHashMap<Long, Record> map = people.get(account);
        if (map == null) {
            map = new LinkedHashMap<>();
            people.put(account, map);
        }
        return map;
    }

    private void reindex() {
        long[][] each = new long[Accounts.MAX][];
        int total = 0;
        for (Map.Entry<Integer, LinkedHashMap<Long, Record>> entry : people.entrySet()) {
            long[] ids = new long[entry.getValue().size()];
            int i = 0;
            for (long id : entry.getValue().keySet()) ids[i++] = id;
            Arrays.sort(ids);
            each[entry.getKey()] = ids;
            total += ids.length;
        }
        long[] all = new long[total];
        int at = 0;
        for (long[] ids : each) {
            if (ids == null) continue;
            System.arraycopy(ids, 0, all, at, ids.length);
            at += ids.length;
        }
        Arrays.sort(all);
        byAccount = each;
        anyAccount = all;
    }

    static boolean validAccount(int account) {
        return account >= 0 && account < Accounts.MAX;
    }

    /** The person a file in an account's folder belongs to, or 0 for a file that isn't one. */
    static long idOf(String fileName) {
        for (String suffix : SUFFIXES) {
            if (!fileName.endsWith(suffix)) continue;
            String digits = fileName.substring(0, fileName.length() - suffix.length());
            if (digits.isEmpty() || digits.length() > 19) return 0;
            for (int i = 0; i < digits.length(); i++) {
                if (digits.charAt(i) < '0' || digits.charAt(i) > '9') return 0;
            }
            try {
                return Long.parseLong(digits);
            } catch (NumberFormatException tooBig) {
                return 0;
            }
        }
        return 0;
    }

    File fileOf(int account, long id) {
        return new File(new File(root, Integer.toString(account)), id + ".json");
    }

    /** Reads a person's file once. A file that can't be read starts their history over and is written again. */
    private void load(Record record) {
        if (record.loaded) return;
        record.loaded = true;
        try {
            byte[] data = new AtomicFile(fileOf(record.account, record.id)).readFully();
            read(record, new JSONObject(new String(data, StandardCharsets.UTF_8)));
        } catch (IOException | JSONException | RuntimeException unreadable) {
            Logger.printException(() -> "Special contacts: a history can't be read and starts over", unreadable);
            record.snap = new Snapshot();
            record.events.clear();
            save(record);
        }
    }

    private static void read(Record record, JSONObject json) throws JSONException {
        if (json.getLong("id") != record.id) throw new JSONException("another person's file");
        record.name = json.optString("name", "");
        record.username = json.optString("username", "");
        record.since = json.optLong("since", 0);
        Snapshot s = new Snapshot();
        JSONObject snap = json.optJSONObject("snap");
        if (snap != null) {
            s.name = text(snap, "name");
            s.usernames = text(snap, "usernames");
            s.phone = text(snap, "phone");
            s.photoKnown = snap.optBoolean("photoKnown");
            s.photoId = snap.optLong("photoId");
            s.status = snap.optInt("status", UNKNOWN);
            if (s.status < UNKNOWN || s.status > HIDDEN) s.status = UNKNOWN;
            s.lastSeen = snap.optLong("lastSeen");
            s.statusAt = snap.optLong("statusAt");
            s.contactKnown = snap.optBoolean("contactKnown");
            s.contact = snap.optBoolean("contact");
            s.mutual = snap.optBoolean("mutual");
            s.maybeBlocked = snap.optBoolean("maybeBlocked");
            s.deleted = snap.optBoolean("deleted");
        }
        JSONArray events = json.getJSONArray("events");
        List<Event> read = new ArrayList<>();
        for (int i = 0; i < events.length(); i++) {
            JSONArray each = events.getJSONArray(i);
            read.add(new Event(each.getLong(0), each.getString(1), each.optString(2, "")));
        }
        int over = read.size() - MAX_EVENTS;
        record.snap = s;
        record.events.clear();
        record.events.addAll(over > 0 ? read.subList(over, read.size()) : read);
    }

    private static String text(JSONObject json, String key) {
        return json.has(key) && !json.isNull(key) ? json.optString(key) : null;
    }

    private boolean save(Record record) {
        File file = fileOf(record.account, record.id);
        File dir = file.getParentFile();
        if (dir == null || (!dir.mkdirs() && !dir.isDirectory())) {
            Logger.printException(() -> "Special contacts: the folder for an account can't be made");
            return false;
        }
        AtomicFile atomic = new AtomicFile(file);
        FileOutputStream out = null;
        try {
            byte[] data = json(record).toString().getBytes(StandardCharsets.UTF_8);
            out = atomic.startWrite();
            out.write(data);
            atomic.finishWrite(out);
            return true;
        } catch (IOException | JSONException | RuntimeException failure) {
            if (out != null) atomic.failWrite(out);
            Logger.printException(() -> "Special contacts: a history can't be saved", failure);
            return false;
        }
    }

    private static JSONObject json(Record record) throws JSONException {
        JSONObject json = new JSONObject();
        json.put("v", 1);
        json.put("id", record.id);
        json.put("name", record.name);
        json.put("username", record.username);
        json.put("since", record.since);
        Snapshot s = record.snap;
        JSONObject snap = new JSONObject();
        if (s.name != null) snap.put("name", s.name);
        if (s.usernames != null) snap.put("usernames", s.usernames);
        if (s.phone != null) snap.put("phone", s.phone);
        snap.put("photoKnown", s.photoKnown);
        snap.put("photoId", s.photoId);
        snap.put("status", s.status);
        snap.put("lastSeen", s.lastSeen);
        snap.put("statusAt", s.statusAt);
        snap.put("contactKnown", s.contactKnown);
        snap.put("contact", s.contact);
        snap.put("mutual", s.mutual);
        snap.put("maybeBlocked", s.maybeBlocked);
        snap.put("deleted", s.deleted);
        json.put("snap", snap);
        JSONArray events = new JSONArray();
        for (Event event : record.events) {
            JSONArray each = new JSONArray();
            each.put(event.at);
            each.put(event.kind);
            each.put(event.detail);
            events.put(each);
        }
        json.put("events", events);
        return json;
    }
}
