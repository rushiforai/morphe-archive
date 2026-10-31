package com.google.android.gms.internal.measurement;

import java.util.Collections;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes3.dex */
public final class g1 {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f32551c = 0;

    /* renamed from: a, reason: collision with root package name */
    public final v2 f32552a = new v2();

    /* renamed from: b, reason: collision with root package name */
    public boolean f32553b;

    static {
        new g1(0);
    }

    public g1() {
    }

    public static void b(c1 c1Var, g3 g3Var, int i5, Object obj) {
        if (g3Var == g3.f32556d) {
            c1Var.r(i5, 3);
            ((o1) ((n0) obj)).f(c1Var);
            c1Var.r(i5, 4);
            return;
        }
        c1Var.r(i5, g3Var.f32560b);
        h3 h3Var = h3.f32592a;
        switch (g3Var.ordinal()) {
            case 0:
                c1Var.I(Double.doubleToRawLongBits(((Double) obj).doubleValue()));
                break;
            case 1:
                c1Var.G(Float.floatToRawIntBits(((Float) obj).floatValue()));
                break;
            case 2:
                c1Var.H(((Long) obj).longValue());
                break;
            case 3:
                c1Var.H(((Long) obj).longValue());
                break;
            case 4:
                c1Var.E(((Integer) obj).intValue());
                break;
            case 5:
                c1Var.I(((Long) obj).longValue());
                break;
            case 6:
                c1Var.G(((Integer) obj).intValue());
                break;
            case 7:
                c1Var.D(((Boolean) obj).booleanValue() ? (byte) 1 : (byte) 0);
                break;
            case 8:
                if (!(obj instanceof v0)) {
                    c1Var.J((String) obj);
                    break;
                } else {
                    c1Var.A((v0) obj);
                    break;
                }
            case 9:
                ((o1) ((n0) obj)).f(c1Var);
                break;
            case 10:
                c1Var.C((n0) obj);
                break;
            case 11:
                if (!(obj instanceof v0)) {
                    byte[] bArr = (byte[]) obj;
                    c1Var.B(bArr.length, bArr);
                    break;
                } else {
                    c1Var.A((v0) obj);
                    break;
                }
            case 12:
                c1Var.F(((Integer) obj).intValue());
                break;
            case 13:
                if (!(obj instanceof q1)) {
                    c1Var.E(((Integer) obj).intValue());
                    break;
                } else {
                    c1Var.E(((q1) obj).zza());
                    break;
                }
            case 14:
                c1Var.G(((Integer) obj).intValue());
                break;
            case 15:
                c1Var.I(((Long) obj).longValue());
                break;
            case 16:
                int iIntValue = ((Integer) obj).intValue();
                c1Var.F((iIntValue >> 31) ^ (iIntValue + iIntValue));
                break;
            case 17:
                long jLongValue = ((Long) obj).longValue();
                c1Var.H((jLongValue >> 63) ^ (jLongValue + jLongValue));
                break;
        }
    }

    public final void a() {
        if (this.f32553b) {
            return;
        }
        v2 v2Var = this.f32552a;
        int i5 = v2Var.f33126b;
        for (int i11 = 0; i11 < i5; i11++) {
            Object obj = v2Var.a(i11).f33178b;
            if (obj instanceof o1) {
                ((o1) obj).j();
            }
        }
        Iterator it = v2Var.b().iterator();
        while (it.hasNext()) {
            Object value = ((Map.Entry) it.next()).getValue();
            if (value instanceof o1) {
                ((o1) value).j();
            }
        }
        if (!v2Var.f33128d) {
            if (v2Var.f33126b > 0) {
                throw null;
            }
            Iterator it2 = v2Var.b().iterator();
            if (it2.hasNext()) {
                ((Map.Entry) it2.next()).getKey().getClass();
                throw new ClassCastException();
            }
        }
        if (!v2Var.f33128d) {
            v2Var.f33127c = v2Var.f33127c.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(v2Var.f33127c);
            v2Var.f33130f = v2Var.f33130f.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(v2Var.f33130f);
            v2Var.f33128d = true;
        }
        this.f32553b = true;
    }

    public final Object clone() {
        g1 g1Var = new g1();
        v2 v2Var = this.f32552a;
        if (v2Var.f33126b > 0) {
            throw null;
        }
        Iterator it = v2Var.b().iterator();
        if (!it.hasNext()) {
            return g1Var;
        }
        Map.Entry entry = (Map.Entry) it.next();
        if (entry.getKey() != null) {
            throw new ClassCastException();
        }
        entry.getValue();
        throw null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof g1) {
            return this.f32552a.equals(((g1) obj).f32552a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f32552a.hashCode();
    }

    public g1(int i5) {
        a();
        a();
    }
}
