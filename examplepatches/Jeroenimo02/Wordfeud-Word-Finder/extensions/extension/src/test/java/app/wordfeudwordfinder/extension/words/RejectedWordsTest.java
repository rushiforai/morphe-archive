package app.wordfeudwordfinder.extension.words;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import app.wordfeudwordfinder.extension.core.Storage;
import app.wordfeudwordfinder.extension.game.Ruleset;
import app.wordfeudwordfinder.extension.solver.Move;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class RejectedWordsTest {
    @Rule public TemporaryFolder tmp = new TemporaryFolder();

    private static Move mv(String word, String... cross) {
        List<String> all = new java.util.ArrayList<>();
        all.add(word);
        all.addAll(Arrays.asList(cross));
        return new Move(word, 0, 0, true, Collections.emptyList(), Collections.emptyList(), 5, all,
                Collections.emptyList(), false);
    }

    @Test
    public void rejectedPersistsAndFilters() throws Exception {
        Storage st = new Storage(tmp.getRoot());
        new RejectedWords(st).add(2, Arrays.asList("WROET"));
        RejectedWords again = new RejectedWords(new Storage(tmp.getRoot()));
        List<Move> out = again.filter(2, Arrays.asList(mv("WROET"), mv("ROG")));
        assertEquals(1, out.size());
        assertEquals("ROG", out.get(0).word);
        assertEquals(2, again.filter(3, Arrays.asList(mv("WROET"), mv("ROG"))).size()); // other ruleset
        assertEquals("WROET\n", new String(Files.readAllBytes(new File(tmp.getRoot(), "rejected/2.txt").toPath()),
                StandardCharsets.UTF_8));
    }

    @Test
    public void crossWordRejectionFiltersMove() {
        RejectedWords r = new RejectedWords(new Storage(tmp.getRoot()));
        r.add(2, Arrays.asList("ZO"));
        assertEquals(0, r.filter(2, Arrays.asList(mv("ROG", "ZO"))).size());
    }

    @Test
    public void containsIsCaseInsensitiveAndIgnoresBlank() {
        RejectedWords r = new RejectedWords(new Storage(tmp.getRoot()));
        r.add(2, Arrays.asList("wroet", " ", ""));
        assertTrue(r.contains(2, "Wroet"));
        assertFalse(r.contains(2, ""));
        assertFalse(r.contains(2, "ROG"));
    }

    @Test
    public void rejectedSurvivesNewWordlistVersion() throws Exception {
        Storage st = new Storage(tmp.getRoot());
        new RejectedWords(st).add(2, Arrays.asList("WROET"));
        byte[] list = "aap\nnoot\n".getBytes(StandardCharsets.UTF_8);
        StringBuilder hex = new StringBuilder();
        for (byte b : MessageDigest.getInstance("SHA-256").digest(list)) hex.append(String.format("%02x", b));
        Map<String, Integer> points = new LinkedHashMap<>();
        for (char c = 'A'; c <= 'Z'; c++) points.put(String.valueOf(c), 1);
        Ruleset rs = new Ruleset(2, "nl", points, Collections.emptyMap());
        WordListManager m = new WordListManager(st, (url, p) -> list, Runnable::run,
                id -> new WordListSources.Source("https://example.org/nl.txt", hex.toString(), 9, "UTF-8"));
        m.onRulesetsSeen(Collections.singleton(2), id -> rs);
        assertTrue(new File(tmp.getRoot(), "wordlists/2-v9.graph").isFile());
        assertTrue(new File(tmp.getRoot(), "rejected/2.txt").isFile());
        assertTrue(new RejectedWords(st).contains(2, "WROET"));
    }

    /** Storage whose reads fail while {@code failReads} is set. */
    private static final class FlakyStorage extends Storage {
        boolean failReads = true;

        FlakyStorage(File root) {
            super(root);
        }

        @Override
        public String readText(String rel) throws java.io.IOException {
            if (failReads) throw new java.io.IOException("read failed");
            return super.readText(rel);
        }
    }

    @Test
    public void failedReadDoesNotOverwriteFileAndIsRetried() throws Exception {
        File f = new File(tmp.getRoot(), "rejected/2.txt");
        f.getParentFile().mkdirs();
        Files.write(f.toPath(), "OUD\n".getBytes(StandardCharsets.UTF_8));
        FlakyStorage st = new FlakyStorage(tmp.getRoot());
        RejectedWords r = new RejectedWords(st);

        r.add(2, Arrays.asList("nieuw"));
        assertEquals("file untouched after a failed read", "OUD\n",
                new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8));
        assertTrue("new word kept in memory", r.contains(2, "NIEUW"));
        assertEquals(1, r.filter(2, Arrays.asList(mv("NIEUW"), mv("ROG"))).size());

        st.failReads = false;
        assertTrue("read retried after the failure", r.contains(2, "OUD"));
        assertTrue(r.contains(2, "NIEUW"));
        assertEquals("pending words merged and persisted", "NIEUW\nOUD\n",
                new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8));
    }

    @Test
    public void failedReadIsNotPinnedAsEmpty() throws Exception {
        File f = new File(tmp.getRoot(), "rejected/2.txt");
        f.getParentFile().mkdirs();
        Files.write(f.toPath(), "OUD\n".getBytes(StandardCharsets.UTF_8));
        FlakyStorage st = new FlakyStorage(tmp.getRoot());
        RejectedWords r = new RejectedWords(st);
        assertFalse(r.contains(2, "OUD"));
        st.failReads = false;
        assertTrue(r.contains(2, "OUD"));
    }
}
