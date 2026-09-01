package defpackage;

import androidx.datastore.preferences.protobuf.a;
import androidx.datastore.preferences.protobuf.e;
import j$.util.DesugarCollections;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ag4 {
    public static final /* synthetic */ int c = 0;
    public final ogc a = ogc.g();
    public boolean b;

    static {
        new ag4(0);
    }

    public ag4(int i) {
        a();
        a();
    }

    public static void b(zp1 zp1Var, l6f l6fVar, int i, Object obj) {
        if (l6fVar == l6f.GROUP) {
            zp1Var.B(i, 3);
            ((a) obj).b(zp1Var);
            zp1Var.B(i, 4);
        }
        zp1Var.B(i, l6fVar.getWireType());
        switch (xf4.b[l6fVar.ordinal()]) {
            case 1:
                zp1Var.u(Double.doubleToRawLongBits(((Double) obj).doubleValue()));
                break;
            case 2:
                zp1Var.s(Float.floatToRawIntBits(((Float) obj).floatValue()));
                break;
            case 3:
                zp1Var.F(((Long) obj).longValue());
                break;
            case 4:
                zp1Var.F(((Long) obj).longValue());
                break;
            case 5:
                zp1Var.w(((Integer) obj).intValue());
                break;
            case 6:
                zp1Var.u(((Long) obj).longValue());
                break;
            case 7:
                zp1Var.s(((Integer) obj).intValue());
                break;
            case 8:
                zp1Var.m(((Boolean) obj).booleanValue() ? (byte) 1 : (byte) 0);
                break;
            case 9:
                ((a) obj).b(zp1Var);
                break;
            case 10:
                a aVar = (a) obj;
                zp1Var.D(((e) aVar).a(null));
                aVar.b(zp1Var);
                break;
            case 11:
                if (!(obj instanceof d21)) {
                    zp1Var.A((String) obj);
                } else {
                    zp1Var.q((d21) obj);
                }
                break;
            case 12:
                if (!(obj instanceof d21)) {
                    byte[] bArr = (byte[]) obj;
                    int length = bArr.length;
                    zp1Var.D(length);
                    zp1Var.n(bArr, 0, length);
                } else {
                    zp1Var.q((d21) obj);
                }
                break;
            case 13:
                zp1Var.D(((Integer) obj).intValue());
                break;
            case 14:
                zp1Var.s(((Integer) obj).intValue());
                break;
            case 15:
                zp1Var.u(((Long) obj).longValue());
                break;
            case 16:
                int iIntValue = ((Integer) obj).intValue();
                zp1Var.D((iIntValue >> 31) ^ (iIntValue << 1));
                break;
            case 17:
                long jLongValue = ((Long) obj).longValue();
                zp1Var.F((jLongValue >> 63) ^ (jLongValue << 1));
                break;
            case 18:
                zp1Var.w(((Integer) obj).intValue());
                break;
        }
    }

    public final void a() {
        if (this.b) {
            return;
        }
        ogc ogcVar = this.a;
        int size = ogcVar.a.size();
        for (int i = 0; i < size; i++) {
            Map.Entry entryC = ogcVar.c(i);
            if (entryC.getValue() instanceof e) {
                e eVar = (e) entryC.getValue();
                eVar.getClass();
                u7a u7aVar = u7a.c;
                u7aVar.getClass();
                u7aVar.a(eVar.getClass()).b(eVar);
                eVar.h();
            }
        }
        if (!ogcVar.c) {
            if (ogcVar.a.size() > 0) {
                ogcVar.c(0).getKey().getClass();
                rd6.m();
                return;
            } else {
                Iterator it2 = ogcVar.d().iterator();
                if (it2.hasNext()) {
                    ((Map.Entry) it2.next()).getKey().getClass();
                    rd6.m();
                    return;
                }
            }
        }
        if (!ogcVar.c) {
            ogcVar.b = ogcVar.b.isEmpty() ? Collections.EMPTY_MAP : DesugarCollections.unmodifiableMap(ogcVar.b);
            ogcVar.e = ogcVar.e.isEmpty() ? Collections.EMPTY_MAP : DesugarCollections.unmodifiableMap(ogcVar.e);
            ogcVar.c = true;
        }
        this.b = true;
    }

    public final Object clone() {
        ag4 ag4Var = new ag4();
        ogc ogcVar = this.a;
        if (ogcVar.a.size() > 0) {
            Map.Entry entryC = ogcVar.c(0);
            if (entryC.getKey() != null) {
                rd6.m();
                return null;
            }
            entryC.getValue();
            throw null;
        }
        Iterator it2 = ogcVar.d().iterator();
        if (!it2.hasNext()) {
            return ag4Var;
        }
        Map.Entry entry = (Map.Entry) it2.next();
        if (entry.getKey() != null) {
            rd6.m();
            return null;
        }
        entry.getValue();
        throw null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ag4) {
            return this.a.equals(((ag4) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public ag4() {
    }
}
