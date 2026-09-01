package defpackage;

import com.medium.android.upvoters.ui.UpVotersReference;
import com.medium.android.upvoters.ui.d;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a4e extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ d d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a4e(d dVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = dVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        d dVar = this.d;
        switch (i) {
            case 0:
                return new a4e(dVar, n92Var, 0);
            default:
                return new a4e(dVar, n92Var, 1);
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
        return ((a4e) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        d dVar = this.d;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    UpVotersReference upVotersReference = dVar.b;
                    if (upVotersReference instanceof UpVotersReference.Catalog) {
                        kxe kxeVar = dVar.d;
                        this.c = 1;
                        Object objD = kxeVar.b.D(this);
                        if (objD != tb2Var) {
                            objD = c1eVar;
                        }
                        if (objD != tb2Var) {
                        }
                    } else if (upVotersReference instanceof UpVotersReference.Post) {
                        wye wyeVar = dVar.e;
                        this.c = 2;
                        Object objD2 = wyeVar.b.D(this);
                        if (objD2 != tb2Var) {
                            objD2 = c1eVar;
                        }
                        if (objD2 != tb2Var) {
                        }
                    } else {
                        ygf.a();
                    }
                } else if (i2 == 1 || i2 == 2) {
                    br7.v(obj);
                } else {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                }
                break;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    UpVotersReference upVotersReference2 = dVar.b;
                    if (upVotersReference2 instanceof UpVotersReference.Catalog) {
                        kxe kxeVar2 = dVar.d;
                        this.c = 1;
                        Object objC0 = kxeVar2.b.c0(this);
                        if (objC0 != tb2Var2) {
                            objC0 = c1eVar;
                        }
                        if (objC0 != tb2Var2) {
                        }
                    } else if (upVotersReference2 instanceof UpVotersReference.Post) {
                        wye wyeVar2 = dVar.e;
                        this.c = 2;
                        Object objC02 = wyeVar2.b.c0(this);
                        if (objC02 != tb2Var2) {
                            objC02 = c1eVar;
                        }
                        if (objC02 != tb2Var2) {
                        }
                    } else {
                        ygf.a();
                    }
                } else if (i3 == 1 || i3 == 2) {
                    br7.v(obj);
                } else {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                }
                break;
        }
        return c1eVar;
    }
}
