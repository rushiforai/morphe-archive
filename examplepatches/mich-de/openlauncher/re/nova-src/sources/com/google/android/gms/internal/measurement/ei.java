package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class ei {

    /* renamed from: d, reason: collision with root package name */
    public static final long f32514d;

    /* renamed from: e, reason: collision with root package name */
    public static final ei f32515e;

    /* renamed from: a, reason: collision with root package name */
    public final int f32516a;

    /* renamed from: b, reason: collision with root package name */
    public final int f32517b;

    /* renamed from: c, reason: collision with root package name */
    public final int f32518c;

    static {
        long jCharAt = 0;
        for (int i5 = 0; i5 < 7; i5++) {
            jCharAt |= (i5 + 1) << ((int) ((" #(+,-0".charAt(i5) - ' ') * 3));
        }
        f32514d = jCharAt;
        f32515e = new ei(0, -1, -1);
    }

    public ei(int i5, int i11, int i12) {
        this.f32516a = i5;
        this.f32517b = i11;
        this.f32518c = i12;
    }

    public static int e(int i5, int i11, String str) {
        if (i5 == i11) {
            throw zzabo.b(i5 - 1, "missing precision", str);
        }
        int i12 = 0;
        for (int i13 = i5; i13 < i11; i13++) {
            char cCharAt = (char) (str.charAt(i13) - '0');
            if (cCharAt >= '\n') {
                throw zzabo.b(i13, "invalid precision character", str);
            }
            i12 = (i12 * 10) + cCharAt;
            if (i12 > 999999) {
                throw zzabo.a(i5, i11, "precision too large", str);
            }
        }
        if (i12 != 0) {
            return i12;
        }
        if (i11 == i5 + 1) {
            return 0;
        }
        throw zzabo.a(i5, i11, "invalid precision", str);
    }

    public final boolean a() {
        return this == f32515e;
    }

    public final boolean b(int i5, boolean z11) {
        int i11;
        if (a()) {
            return true;
        }
        int i12 = ~i5;
        int i13 = this.f32516a;
        if ((i12 & i13) != 0) {
            return false;
        }
        if ((!z11 && this.f32518c != -1) || (i13 & 9) == 9 || (i11 = i13 & 96) == 96) {
            return false;
        }
        return i11 == 0 || this.f32517b != -1;
    }

    public final boolean c() {
        return (this.f32516a & 128) != 0;
    }

    public final void d(StringBuilder sb2) {
        if (a()) {
            return;
        }
        int i5 = 0;
        while (true) {
            int i11 = this.f32516a & (-129);
            int i12 = 1 << i5;
            if (i12 > i11) {
                break;
            }
            if ((i11 & i12) != 0) {
                sb2.append(" #(+,-0".charAt(i5));
            }
            i5++;
        }
        int i13 = this.f32517b;
        if (i13 != -1) {
            sb2.append(i13);
        }
        int i14 = this.f32518c;
        if (i14 != -1) {
            sb2.append('.');
            sb2.append(i14);
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof ei) {
            ei eiVar = (ei) obj;
            if (eiVar.f32516a == this.f32516a && eiVar.f32517b == this.f32517b && eiVar.f32518c == this.f32518c) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return (((this.f32516a * 31) + this.f32517b) * 31) + this.f32518c;
    }
}
