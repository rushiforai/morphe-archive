package com.google.android.gms.internal.measurement;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class ue extends hf {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f33108b = 0;

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f33109a;

    public ue(InputStream inputStream, ArrayList arrayList) {
        super(inputStream);
        this.f33109a = arrayList;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        Iterator it = this.f33109a.iterator();
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

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read() throws IOException {
        int i5 = ((FilterInputStream) this).in.read();
        if (i5 != -1) {
            Iterator it = this.f33109a.iterator();
            if (it.hasNext()) {
                throw b.u4.e(it);
            }
        }
        return i5;
    }

    @Override // com.google.android.gms.internal.measurement.hf, java.io.FilterInputStream, java.io.InputStream
    public final int read(byte[] bArr) throws IOException {
        int i5 = ((FilterInputStream) this).in.read(bArr);
        if (i5 != -1) {
            Iterator it = this.f33109a.iterator();
            if (it.hasNext()) {
                throw b.u4.e(it);
            }
        }
        return i5;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = ((FilterInputStream) this).in.read(bArr, i5, i11);
        if (i12 != -1) {
            Iterator it = this.f33109a.iterator();
            if (it.hasNext()) {
                throw b.u4.e(it);
            }
        }
        return i12;
    }
}
