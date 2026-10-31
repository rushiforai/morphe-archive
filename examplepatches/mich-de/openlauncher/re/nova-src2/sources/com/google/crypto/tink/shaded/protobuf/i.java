package com.google.crypto.tink.shaded.protobuf;

import java.io.Serializable;
import java.util.Locale;

/* loaded from: classes.dex */
public abstract class i implements Iterable, Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final g f34608b = new g(b0.f34576b);

    /* renamed from: c, reason: collision with root package name */
    public static final f f34609c;

    /* renamed from: a, reason: collision with root package name */
    public int f34610a;

    static {
        f34609c = c.a() ? new h() : new br.c();
    }

    public static int d(int i5, int i11, int i12) {
        int i13 = i11 - i5;
        if ((i5 | i11 | i13 | (i12 - i11)) >= 0) {
            return i13;
        }
        if (i5 < 0) {
            throw new IndexOutOfBoundsException(b.c0.i(i5, "Beginning index: ", " < 0"));
        }
        if (i11 < i5) {
            throw new IndexOutOfBoundsException(b.c0.g(i5, i11, "Beginning index larger than ending index: ", ", "));
        }
        throw new IndexOutOfBoundsException(b.c0.g(i11, i12, "End index: ", " >= "));
    }

    public static g e(int i5, int i11, byte[] bArr) {
        d(i5, i5 + i11, bArr.length);
        return new g(f34609c.a(i5, i11, bArr));
    }

    public abstract byte c(int i5);

    public abstract boolean equals(Object obj);

    public abstract void f(int i5, byte[] bArr);

    public abstract byte g(int i5);

    public final byte[] h() {
        int size = size();
        if (size == 0) {
            return b0.f34576b;
        }
        byte[] bArr = new byte[size];
        f(size, bArr);
        return bArr;
    }

    public final int hashCode() {
        int i5 = this.f34610a;
        if (i5 != 0) {
            return i5;
        }
        int size = size();
        g gVar = (g) this;
        int iJ = gVar.j();
        int i11 = size;
        for (int i12 = iJ; i12 < iJ + size; i12++) {
            i11 = (i11 * 31) + gVar.f34597d[i12];
        }
        if (i11 == 0) {
            i11 = 1;
        }
        this.f34610a = i11;
        return i11;
    }

    public abstract int size();

    public final String toString() {
        String string;
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        int size = size();
        if (size() <= 50) {
            string = io.sentry.config.a.E(this);
        } else {
            StringBuilder sb2 = new StringBuilder();
            g gVar = (g) this;
            int iD = d(0, 47, gVar.size());
            sb2.append(io.sentry.config.a.E(iD == 0 ? f34608b : new e(gVar.f34597d, gVar.j(), iD)));
            sb2.append("...");
            string = sb2.toString();
        }
        return b.c0.q(b.c0.v("<ByteString@", size, hexString, " size=", " contents=\""), string, "\">");
    }
}
