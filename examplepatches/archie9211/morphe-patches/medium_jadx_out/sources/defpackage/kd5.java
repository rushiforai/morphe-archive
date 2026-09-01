package defpackage;

import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class kd5 extends fv7 {
    public static final /* synthetic */ fj6[] d = {n1b.a.g(new u4a(kd5.class, "allDescriptors", "getAllDescriptors()Ljava/util/List;", 0))};
    public final f0 b;
    public final u67 c;

    public kd5(x67 x67Var, f0 f0Var) {
        x67Var.getClass();
        this.b = f0Var;
        this.c = new u67(x67Var, new v2(15, this));
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Collection a(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        List list = (List) mk7.z(this.c, d[0]);
        if (list.isEmpty()) {
            return ey3.a;
        }
        wgc wgcVar = new wgc();
        for (Object obj : list) {
            if ((obj instanceof bec) && g76.L(((bec) obj).getName(), n98Var)) {
                wgcVar.add(obj);
            }
        }
        return wgcVar;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Collection e(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        if (!p83Var.a(p83.n.b)) {
            return ey3.a;
        }
        return (List) mk7.z(this.c, d[0]);
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Collection f(n98 n98Var, ng8 ng8Var) {
        n98Var.getClass();
        ng8Var.getClass();
        List list = (List) mk7.z(this.c, d[0]);
        if (list.isEmpty()) {
            return ey3.a;
        }
        wgc wgcVar = new wgc();
        for (Object obj : list) {
            if ((obj instanceof q4a) && g76.L(((q4a) obj).getName(), n98Var)) {
                wgcVar.add(obj);
            }
        }
        return wgcVar;
    }

    public abstract List h();
}
