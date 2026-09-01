package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wz3 extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ xz3 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ wz3(xz3 xz3Var, int i) {
        super(1);
        this.a = i;
        this.b = xz3Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        xz3 xz3Var = this.b;
        switch (i) {
            case 0:
                zrd zrdVar = (zrd) obj;
                jz3 jz3Var = jz3.PreEnter;
                jz3 jz3Var2 = jz3.Visible;
                Object obj2 = null;
                if (zrdVar.b(jz3Var, jz3Var2)) {
                    uj1 uj1Var = xz3Var.t.a.c;
                    if (uj1Var != null) {
                        obj2 = uj1Var.c;
                    }
                } else if (zrdVar.b(jz3Var2, jz3.PostExit)) {
                    uj1 uj1Var2 = xz3Var.u.a.c;
                    if (uj1Var2 != null) {
                        obj2 = uj1Var2.c;
                    }
                } else {
                    obj2 = sz3.d;
                }
                return obj2 == null ? sz3.d : obj2;
            default:
                zrd zrdVar2 = (zrd) obj;
                jz3 jz3Var3 = jz3.PreEnter;
                jz3 jz3Var4 = jz3.Visible;
                if (zrdVar2.b(jz3Var3, jz3Var4)) {
                    pfc pfcVar = xz3Var.t.a.b;
                    return pfcVar != null ? pfcVar.b : sz3.c;
                }
                if (!zrdVar2.b(jz3Var4, jz3.PostExit)) {
                    return sz3.c;
                }
                pfc pfcVar2 = xz3Var.u.a.b;
                return pfcVar2 != null ? pfcVar2.b : sz3.c;
        }
    }
}
