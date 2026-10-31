package com.google.android.gms.internal.consent_sdk;

import java.io.IOException;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes3.dex */
public final class s5 {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f32234c = 0;

    /* renamed from: a, reason: collision with root package name */
    public final v6 f32235a = new v6();

    /* renamed from: b, reason: collision with root package name */
    public boolean f32236b;

    static {
        new s5(0);
    }

    public s5() {
    }

    public static void b(o5 o5Var, h7 h7Var, int i5, Object obj) throws IOException {
        if (h7Var == h7.f32092e) {
            o5Var.n0(i5, 3);
            ((i5) obj).a(o5Var);
            o5Var.n0(i5, 4);
            return;
        }
        o5Var.n0(i5, h7Var.f32095b);
        i7 i7Var = i7.f32101a;
        switch (h7Var.ordinal()) {
            case 0:
                o5Var.j0(Double.doubleToRawLongBits(((Double) obj).doubleValue()));
                break;
            case 1:
                o5Var.h0(Float.floatToRawIntBits(((Float) obj).floatValue()));
                break;
            case 2:
                o5Var.r0(((Long) obj).longValue());
                break;
            case 3:
                o5Var.r0(((Long) obj).longValue());
                break;
            case 4:
                o5Var.l0(((Integer) obj).intValue());
                break;
            case 5:
                o5Var.j0(((Long) obj).longValue());
                break;
            case 6:
                o5Var.h0(((Integer) obj).intValue());
                break;
            case 7:
                byte bBooleanValue = ((Boolean) obj).booleanValue();
                if (o5Var.f32202g == o5Var.f32201f) {
                    o5Var.Y();
                }
                byte[] bArr = o5Var.f32200e;
                int i11 = o5Var.f32202g;
                bArr[i11] = bBooleanValue;
                o5Var.f32202g = i11 + 1;
                break;
            case 8:
                if (!(obj instanceof n5)) {
                    o5Var.m0((String) obj);
                    break;
                } else {
                    o5Var.f0((n5) obj);
                    break;
                }
            case 9:
                ((i5) obj).a(o5Var);
                break;
            case 10:
                i5 i5Var = (i5) obj;
                o5Var.p0(i5Var.c());
                i5Var.a(o5Var);
                break;
            case 11:
                if (!(obj instanceof n5)) {
                    byte[] bArr2 = (byte[]) obj;
                    int length = bArr2.length;
                    o5Var.p0(length);
                    o5Var.s0(length, bArr2);
                    break;
                } else {
                    o5Var.f0((n5) obj);
                    break;
                }
            case 12:
                o5Var.p0(((Integer) obj).intValue());
                break;
            case 13:
                o5Var.l0(((Integer) obj).intValue());
                break;
            case 14:
                o5Var.h0(((Integer) obj).intValue());
                break;
            case 15:
                o5Var.j0(((Long) obj).longValue());
                break;
            case 16:
                int iIntValue = ((Integer) obj).intValue();
                o5Var.p0((iIntValue >> 31) ^ (iIntValue + iIntValue));
                break;
            case 17:
                long jLongValue = ((Long) obj).longValue();
                o5Var.r0((jLongValue >> 63) ^ (jLongValue + jLongValue));
                break;
        }
    }

    public final void a() {
        if (this.f32236b) {
            return;
        }
        v6 v6Var = this.f32235a;
        int i5 = v6Var.f32272b;
        for (int i11 = 0; i11 < i5; i11++) {
            Object obj = v6Var.c(i11).f32284b;
            if (obj instanceof x5) {
                ((x5) obj).j();
            }
        }
        Iterator it = v6Var.a().iterator();
        while (it.hasNext()) {
            Object value = ((Map.Entry) it.next()).getValue();
            if (value instanceof x5) {
                ((x5) value).j();
            }
        }
        if (!v6Var.f32274d) {
            if (v6Var.f32272b > 0) {
                throw null;
            }
            Iterator it2 = v6Var.a().iterator();
            if (it2.hasNext()) {
                ((Map.Entry) it2.next()).getKey().getClass();
                throw new ClassCastException();
            }
        }
        if (!v6Var.f32274d) {
            v6Var.f32273c = v6Var.f32273c.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(v6Var.f32273c);
            v6Var.f32276f = v6Var.f32276f.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(v6Var.f32276f);
            v6Var.f32274d = true;
        }
        this.f32236b = true;
    }

    public final Object clone() {
        s5 s5Var = new s5();
        v6 v6Var = this.f32235a;
        if (v6Var.f32272b > 0) {
            throw null;
        }
        Iterator it = v6Var.a().iterator();
        if (!it.hasNext()) {
            return s5Var;
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
        if (obj instanceof s5) {
            return this.f32235a.equals(((s5) obj).f32235a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f32235a.hashCode();
    }

    public s5(int i5) {
        a();
        a();
    }
}
