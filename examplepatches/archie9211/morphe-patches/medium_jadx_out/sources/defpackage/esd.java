package defpackage;

import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class esd {
    public final i94 a;
    public final pfc b;
    public final uj1 c;
    public final boolean d;
    public final Map e;

    public /* synthetic */ esd(i94 i94Var, pfc pfcVar, uj1 uj1Var, gp7 gp7Var, LinkedHashMap linkedHashMap, int i) {
        this((i & 1) != 0 ? null : i94Var, (i & 2) != 0 ? null : pfcVar, (i & 4) != 0 ? null : uj1Var, (i & 8) != 0 ? null : gp7Var, (i & 32) == 0, (i & 64) != 0 ? fy3.a : linkedHashMap);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof esd)) {
            return false;
        }
        esd esdVar = (esd) obj;
        return g76.L(this.a, esdVar.a) && g76.L(this.b, esdVar.b) && g76.L(this.c, esdVar.c) && g76.L(null, null) && this.d == esdVar.d && g76.L(this.e, esdVar.e);
    }

    public final int hashCode() {
        i94 i94Var = this.a;
        int iHashCode = (i94Var == null ? 0 : i94Var.hashCode()) * 31;
        pfc pfcVar = this.b;
        int iHashCode2 = (iHashCode + (pfcVar == null ? 0 : pfcVar.hashCode())) * 31;
        uj1 uj1Var = this.c;
        return this.e.hashCode() + ((((((iHashCode2 + (uj1Var == null ? 0 : uj1Var.hashCode())) * 31) + 0) * 961) + (this.d ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "TransitionData(fade=" + this.a + ", slide=" + this.b + ", changeSize=" + this.c + ", scale=" + ((Object) null) + ", veil=null, hold=" + this.d + ", effectsMap=" + this.e + ')';
    }

    public esd(i94 i94Var, pfc pfcVar, uj1 uj1Var, gp7 gp7Var, boolean z, Map map) {
        this.a = i94Var;
        this.b = pfcVar;
        this.c = uj1Var;
        this.d = z;
        this.e = map;
    }
}
