package app.wordfeudwordfinder.extension.words;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import org.junit.Test;

public class WordGraphTest {

    private static WordGraph roundTrip(WordGraph g) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        g.write(out);
        return WordGraph.read(new ByteArrayInputStream(out.toByteArray()));
    }

    @Test
    public void containsExactWordsOnly() {
        WordGraph g = WordGraph.build(Arrays.asList("NEIGEN", "NEE", "NEIG", "NEE", "", null, "A"));
        assertTrue(g.contains("NEIGEN"));
        assertTrue(g.contains("NEE"));
        assertTrue(g.contains("NEIG"));
        assertTrue(g.contains("A"));
        assertFalse(g.contains("NE"));
        assertFalse(g.contains("NEIGE"));
        assertFalse(g.contains("NEIGENS"));
        assertFalse(g.contains(""));
        assertFalse(g.contains(null));
        assertFalse(g.contains("B"));
    }

    @Test
    public void unicodeLetters() throws IOException {
        List<String> w = Arrays.asList("ÅR", "ÄPPLE", "ÖL", "AÑO", "ÇA", "ZZ");
        WordGraph g = roundTrip(WordGraph.build(w));
        for (String s : w) assertTrue(s, g.contains(s));
        assertFalse(g.contains("AR"));
        assertFalse(g.contains("ANO"));
    }

    @Test
    public void emptyGraph() throws IOException {
        WordGraph g = roundTrip(WordGraph.build(Collections.<String>emptyList()));
        assertEquals(1, g.nodeCount());
        assertFalse(g.contains("A"));
    }

    @Test
    public void roundTripRandom() throws IOException {
        Random rnd = new Random(3);
        List<String> words = new ArrayList<>();
        for (int i = 0; i < 20000; i++) {
            int len = 1 + rnd.nextInt(12);
            StringBuilder sb = new StringBuilder();
            for (int k = 0; k < len; k++) sb.append((char) ('A' + rnd.nextInt(26)));
            words.add(sb.toString());
        }
        WordGraph g = WordGraph.build(words);
        WordGraph r = roundTrip(g);
        assertEquals(g.nodeCount(), r.nodeCount());
        for (String s : words) assertTrue(s, r.contains(s));
        int absent = 0;
        for (int i = 0; i < 2000; i++) {
            String s = words.get(i) + "Q";
            if (!words.contains(s)) {
                absent++;
                assertFalse(s, r.contains(s));
            }
        }
        assertTrue(absent > 1000);
    }

    @Test
    public void edgesSortedForBinarySearch() {
        WordGraph g = WordGraph.build(Arrays.asList("C", "A", "B", "Ä"));
        int root = g.root();
        for (int e = g.edgeStart(root) + 1; e < g.edgeEnd(root); e++) {
            assertTrue(g.edgeChar(e - 1) < g.edgeChar(e));
        }
        assertEquals(4, g.edgeEnd(root) - g.edgeStart(root));
        assertTrue(g.isTerminal(g.child(root, 'Ä')));
        assertEquals(-1, g.child(root, 'D'));
    }

    @Test
    public void rejectsForeignOrCorruptStreams() throws IOException {
        try {
            WordGraph.read(new ByteArrayInputStream(new byte[] {1, 2, 3, 4, 5, 6, 7, 8}));
            fail();
        } catch (IOException expected) {
        }
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        WordGraph.build(Arrays.asList("AB", "AC")).write(out);
        byte[] b = out.toByteArray();
        byte[] truncated = Arrays.copyOf(b, b.length - 3);
        try {
            WordGraph.read(new ByteArrayInputStream(truncated));
            fail();
        } catch (IOException expected) {
        }
        byte[] wrongVersion = b.clone();
        wrongVersion[7] = 99;
        try {
            WordGraph.read(new ByteArrayInputStream(wrongVersion));
            fail();
        } catch (IOException expected) {
        }
    }

    private static byte[] header(int nodes, int edges) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        DataOutputStream d = new DataOutputStream(out);
        d.writeInt(0x57465747);
        d.writeInt(1);
        d.writeInt(nodes);
        d.writeInt(edges);
        d.writeInt(0);
        d.flush();
        return out.toByteArray();
    }

    @Test
    public void hugeNodeCountIsIOExceptionNotOutOfMemory() throws IOException {
        for (int nodes : new int[] {Integer.MAX_VALUE, (1 << 26) + 1}) {
            try {
                WordGraph.read(new ByteArrayInputStream(header(nodes, nodes - 1)));
                fail("accepted " + nodes);
            } catch (IOException expected) {
            }
        }
    }

    @Test
    public void headerLargerThanAvailableBytesIsRejected() throws IOException {
        byte[] h = header(1_000_000, 999_999);
        try {
            WordGraph.read(new ByteArrayInputStream(h), h.length);
            fail();
        } catch (IOException expected) {
        }
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        WordGraph.build(Arrays.asList("AB", "AC")).write(out);
        byte[] b = out.toByteArray();
        assertTrue(WordGraph.read(new ByteArrayInputStream(b), b.length).contains("AC"));
    }
}
