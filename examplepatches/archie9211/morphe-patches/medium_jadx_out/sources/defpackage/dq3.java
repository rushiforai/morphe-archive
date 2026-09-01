package defpackage;

import com.medium.android.donkey.write.EditPostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dq3 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ EditPostFragment d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ dq3(EditPostFragment editPostFragment, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = editPostFragment;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        EditPostFragment editPostFragment = this.d;
        switch (i) {
            case 0:
                return new dq3(editPostFragment, n92Var, 0);
            case 1:
                return new dq3(editPostFragment, n92Var, 1);
            case 2:
                return new dq3(editPostFragment, n92Var, 2);
            case 3:
                return new dq3(editPostFragment, n92Var, 3);
            default:
                return new dq3(editPostFragment, n92Var, 4);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((dq3) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objI;
        int i = this.b;
        c1e c1eVar = c1e.a;
        EditPostFragment editPostFragment = this.d;
        int i2 = 1;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                ex2 ex2Var = editPostFragment.C0;
                if (ex2Var == null) {
                    g76.g0("backgroundDetector");
                    throw null;
                }
                xpc xpcVar = ex2Var.a;
                ky6 ky6Var = editPostFragment.O;
                ky6Var.getClass();
                l41 l41VarL = pwd.L(xpcVar, ky6Var);
                aq aqVar = new aq(6, editPostFragment);
                this.c = 1;
                return l41VarL.b(aqVar, this) == tb2Var ? tb2Var : c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                int i5 = EditPostFragment.Q0;
                uua uuaVar = editPostFragment.j1().r;
                w25 w25VarQ = editPostFragment.q();
                w25VarQ.b();
                l41 l41VarL2 = pwd.L(uuaVar, w25VarQ.e);
                ob0 ob0Var = new ob0(2, editPostFragment);
                this.c = 1;
                return l41VarL2.b(ob0Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 != 0) {
                    if (i6 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                int i7 = EditPostFragment.Q0;
                wua wuaVar = editPostFragment.j1().z;
                w25 w25VarQ2 = editPostFragment.q();
                w25VarQ2.b();
                pc1 pc1Var = new pc1(new u50(5, pwd.L(wuaVar, w25VarQ2.e)), 5, editPostFragment);
                z8 z8Var = new z8(editPostFragment, n92Var, 21);
                this.c = 1;
                return wgf.h(pc1Var, z8Var, this) == tb2Var3 ? tb2Var3 : c1eVar;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 != 0) {
                    if (i8 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                int i9 = EditPostFragment.Q0;
                wua wuaVar2 = editPostFragment.j1().z;
                w25 w25VarQ3 = editPostFragment.q();
                w25VarQ3.b();
                l41 l41VarL3 = pwd.L(wuaVar2, w25VarQ3.e);
                cq3 cq3Var = new cq3(editPostFragment, n92Var, i2);
                this.c = 1;
                return wgf.h(l41VarL3, cq3Var, this) == tb2Var4 ? tb2Var4 : c1eVar;
            default:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i10 = this.c;
                if (i10 == 0) {
                    br7.v(obj);
                    int i11 = EditPostFragment.Q0;
                    xq3 xq3Var = editPostFragment.j1().x;
                    if (xq3Var == null) {
                        return c1eVar;
                    }
                    this.c = 1;
                    objI = xq3Var.i(this);
                    if (objI == tb2Var5) {
                        return tb2Var5;
                    }
                } else {
                    if (i10 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objI = ((bjb) obj).a;
                }
                if (!(objI instanceof ajb)) {
                    editPostFragment.J0 = null;
                }
                Throwable thB = bjb.b(objI);
                if (thB == null) {
                    return c1eVar;
                }
                int i12 = EditPostFragment.Q0;
                editPostFragment.l1(thB);
                return c1eVar;
        }
    }
}
