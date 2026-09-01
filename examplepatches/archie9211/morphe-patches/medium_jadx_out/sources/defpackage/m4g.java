package defpackage;

import com.google.android.gms.internal.play_billing.zzfm;
import j$.util.DesugarCollections;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m4g {
    public static final /* synthetic */ int c = 0;
    public final h8g a = new h8g();
    public boolean b;

    static {
        new m4g(0);
    }

    public m4g(int i) {
        a();
        a();
    }

    public static void b(c4g c4gVar, nag nagVar, int i, Object obj) throws zzfm {
        if (nagVar == nag.zzj) {
            c4gVar.k(i, 3);
            ((d3g) obj).a(c4gVar);
            c4gVar.k(i, 4);
            return;
        }
        c4gVar.k(i, nagVar.zza());
        pag pagVar = pag.zza;
        switch (nagVar.ordinal()) {
            case 0:
                c4gVar.g(Double.doubleToRawLongBits(((Double) obj).doubleValue()));
                break;
            case 1:
                c4gVar.e(Float.floatToRawIntBits(((Float) obj).floatValue()));
                break;
            case 2:
                c4gVar.o(((Long) obj).longValue());
                break;
            case 3:
                c4gVar.o(((Long) obj).longValue());
                break;
            case 4:
                c4gVar.i(((Integer) obj).intValue());
                break;
            case 5:
                c4gVar.g(((Long) obj).longValue());
                break;
            case 6:
                c4gVar.e(((Integer) obj).intValue());
                break;
            case 7:
                c4gVar.b(((Boolean) obj).booleanValue() ? (byte) 1 : (byte) 0);
                break;
            case 8:
                if (!(obj instanceof t3g)) {
                    c4gVar.j((String) obj);
                } else {
                    t3g t3gVar = (t3g) obj;
                    c4gVar.m(t3gVar.f());
                    t3gVar.q(c4gVar);
                }
                break;
            case 9:
                ((d3g) obj).a(c4gVar);
                break;
            case 10:
                d3g d3gVar = (d3g) obj;
                c4gVar.m(d3gVar.d());
                d3gVar.a(c4gVar);
                break;
            case 11:
                if (!(obj instanceof t3g)) {
                    byte[] bArr = (byte[]) obj;
                    int length = bArr.length;
                    c4gVar.m(length);
                    c4gVar.c(bArr, 0, length);
                } else {
                    t3g t3gVar2 = (t3g) obj;
                    c4gVar.m(t3gVar2.f());
                    t3gVar2.q(c4gVar);
                }
                break;
            case 12:
                c4gVar.m(((Integer) obj).intValue());
                break;
            case 13:
                if (!(obj instanceof k5g)) {
                    c4gVar.i(((Integer) obj).intValue());
                } else {
                    c4gVar.i(((k5g) obj).zza());
                }
                break;
            case 14:
                c4gVar.e(((Integer) obj).intValue());
                break;
            case 15:
                c4gVar.g(((Long) obj).longValue());
                break;
            case 16:
                int iIntValue = ((Integer) obj).intValue();
                c4gVar.m((iIntValue >> 31) ^ (iIntValue + iIntValue));
                break;
            case 17:
                long jLongValue = ((Long) obj).longValue();
                c4gVar.o((jLongValue >> 63) ^ (jLongValue + jLongValue));
                break;
        }
    }

    public final void a() {
        if (this.b) {
            return;
        }
        h8g h8gVar = this.a;
        int i = h8gVar.b;
        for (int i2 = 0; i2 < i; i2++) {
            Object obj = h8gVar.c(i2).b;
            if (obj instanceof h5g) {
                h5g h5gVar = (h5g) obj;
                w7g.c.a(h5gVar.getClass()).b(h5gVar);
                h5gVar.e();
            }
        }
        Iterator it2 = h8gVar.a().iterator();
        while (it2.hasNext()) {
            Object value = ((Map.Entry) it2.next()).getValue();
            if (value instanceof h5g) {
                h5g h5gVar2 = (h5g) value;
                w7g.c.a(h5gVar2.getClass()).b(h5gVar2);
                h5gVar2.e();
            }
        }
        if (!h8gVar.d) {
            if (h8gVar.b > 0) {
                h8gVar.c(0).a.getClass();
                rd6.m();
                return;
            } else {
                Iterator it3 = h8gVar.a().iterator();
                if (it3.hasNext()) {
                    ((Map.Entry) it3.next()).getKey().getClass();
                    rd6.m();
                    return;
                }
            }
        }
        if (!h8gVar.d) {
            h8gVar.c = h8gVar.c.isEmpty() ? Collections.EMPTY_MAP : DesugarCollections.unmodifiableMap(h8gVar.c);
            h8gVar.f = h8gVar.f.isEmpty() ? Collections.EMPTY_MAP : DesugarCollections.unmodifiableMap(h8gVar.f);
            h8gVar.d = true;
        }
        this.b = true;
    }

    public final Object clone() {
        m4g m4gVar = new m4g();
        h8g h8gVar = this.a;
        if (h8gVar.b > 0) {
            h8gVar.c(0).a.getClass();
            rd6.m();
            return null;
        }
        Iterator it2 = h8gVar.a().iterator();
        if (!it2.hasNext()) {
            return m4gVar;
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
        if (obj instanceof m4g) {
            return this.a.equals(((m4g) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public m4g() {
    }
}
