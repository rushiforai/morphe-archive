package com.google.android.gms.internal.consent_sdk;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Locale;

/* loaded from: classes3.dex */
public class n5 implements Iterable, Serializable {

    /* renamed from: c, reason: collision with root package name */
    public static final n5 f32153c = new n5(b6.f31998b);

    /* renamed from: a, reason: collision with root package name */
    public int f32154a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f32155b;

    static {
        int i5 = k5.f32121a;
    }

    public n5(byte[] bArr) {
        bArr.getClass();
        this.f32155b = bArr;
    }

    public static void g(int i5) {
        if (((i5 - 47) | 47) < 0) {
            throw new IndexOutOfBoundsException(b.c0.h(i5, "End index: 47 >= "));
        }
    }

    public byte c(int i5) {
        return this.f32155b[i5];
    }

    public byte d(int i5) {
        return this.f32155b[i5];
    }

    public int e() {
        return this.f32155b.length;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof n5)) {
            return false;
        }
        n5 n5Var = (n5) obj;
        int iE = e();
        if (iE != n5Var.e()) {
            return false;
        }
        if (iE == 0) {
            return true;
        }
        int i5 = this.f32154a;
        int i11 = n5Var.f32154a;
        if (i5 == 0 || i11 == 0 || i5 == i11) {
            return f(n5Var);
        }
        return false;
    }

    public final boolean f(n5 n5Var) {
        if (!(n5Var instanceof n5)) {
            return n5Var.f(this);
        }
        int iE = e();
        if (iE > n5Var.e()) {
            throw new IllegalArgumentException("Length too large: " + iE + e());
        }
        if (iE > n5Var.e()) {
            throw new IllegalArgumentException(b.c0.g(iE, n5Var.e(), "Ran off end of other: 0, ", ", "));
        }
        byte[] bArr = n5Var.f32155b;
        int i5 = 0;
        int i11 = 0;
        while (i5 < iE) {
            if (this.f32155b[i5] != bArr[i11]) {
                return false;
            }
            i5++;
            i11++;
        }
        return true;
    }

    public final int hashCode() {
        int i5 = this.f32154a;
        if (i5 != 0) {
            return i5;
        }
        int iE = e();
        int i11 = iE;
        for (int i12 = 0; i12 < iE; i12++) {
            i11 = (i11 * 31) + this.f32155b[i12];
        }
        if (i11 == 0) {
            i11 = 1;
        }
        this.f32154a = i11;
        return i11;
    }

    @Override // java.lang.Iterable
    public final /* synthetic */ Iterator iterator() {
        return new androidx.datastore.preferences.protobuf.e(this);
    }

    public final String toString() {
        String strConcat;
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        int iE = e();
        if (e() <= 50) {
            strConcat = p10.c0.g0(this);
        } else {
            g(e());
            byte[] bArr = this.f32155b;
            m5 m5Var = new m5(bArr);
            g(bArr.length);
            strConcat = p10.c0.g0(m5Var).concat("...");
        }
        return b.c0.q(b.c0.v("<ByteString@", iE, hexString, " size=", " contents=\""), strConcat, "\">");
    }
}
