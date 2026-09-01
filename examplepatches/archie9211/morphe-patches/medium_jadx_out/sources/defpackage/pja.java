package defpackage;

import com.medium.android.graphql.type.UserDismissableFlags;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pja implements bo4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ bo4 b;
    public final /* synthetic */ Object c;

    public /* synthetic */ pja(bo4 bo4Var, Object obj, int i) {
        this.a = i;
        this.b = bo4Var;
        this.c = obj;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) throws Throwable {
        int i = this.a;
        int i2 = 4;
        c1e c1eVar = c1e.a;
        Object obj = this.c;
        bo4 bo4Var = this.b;
        switch (i) {
            case 0:
                Object objB = ((u50) bo4Var).b(new jo9(do4Var, i2, (rja) obj), n92Var);
                return objB == tb2.COROUTINE_SUSPENDED ? objB : c1eVar;
            case 1:
                Object objB2 = ((zh) bo4Var).b(new jo9(do4Var, 7, (gvb) obj), n92Var);
                return objB2 == tb2.COROUTINE_SUSPENDED ? objB2 : c1eVar;
            case 2:
                Object objB3 = ((uua) bo4Var).a.b(new jo9(do4Var, 9, (o8c) obj), n92Var);
                return objB3 == tb2.COROUTINE_SUSPENDED ? objB3 : c1eVar;
            case 3:
                Object objB4 = ((hk1) bo4Var).b(new jo9(do4Var, 15, (efd) obj), n92Var);
                return objB4 == tb2.COROUTINE_SUSPENDED ? objB4 : c1eVar;
            case 4:
                Object objB5 = ((u50) bo4Var).b(new jo9(do4Var, 17, (fqd) obj), n92Var);
                return objB5 == tb2.COROUTINE_SUSPENDED ? objB5 : c1eVar;
            case 5:
                Object objB6 = ((to4) bo4Var).b(new jo9(do4Var, 19, (sae) obj), n92Var);
                return objB6 == tb2.COROUTINE_SUSPENDED ? objB6 : c1eVar;
            case 6:
                Object objB7 = ((u50) bo4Var).b(new jo9(do4Var, 22, (mfe) obj), n92Var);
                return objB7 == tb2.COROUTINE_SUSPENDED ? objB7 : c1eVar;
            case 7:
                Object objB8 = ((u50) bo4Var).b(new jo9(do4Var, 25, (cie) obj), n92Var);
                return objB8 == tb2.COROUTINE_SUSPENDED ? objB8 : c1eVar;
            case 8:
                Object objB9 = ((u50) bo4Var).b(new jo9(do4Var, 29, (ime) obj), n92Var);
                return objB9 == tb2.COROUTINE_SUSPENDED ? objB9 : c1eVar;
            case 9:
                Object objB10 = ((hk1) bo4Var).b(new moe(do4Var, 0, (ooe) obj), n92Var);
                return objB10 == tb2.COROUTINE_SUSPENDED ? objB10 : c1eVar;
            case 10:
                Object objB11 = ((wua) bo4Var).a.b(new moe(do4Var, 1, (wwe) obj), n92Var);
                return objB11 == tb2.COROUTINE_SUSPENDED ? objB11 : c1eVar;
            case 11:
                Object objB12 = ((to4) bo4Var).b(new moe(do4Var, 2, (UserDismissableFlags) obj), n92Var);
                return objB12 == tb2.COROUTINE_SUSPENDED ? objB12 : c1eVar;
            case 12:
                Object objB13 = bo4Var.b(new moe(do4Var, 3, (vwa) obj), n92Var);
                return objB13 == tb2.COROUTINE_SUSPENDED ? objB13 : c1eVar;
            case 13:
                Object objB14 = ((xwc) bo4Var).b(new be4(do4Var, (rya) obj, 4), n92Var);
                return objB14 == tb2.COROUTINE_SUSPENDED ? objB14 : c1eVar;
            case 14:
                Object objB15 = ((xwc) bo4Var).b(new moe(do4Var, i2, (h00) obj), n92Var);
                return objB15 == tb2.COROUTINE_SUSPENDED ? objB15 : c1eVar;
            default:
                Object objB16 = ((jye) bo4Var).b(new moe(do4Var, 5, (s33) obj), n92Var);
                return objB16 == tb2.COROUTINE_SUSPENDED ? objB16 : c1eVar;
        }
    }
}
