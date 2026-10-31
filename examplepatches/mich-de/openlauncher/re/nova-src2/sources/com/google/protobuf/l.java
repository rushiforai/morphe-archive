package com.google.protobuf;

import java.io.Serializable;
import java.nio.charset.Charset;
import java.util.Locale;

/* loaded from: classes.dex */
public abstract class l implements Iterable, Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final j f34884b = new j(a1.f34809b);

    /* renamed from: c, reason: collision with root package name */
    public static final k f34885c;

    /* renamed from: a, reason: collision with root package name */
    public int f34886a;

    static {
        Class cls = e.f34844a;
        f34885c = new k();
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

    public static j e(int i5, int i11, byte[] bArr) {
        d(i5, i5 + i11, bArr.length);
        f34885c.getClass();
        byte[] bArr2 = new byte[i11];
        System.arraycopy(bArr, i5, bArr2, 0, i11);
        return new j(bArr2);
    }

    public static j f(String str) {
        return new j(str.getBytes(a1.f34808a));
    }

    public abstract byte c(int i5);

    public abstract byte g(int i5);

    public abstract boolean h();

    public final int hashCode() {
        int iK = this.f34886a;
        if (iK == 0) {
            int size = size();
            iK = k(size, size);
            if (iK == 0) {
                iK = 1;
            }
            this.f34886a = iK;
        }
        return iK;
    }

    public abstract p j();

    public abstract int k(int i5, int i11);

    public abstract l l(int i5);

    public abstract String n(Charset charset);

    public final String o() {
        return size() == 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : n(a1.f34808a);
    }

    public abstract void p(t tVar);

    public abstract int size();

    public final String toString() {
        String strX;
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        int size = size();
        if (size() <= 50) {
            strX = g.x(this);
        } else {
            strX = g.x(l(47)) + "...";
        }
        return b.c0.q(b.c0.v("<ByteString@", size, hexString, " size=", " contents=\""), strX, "\">");
    }
}
