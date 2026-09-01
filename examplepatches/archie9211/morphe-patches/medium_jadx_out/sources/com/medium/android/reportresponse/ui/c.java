package com.medium.android.reportresponse.ui;

import com.medium.android.reportresponse.ui.ReportResponseReference;
import defpackage.a7b;
import defpackage.ae2;
import defpackage.b55;
import defpackage.bjb;
import defpackage.br7;
import defpackage.c1e;
import defpackage.n92;
import defpackage.p4d;
import defpackage.sb2;
import defpackage.tb2;
import defpackage.ygf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class c extends p4d implements b55 {
    public int b;
    public final /* synthetic */ a7b c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(a7b a7bVar, n92 n92Var) {
        super(2, n92Var);
        this.c = a7bVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new c(this.c, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((c) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        a7b a7bVar = this.c;
        ReportResponseReference reportResponseReference = a7bVar.b;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            ae2 ae2Var = a7bVar.g;
            String responseId = ((ReportResponseReference.Post) reportResponseReference).getResponseId();
            String rootPostId = ((ReportResponseReference.Post) reportResponseReference).getRootPostId();
            String str = a7bVar.d;
            String str2 = a7bVar.n;
            String str3 = a7bVar.m;
            this.b = 1;
            objA = ae2Var.a(rootPostId, responseId, str, str2, str3, this);
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
