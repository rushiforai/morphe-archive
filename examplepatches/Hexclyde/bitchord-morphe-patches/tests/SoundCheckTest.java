package app.bitchord.telegram;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.atomic.AtomicLong;

public final class SoundCheckTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    static SoundCheck.Pcm pcm(float[] audio, int rate, double seconds) {
        int n = (int) Math.min(audio.length, seconds * rate);
        return new SoundCheck.Pcm(audio, n, rate);
    }

    /** Plays mono audio into a sink as 16-bit stereo, 4096 frames at a time. */
    static void play(Object sink, float[] audio, double seconds, boolean repeatEach) {
        int frames = 4096;
        long timeUs = 1_000_000_000_000L;
        for (int start = 0; start < seconds * 48000 && start < audio.length; start += frames) {
            ByteBuffer b = ByteBuffer.allocateDirect(frames * 4).order(ByteOrder.LITTLE_ENDIAN);
            for (int i = 0; i < frames; i++) {
                float v = start + i < audio.length ? audio[start + i] : 0;
                short s = (short) Math.max(-32768, Math.min(32767, Math.round(v * 32767)));
                b.putShort(s).putShort(s);
            }
            b.flip();
            SoundCheck.tap(sink, b, timeUs);
            if (repeatEach) SoundCheck.tap(sink, b, timeUs); // the sink took only part of it
            timeUs += frames * 1_000_000L / 48000;
        }
    }

    public static void main(String[] args) throws Exception {
        float[] song = FingerprintTest.tune(1, 60, 1.0), other = FingerprintTest.tune(5, 60, 1.0);
        float[] intro = new float[song.length + 6 * 44100];
        System.arraycopy(song, 0, intro, 6 * 44100, song.length);
        Map<String, float[]> files = Map.of("-100_7", song, "-100_8", other, "-100_10", intro);
        List<String> loaded = new ArrayList<>(), notices = new ArrayList<>();
        SoundCheck.Reference reference =
                (id, seconds) -> {
                    loaded.add(id);
                    float[] audio = files.get(id);
                    if (audio == null) throw new IOException("unreadable");
                    return pcm(audio, 44100, seconds);
                };
        File store = Files.createTempFile("sound", ".json").toFile();
        store.delete();
        AtomicLong clock = new AtomicLong(1_000_000);
        SoundCheck check =
                new SoundCheck(store, reference, notices::add, Runnable::run, clock::get);
        SoundCheck.active = check;

        // Which rejections are worth a listen.
        check(
                TelegramMatch.uncertain(
                        "Dream A Little Dream Of Me", 187, "Dream a Little Dream of Me", 198),
                "Same title, 11 s longer");
        check(
                !TelegramMatch.uncertain(
                        "Dream A Little Dream Of Me", 187, "Dream a Little Dream of Me", 190),
                "Already accepted");
        check(
                !TelegramMatch.uncertain(
                        "Dream A Little Dream Of Me", 187, "Dream a Little Dream of Me", 300),
                "Over a minute off");
        check(!TelegramMatch.uncertain("L-O-V-E", 150, "Sway", 160), "Unrelated title");
        check(!TelegramMatch.uncertain("Sway", null, "Sway", 160), "Unknown length");

        String title = "Dream A Little Dream Of Me";
        for (String id : List.of("-100_7", "-100_8", "-100_9", "-100_10"))
            check.consider(title, "Ella Fitzgerald", 187, id);
        check.consider(title, "Ella Fitzgerald", 187, "-100_7");
        check(check.pendingCount() == 4, "Four candidates, no repeats");

        // Heard from half a second in. Another sink still finishing the previous song is ignored.
        check.playing("Dream a Little Dream of Me", "Ella Fitzgerald", 187_400, 30_000);
        Object sink = new Object(), outgoing = new Object();
        SoundCheck.format(sink, 48000, 2, Downmix.PCM_16BIT);
        SoundCheck.format(outgoing, 48000, 2, Downmix.PCM_16BIT);
        play(sink, FingerprintTest.streamed(song, 30, 16, 1), 16, false);
        check(loaded.isEmpty(), "Not compared when heard from the middle");

        check.playing("Dream a Little Dream of Me", "Ella Fitzgerald", 187_400, 500);
        play(outgoing, FingerprintTest.streamed(other, 50, 4, 2), 4, false);
        play(sink, FingerprintTest.streamed(song, 0.5, 16, 3), 16, true);
        check(loaded.size() == 4, "Each candidate read once: " + loaded);
        check(check.pendingCount() == 0, "None left waiting");

        check(
                Integer.valueOf(187)
                        .equals(
                                check.seconds(
                                        "-100_7", "dream a little dream of me ella fitzgerald")),
                "Same recording reported with the song's length");
        check(check.seconds("-100_7", "sway dean martin") == null, "Only for that song's search");
        check(check.seconds("-100_8", "dream a little dream of me") == null, "Other recording");
        check(check.seconds("-100_10", "dream a little dream of me") == null, "Starts 6 s later");
        check(check.seconds("-100_9", "dream a little dream of me") == null, "Unreadable");
        check(notices.equals(List.of(title)), "One notice: " + notices);
        check(check.confirmed() == 1, "One confirmed");
        check(
                InternalAddon.duration(
                                new org.json.JSONObject().put("id", "-100_7").put("duration", 198),
                                "dream a little dream of me")
                        == 187,
                "The add-on's answer carries the song's length");
        check(
                InternalAddon.duration(
                                new org.json.JSONObject().put("id", "-100_8").put("duration", 198),
                                "dream a little dream of me")
                        == 198,
                "Others keep their own");

        // Kept across restarts; checked files aren't queued again, unreadable ones after a week.
        SoundCheck again =
                new SoundCheck(store, reference, notices::add, Runnable::run, clock::get);
        check(
                Integer.valueOf(187).equals(again.seconds("-100_7", "dream a little dream of me")),
                "Saved");
        for (String id : List.of("-100_7", "-100_8", "-100_9")) again.consider(title, "", 187, id);
        check(again.pendingCount() == 0, "Not checked twice");
        clock.addAndGet(SoundCheck.RETRY_MILLIS + 1);
        again.consider(title, "", 187, "-100_9");
        check(again.pendingCount() == 1, "An unreadable file is tried again later");

        // Off: the player's hooks do nothing, and the add-on reports real lengths.
        SoundCheck.active = null;
        check(
                InternalAddon.duration(
                                new org.json.JSONObject().put("id", "-100_7").put("duration", 198),
                                "dream a little dream of me")
                        == 198,
                "Off: real length");
        again.clear();
        check(!store.exists() && again.confirmed() == 0, "Sign-out forgets it");
        System.out.println(
                "PASS: " + checks + " sound check queue, listen, compare and report checks.");
    }
}
