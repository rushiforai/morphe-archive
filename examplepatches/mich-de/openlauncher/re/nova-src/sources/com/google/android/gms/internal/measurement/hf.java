package com.google.android.gms.internal.measurement;

import java.io.FilterInputStream;

/* loaded from: classes3.dex */
public abstract class hf extends FilterInputStream {
    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr) {
        return ((FilterInputStream) this).in.read(bArr);
    }
}
