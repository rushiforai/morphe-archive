package app.wordfeudwordfinder.extension.words;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

/**
 * Immutable minimal word graph (DAWG: words share both prefixes and suffixes), stored as flat arrays so that large
 * word lists (millions of words) fit on Android without node objects.
 *
 * <p>Layout: node {@code n} owns the edges {@code edgeFirst[n] .. edgeFirst[n + 1] - 1}; the edges of a node
 * are sorted by character, so a child is found by binary search. Node 0 is the root; every edge points to a higher
 * node id. {@code terminal} has one bit per node. Letters are arbitrary UTF-16 chars; the graph does no case folding
 * (normalisation happens when the list is loaded). Callers only walk the graph (no per-node data), so shared
 * suffix nodes are safe.
 *
 * <p>Built incrementally from sorted input ({@link Builder}, Daciuk et al. 2000): only the path of the current word
 * is kept as mutable nodes, so the word list itself never has to be in memory at once.
 */
public final class WordGraph {
    /** "WFWG" */
    private static final int MAGIC = 0x57465747;
    /** 1: trie (edges = nodes - 1); 2: minimal graph. Both are read. */
    private static final int VERSION = 2;
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

    /** Builds a graph from the given words (any order). Null and empty entries are ignored, duplicates are merged. */
    public static WordGraph build(Collection<String> words) {
        String[] sorted = new String[words.size()];
        int n = 0;
        for (String w : words) {
            if (w != null && !w.isEmpty()) sorted[n++] = w;
        }
        Arrays.sort(sorted, 0, n);
        Builder b = new Builder();
        for (int i = 0; i < n; i++) b.add(sorted[i]);
        return b.finish();
    }

    /**
     * Incremental builder for words in ascending {@link String#compareTo} order (duplicates in a row are merged).
     * {@link #add} throws IllegalArgumentException for a word that sorts before the previous one.
     */
    public static final class Builder {
        private static final int PENDING = -1;

        /** A node on the path of the last added word; its last edge leads to the next path node (PENDING). */
        private static final class Mutable {
            boolean terminal;
            char[] ch = new char[4];
            int[] tgt = new int[4];
            int n;

            void add(char c) {
                if (n == ch.length) {
                    ch = Arrays.copyOf(ch, n * 2);
                    tgt = Arrays.copyOf(tgt, n * 2);
                }
                ch[n] = c;
                tgt[n] = PENDING;
                n++;
            }

            int hash() {
                int h = terminal ? 1 : 0;
                for (int i = 0; i < n; i++) h = (h * 31 + ch[i]) * 31 + tgt[i];
                return h;
            }
        }

        // finalized nodes, in creation order (children before parents)
        private int[] first = new int[1024];
        private int[] count = new int[1024];
        private long[] term = new long[16];
        private int nodes;
        private char[] chars = new char[1024];
        private int[] targets = new int[1024];
        private int edges;
        // register of finalized nodes (open addressing on node ids, -1 = empty)
        private int[] table = filled(1 << 12);
        private int registered;

        private final ArrayList<Mutable> path = new ArrayList<>();
        private String prev = "";
        private boolean finished;

        public Builder() {
            path.add(new Mutable());
        }

        private static int[] filled(int n) {
            int[] t = new int[n];
            Arrays.fill(t, -1);
            return t;
        }

        public void add(String w) {
            if (finished) throw new IllegalStateException("finished");
            if (w == null || w.isEmpty()) return;
            int cmp = w.compareTo(prev);
            if (cmp == 0) return;
            if (cmp < 0) throw new IllegalArgumentException("words not sorted");
            int cp = 0;
            int max = Math.min(w.length(), prev.length());
            while (cp < max && w.charAt(cp) == prev.charAt(cp)) cp++;
            minimize(cp);
            for (int i = cp; i < w.length(); i++) {
                path.get(path.size() - 1).add(w.charAt(i));
                path.add(new Mutable());
            }
            path.get(path.size() - 1).terminal = true;
            prev = w;
        }

        /** Finalizes the path nodes deeper than {@code depth}, sharing equal ones. */
        private void minimize(int depth) {
            for (int i = path.size() - 1; i > depth; i--) {
                Mutable child = path.remove(i);
                Mutable parent = path.get(i - 1);
                parent.tgt[parent.n - 1] = findOrAdd(child);
            }
        }

        private boolean same(int id, Mutable m) {
            if (isTerm(id) != m.terminal || count[id] != m.n) return false;
            int f = first[id];
            for (int i = 0; i < m.n; i++) {
                if (chars[f + i] != m.ch[i] || targets[f + i] != m.tgt[i]) return false;
            }
            return true;
        }

        private boolean isTerm(int id) {
            return (term[id >> 6] & (1L << (id & 63))) != 0;
        }

        private int findOrAdd(Mutable m) {
            int mask = table.length - 1;
            int slot = mix(m.hash()) & mask;
            while (table[slot] >= 0) {
                if (same(table[slot], m)) return table[slot];
                slot = (slot + 1) & mask;
            }
            int id = store(m);
            table[slot] = id;
            if (++registered * 2 > table.length) rehash();
            return id;
        }

        private static int mix(int h) {
            h ^= h >>> 16;
            h *= 0x85ebca6b;
            h ^= h >>> 13;
            return h;
        }

        private int hashOf(int id) {
            int h = isTerm(id) ? 1 : 0;
            int f = first[id];
            for (int i = 0; i < count[id]; i++) h = (h * 31 + chars[f + i]) * 31 + targets[f + i];
            return h;
        }

        private void rehash() {
            int[] old = table;
            table = filled(old.length * 2);
            int mask = table.length - 1;
            for (int id : old) {
                if (id < 0) continue;
                int slot = mix(hashOf(id)) & mask;
                while (table[slot] >= 0) slot = (slot + 1) & mask;
                table[slot] = id;
            }
        }

        private int store(Mutable m) {
            int id = nodes++;
            if (id >= first.length) {
                first = Arrays.copyOf(first, first.length * 2);
                count = Arrays.copyOf(count, count.length * 2);
            }
            if ((id >> 6) >= term.length) term = Arrays.copyOf(term, term.length * 2);
            if (m.terminal) term[id >> 6] |= 1L << (id & 63);
            if (edges + m.n > chars.length) {
                int cap = Math.max(edges + m.n, chars.length * 2);
                chars = Arrays.copyOf(chars, cap);
                targets = Arrays.copyOf(targets, cap);
            }
            first[id] = edges;
            count[id] = m.n;
            System.arraycopy(m.ch, 0, chars, edges, m.n);
            System.arraycopy(m.tgt, 0, targets, edges, m.n);
            edges += m.n;
            return id;
        }

        /** Finishes the graph; the root becomes node 0. */
        public WordGraph finish() {
            if (finished) throw new IllegalStateException("finished");
            finished = true;
            minimize(0);
            table = null;
            int root = store(path.get(0)); // never shared with another node
            path.clear();
            int n = nodes;
            int[] f = new int[n + 1];
            char[] c = new char[edges];
            int[] t = new int[edges];
            long[] tm = new long[(n >> 6) + 1];
            int e = 0;
            for (int newId = 0; newId < n; newId++) {
                int old = root - newId; // reverse creation order: root first, children after their parents
                f[newId] = e;
                if (isTerm(old)) tm[newId >> 6] |= 1L << (newId & 63);
                int of = first[old];
                for (int i = 0; i < count[old]; i++) {
                    c[e] = chars[of + i];
                    t[e] = root - targets[of + i];
                    e++;
                }
            }
            f[n] = e;
            return new WordGraph(f, tm, c, t);
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
        if (version != 1 && version != VERSION) throw new IOException("unsupported word graph version " + version);
        int nodes = d.readInt();
        int edges = d.readInt();
        // Every node but the root has an incoming edge; a trie (version 1) has exactly one.
        boolean shape = version == 1 ? edges == nodes - 1 : edges >= nodes - 1 && edges <= MAX_NODES * 4L;
        if (nodes < 1 || nodes > MAX_NODES || edges < 0 || !shape) {
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
        for (int n = 0; n < nodes; n++) {
            for (int i = first[n]; i < first[n + 1]; i++) {
                int t = d.readInt();
                // Children always have a higher id, so walking can never loop.
                if (t <= n || t >= nodes) throw new IOException("corrupt word graph");
                targets[i] = t;
            }
        }
        return new WordGraph(first, term, chars, targets);
    }

    /** Exact byte size of the stream {@link #write} produces for a graph of this shape. */
    private static long serializedSize(int nodes, int edges) {
        long termLen = (nodes >> 6) + 1L;
        return 16L + 4L * (nodes + 1L) + 4L + 8L * termLen + 2L * edges + 4L * edges;
    }
}
