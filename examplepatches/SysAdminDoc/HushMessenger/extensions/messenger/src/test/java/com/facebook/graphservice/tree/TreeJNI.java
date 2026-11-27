package com.facebook.graphservice.tree;

import com.facebook.graphservice.interfaces.Tree;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Stands in for Meta's GraphQL tree, whose data lives in native code. It has only the public methods the real one keeps
 * by name in every build: a field's type and whether it's set are asked by its name, and its value read by its name's
 * hash. Reading a string or a tree from a field that holds something else throws, where the real one's native type
 * mismatch would take the process down, so a test sees any read that wasn't checked first.
 */
public class TreeJNI implements Tree {
    /** Every value read, as the field's hash, so a test can tell what was read and that nothing was. */
    public static final List<Integer> reads = new ArrayList<>();
    /** Makes every call throw, for a tree this build can't read. */
    public static boolean failing;

    private final Map<String, FieldType> types = new HashMap<>();
    private final Map<Integer, Object> values = new HashMap<>();

    /** Sets field [name] to [value], a String or another tree. */
    public final void put(String name, Object value) {
        types.put(name, value instanceof String ? FieldType.STRING : value instanceof TreeJNI ? FieldType.TREE : FieldType.DYNAMIC);
        values.put(name.hashCode(), value);
    }

    /** Declares field [name] as a [type] with nothing set in it, the way a tree's schema lists fields it didn't get. */
    public final void declare(String name, FieldType type) {
        types.put(name, type);
    }

    public FieldType getFieldType(String name) {
        check();
        FieldType type = types.get(name);
        return type == null ? FieldType.NONE : type;
    }

    public final boolean isFieldUnset(String name) {
        check();
        return !values.containsKey(name.hashCode());
    }

    public final TreeJNI getTree(int field) {
        check();
        reads.add(field);
        Object value = values.get(field);
        if (value != null && !(value instanceof TreeJNI)) throw new IllegalStateException("not a tree");
        return (TreeJNI) value;
    }

    public String getString(int field) {
        check();
        reads.add(field);
        Object value = values.get(field);
        if (value != null && !(value instanceof String)) throw new IllegalStateException("not a string");
        return (String) value;
    }

    private static void check() {
        if (failing) throw new IllegalStateException("tree unreadable");
    }
}
