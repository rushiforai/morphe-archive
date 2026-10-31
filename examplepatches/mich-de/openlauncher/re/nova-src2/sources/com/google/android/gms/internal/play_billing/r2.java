package com.google.android.gms.internal.play_billing;

import java.util.Collections;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes3.dex */
public final class r2 {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f33500c = 0;

    /* renamed from: a, reason: collision with root package name */
    public final z3 f33501a = new z3();

    /* renamed from: b, reason: collision with root package name */
    public boolean f33502b;

    static {
        new r2(0);
    }

    public r2() {
    }

    public static void b(n2 n2Var, o4 o4Var, int i5, Object obj) throws zzfa {
        if (o4Var == o4.f33470d) {
            n2Var.y0(i5, 3);
            ((g2) obj).a(n2Var);
            n2Var.y0(i5, 4);
            return;
        }
        n2Var.y0(i5, o4Var.f33474b);
        p4 p4Var = p4.f33481a;
        switch (o4Var.ordinal()) {
            case 0:
                n2Var.u0(Double.doubleToRawLongBits(((Double) obj).doubleValue()));
                break;
            case 1:
                n2Var.s0(Float.floatToRawIntBits(((Float) obj).floatValue()));
                break;
            case 2:
                n2Var.C0(((Long) obj).longValue());
                break;
            case 3:
                n2Var.C0(((Long) obj).longValue());
                break;
            case 4:
                n2Var.w0(((Integer) obj).intValue());
                break;
            case 5:
                n2Var.u0(((Long) obj).longValue());
                break;
            case 6:
                n2Var.s0(((Integer) obj).intValue());
                break;
            case 7:
                n2Var.o0(((Boolean) obj).booleanValue() ? (byte) 1 : (byte) 0);
                break;
            case 8:
                if (!(obj instanceof l2)) {
                    n2Var.x0((String) obj);
                    break;
                } else {
                    l2 l2Var = (l2) obj;
                    n2Var.A0(l2Var.f());
                    l2Var.h(n2Var);
                    break;
                }
            case 9:
                ((g2) obj).a(n2Var);
                break;
            case 10:
                g2 g2Var = (g2) obj;
                n2Var.A0(g2Var.d());
                g2Var.a(n2Var);
                break;
            case 11:
                if (!(obj instanceof l2)) {
                    byte[] bArr = (byte[]) obj;
                    int length = bArr.length;
                    n2Var.A0(length);
                    n2Var.p0(0, length, bArr);
                    break;
                } else {
                    l2 l2Var2 = (l2) obj;
                    n2Var.A0(l2Var2.f());
                    l2Var2.h(n2Var);
                    break;
                }
            case 12:
                n2Var.A0(((Integer) obj).intValue());
                break;
            case 13:
                if (!(obj instanceof z2)) {
                    n2Var.w0(((Integer) obj).intValue());
                    break;
                } else {
                    n2Var.w0(((z2) obj).zza());
                    break;
                }
            case 14:
                n2Var.s0(((Integer) obj).intValue());
                break;
            case 15:
                n2Var.u0(((Long) obj).longValue());
                break;
            case 16:
                int iIntValue = ((Integer) obj).intValue();
                n2Var.A0((iIntValue >> 31) ^ (iIntValue + iIntValue));
                break;
            case 17:
                long jLongValue = ((Long) obj).longValue();
                n2Var.C0((jLongValue >> 63) ^ (jLongValue + jLongValue));
                break;
        }
    }

    public final void a() {
        if (this.f33502b) {
            return;
        }
        z3 z3Var = this.f33501a;
        int i5 = z3Var.f33666b;
        for (int i11 = 0; i11 < i5; i11++) {
            Object obj = z3Var.c(i11).f33354b;
            if (obj instanceof x2) {
                ((x2) obj).p();
            }
        }
        Iterator it = z3Var.a().iterator();
        while (it.hasNext()) {
            Object value = ((Map.Entry) it.next()).getValue();
            if (value instanceof x2) {
                ((x2) value).p();
            }
        }
        if (!z3Var.f33668d) {
            if (z3Var.f33666b > 0) {
                throw null;
            }
            Iterator it2 = z3Var.a().iterator();
            if (it2.hasNext()) {
                ((Map.Entry) it2.next()).getKey().getClass();
                throw new ClassCastException();
            }
        }
        if (!z3Var.f33668d) {
            z3Var.f33667c = z3Var.f33667c.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(z3Var.f33667c);
            z3Var.f33670f = z3Var.f33670f.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(z3Var.f33670f);
            z3Var.f33668d = true;
        }
        this.f33502b = true;
    }

    public final Object clone() {
        r2 r2Var = new r2();
        z3 z3Var = this.f33501a;
        if (z3Var.f33666b > 0) {
            throw null;
        }
        Iterator it = z3Var.a().iterator();
        if (!it.hasNext()) {
            return r2Var;
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
        if (obj instanceof r2) {
            return this.f33501a.equals(((r2) obj).f33501a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f33501a.hashCode();
    }

    public r2(int i5) {
        a();
        a();
    }
}
