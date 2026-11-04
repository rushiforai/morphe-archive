package app.wordfeudwordfinder.extension.words;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.Collection;

/**
 * Immutable trie of words, stored as flat arrays so that large word lists (~400k words) fit on Android
 * without millions of node objects.
 *
 * <p>Layout: node {@code n} owns the edges {@code edgeFirst[n] .. edgeFirst[n + 1] - 1}; the edges of a node
 * are sorted by character, so a child is found by binary search. Node 0 is the root. {@code terminal} has one
 * bit per node. Letters are arbitrary UTF-16 chars; the graph does no case folding (normalisation happens when
 * the list is loaded).
 */
public final class WordGraph {
    /** "WFWG" */
    private static final int MAGIC = 0x57465747;
    private static final int VERSION = 1;
    /** Upper bound on the node count accepted by {@link #read}; far above any real word list. */
    static final int MAX_NODES = 1 << 26;

    private final int[] edgeFirst;   // nodeCount + 1 entries
    private final long[] terminal;   // bitset over nodes
    private final char[] edgeChar;
    private final int[] edgeTarget;

    private WordGraph(int[] edgeFirst, long[] terminal, char[] edgeChar, int[] edgeTarget) {
        this.edgeFirst = edgeFirst;
        this.terminal = terminal;
        this.edgeChar = edgeChar;
        this.edgeTarget = edgeTarget;
    }

    // ---------------------------------------------------------------- building

    /** Builds a graph from the given words. Null and empty entries are ignored, duplicates are merged. */
    public static WordGraph build(Collection<String> words) {
        String[] sorted = new String[words.size()];
        int n = 0;
        for (String w : words) {
            if (w != null && !w.isEmpty()) sorted[n++] = w;
        }
        Arrays.sort(sorted, 0, n);
        int u = 0;
        for (int i = 0; i < n; i++) {
            if (u == 0 || !sorted[i].equals(sorted[u - 1])) sorted[u++] = sorted[i];
        }
        Builder b = new Builder(Math.max(16, u * 3));
        b.build(sorted, 0, u, 0);
        return b.finish();
    }

    /** Builds the flat arrays directly from a sorted, duplicate-free word array (no temporary node objects). */
    private static final class Builder {
        int[] first;
        long[] term;
        int nodes;
        char[] chars;
        int[] targets;
        int edges;

        Builder(int capacity) {
            first = new int[capacity];
            term = new long[(capacity >> 6) + 1];
            chars = new char[capacity];
            targets = new int[capacity];
        }

        /** Creates the node for words[lo..hi) that share their first {@code depth} chars; returns its id. */
        int build(String[] w, int lo, int hi, int depth) {
            int id = nodes++;
            if (id >= first.length) {
                first = Arrays.copyOf(first, first.length * 2);
            }
            if ((id >> 6) >= term.length) term = Arrays.copyOf(term, term.length * 2);
            first[id] = edges;
            if (lo < hi && w[lo].length() == depth) {
                term[id >> 6] |= 1L << (id & 63);
                lo++;
            }
            int groups = 0;
            for (int i = lo; i < hi; i++) {
                if (i == lo || w[i].charAt(depth) != w[i - 1].charAt(depth)) groups++;
            }
            int base = edges;
            edges += groups;
            if (edges > chars.length) {
                int cap = Math.max(edges, chars.length * 2);
                chars = Arrays.copyOf(chars, cap);
                targets = Arrays.copyOf(targets, cap);
            }
            int k = 0;
            int gLo = lo;
            for (int i = lo; i <= hi; i++) {
                if (i == hi || (i > gLo && w[i].charAt(depth) != w[gLo].charAt(depth))) {
                    if (i > gLo) {
                        chars[base + k] = w[gLo].charAt(depth);
                        int child = build(w, gLo, i, depth + 1);
                        targets[base + k] = child;
                        k++;
                    }
                    gLo = i;
                }
            }
            return id;
        }

        WordGraph finish() {
            int[] f = Arrays.copyOf(first, nodes + 1);
            f[nodes] = edges;
            long[] t = Arrays.copyOf(term, (nodes >> 6) + 1);
            return new WordGraph(f, t, Arrays.copyOf(chars, edges), Arrays.copyOf(targets, edges));
        }
    }

    // ---------------------------------------------------------------- queries

    public boolean contains(String w) {
        if (w == null || w.isEmpty()) return false;
        int node = walk(root(), w);
        return node >= 0 && isTerminal(node);
    }

    /** Follows the chars of {@code s} from {@code node}; returns the node reached, or -1. */
    public int walk(int node, CharSequence s) {
        for (int i = 0; i < s.length() && node >= 0; i++) node = child(node, s.charAt(i));
        return node;
    }

    public int root() { return 0; }

    public int nodeCount() { return edgeFirst.length - 1; }

    public boolean isTerminal(int node) {
        return (terminal[node >> 6] & (1L << (node & 63))) != 0;
    }

    /** Child of {@code node} along {@code c}, or -1. */
    public int child(int node, char c) {
        int lo = edgeFirst[node];
        int hi = edgeFirst[node + 1] - 1;
        while (lo <= hi) {
            int mid = (lo + hi) >>> 1;
            char m = edgeChar[mid];
            if (m < c) lo = mid + 1;
            else if (m > c) hi = mid - 1;
            else return edgeTarget[mid];
        }
        return -1;
    }

    /** First edge index of {@code node}. */
    public int edgeStart(int node) { return edgeFirst[node]; }

    /** One past the last edge index of {@code node}. */
    public int edgeEnd(int node) { return edgeFirst[node + 1]; }

    public char edgeChar(int edge) { return edgeChar[edge]; }

    public int edgeTarget(int edge) { return edgeTarget[edge]; }

    // ---------------------------------------------------------------- serialisation

    /** Writes the graph; the stream is flushed but not closed. */
    public void write(OutputStream out) throws IOException {
        DataOutputStream d = new DataOutputStream(new BufferedOutputStream(out, 1 << 16));
        int nodes = nodeCount();
        int edges = edgeChar.length;
        d.writeInt(MAGIC);
        d.writeInt(VERSION);
        d.writeInt(nodes);
        d.writeInt(edges);
        for (int i = 0; i <= nodes; i++) d.writeInt(edgeFirst[i]);
        d.writeInt(terminal.length);
        for (long l : terminal) d.writeLong(l);
        for (int i = 0; i < edges; i++) d.writeChar(edgeChar[i]);
        for (int i = 0; i < edges; i++) d.writeInt(edgeTarget[i]);
        d.flush();
    }

    /** Reads a graph written by {@link #write}; throws IOException for a foreign, newer or corrupt stream. */
    public static WordGraph read(InputStream in) throws IOException {
        return read(in, -1);
    }

    /**
     * As {@link #read(InputStream)}, but when {@code availableBytes >= 0} (e.g. the file length) a header that
     * implies a larger stream is rejected before any array is allocated, so a corrupt file cannot cause a huge
     * allocation. A node count above {@link #MAX_NODES} is always rejected.
     */
    public static WordGraph read(InputStream in, long availableBytes) throws IOException {
        DataInputStream d = new DataInputStream(new BufferedInputStream(in, 1 << 16));
        if (d.readInt() != MAGIC) throw new IOException("not a word graph");
        int version = d.readInt();
        if (version != VERSION) throw new IOException("unsupported word graph version " + version);
        int nodes = d.readInt();
        int edges = d.readInt();
        if (nodes < 1 || nodes > MAX_NODES || edges < 0 || edges != nodes - 1) {
            throw new IOException("corrupt word graph header");
        }
        if (availableBytes >= 0 && serializedSize(nodes, edges) > availableBytes) {
            throw new IOException("corrupt word graph header");
        }
        int[] first = new int[nodes + 1];
        int prev = 0;
        for (int i = 0; i <= nodes; i++) {
            int v = d.readInt();
            if (v < prev || v > edges) throw new IOException("corrupt word graph");
            first[i] = prev = v;
        }
        if (first[0] != 0 || first[nodes] != edges) throw new IOException("corrupt word graph");
        int termLen = d.readInt();
        if (termLen != (nodes >> 6) + 1) throw new IOException("corrupt word graph");
        long[] term = new long[termLen];
        for (int i = 0; i < termLen; i++) term[i] = d.readLong();
        char[] chars = new char[edges];
        for (int i = 0; i < edges; i++) chars[i] = d.readChar();
        int[] targets = new int[edges];
        for (int i = 0; i < edges; i++) {
            int t = d.readInt();
            if (t <= 0 || t >= nodes) throw new IOException("corrupt word graph");
            targets[i] = t;
        }
        return new WordGraph(first, term, chars, targets);
    }

    /** Exact byte size of the stream {@link #write} produces for a graph of this shape. */
    private static long serializedSize(int nodes, int edges) {
        long termLen = (nodes >> 6) + 1L;
        return 16L + 4L * (nodes + 1L) + 4L + 8L * termLen + 2L * edges + 4L * edges;
    }
}
