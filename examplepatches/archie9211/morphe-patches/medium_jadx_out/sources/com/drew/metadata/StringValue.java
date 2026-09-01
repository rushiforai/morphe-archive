package com.drew.metadata;

import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class StringValue {
    private final byte[] _bytes;
    private final Charset _charset;

    public StringValue(byte[] bArr, Charset charset) {
        this._bytes = bArr;
        this._charset = charset;
    }

    public final byte[] getBytes() {
        return this._bytes;
    }

    public final Charset getCharset() {
        return this._charset;
    }

    public final String toString(Charset charset) {
        byte[] bArr = this._bytes;
        return charset != null ? new String(bArr, charset) : new String(bArr);
    }

    public final String toString() {
        return toString(this._charset);
    }
}
