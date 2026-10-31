package com.google.android.gms.internal.measurement;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class ve extends jf {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f33146b = 0;

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f33147a;

    public ve(OutputStream outputStream, ArrayList arrayList) {
        super(outputStream);
        this.f33147a = arrayList;
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        Iterator it = this.f33147a.iterator();
        while (it.hasNext()) {
            if (it.next() != null) {
                throw new ClassCastException();
            }
            try {
                throw null;
            } catch (Throwable unused) {
            }
        }
        super.close();
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public final void write(int i5) throws IOException {
        ((FilterOutputStream) this).out.write(i5);
        Iterator it = this.f33147a.iterator();
        if (it.hasNext()) {
            throw b.u4.e(it);
        }
    }

    @Override // com.google.android.gms.internal.measurement.jf, java.io.FilterOutputStream, java.io.OutputStream
    public final void write(byte[] bArr) throws IOException {
        ((FilterOutputStream) this).out.write(bArr);
        Iterator it = this.f33147a.iterator();
        if (it.hasNext()) {
            if (it.next() == null) {
                int length = bArr.length;
                throw null;
            }
            throw new ClassCastException();
        }
    }

    @Override // com.google.android.gms.internal.measurement.jf, java.io.FilterOutputStream, java.io.OutputStream
    public final void write(byte[] bArr, int i5, int i11) throws IOException {
        ((FilterOutputStream) this).out.write(bArr, i5, i11);
        Iterator it = this.f33147a.iterator();
        if (it.hasNext()) {
            throw b.u4.e(it);
        }
    }
}
