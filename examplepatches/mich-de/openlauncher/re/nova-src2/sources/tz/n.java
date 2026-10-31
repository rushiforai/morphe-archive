package tz;

import b.c0;
import java.util.ArrayList;
import java.util.Arrays;
import kotlin.UInt;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.ranges.IntRange;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@JvmInline
@Serializable
@SourceDebugExtension
/* loaded from: classes.dex */
public final class n {
    public static final long A;
    public static final long B;
    public static final long C;

    @NotNull
    public static final m Companion;
    public static final long D;
    public static final long E;
    public static final long F;
    public static final long G;
    public static final long H;
    public static final long I;
    public static final long J;
    public static final long K;
    public static final long L;
    public static final long M;
    public static final long N;
    public static final ArrayList O;

    /* renamed from: b, reason: collision with root package name */
    public static final long f90140b;

    /* renamed from: c, reason: collision with root package name */
    public static final long f90141c;

    /* renamed from: d, reason: collision with root package name */
    public static final long f90142d;

    /* renamed from: e, reason: collision with root package name */
    public static final long f90143e;

    /* renamed from: f, reason: collision with root package name */
    public static final long f90144f;

    /* renamed from: g, reason: collision with root package name */
    public static final long f90145g;

    /* renamed from: h, reason: collision with root package name */
    public static final long f90146h;

    /* renamed from: i, reason: collision with root package name */
    public static final long f90147i;

    /* renamed from: j, reason: collision with root package name */
    public static final long f90148j;

    /* renamed from: k, reason: collision with root package name */
    public static final long f90149k;

    /* renamed from: l, reason: collision with root package name */
    public static final long f90150l;

    /* renamed from: m, reason: collision with root package name */
    public static final long f90151m;
    public static final long n;
    public static final long o;

    /* renamed from: p, reason: collision with root package name */
    public static final long f90152p;

    /* renamed from: q, reason: collision with root package name */
    public static final long f90153q;

    /* renamed from: r, reason: collision with root package name */
    public static final long f90154r;

    /* renamed from: s, reason: collision with root package name */
    public static final long f90155s;

    /* renamed from: t, reason: collision with root package name */
    public static final long f90156t;

    /* renamed from: u, reason: collision with root package name */
    public static final long f90157u;

    /* renamed from: v, reason: collision with root package name */
    public static final long f90158v;

    /* renamed from: w, reason: collision with root package name */
    public static final long f90159w;

    /* renamed from: x, reason: collision with root package name */
    public static final long f90160x;

    /* renamed from: y, reason: collision with root package name */
    public static final long f90161y;

    /* renamed from: z, reason: collision with root package name */
    public static final long f90162z;

    /* renamed from: a, reason: collision with root package name */
    public final long f90163a;

    static {
        m mVar = new m();
        Companion = mVar;
        new IntRange(0, 72, 1);
        f90140b = m.c(4, 0, 0);
        f90141c = m.c(4, 1, 0);
        f90142d = m.c(4, 2, 0);
        f90143e = m.b(mVar, 0);
        f90144f = m.b(mVar, 1);
        f90145g = m.b(mVar, 2);
        f90146h = m.b(mVar, 3);
        f90147i = m.b(mVar, 4);
        f90148j = m.b(mVar, 5);
        f90149k = m.b(mVar, 6);
        f90150l = m.b(mVar, 7);
        f90151m = m.b(mVar, 8);
        n = m.b(mVar, 9);
        o = m.b(mVar, 10);
        f90152p = m.b(mVar, 11);
        f90153q = m.b(mVar, 12);
        f90154r = m.b(mVar, 13);
        f90155s = m.b(mVar, 14);
        f90156t = m.b(mVar, 15);
        f90157u = m.b(mVar, 16);
        f90158v = m.b(mVar, 17);
        f90159w = m.b(mVar, 18);
        f90160x = m.b(mVar, 19);
        f90161y = m.b(mVar, 20);
        f90162z = m.b(mVar, 21);
        A = m.b(mVar, 22);
        B = m.b(mVar, 23);
        C = m.b(mVar, 24);
        D = m.b(mVar, 25);
        E = m.b(mVar, 26);
        F = m.b(mVar, 27);
        G = m.b(mVar, 28);
        H = m.b(mVar, 29);
        I = m.b(mVar, 30);
        J = m.b(mVar, 31);
        K = m.b(mVar, 32);
        L = m.b(mVar, 33);
        M = m.b(mVar, 34);
        N = m.b(mVar, 35);
        ArrayList arrayList = new ArrayList(8);
        for (int i5 = 0; i5 < 8; i5++) {
            Companion.getClass();
            arrayList.add(new n(m.c(2, i5, 0)));
        }
        O = arrayList;
    }

    public /* synthetic */ n(long j11) {
        this.f90163a = j11;
    }

    public static final boolean a(long j11, long j12) {
        return j11 == j12;
    }

    public static final int b(long j11) {
        return (int) ((j11 & 4278190080L) >> 24);
    }

    public static final int c(long j11) {
        int i5 = (int) ((j11 >> 56) & 255);
        if (i5 != 0 && i5 != 5 && i5 != 6 && i5 != 7) {
            throw new IllegalStateException();
        }
        int i11 = (int) (j11 & 4294967295L);
        UInt.Companion companion = UInt.f71696b;
        return i11;
    }

    public static final int d(long j11, o oVar, int i5, int i11, int i12) {
        vz.a aVarA = vz.a.a(i11);
        switch ((int) ((j11 >> 56) & 255)) {
            case 0:
                return f(j11, oVar);
            case 1:
                int iF = f(j11, oVar);
                float f11 = i12;
                return Math.abs(((float) v4.a.n(iF)) - aVarA.f93390c) < f11 ? ul.b.p0(iF, f11, aVarA.f93390c) : iF;
            case 2:
                return g(i5, (int) (j11 & 16777215), aVarA, i12);
            case 3:
                return g(i5, (int) (j11 & 16777215), aVarA, i12);
            case 4:
                if ((a(j11, f90140b) ? new p70.a(50.0f, Float.MAX_VALUE) : a(j11, f90141c) ? new p70.a(42.0f, Float.MAX_VALUE) : a(j11, f90142d) ? new p70.a(58.0f, Float.MAX_VALUE) : new p70.a(50.0f, Float.MAX_VALUE)).d(Float.valueOf(aVarA.f93390c))) {
                    UInt.Companion companion = UInt.f71696b;
                    return -16777216;
                }
                UInt.Companion companion2 = UInt.f71696b;
                return -1;
            case 5:
                int i13 = (int) (j11 & 4294967295L);
                UInt.Companion companion3 = UInt.f71696b;
                float f12 = i12;
                return Math.abs(((float) v4.a.n(i13)) - aVarA.f93390c) < f12 ? ul.b.p0(i13, f12, aVarA.f93390c) : i13;
            case 6:
                int i14 = (int) (j11 & 4294967295L);
                UInt.Companion companion4 = UInt.f71696b;
                int i15 = (((int) (j11 >> 32)) & 16777215) | (i14 & (-16777216));
                return Math.abs(((float) v4.a.n(i14)) - aVarA.f93390c) >= Math.abs(((float) v4.a.n(i15)) - aVarA.f93390c) ? i14 : i15;
            case 7:
                int i16 = (int) (j11 & 4294967295L);
                UInt.Companion companion5 = UInt.f71696b;
                return Math.abs(((float) v4.a.n(i16)) - aVarA.f93390c) >= ((float) i12) ? i16 : (((int) (j11 >> 32)) & 16777215) | (i16 & (-16777216));
            default:
                return d(f90140b, oVar, i5, i11, 40);
        }
    }

    public static final c e(long j11) {
        int i5 = (int) ((j11 >> 56) & 255);
        if (i5 != 6 && i5 != 7) {
            return null;
        }
        UInt.Companion companion = UInt.f71696b;
        return new c(ul.b.o0(((int) (j11 >> 32)) & 16777215, b(j11)));
    }

    public static final int f(long j11, o oVar) {
        int i5 = (int) ((j11 >> 56) & 255);
        if (i5 == 0) {
            int i11 = (int) (j11 & 4294967295L);
            UInt.Companion companion = UInt.f71696b;
            return i11;
        }
        if (i5 != 1) {
            return ul.b.o0(-14979341, b(j11));
        }
        int i12 = (int) (16777215 & j11);
        return (i12 < 0 || i12 >= 36) ? ul.b.o0(-14979341, b(j11)) : ul.b.o0(((c) oVar.f90166a.get(i12)).f90097a, b(j11));
    }

    public static final int g(int i5, int i11, vz.a aVar, int i12) {
        int iE0 = kotlin.ranges.a.e0(i11, 0, 100);
        vz.a aVarA = vz.a.a(i5);
        boolean z11 = aVar.f93390c <= 50.0f;
        int iB = z11 ? -1 : -16777216;
        float f11 = 10.0f;
        if (z11) {
            iE0 = 8 - iE0;
        }
        float f12 = iE0 * 10.0f;
        while (true) {
            f12 += f11;
            if (0.0f > f12 || f12 > 100.0f) {
                break;
            }
            vz.a aVar2 = new vz.a(aVarA.f93388a, aVarA.f93389b, f12);
            if (Math.abs(aVar.f93390c - aVar2.f93390c) >= i12) {
                iB = aVar2.b();
                break;
            }
            f11 = z11 ? 10 : -10;
        }
        UInt.Companion companion = UInt.f71696b;
        return iB;
    }

    public static String h(long j11) {
        String strI;
        int i5 = (int) ((j11 >> 56) & 255);
        if (i5 == 0) {
            return String.format("#%08x", Arrays.copyOf(new Object[]{Long.valueOf(j11)}, 1));
        }
        switch (i5) {
            case 1:
                strI = c0.i((int) (j11 & 16777215), "Palette[", "]");
                break;
            case 2:
                strI = c0.i((int) (j11 & 16777215), "suitableForeground[", "]");
                break;
            case 3:
                strI = c0.i((int) (j11 & 16777215), "suitableAccent[", "]");
                break;
            case 4:
                if (!a(j11, f90142d)) {
                    if (!a(j11, f90141c)) {
                        if (!a(j11, f90140b)) {
                            strI = "BlackOrWhiteUnknown";
                            break;
                        } else {
                            strI = "BlackOrWhite";
                            break;
                        }
                    } else {
                        strI = "BlackOrWhitePreferBlack";
                        break;
                    }
                } else {
                    strI = "BlackOrWhitePreferWhite";
                    break;
                }
            case 5:
                strI = "AdjustTone";
                break;
            case 6:
                strI = "UseBest";
                break;
            case 7:
                strI = "PreferFirst";
                break;
            default:
                strI = String.format("Unknown(%02x)", Arrays.copyOf(new Object[]{Integer.valueOf(i5)}, 1));
                break;
        }
        return String.format(c0.E(strI, " (x%08x x%08x)"), Arrays.copyOf(new Object[]{Integer.valueOf((int) (j11 >> 32)), Integer.valueOf((int) (j11 & 4294967295L))}, 2));
    }

    public static final long i(int i5, long j11) {
        if (i5 < 0 || i5 >= 256) {
            throw new IllegalArgumentException();
        }
        return (j11 & (-4278190081L)) | (i5 << 24);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof n) {
            return this.f90163a == ((n) obj).f90163a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f90163a);
    }

    public final String toString() {
        return h(this.f90163a);
    }
}
