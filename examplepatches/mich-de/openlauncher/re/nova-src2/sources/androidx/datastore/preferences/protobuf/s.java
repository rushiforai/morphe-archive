package androidx.datastore.preferences.protobuf;

import java.util.Collections;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes.dex */
public final class s {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f14394c = 0;

    /* renamed from: a, reason: collision with root package name */
    public final b1 f14395a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f14396b;

    static {
        new s(0);
    }

    public s() {
        int i5 = b1.f14280f;
        this.f14395a = new b1();
    }

    public static void b(m mVar, v1 v1Var, int i5, Object obj) {
        if (v1Var == v1.f14408d) {
            mVar.A0(i5, 3);
            ((y) ((a) obj)).k(mVar);
            mVar.A0(i5, 4);
        }
        mVar.A0(i5, v1Var.f14412b);
        switch (v1Var.ordinal()) {
            case 0:
                mVar.u0(Double.doubleToRawLongBits(((Double) obj).doubleValue()));
                break;
            case 1:
                mVar.s0(Float.floatToRawIntBits(((Float) obj).floatValue()));
                break;
            case 2:
                mVar.E0(((Long) obj).longValue());
                break;
            case 3:
                mVar.E0(((Long) obj).longValue());
                break;
            case 4:
                mVar.w0(((Integer) obj).intValue());
                break;
            case 5:
                mVar.u0(((Long) obj).longValue());
                break;
            case 6:
                mVar.s0(((Integer) obj).intValue());
                break;
            case 7:
                mVar.m0(((Boolean) obj).booleanValue() ? (byte) 1 : (byte) 0);
                break;
            case 8:
                if (!(obj instanceof h)) {
                    mVar.z0((String) obj);
                    break;
                } else {
                    mVar.q0((h) obj);
                    break;
                }
            case 9:
                ((y) ((a) obj)).k(mVar);
                break;
            case 10:
                a aVar = (a) obj;
                mVar.getClass();
                mVar.C0(((y) aVar).a(null));
                ((y) aVar).k(mVar);
                break;
            case 11:
                if (!(obj instanceof h)) {
                    byte[] bArr = (byte[]) obj;
                    int length = bArr.length;
                    mVar.C0(length);
                    mVar.n0(bArr, 0, length);
                    break;
                } else {
                    mVar.q0((h) obj);
                    break;
                }
            case 12:
                mVar.C0(((Integer) obj).intValue());
                break;
            case 13:
                mVar.w0(((Integer) obj).intValue());
                break;
            case 14:
                mVar.s0(((Integer) obj).intValue());
                break;
            case 15:
                mVar.u0(((Long) obj).longValue());
                break;
            case 16:
                int iIntValue = ((Integer) obj).intValue();
                mVar.C0((iIntValue >> 31) ^ (iIntValue << 1));
                break;
            case 17:
                long jLongValue = ((Long) obj).longValue();
                mVar.E0((jLongValue >> 63) ^ (jLongValue << 1));
                break;
        }
    }

    public final void a() {
        if (this.f14396b) {
            return;
        }
        b1 b1Var = this.f14395a;
        int size = b1Var.f14281a.size();
        for (int i5 = 0; i5 < size; i5++) {
            Map.Entry entryC = b1Var.c(i5);
            if (entryC.getValue() instanceof y) {
                y yVar = (y) entryC.getValue();
                yVar.getClass();
                w0 w0Var = w0.f14415c;
                w0Var.getClass();
                w0Var.a(yVar.getClass()).b(yVar);
                yVar.g();
            }
        }
        if (!b1Var.f14283c) {
            if (b1Var.f14281a.size() > 0) {
                b1Var.c(0).getKey().getClass();
                throw new ClassCastException();
            }
            Iterator it = b1Var.d().iterator();
            if (it.hasNext()) {
                ((Map.Entry) it.next()).getKey().getClass();
                throw new ClassCastException();
            }
        }
        if (!b1Var.f14283c) {
            b1Var.f14282b = b1Var.f14282b.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(b1Var.f14282b);
            b1Var.f14285e = b1Var.f14285e.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(b1Var.f14285e);
            b1Var.f14283c = true;
        }
        this.f14396b = true;
    }

    public final Object clone() {
        s sVar = new s();
        b1 b1Var = this.f14395a;
        if (b1Var.f14281a.size() > 0) {
            Map.Entry entryC = b1Var.c(0);
            b.c0.y(entryC.getKey());
            entryC.getValue();
            throw null;
        }
        Iterator it = b1Var.d().iterator();
        if (!it.hasNext()) {
            return sVar;
        }
        Map.Entry entry = (Map.Entry) it.next();
        b.c0.y(entry.getKey());
        entry.getValue();
        throw null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof s) {
            return this.f14395a.equals(((s) obj).f14395a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f14395a.hashCode();
    }

    public s(int i5) {
        int i11 = b1.f14280f;
        this.f14395a = new b1();
        a();
        a();
    }
}
