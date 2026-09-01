package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class me4 {
    public final qi1 a;

    public me4(qi1 qi1Var) {
        qi1Var.getClass();
        this.a = qi1Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r6, defpackage.yd4 r7, defpackage.p92 r8) {
        /*
            r5 = this;
            boolean r0 = r8 instanceof defpackage.le4
            if (r0 == 0) goto L13
            r0 = r8
            le4 r0 = (defpackage.le4) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            le4 r0 = new le4
            r0.<init>(r5, r8)
        L18:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2e
            java.lang.String r6 = r0.b
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r5 = r8.a
            goto L44
        L2e:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L34:
            defpackage.br7.v(r8)
            r0.b = r6
            r0.e = r3
            qi1 r5 = r5.a
            java.lang.Object r5 = r5.r(r6, r7, r0)
            if (r5 != r1) goto L44
            return r1
        L44:
            java.lang.Throwable r7 = defpackage.bjb.b(r5)
            r8 = 0
            java.lang.String r0 = "Fetch user reading list failure. User id: "
            if (r7 != 0) goto Lab
            com.medium.android.graphql.PredefinedCatalogQuery$GetPredefinedCatalog r5 = (com.medium.android.graphql.PredefinedCatalogQuery.GetPredefinedCatalog) r5
            com.medium.android.graphql.fragment.CatalogPreviewData r7 = r5.getCatalogPreviewData()
            if (r7 == 0) goto L5b
            rua r5 = new rua
            r5.<init>(r7)
            return r5
        L5b:
            com.medium.android.graphql.PredefinedCatalogQuery$OnNotFound r7 = r5.getOnNotFound()
            if (r7 == 0) goto L71
            qua r6 = new qua
            com.medium.android.graphql.PredefinedCatalogQuery$OnNotFound r5 = r5.getOnNotFound()
            if (r5 == 0) goto L6d
            java.lang.String r4 = r5.getMessage()
        L6d:
            r6.<init>(r4)
            return r6
        L71:
            com.medium.android.graphql.PredefinedCatalogQuery$OnForbidden r7 = r5.getOnForbidden()
            if (r7 == 0) goto L87
            pua r6 = new pua
            com.medium.android.graphql.PredefinedCatalogQuery$OnForbidden r5 = r5.getOnForbidden()
            if (r5 == 0) goto L83
            java.lang.String r4 = r5.getMessage()
        L83:
            r6.<init>(r4)
            return r6
        L87:
            java.lang.IllegalArgumentException r7 = new java.lang.IllegalArgumentException
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            java.lang.String r2 = "Result not handled: "
            r1.<init>(r2)
            r1.append(r5)
            java.lang.String r5 = r1.toString()
            r7.<init>(r5)
            java.lang.String r5 = defpackage.ka1.r(r0, r6)
            uld r6 = defpackage.wld.a
            java.lang.Object[] r8 = new java.lang.Object[r8]
            r6.e(r7, r5, r8)
            oua r5 = new oua
            r5.<init>(r7)
            return r5
        Lab:
            java.lang.String r5 = defpackage.ka1.r(r0, r6)
            uld r6 = defpackage.wld.a
            java.lang.Object[] r8 = new java.lang.Object[r8]
            r6.e(r7, r5, r8)
            oua r5 = new oua
            r5.<init>(r7)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.me4.a(java.lang.String, yd4, p92):java.lang.Object");
    }
}
