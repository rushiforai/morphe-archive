package com.drew.lang;

import defpackage.ay0;
import defpackage.ygf;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ByteTrie<T> {
    private int _maxDepth;
    private final ByteTrieNode<T> _root = new ByteTrieNode<>();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class ByteTrieNode<T> {
        private final Map<Byte, ByteTrieNode<T>> _children = new HashMap();
        private T _value = null;

        public final void setValue(T t) {
            if (this._value == null) {
                this._value = t;
            } else {
                ygf.i("Value already set for this trie node");
            }
        }
    }

    public final void addPath(T t, byte[]... bArr) {
        ByteTrieNode<T> byteTrieNode = this._root;
        int i = 0;
        for (byte[] bArr2 : bArr) {
            for (byte b : bArr2) {
                ByteTrieNode<T> byteTrieNode2 = (ByteTrieNode) ((ByteTrieNode) byteTrieNode)._children.get(Byte.valueOf(b));
                if (byteTrieNode2 == null) {
                    byteTrieNode2 = new ByteTrieNode<>();
                    ((ByteTrieNode) byteTrieNode)._children.put(Byte.valueOf(b), byteTrieNode2);
                }
                byteTrieNode = byteTrieNode2;
                i++;
            }
        }
        if (i == 0) {
            ay0.e("Parts must contain at least one byte.");
        } else {
            byteTrieNode.setValue(t);
            this._maxDepth = Math.max(this._maxDepth, i);
        }
    }

    public final T find(byte[] bArr, int i, int i2) {
        int i3 = i2 + i;
        if (i3 > bArr.length) {
            throw new IndexOutOfBoundsException();
        }
        ByteTrieNode<T> byteTrieNode = this._root;
        T t = (T) ((ByteTrieNode) byteTrieNode)._value;
        while (i < i3) {
            byteTrieNode = (ByteTrieNode) ((ByteTrieNode) byteTrieNode)._children.get(Byte.valueOf(bArr[i]));
            if (byteTrieNode == null) {
                break;
            }
            if (((ByteTrieNode) byteTrieNode)._value != null) {
                t = (T) ((ByteTrieNode) byteTrieNode)._value;
            }
            i++;
        }
        return t;
    }

    public final int getMaxDepth() {
        return this._maxDepth;
    }

    public final void setDefaultValue(T t) {
        this._root.setValue(t);
    }

    public final T find(byte[] bArr) {
        return find(bArr, 0, bArr.length);
    }
}
