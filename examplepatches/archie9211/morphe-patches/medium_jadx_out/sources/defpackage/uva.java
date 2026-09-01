package defpackage;

import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uva implements jre {
    public long a;
    public long b;
    public final Object c;
    public final Object d;

    public uva(f33 f33Var, long j) {
        this.d = f33Var;
        this.c = new LinkedHashMap(0, 0.75f, true);
        this.a = j;
        if (j > 0) {
            return;
        }
        ay0.e("maxSize <= 0");
        throw null;
    }

    public void a(Object obj, Object obj2, tva tvaVar) {
        tva tvaVar2 = (tva) obj2;
        ((ad) ((f33) this.d).b).w((cx7) obj, tvaVar2.a, tvaVar2.b, tvaVar2.c);
    }

    @Override // defpackage.jre
    public boolean b() {
        return true;
    }

    public long c() {
        long j = this.b;
        if (j != -1) {
            return j;
        }
        long jF = 0;
        for (Map.Entry entry : ((LinkedHashMap) this.c).entrySet()) {
            jF += f(entry.getKey(), entry.getValue());
        }
        this.b = jF;
        return jF;
    }

    public long d(long j) {
        long j2 = this.b;
        if (j + j2 <= 0) {
            return 0L;
        }
        long j3 = j + j2;
        long j4 = this.a;
        long j5 = j3 / j4;
        if (((v4b) this.d) != v4b.Restart && j5 % 2 != 0) {
            return ((j5 + 1) * j4) - j3;
        }
        Long.signum(j5);
        return j3 - (j5 * j4);
    }

    public dx e(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        long j2 = this.b;
        long j3 = j + j2;
        long j4 = this.a;
        return j3 > j4 ? ((lre) this.c).j(j4 - j2, dxVar, dxVar3, dxVar2) : dxVar2;
    }

    public long f(Object obj, Object obj2) throws Exception {
        try {
            long j = ((tva) obj2).c;
            if (j >= 0) {
                return j;
            }
            throw new IllegalStateException(("sizeOf(" + obj + ", " + obj2 + ") returned a negative value: " + j).toString());
        } catch (Exception e) {
            this.b = -1L;
            throw e;
        }
    }

    public void g(long j) {
        LinkedHashMap linkedHashMap = (LinkedHashMap) this.c;
        while (c() > j) {
            if (linkedHashMap.isEmpty()) {
                if (c() == 0) {
                    return;
                }
                ygf.f("sizeOf() is returning inconsistent values");
                return;
            } else {
                Map.Entry entry = (Map.Entry) bu1.w0(linkedHashMap.entrySet());
                Object key = entry.getKey();
                Object value = entry.getValue();
                linkedHashMap.remove(key);
                this.b = c() - f(key, value);
                a(key, value, null);
            }
        }
    }

    @Override // defpackage.jre
    public dx j(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        return ((lre) this.c).j(d(j), dxVar, dxVar2, e(j, dxVar, dxVar3, dxVar2));
    }

    @Override // defpackage.jre
    public dx r(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        return ((lre) this.c).r(d(j), dxVar, dxVar2, e(j, dxVar, dxVar3, dxVar2));
    }

    @Override // defpackage.jre
    public dx s(dx dxVar, dx dxVar2, dx dxVar3) {
        return j(Long.MAX_VALUE, dxVar, dxVar2, dxVar3);
    }

    @Override // defpackage.jre
    public long t(dx dxVar, dx dxVar2, dx dxVar3) {
        return Long.MAX_VALUE;
    }

    public uva(lre lreVar, v4b v4bVar, long j) {
        this.c = lreVar;
        this.d = v4bVar;
        this.a = ((long) (lreVar.q() + lreVar.m())) * 1000000;
        this.b = j * 1000000;
    }
}
