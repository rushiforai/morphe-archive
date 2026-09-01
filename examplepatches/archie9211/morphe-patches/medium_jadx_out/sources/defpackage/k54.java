package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k54 {
    public static final k54 b;
    public static final k54 c;
    public final esd a;

    static {
        LinkedHashMap linkedHashMap = null;
        i94 i94Var = null;
        pfc pfcVar = null;
        uj1 uj1Var = null;
        gp7 gp7Var = null;
        b = new k54(new esd(i94Var, pfcVar, uj1Var, gp7Var, linkedHashMap, 127));
        c = new k54(new esd(i94Var, pfcVar, uj1Var, gp7Var, linkedHashMap, 95));
    }

    public k54(esd esdVar) {
        this.a = esdVar;
    }

    public final k54 a(k54 k54Var) {
        esd esdVar = k54Var.a;
        i94 i94Var = esdVar.a;
        esd esdVar2 = this.a;
        if (i94Var == null) {
            i94Var = esdVar2.a;
        }
        pfc pfcVar = esdVar.b;
        if (pfcVar == null) {
            pfcVar = esdVar2.b;
        }
        uj1 uj1Var = esdVar.c;
        if (uj1Var == null) {
            uj1Var = esdVar2.c;
        }
        return new k54(new esd(i94Var, pfcVar, uj1Var, (gp7) null, esdVar.d || esdVar2.d, ei7.S(esdVar2.e, esdVar.e)));
    }

    public final boolean equals(Object obj) {
        return (obj instanceof k54) && ((k54) obj).a.equals(this.a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        if (equals(b)) {
            return "ExitTransition.None";
        }
        if (equals(c)) {
            return "ExitTransition.KeepUntilTransitionsFinished";
        }
        StringBuilder sb = new StringBuilder("ExitTransition: \nFade - ");
        esd esdVar = this.a;
        i94 i94Var = esdVar.a;
        sb.append(i94Var != null ? i94Var.toString() : null);
        sb.append(",\nSlide - ");
        pfc pfcVar = esdVar.b;
        sb.append(pfcVar != null ? pfcVar.toString() : null);
        sb.append(",\nShrink - ");
        uj1 uj1Var = esdVar.c;
        sb.append(uj1Var != null ? uj1Var.toString() : null);
        sb.append(",\nScale - ");
        sb.append((String) null);
        sb.append(",\nKeepUntilTransitionsFinished - ");
        sb.append(esdVar.d);
        return sb.toString();
    }
}
