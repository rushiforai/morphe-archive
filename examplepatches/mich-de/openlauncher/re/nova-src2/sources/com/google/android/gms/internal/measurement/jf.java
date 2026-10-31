package com.google.android.gms.internal.measurement;

import java.io.FilterOutputStream;
import java.io.IOException;

/* loaded from: classes3.dex */
public abstract class jf extends FilterOutputStream {
    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] bArr) throws IOException {
        ((FilterOutputStream) this).out.write(bArr);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] bArr, int i5, int i11) throws IOException {
        ((FilterOutputStream) this).out.write(bArr, i5, i11);
    }
}
