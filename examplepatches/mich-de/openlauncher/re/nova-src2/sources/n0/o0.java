package n0;

import cw.l2;
import kotlin.jvm.functions.Function1;
import kw.p2;

/* loaded from: classes.dex */
public final class o0 {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f77454a;

    /* renamed from: c, reason: collision with root package name */
    public androidx.room.h f77456c;

    /* renamed from: f, reason: collision with root package name */
    public int f77459f;

    /* renamed from: b, reason: collision with root package name */
    public final i50.c f77455b = new i50.c(7);

    /* renamed from: d, reason: collision with root package name */
    public int f77457d = -1;

    /* renamed from: e, reason: collision with root package name */
    public int f77458e = -1;

    public o0(Function1 function1) {
        this.f77454a = function1;
    }

    public final m0 a(int i5, long j11, boolean z11, p2 p2Var) {
        androidx.room.h hVar = this.f77456c;
        if (hVar == null) {
            return e.f77409a;
        }
        c1 c1Var = (c1) hVar.f15221d;
        boolean z12 = c1Var instanceof a;
        a1 a1Var = new a1(hVar, i5, j11, this.f77455b, p2Var);
        if (!z12) {
            c1Var.a(a1Var);
        } else if (z11) {
            a aVar = (a) c1Var;
            aVar.f77366b.add(new f1(1, a1Var));
            if (!aVar.f77367c) {
                aVar.f77367c = true;
                aVar.f77365a.post(aVar);
            }
        } else {
            a aVar2 = (a) c1Var;
            aVar2.f77366b.add(new f1(0, a1Var));
            if (!aVar2.f77367c) {
                aVar2.f77367c = true;
                aVar2.f77365a.post(aVar2);
            }
        }
        l2.J(i5, "compose:lazy:schedule_prefetch:index");
        return a1Var;
    }
}
