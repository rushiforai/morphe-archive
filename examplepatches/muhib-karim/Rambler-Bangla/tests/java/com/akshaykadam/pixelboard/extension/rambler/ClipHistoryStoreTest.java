package com.akshaykadam.pixelboard.extension.rambler;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public final class ClipHistoryStoreTest {
    static int checks;
    static void check(boolean value) { checks++; if (!value) throw new AssertionError("check " + checks); }
    static final class FakePrefs implements ClipHistoryStore.Storage {
        byte[] value;
        boolean fail;
        public byte[] read() { return value; }
        public void write(byte[] next) throws IOException {
            if (fail) throw new IOException("synthetic write failure");
            value = next.clone();
        }
    }
    static List<String> texts(ClipHistoryStore s) { return s.snapshot(); }

    public static void main(String[] args) throws Exception {
        store();
        pins();
        policy();
        privacy();
        System.out.println(checks + " history assertions passed");
    }

    static void store() throws Exception {
        FakePrefs prefs = new FakePrefs();
        ClipHistoryStore s = new ClipHistoryStore(prefs);
        for (int i = 1; i <= 60; i++) check(s.record("clip " + i, i, false));
        check(texts(s).size() == 50);
        check(texts(s).get(0).equals("clip 60"));
        check(texts(s).get(49).equals("clip 11"));
        // Identical text moves to the top instead of duplicating.
        check(s.record("clip 20", 61, false));
        check(texts(s).get(0).equals("clip 20") && texts(s).size() == 50);
        check(texts(s).indexOf("clip 20") == texts(s).lastIndexOf("clip 20"));
        check(!s.record("secret", 62, true));
        check(!texts(s).contains("secret"));
        String unicode = "বাংলা\nemoji 😀\u0000";
        check(s.record(unicode, 63, false));
        check(new ClipHistoryStore(prefs).snapshot().equals(texts(s)));
        // A replay of the same clipboard event cannot resurrect a deleted entry, before or after a restart.
        check(s.delete(unicode));
        check(!s.delete(unicode));
        check(!s.record(unicode, 63, false));
        check(!new ClipHistoryStore(prefs).record(unicode, 63, false));
        // The same text copied again later is a new event.
        check(s.record(unicode, 64, false));
        check(texts(s).get(0).equals(unicode));
        // A wall-clock step backwards must not stop recording.
        check(s.record("after clock change", 20, false));
        check(texts(s).get(0).equals("after clock change"));
        // One clipboard event has one timestamp: a second text under it is not a new copy.
        check(!s.record("new same millisecond", 20, false));
        check(s.record("new same millisecond", 21, false));
        check(!s.record(null, 65, false));
        check(!s.record("", 65, false));
        check(!s.record("x", 0, false));
        check(!s.record(new String(new char[ClipHistoryStore.MAX_TEXT_CHARS + 1]), 66, false));
        byte[] before = prefs.value.clone();
        List<String> shown = texts(s);
        prefs.fail = true;
        try { s.record("lost", 70, false); throw new AssertionError("write must fail"); }
        catch (IOException expected) { check(texts(s).equals(shown)); }
        try { s.delete(shown.get(0)); throw new AssertionError("write must fail"); }
        catch (IOException expected) { check(texts(s).equals(shown)); }
        check(Arrays.equals(before, prefs.value));
        prefs.fail = false;
        check(s.record("recovered", 70, false));
        s.snapshot().clear();
        check(!s.snapshot().isEmpty());
        // Corrupt or foreign data loads as empty instead of partially.
        prefs.value = new byte[] {1, 2, 3};
        check(new ClipHistoryStore(prefs).snapshot().isEmpty());
        // A deleted clip leaves no copy of its text (and no hash) in storage.
        ClipHistoryStore clean = new ClipHistoryStore(prefs);
        check(clean.record("one-time code 492817", 200, false) && clean.record("other", 201, false));
        check(contains(prefs.value, "one-time code 492817"));
        check(clean.delete("one-time code 492817"));
        check(!contains(prefs.value, "one-time code 492817"));
        check(prefs.value.length == valid(new String[] {"other"}, new boolean[] {false}, 201).length);
        loader();
        prefs.value = null;
        check(new ClipHistoryStore(prefs).snapshot().isEmpty());
    }

    static boolean contains(byte[] data, String text) throws Exception {
        return new String(data, "UTF-16BE").contains(text) || new String(data, 1, data.length - 1, "UTF-16BE").contains(text);
    }

    /** RCH2: magic, last event timestamp, count, then per entry flags (1 = pinned), length, UTF-16 chars. */
    static byte[] valid(String[] texts, boolean[] pinned, long timestamp) throws Exception {
        java.io.ByteArrayOutputStream bytes = new java.io.ByteArrayOutputStream();
        java.io.DataOutputStream out = new java.io.DataOutputStream(bytes);
        out.writeInt(0x52434832);
        out.writeLong(timestamp);
        out.writeInt(texts.length);
        for (int i = 0; i < texts.length; i++) {
            out.writeByte(pinned[i] ? 1 : 0);
            out.writeInt(texts[i].length());
            out.writeChars(texts[i]);
        }
        return bytes.toByteArray();
    }

    static List<String> load(byte[] data) throws Exception {
        FakePrefs prefs = new FakePrefs();
        prefs.value = data;
        return new ClipHistoryStore(prefs).snapshot();
    }

    /** Malformed files load as empty, never partially. */
    static void loader() throws Exception {
        check(load(valid(new String[] {"p", "a", "b"}, new boolean[] {true, false, false}, 5))
                .equals(Arrays.asList("p", "a", "b")));
        check(load(valid(new String[] {"a", "a"}, new boolean[] {false, false}, 5)).isEmpty());
        check(load(valid(new String[] {"a", "p"}, new boolean[] {false, true}, 5)).isEmpty());
        byte[] trailing = valid(new String[] {"a"}, new boolean[] {false}, 5);
        check(load(Arrays.copyOf(trailing, trailing.length + 1)).isEmpty());
        check(load(Arrays.copyOf(trailing, trailing.length - 1)).isEmpty());
        String[] many = new String[ClipHistoryStore.LIMIT + 1];
        boolean[] flags = new boolean[many.length];
        for (int i = 0; i < many.length; i++) many[i] = "c" + i;
        check(load(valid(many, flags, 5)).isEmpty());
        String[] pins = new String[ClipHistoryStore.MAX_PINNED + 1];
        boolean[] all = new boolean[pins.length];
        for (int i = 0; i < pins.length; i++) { pins[i] = "p" + i; all[i] = true; }
        check(load(valid(pins, all, 5)).isEmpty());
        byte[] badFlag = valid(new String[] {"a"}, new boolean[] {false}, 5);
        badFlag[16] = 2;
        check(load(badFlag).isEmpty());
        byte[] wrongMagic = valid(new String[] {"a"}, new boolean[] {false}, 5);
        wrongMagic[3] = '1';
        check(load(wrongMagic).isEmpty());
    }

    static void pins() throws Exception {
        FakePrefs prefs = new FakePrefs();
        ClipHistoryStore s = new ClipHistoryStore(prefs);
        for (int i = 1; i <= 50; i++) check(s.record("clip " + i, i, false));
        check(s.setPinned("clip 1", true));
        check(!s.setPinned("clip 1", true));
        check(!s.setPinned("absent", true));
        check(s.isPinned("clip 1") && !s.isPinned("clip 2"));
        // Pinned entries sit on top and do not count towards the 50 recent entries.
        check(texts(s).get(0).equals("clip 1"));
        check(texts(s).size() == 50);
        for (int i = 51; i <= 60; i++) check(s.record("clip " + i, i, false));
        check(texts(s).size() == 51 && texts(s).contains("clip 1"));
        check(texts(s).get(0).equals("clip 1") && texts(s).get(1).equals("clip 60"));
        // Copying pinned text again keeps it pinned and in place.
        check(s.setPinned("clip 60", true));
        check(texts(s).get(0).equals("clip 60") && texts(s).get(1).equals("clip 1"));
        check(s.record("clip 1", 61, false));
        check(texts(s).get(0).equals("clip 60") && texts(s).get(1).equals("clip 1") && s.isPinned("clip 1"));
        check(texts(s).indexOf("clip 1") == texts(s).lastIndexOf("clip 1"));
        // Pins round-trip through storage.
        ClipHistoryStore reloaded = new ClipHistoryStore(prefs);
        check(reloaded.snapshot().equals(texts(s)) && reloaded.isPinned("clip 1") && reloaded.isPinned("clip 60"));
        // Unpin returns the entry to the top of the recent list.
        check(s.setPinned("clip 60", false));
        check(texts(s).get(0).equals("clip 1") && texts(s).get(1).equals("clip 60") && !s.isPinned("clip 60"));
        check(texts(s).size() == 51);
        // Pins are bounded.
        int pinned = 1;
        for (int i = 59; pinned < ClipHistoryStore.MAX_PINNED; i--, pinned++) check(s.setPinned("clip " + i, true));
        check(!s.canPin());
        check(!s.setPinned("more 119", true));
        check(texts(s).size() == 51);
        // New clips refill the recent list up to its own cap; the total is bounded by LIMIT + MAX_PINNED.
        for (int i = 100; i < 120; i++) check(s.record("more " + i, i, false));
        check(texts(s).size() == ClipHistoryStore.LIMIT + ClipHistoryStore.MAX_PINNED);
        check(texts(s).get(ClipHistoryStore.MAX_PINNED).equals("more 119"));
        check(new ClipHistoryStore(prefs).snapshot().equals(texts(s)));
        check(s.delete("clip 1"));
        check(s.canPin() && !s.isPinned("clip 1") && !texts(s).contains("clip 1"));
        prefs.fail = true;
        try { s.setPinned("more 118", true); throw new AssertionError("write must fail"); }
        catch (IOException expected) { check(!s.isPinned("more 118")); }
        prefs.fail = false;
    }

    static void policy() {
        int text = 1, none = 0, noLearning = 0x1000000;
        check(ClipHistoryPolicy.showHistory(text, 0, true, false));
        for (int type : new int[] {none, 0x81, 0x91, 0xe1, 0x12})
            check(!ClipHistoryPolicy.showHistory(type, 0, true, false));
        check(!ClipHistoryPolicy.showHistory(text, noLearning, true, false));
        check(!ClipHistoryPolicy.showHistory(text, 0, false, false));
        check(!ClipHistoryPolicy.showHistory(text, 0, true, true));

        // Copies made between input sessions or into a normal field are recorded, as stock Gboard does.
        check(ClipHistoryPolicy.recordClip(false, none, 0, true, false, false, false));
        check(ClipHistoryPolicy.recordClip(false, 0x81, noLearning, true, false, false, false));
        check(ClipHistoryPolicy.recordClip(true, text, 0, true, false, false, false));
        check(ClipHistoryPolicy.recordClip(true, none, 0, true, false, false, false));
        check(!ClipHistoryPolicy.recordClip(true, none, noLearning, true, false, false, false));
        // A started password or no-learning editor, private mode, opt-out, sensitive or masked clips are not.
        for (int type : new int[] {0x81, 0x91, 0xe1, 0x12})
            check(!ClipHistoryPolicy.recordClip(true, type, 0, true, false, false, false));
        check(!ClipHistoryPolicy.recordClip(true, text, noLearning, true, false, false, false));
        check(!ClipHistoryPolicy.recordClip(false, none, 0, false, false, false, false));
        check(!ClipHistoryPolicy.recordClip(false, none, 0, true, true, false, false));
        check(!ClipHistoryPolicy.recordClip(false, none, 0, true, false, true, false));
        check(!ClipHistoryPolicy.recordClip(false, none, 0, true, false, false, true));

        // Only live clipboard events: a stale re-read cannot import an older clip.
        check(ClipHistoryPolicy.fresh(100_000, 100_000));
        check(ClipHistoryPolicy.fresh(100_000, 110_000));
        check(ClipHistoryPolicy.fresh(100_000, 99_000));
        check(!ClipHistoryPolicy.fresh(100_000, 110_001));
        check(!ClipHistoryPolicy.fresh(100_000, 98_999));
        check(!ClipHistoryPolicy.fresh(0, 5_000));

        // A copy made during a private session is refused even if focus left before the read was handled.
        // The window runs on the monotonic clock; w(e) is the wall time when nothing moved the clock.
        ClipHistoryPolicy.PrivateWindow window = new ClipHistoryPolicy.PrivateWindow();
        check(!window.covers(w(1_000), w(1_000), 1_000));
        window.enter(10_000);
        check(window.covers(w(9_000), w(9_500), 9_500) && window.covers(w(50_000), w(50_000), 50_000));
        check(!window.covers(w(8_999), w(9_500), 9_500));
        window.leave(12_000);
        check(window.covers(w(12_000), w(12_100), 12_100) && window.covers(w(13_000), w(13_100), 13_100));
        check(!window.covers(w(13_001), w(13_100), 13_100));
        window.leave(14_000);
        check(!window.covers(w(13_500), w(14_100), 14_100));
        // Private sessions close together merge, so a short normal gap between them is refused too.
        window.enter(20_000);
        check(window.covers(w(9_500), w(20_100), 20_100) && window.covers(w(16_000), w(20_100), 20_100));
        window.leave(21_000);
        window.enter(60_000);
        check(!window.covers(w(15_000), w(60_100), 60_100) && window.covers(w(60_000), w(60_100), 60_100));
        window.leave(61_000);
        // The wall clock jumps back 50 s inside a private session: the copy still falls inside the window.
        ClipHistoryPolicy.PrivateWindow jumped = new ClipHistoryPolicy.PrivateWindow();
        long offset = 1_000_000;
        jumped.enter(100_000);                    // wall 1_100_000
        long back = offset - 50_000;              // from monotonic 101_000 on, wall = monotonic + back
        long copy = 102_000 + back;               // copied at monotonic 102_000
        jumped.leave(102_500);
        check(jumped.covers(copy, 102_600 + back, 102_600));
        check(!jumped.covers(104_000 + back, 104_100 + back, 104_100));

        check(ClipHistoryPolicy.sameClip(100, 100));
        check(!ClipHistoryPolicy.sameClip(100, 101));
        check(!ClipHistoryPolicy.sameClip(0, 0));
    }

    /** Wall time for a monotonic time when the clock never moved. */
    static long w(long elapsed) { return elapsed + 1_000_000; }

    static void privacy() throws Exception {
        ClassLoader loader = ClipHistoryStoreTest.class.getClassLoader();
        java.lang.reflect.Field incognito = Class.forName("aelb").getField("incognito");
        incognito.setBoolean(null, false);
        check(!ClipHistoryGboardPrivacy.incognito(loader));
        incognito.setBoolean(null, true);
        check(ClipHistoryGboardPrivacy.incognito(loader));
        incognito.setBoolean(null, false);
        // Unknown state counts as private.
        check(ClipHistoryGboardPrivacy.incognito(new ClassLoader(null) {}));
    }
}
