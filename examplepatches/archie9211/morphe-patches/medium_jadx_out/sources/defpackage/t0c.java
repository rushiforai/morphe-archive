package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t0c {
    public static final s0c Companion = new s0c();
    public static final vq6[] d = {null, null, vx0.d0(yw6.PUBLICATION, new lg9(25))};
    public final y0c a;
    public final zld b;
    public final Map c;

    public /* synthetic */ t0c(int i, y0c y0cVar, zld zldVar, Map map) {
        if (1 != (i & 1)) {
            iq7.S(i, 1, r0c.a.a());
            throw null;
        }
        this.a = y0cVar;
        if ((i & 2) == 0) {
            this.b = null;
        } else {
            this.b = zldVar;
        }
        if ((i & 4) == 0) {
            this.c = null;
        } else {
            this.c = map;
        }
    }

    public static t0c a(t0c t0cVar, y0c y0cVar, zld zldVar, Map map, int i) {
        if ((i & 1) != 0) {
            y0cVar = t0cVar.a;
        }
        if ((i & 2) != 0) {
            zldVar = t0cVar.b;
        }
        if ((i & 4) != 0) {
            map = t0cVar.c;
        }
        t0cVar.getClass();
        y0cVar.getClass();
        return new t0c(y0cVar, zldVar, map);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t0c)) {
            return false;
        }
        t0c t0cVar = (t0c) obj;
        return g76.L(this.a, t0cVar.a) && g76.L(this.b, t0cVar.b) && g76.L(this.c, t0cVar.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        zld zldVar = this.b;
        int iHashCode2 = (iHashCode + (zldVar == null ? 0 : zldVar.hashCode())) * 31;
        Map map = this.c;
        return iHashCode2 + (map != null ? map.hashCode() : 0);
    }

    public final String toString() {
        return "SessionData(sessionDetails=" + this.a + ", backgroundTime=" + this.b + ", processDataMap=" + this.c + ')';
    }

    public t0c(y0c y0cVar, zld zldVar, Map map) {
        y0cVar.getClass();
        this.a = y0cVar;
        this.b = zldVar;
        this.c = map;
    }
}
