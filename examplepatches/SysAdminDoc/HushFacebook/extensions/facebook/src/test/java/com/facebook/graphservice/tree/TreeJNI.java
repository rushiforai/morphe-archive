/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package com.facebook.graphservice.tree;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * A test stand-in for Facebook's JNI tree, the base of every model. The GenAI feed rule reads its
 * public {@code mTypeTag} by reflection, and the GenAI reel rule reads a reel attribution's flag
 * through the public readers Facebook keeps on it: {@code getBooleanValue(int)}, keyed by the hash
 * of the field's GraphQL name, {@code hasFieldValue(int)} and {@code getTypeName()}. Like
 * Facebook's, a boolean the tree doesn't hold reads false. Every boolean read is counted, so a
 * test can show that a switched-off rule reads nothing.
 *
 * <p>The file name reads a post's owner, actors, name and creation time through the kept
 * {@code getTree}, {@code getTreeList}, {@code getString} and {@code getTimeValue}, by the same
 * hashes, after asking {@code isValidGraphServicesJNIModel}. Like Facebook's, a field the tree
 * doesn't hold reads as null, an empty list or 0.
 */
public class TreeJNI {
    public final int mTypeTag;
    private final Map<Integer, Boolean> booleans = new HashMap<>();
    private final Map<Integer, String> strings = new HashMap<>();
    private final Map<Integer, TreeJNI> trees = new HashMap<>();
    private final Map<Integer, List<? extends TreeJNI>> lists = new HashMap<>();
    private final Map<Integer, Long> times = new HashMap<>();
    private final String typeName;
    private boolean valid = true;
    public int booleanReads;
    public int treeReads;

    /**
     * Whether one of the file name's readers asked the tree after it was released. On a phone that
     * read goes to native code with nothing behind it, which no try block catches, so a test asks
     * this flag rather than waiting for an exception.
     */
    public boolean readAfterRelease;

    /** A tree with no type tag and no type name, as the file name's reads see one. */
    public TreeJNI() {
        this(0, null);
    }

    public TreeJNI(int typeTag) {
        this(typeTag, null);
    }

    /** A tree answering {@code typeName}, as a Pando attribution does. */
    public TreeJNI(String typeName) {
        this(0, typeName);
    }

    private TreeJNI(int typeTag, String typeName) {
        this.mTypeTag = typeTag;
        this.typeName = typeName;
    }

    /** Sets the boolean field named {@code field}, the way a fetched tree holds it. */
    public TreeJNI holding(String field, boolean value) {
        booleans.put(field.hashCode(), value);
        return this;
    }

    /** Sets the string field named {@code field}. */
    public TreeJNI with(String field, String value) {
        strings.put(field.hashCode(), value);
        return this;
    }

    /** Sets the model field named {@code field}. */
    public TreeJNI with(String field, TreeJNI value) {
        trees.put(field.hashCode(), value);
        return this;
    }

    /** Sets the model list field named {@code field}. */
    public TreeJNI with(String field, List<? extends TreeJNI> value) {
        lists.put(field.hashCode(), value);
        return this;
    }

    /** Sets the time field named {@code field}, in seconds, as GraphQL carries a creation_time. */
    public TreeJNI with(String field, long seconds) {
        times.put(field.hashCode(), seconds);
        return this;
    }

    /** A tree whose native side is gone, as after Facebook releases it. */
    public TreeJNI releasedTree() {
        valid = false;
        return this;
    }

    public final boolean getBooleanValue(int key) {
        booleanReads++;
        Boolean value = booleans.get(key);
        return value != null && value;
    }

    public final boolean hasFieldValue(int key) {
        return booleans.containsKey(key);
    }

    public boolean isValidGraphServicesJNIModel() {
        return valid;
    }

    public String getTypeName() {
        return typeName;
    }

    public final String getString(int field) {
        nativeRead();
        return strings.get(field);
    }

    /**
     * Facebook's returns its Tree interface; the object behind it is a tree like this one. Every
     * read is counted, so a test can show a switched-off rule asks no tree. Facebook's is final;
     * this one isn't, so a test tree can make the read fail.
     */
    public TreeJNI getTree(int field) {
        treeReads++;
        nativeRead();
        return trees.get(field);
    }

    /** Facebook's returns an ImmutableList, which is a List; an unset field is an empty one. */
    public final List<? extends TreeJNI> getTreeList(int field) {
        nativeRead();
        List<? extends TreeJNI> list = lists.get(field);
        return list == null ? Collections.<TreeJNI>emptyList() : list;
    }

    public final long getTimeValue(int field) {
        nativeRead();
        Long seconds = times.get(field);
        return seconds == null ? 0 : seconds;
    }

    /** The string field [field] as a model's own cache would answer it, with no native read. */
    protected final String cachedString(int field) {
        return strings.get(field);
    }

    private void nativeRead() {
        if (!valid) readAfterRelease = true;
    }
}
