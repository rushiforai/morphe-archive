package app.afterglow.extension.litho;

import java.util.Arrays;

/**
 * Prefix tree that finds registered patterns at any position of a text.
 *
 * <p>Every component path is searched for every pattern of every filter, so
 * the search walks the tree once from each start position instead of looking
 * for each pattern separately. Patterns are added while the filters load and
 * the tree is only read afterwards, so searching needs no locking and
 * allocates nothing.
 *
 * @param <T> the text type: {@link CharSequence} or {@code byte[]}.
 */
abstract class TrieSearch<T> {

    /** Called for each registered pattern found in the searched text. */
    interface Callback {
        /**
         * @param startIndex index of the pattern in the searched text.
         * @param length     length of the pattern.
         * @param parameter  object passed to {@link #matches(Object, Object)}.
         * @return true to stop the search and report a match.
         */
        boolean onMatch(int startIndex, int length, Object parameter);
    }

    private static final int[] NO_KEYS = new int[0];
    private static final Node[] NO_CHILDREN = new Node[0];

    private static final class Node {
        /** Sorted keys of the children. */
        int[] keys = NO_KEYS;
        Node[] children = NO_CHILDREN;
        /** Callbacks of the patterns that end at this node, or null. */
        Callback[] callbacks;

        Node child(int key) {
            int[] keys = this.keys;
            // Most nodes have one or two children; scan those, search the rest.
            if (keys.length <= 4) {
                for (int i = 0; i < keys.length; i++) {
                    if (keys[i] == key) return children[i];
                }
                return null;
            }
            int index = Arrays.binarySearch(keys, key);
            return index >= 0 ? children[index] : null;
        }

        Node childOrCreate(int key) {
            int index = Arrays.binarySearch(keys, key);
            if (index >= 0) return children[index];

            int at = -index - 1;
            int[] newKeys = new int[keys.length + 1];
            Node[] newChildren = new Node[children.length + 1];
            System.arraycopy(keys, 0, newKeys, 0, at);
            System.arraycopy(children, 0, newChildren, 0, at);
            System.arraycopy(keys, at, newKeys, at + 1, keys.length - at);
            System.arraycopy(children, at, newChildren, at + 1, children.length - at);
            Node child = new Node();
            newKeys[at] = key;
            newChildren[at] = child;
            keys = newKeys;
            children = newChildren;
            return child;
        }
    }

    /** Keys below this have a direct slot at the root, so the first step of every search is one array read. */
    private static final int ROOT_TABLE_SIZE = 256;

    private final Node root = new Node();
    private final Node[] rootTable = new Node[ROOT_TABLE_SIZE];
    private int patternCount;

    abstract int length(T text);

    abstract int keyAt(T text, int index);

    final void addPattern(T pattern, Callback callback) {
        int length = length(pattern);
        if (length == 0) throw new IllegalArgumentException("Empty pattern");

        int first = keyAt(pattern, 0);
        Node node = root.childOrCreate(first);
        if (first < ROOT_TABLE_SIZE) rootTable[first] = node;
        for (int i = 1; i < length; i++) {
            node = node.childOrCreate(keyAt(pattern, i));
        }
        Callback[] callbacks = node.callbacks;
        if (callbacks == null) {
            node.callbacks = new Callback[] {callback};
        } else {
            callbacks = Arrays.copyOf(callbacks, callbacks.length + 1);
            callbacks[callbacks.length - 1] = callback;
            node.callbacks = callbacks;
        }
        patternCount++;
    }

    final int patternCount() {
        return patternCount;
    }

    /**
     * Searches the text for every registered pattern, calling the callbacks of
     * the patterns found until one returns true.
     *
     * @return true if a callback returned true.
     */
    final boolean matches(T text, Object parameter) {
        Node root = this.root;
        if (root.keys.length == 0) return false;

        Node[] rootTable = this.rootTable;
        int length = length(text);
        for (int start = 0; start < length; start++) {
            int first = keyAt(text, start);
            Node node = first < ROOT_TABLE_SIZE ? rootTable[first] : root.child(first);
            for (int i = start; node != null; ) {
                Callback[] callbacks = node.callbacks;
                if (callbacks != null) {
                    for (Callback callback : callbacks) {
                        if (callback.onMatch(start, i - start + 1, parameter)) return true;
                    }
                }
                if (++i >= length) break;
                node = node.child(keyAt(text, i));
            }
        }
        return false;
    }

    /** Searches text, such as component paths and identifiers. */
    static final class Text extends TrieSearch<CharSequence> {
        @Override
        int length(CharSequence text) {
            return text.length();
        }

        @Override
        int keyAt(CharSequence text, int index) {
            return text.charAt(index);
        }
    }

    /** Searches bytes, such as an element's protobuf buffer. */
    static final class Bytes extends TrieSearch<byte[]> {
        @Override
        int length(byte[] bytes) {
            return bytes.length;
        }

        @Override
        int keyAt(byte[] bytes, int index) {
            return bytes[index] & 0xFF;
        }
    }
}
