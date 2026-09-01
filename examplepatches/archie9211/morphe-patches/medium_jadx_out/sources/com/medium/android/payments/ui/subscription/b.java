package com.medium.android.payments.ui.subscription;

import com.medium.android.core.models.BillingPeriod;
import defpackage.b55;
import defpackage.c1e;
import defpackage.do4;
import defpackage.ecb;
import defpackage.n92;
import defpackage.p4d;
import defpackage.rya;
import defpackage.zw7;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b extends p4d implements b55 {
    public rya b;
    public rya c;
    public rya d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ SubscriptionViewModel g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(SubscriptionViewModel subscriptionViewModel, n92 n92Var) {
        super(2, n92Var);
        this.g = subscriptionViewModel;
    }

    /* JADX WARN: Code restructure failed: missing block: B:101:0x0213, code lost:
    
        if (r47.a(r0, r6) == r7) goto L295;
     */
    /* JADX WARN: Code restructure failed: missing block: B:296:0x0708, code lost:
    
        return r15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00c7, code lost:
    
        if (r47.a(r14, r6) == r7) goto L295;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x011c, code lost:
    
        if (r47.a(defpackage.wzc.a, r6) == r7) goto L295;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x01d4, code lost:
    
        if (r47.a(r2, r6) == r7) goto L295;
     */
    /* JADX WARN: Removed duplicated region for block: B:134:0x02da  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x0306  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x031f  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x033c  */
    /* JADX WARN: Removed duplicated region for block: B:198:0x04b3  */
    /* JADX WARN: Removed duplicated region for block: B:201:0x04c4  */
    /* JADX WARN: Removed duplicated region for block: B:211:0x0507  */
    /* JADX WARN: Removed duplicated region for block: B:214:0x0537  */
    /* JADX WARN: Removed duplicated region for block: B:225:0x056c  */
    /* JADX WARN: Removed duplicated region for block: B:226:0x056f  */
    /* JADX WARN: Removed duplicated region for block: B:229:0x0577  */
    /* JADX WARN: Removed duplicated region for block: B:230:0x059d  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x05b0  */
    /* JADX WARN: Removed duplicated region for block: B:239:0x05bc  */
    /* JADX WARN: Removed duplicated region for block: B:242:0x05c7  */
    /* JADX WARN: Removed duplicated region for block: B:246:0x05cf  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x05d2  */
    /* JADX WARN: Removed duplicated region for block: B:263:0x05f7  */
    /* JADX WARN: Removed duplicated region for block: B:275:0x0617  */
    /* JADX WARN: Removed duplicated region for block: B:277:0x061f  */
    /* JADX WARN: Removed duplicated region for block: B:278:0x0626  */
    /* JADX WARN: Removed duplicated region for block: B:280:0x062a A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:292:0x06d9  */
    /* JADX WARN: Removed duplicated region for block: B:321:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object i(com.medium.android.payments.ui.subscription.SubscriptionViewModel r46, defpackage.do4 r47, defpackage.gcb r48, com.medium.android.core.models.BillingPeriod r49, defpackage.rj2 r50, defpackage.ww7 r51, defpackage.p92 r52) {
        /*
            Method dump skipped, instruction units count: 1824
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.payments.ui.subscription.b.i(com.medium.android.payments.ui.subscription.SubscriptionViewModel, do4, gcb, com.medium.android.core.models.BillingPeriod, rj2, ww7, p92):java.lang.Object");
    }

    public static final ecb n(List list, zw7 zw7Var, BillingPeriod billingPeriod) {
        Object next;
        Iterator it2 = list.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            ecb ecbVar = (ecb) next;
            if (ecbVar.g == zw7Var && ecbVar.h == billingPeriod) {
                break;
            }
        }
        return (ecb) next;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        b bVar = new b(this.g, n92Var);
        bVar.f = obj;
        return bVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((b) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0086, code lost:
    
        if (r2.a(defpackage.xzc.a, r12) == r7) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x012a, code lost:
    
        if (defpackage.r6c.m(r12, r0, r6) != r7) goto L54;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r13) {
        /*
            Method dump skipped, instruction units count: 305
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.payments.ui.subscription.b.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
