package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nlb extends xp6 {
    public static final nlb c = new nlb("Undefined intrinsics block and it is required", 0);
    public final /* synthetic */ int b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nlb(String str, int i) {
        super(str);
        this.b = i;
    }

    @Override // defpackage.zk7
    public final al7 b(bl7 bl7Var, List list, long j) {
        switch (this.b) {
            case 0:
                int size = list.size();
                fy3 fy3Var = fy3.a;
                if (size == 0) {
                    return bl7Var.q0(f72.j(j), f72.i(j), fy3Var, ox8.f);
                }
                if (size == 1) {
                    t99 t99VarS = ((tk7) list.get(0)).s(j);
                    return bl7Var.q0(h72.g(t99VarS.a, j), h72.f(t99VarS.b, j), fy3Var, new xm(t99VarS, 7));
                }
                ArrayList arrayList = new ArrayList(list.size());
                int size2 = list.size();
                int iMax = 0;
                int iMax2 = 0;
                for (int i = 0; i < size2; i++) {
                    t99 t99VarS2 = ((tk7) list.get(i)).s(j);
                    iMax = Math.max(t99VarS2.a, iMax);
                    iMax2 = Math.max(t99VarS2.b, iMax2);
                    arrayList.add(t99VarS2);
                }
                return bl7Var.q0(h72.g(iMax, j), h72.f(iMax2, j), fy3Var, new xo(3, arrayList));
            default:
                throw new IllegalStateException("Undefined measure and it is required");
        }
    }
}
