package app.bitchord.telegram;

import java.io.File;
import java.nio.file.Files;

public final class LegendMemoryTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    public static void main(String[] args) throws Exception {
        File store = new File(Files.createTempDirectory("legends").toFile(), "legends.json");
        LegendMemory memory = new LegendMemory(store);
        check(memory.get("yt1").isEmpty(), "Nothing remembered yet");
        check(memory.put("yt1", "FLAC 24bit"), "First legend stored");
        check(!memory.put("yt1", "FLAC 24bit"), "Same legend is no change");
        check(!memory.put("yt1", "FLAC"), "A source without bit depth doesn't erase it");
        check(memory.get("yt1").equals("FLAC 24bit"), "Bit depth kept");
        check(memory.put("yt1", "FLAC 16bit"), "A different bit depth replaces it");
        check(!memory.put("yt2", ""), "Lossy songs aren't stored");
        check(!memory.put(null, "FLAC"), "No id");
        memory.save();
        check(new LegendMemory(store).get("yt1").equals("FLAC 16bit"), "Survives a restart");
        LegendMemory full = new LegendMemory(null);
        for (int i = 0; i <= LegendMemory.MAX; i++) full.put("id" + i, "FLAC");
        check(
                full.get("id0").isEmpty() && !full.get("id1").isEmpty(),
                "Oldest dropped at the limit");
        memory.clear();
        check(memory.get("yt1").isEmpty() && !store.exists(), "Sign-out clears it");
        System.out.println("PASS: " + checks + " format legend memory checks.");
    }
}
