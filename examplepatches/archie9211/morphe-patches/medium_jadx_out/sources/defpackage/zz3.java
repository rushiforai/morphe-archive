package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zz3 {
    public static final zz3 b = new zz3(new esd((i94) null, (pfc) null, (uj1) null, (gp7) null, (LinkedHashMap) null, 127));
    public final esd a;

    public zz3(esd esdVar) {
        this.a = esdVar;
    }

    public final zz3 a(zz3 zz3Var) {
        esd esdVar = zz3Var.a;
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
        return new zz3(new esd(i94Var, pfcVar, uj1Var, (gp7) null, ei7.S(esdVar2.e, esdVar.e), 32));
    }

    public final boolean equals(Object obj) {
        return (obj instanceof zz3) && ((zz3) obj).a.equals(this.a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        if (equals(b)) {
            return "EnterTransition.None";
        }
        StringBuilder sb = new StringBuilder("EnterTransition: \nFade - ");
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
        return sb.toString();
    }
}
