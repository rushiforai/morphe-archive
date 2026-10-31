package com.fyber.inneractive.sdk.protobuf;

import java.io.Serializable;
import java.nio.charset.Charset;
import java.util.Locale;

/* loaded from: classes.dex */
public abstract class s implements Iterable, Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final q f30889b = new q(l1.f30848b);

    /* renamed from: c, reason: collision with root package name */
    public static final o f30890c;

    /* renamed from: a, reason: collision with root package name */
    public int f30891a = 0;

    static {
        f30890c = d.a() ? new r() : new m();
    }

    public static q a(String str) {
        return new q(str.getBytes(l1.f30847a));
    }

    public abstract int a(int i5, int i11);

    public abstract void a(int i5, byte[] bArr);

    public abstract void a(k kVar);

    public abstract byte c(int i5);

    public abstract boolean c();

    public abstract byte d(int i5);

    public abstract w d();

    public abstract s e(int i5);

    public abstract String e();

    public final String f() {
        Charset charset = l1.f30847a;
        return size() == 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : e();
    }

    public final int hashCode() {
        int iA = this.f30891a;
        if (iA == 0) {
            int size = size();
            iA = a(size, size);
            if (iA == 0) {
                iA = 1;
            }
            this.f30891a = iA;
        }
        return iA;
    }

    public abstract int size();

    public final String toString() {
        String strA;
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        int size = size();
        if (size() <= 50) {
            strA = h3.a(this);
        } else {
            strA = h3.a(e(47)) + "...";
        }
        return b.c0.q(b.c0.v("<ByteString@", size, hexString, " size=", " contents=\""), strA, "\">");
    }

    public static int a(int i5, int i11, int i12) {
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
}
