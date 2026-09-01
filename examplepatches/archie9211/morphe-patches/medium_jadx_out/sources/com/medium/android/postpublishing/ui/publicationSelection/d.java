package com.medium.android.postpublishing.ui.publicationSelection;

import defpackage.ad5;
import defpackage.b55;
import defpackage.bjb;
import defpackage.br7;
import defpackage.c1e;
import defpackage.lma;
import defpackage.mr9;
import defpackage.n92;
import defpackage.p4d;
import defpackage.tb2;
import defpackage.yd4;
import defpackage.ygf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class d extends p4d implements b55 {
    public int b;
    public final /* synthetic */ lma c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(lma lmaVar, n92 n92Var) {
        super(2, n92Var);
        this.c = lmaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new d(this.c, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((d) create(Integer.valueOf(((Number) obj).intValue()), (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            ad5 ad5Var = this.c.d;
            mr9 mr9Var = new mr9(29);
            this.b = 1;
            objA = ad5Var.a(yd4.NetworkFirst, mr9Var, this);
            if (objA == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            objA = ((bjb) obj).a;
        }
        return new bjb(objA);
    }
}
