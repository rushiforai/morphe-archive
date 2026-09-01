package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gu6 {
    public final x45 a;
    public zf3 c;
    public int f;
    public final ku3 b = new ku3(27);
    public int d = -1;
    public int e = -1;

    public gu6(x45 x45Var) {
        this.a = x45Var;
    }

    public final fu6 a(int i, long j, boolean z, x45 x45Var) {
        zf3 zf3Var = this.c;
        if (zf3Var == null) {
            return hn3.a;
        }
        cz9 cz9Var = (cz9) zf3Var.e;
        boolean z2 = cz9Var instanceof vr;
        az9 az9Var = new az9(zf3Var, i, this.b, x45Var);
        az9Var.d = new f72(j);
        if (!z2) {
            cz9Var.a(az9Var);
        } else if (z) {
            vr vrVar = (vr) cz9Var;
            vrVar.b.add(new d1a(1, az9Var));
            if (!vrVar.c) {
                vrVar.c = true;
                vrVar.a.post(vrVar);
            }
        } else {
            vr vrVar2 = (vr) cz9Var;
            vrVar2.b.add(new d1a(0, az9Var));
            if (!vrVar2.c) {
                vrVar2.c = true;
                vrVar2.a.post(vrVar2);
            }
        }
        nm.N(i, "compose:lazy:schedule_prefetch:index");
        return az9Var;
    }
}
