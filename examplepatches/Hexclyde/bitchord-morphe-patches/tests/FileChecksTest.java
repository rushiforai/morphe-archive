package app.bitchord.telegram;

import org.json.JSONObject;

import java.util.*;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Listening to files: songs that play are checked a minute later, the chats are gone through in the
 * background when that's on, and untagged files are named from AcoustID. What's found goes into the
 * saved index and survives the files being read from Telegram again.
 */
public final class FileChecksTest {
    static int passed;

    static void check(boolean okay, String message) {
        passed++;
        if (!okay) throw new AssertionError(message);
    }

    static final class Host implements FileChecks.Host {
        final TelegramIndex index;
        final Map<Integer, byte[]> files = new HashMap<>();
        final List<String> changed = new ArrayList<>();
        String pause = "", answer = "";
        int lookups, decodes;

        Host(TelegramIndex index) {
            this.index = index;
        }

        public boolean ready() {
            return true;
        }

        public String pause() {
            return pause;
        }

        public Collection<Long> chats() {
            return Collections.singleton(-100L);
        }

        public TelegramIndex index() {
            return index;
        }

        public byte[] range(int file, long offset, int length) {
            byte[] b = files.get(file);
            return Arrays.copyOfRange(b, (int) offset, (int) Math.min(b.length, offset + length));
        }

        public FileChecks.Audio decode(String id, int seconds) {
            decodes++;
            short[] tune = ChromaprintTest.tune(11025, 30, 42);
            float[] samples = new float[tune.length];
            for (int i = 0; i < tune.length; i++) samples[i] = tune[i] / 32767f;
            return new FileChecks.Audio(samples, samples.length, 11025);
        }

        public String lookup(String key, int seconds, String fingerprint) {
            lookups++;
            check(
                    key.equals("Key12345") && fingerprint.startsWith("AQAA"),
                    "sends the key and fingerprint");
            return answer;
        }

        public void changed(JSONObject row) {
            changed.add(row.optString("id"));
        }
    }

    static JSONObject row(
            long message, int file, String format, int size, int seconds, boolean tagged)
            throws Exception {
        return new JSONObject()
                .put("id", "-100_" + message)
                .put("chat", -100)
                .put("message", message)
                .put("file", file)
                .put("format", format)
                .put("size", size)
                .put("duration", seconds)
                .put("title", tagged ? "Song " + message : "track" + message)
                .put("artist", tagged ? "Artist" : "")
                .put("fileName", "track" + message + "." + format)
                .put("tagged", tagged);
    }

    public static void main(String[] args) throws Exception {
        AtomicLong clock = new AtomicLong(1_000_000_000_000L);
        IndexStore.Memory store = new IndexStore.Memory();
        TelegramIndex index = new TelegramIndex(store, null, clock::get);
        Host host = new Host(index);
        byte[] genuine =
                TestFlac.encode(
                        LosslessCheckTest.noise(44100, 10, 16, (b, r) -> 22050, 1),
                        44100,
                        16,
                        null);
        byte[] fake =
                TestFlac.encode(
                        LosslessCheckTest.noise(
                                44100,
                                10,
                                16,
                                (b, r) ->
                                        r.nextDouble() < 0.3
                                                ? 16000
                                                : 13800 + 1800 * r.nextDouble(),
                                2),
                        44100,
                        16,
                        null);
        host.files.put(11, genuine);
        host.files.put(12, fake);
        JSONObject a = row(1, 11, "flac", genuine.length, 10, true);
        JSONObject b = row(2, 12, "flac", fake.length, 10, true);
        JSONObject c = row(3, 13, "mp3", 400_000, 30, false);
        JSONObject d = row(4, 0, "flac", 1000, 10, true); // from a shared index, not played here
        store.put(-100, Arrays.asList(a, b, c, d), 1);
        FileChecks checks = new FileChecks(null, null, host, clock::get);

        // A song that plays is checked a minute later.
        checks.played(b);
        check(checks.step() == 60_000, "nothing else to do yet");
        check(index.found("check", "-100_2") == null, "not before a minute");
        clock.addAndGet(FileChecks.PLAYED_DELAY + 1);
        checks.step();
        JSONObject found = index.found("check", "-100_2");
        check(found != null && found.optString("verdict").equals("lossy"), "found fake: " + found);
        check(
                store.row(-100, 2, 0).getJSONObject("check").optString("verdict").equals("lossy"),
                "row");
        check(host.changed.contains("-100_2"), "legend told");
        check(checks.status().equals("Checked 1 file · 1 not really lossless"), checks.status());

        // Read from Telegram again (a rebuild): what was found stays.
        store.put(-100, Collections.singletonList(row(2, 12, "flac", fake.length, 10, true)), 2);
        check(store.row(-100, 2, 0).has("check"), "kept through a rebuild");
        JSONObject fresh = index.withFound(row(2, 12, "flac", fake.length, 10, true));
        check(
                fresh.getJSONObject("check").optString("verdict").equals("lossy"),
                "and for live rows");

        // What it means: ranked as the MP3 it came from, and the genuine copy wins.
        check(InternalAddon.quality(fresh).equals("LOW"), "ranked as a 128 kbps file");
        check(MainChannel.lossless(fresh) == false, "not copied as lossless");
        check(
                LegendMatch.row(fresh, null).equals("FLAC · from ≈128 kbps"),
                LegendMatch.row(fresh, null));
        JSONObject twin = row(9, 11, "flac", genuine.length, 10, true).put("title", "Song 2");
        check(
                Duplicates.best(Arrays.asList(fresh, twin), null).get(0) == twin,
                "genuine copy wins");

        // In the background, only when asked, and not while paused.
        check(checks.step() == 60_000 && index.found("check", "-100_1") == null, "off");
        checks.checkInBackground = true;
        host.pause = "Paused until this phone is on Wi-Fi";
        check(checks.step() == 60_000 && index.found("check", "-100_1") == null, "paused");
        host.pause = "";
        checks.step();
        JSONObject ok = index.found("check", "-100_1");
        check(ok != null && ok.optString("verdict").equals("ok"), "genuine: " + ok);
        check(index.found("check", "-100_4") == null, "a file not played here can't be read yet");
        check(checks.step() == 60_000, "round done");
        check(checks.step() == 60_000, "waits for the next round");

        // Naming untagged files: needs a key, then looks them up.
        check(!checks.needsName(c), "off");
        checks.recognize = true;
        check(!checks.needsName(c), "no key");
        boolean refused = false;
        try {
            checks.setKey("bad key");
        } catch (java.io.IOException e) {
            refused = true;
        }
        check(refused, "a key that isn't one");
        checks.setKey("Key12345");
        check(checks.key().equals("Key12345") && checks.needsName(c), "ready");
        check(!checks.needsName(a), "tagged files keep their names");
        host.answer =
                "{\"status\":\"ok\",\"results\":[{\"id\":\"x\",\"score\":0.97,\"recordings\":[{\"id\":\"r\",\"title\":\"Real"
                    + " Title\",\"duration\":30,\"artists\":[{\"name\":\"Real Artist\"}]}]}]}";
        clock.addAndGet(FileChecks.ROUND_MILLIS + 1);
        checks.step();
        JSONObject named = store.row(-100, 3, 0);
        check(named.optString("title").equals("Real Title"), "named: " + named);
        check(
                named.optString("artist").equals("Real Artist") && named.optBoolean("tagged"),
                "artist");
        check(named.getJSONObject("recognized").optString("by").equals("AcoustID"), "by");
        check(
                store.search(Collections.singleton(-100L), TrackNames.words("real title"), 10)
                                .size()
                        == 1,
                "searchable");
        check(host.lookups == 1 && host.decodes == 1, "one lookup");
        check(checks.status().contains("1 named by sound"), checks.status());

        // Not found: asked again only after a month. A refused key stops lookups.
        JSONObject e = row(5, 15, "mp3", 400_000, 30, false);
        store.put(-100, Collections.singletonList(e), 2);
        host.answer = "{\"status\":\"ok\",\"results\":[]}";
        checks.played(e);
        clock.addAndGet(FileChecks.PLAYED_DELAY + 1);
        checks.step();
        check(host.lookups == 2, "looked up");
        check(!checks.needsName(store.row(-100, 5, 0)), "not again soon");
        clock.addAndGet(FileChecks.RETRY_MILLIS + 1);
        check(checks.needsName(store.row(-100, 5, 0)), "again after a month");
        host.answer =
                "{\"status\":\"error\",\"error\":{\"code\":4,\"message\":\"invalid API key\"}}";
        checks.played(store.row(-100, 5, 0));
        clock.addAndGet(FileChecks.PLAYED_DELAY + 1);
        checks.step();
        check(
                checks.status().contains("AcoustID refused the key: invalid API key"),
                checks.status());
        check(!checks.needsName(store.row(-100, 5, 0)), "no lookups with a refused key");
        checks.setKey("Key12345");
        check(checks.needsName(store.row(-100, 5, 0)), "a new key tries again");

        // A shared index brings what someone else found; this phone keeps what it found itself.
        IndexStore.Memory other = new IndexStore.Memory();
        JSONObject shared =
                row(2, 0, "flac", 1000, 10, true)
                        .put("check", new JSONObject().put("verdict", "ok"));
        other.put(-100, Collections.singletonList(shared), 1);
        check(other.found("check", "-100_2").optString("verdict").equals("ok"), "remembered");
        store.put(-100, Collections.singletonList(shared), 3);
        check(
                store.row(-100, 2, 0).getJSONObject("check").optString("verdict").equals("lossy"),
                "own wins");
        JSONObject sharedName =
                row(7, 0, "mp3", 1000, 30, false)
                        .put(
                                "recognized",
                                new JSONObject().put("title", "Shared").put("artist", "Them"));
        other.put(-100, Collections.singletonList(sharedName), 1);
        check(
                other.row(-100, 7, 0).optString("title").equals("Shared"),
                "names from a shared index");

        // In index files: what's sensible is kept.
        JSONObject out = IndexTransfer.clean(store.row(-100, 2, 0), -100);
        check(out.getJSONObject("check").optString("verdict").equals("lossy"), "check kept " + out);
        check(out.getJSONObject("check").optInt("kbps") == 128, "with its numbers");
        JSONObject odd = new JSONObject(store.row(-100, 2, 0).toString());
        odd.getJSONObject("check").put("verdict", "<script>").put("lock", "NaN");
        check(!IndexTransfer.clean(odd, -100).has("check"), "unknown verdicts dropped");
        odd.getJSONObject("check").put("verdict", "ok");
        JSONObject nan = IndexTransfer.clean(odd, -100);
        check(
                nan != null && Double.isFinite(nan.getJSONObject("check").optDouble("lock", 0)),
                "odd numbers made sensible: " + nan);
        JSONObject outName = IndexTransfer.clean(store.row(-100, 3, 0), -100);
        check(
                outName.getJSONObject("recognized").optString("title").equals("Real Title"),
                "names kept");
        checks.clear();
        check(checks.status().isEmpty(), "signing out clears the counts");
        check(checks.key().equals("Key12345"), "the AcoustID key isn't Telegram's, and stays");
        store.clear();
        check(store.found("check", "-100_2") == null, "clearing the index clears what was found");
        System.out.println("PASS: " + passed + " file check, recognition and saved-result checks.");
    }
}
