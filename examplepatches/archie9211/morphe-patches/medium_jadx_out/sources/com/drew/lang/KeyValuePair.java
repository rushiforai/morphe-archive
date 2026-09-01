package com.drew.lang;

import com.drew.metadata.StringValue;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class KeyValuePair {
    private final String _key;
    private final StringValue _value;

    public KeyValuePair(String str, StringValue stringValue) {
        this._key = str;
        this._value = stringValue;
    }

    public final String getKey() {
        return this._key;
    }

    public final StringValue getValue() {
        return this._value;
    }

    public final String toString() {
        return this._key + ": " + this._value;
    }
}
