package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nc5 {
    public final yad a;

    public nc5(yad yadVar) {
        this.a = yadVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.mc5
            if (r0 == 0) goto L13
            r0 = r14
            mc5 r0 = (defpackage.mc5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            mc5 r0 = new mc5
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L32
            if (r2 != r4) goto L2c
            defpackage.br7.v(r14)
            bjb r14 = (defpackage.bjb) r14
            java.lang.Object r11 = r14.a
            goto L40
        L2c:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r3
        L32:
            defpackage.br7.v(r14)
            r0.d = r4
            yad r11 = r11.a
            java.lang.Object r11 = r11.f(r12, r13, r0)
            if (r11 != r1) goto L40
            return r1
        L40:
            boolean r12 = r11 instanceof defpackage.ajb
            if (r12 != 0) goto Lbc
            com.medium.android.graphql.TagCuratedCatalogQuery$Node r11 = (com.medium.android.graphql.TagCuratedCatalogQuery.Node) r11
            java.lang.String r6 = r11.getId()
            com.medium.android.graphql.type.PredefinedCatalogType r12 = r11.getPredefined()
            if (r12 != 0) goto L52
            r12 = -1
            goto L5a
        L52:
            int[] r13 = defpackage.lc5.a
            int r12 = r12.ordinal()
            r12 = r13[r12]
        L5a:
            if (r12 != r4) goto L60
            com.medium.android.core.models.CatalogName$ReadingList r12 = com.medium.android.core.models.CatalogName.ReadingList.INSTANCE
        L5e:
            r7 = r12
            goto L6a
        L60:
            com.medium.android.core.models.CatalogName$Name r12 = new com.medium.android.core.models.CatalogName$Name
            java.lang.String r13 = r11.getName()
            r12.<init>(r13)
            goto L5e
        L6a:
            com.medium.android.graphql.TagCuratedCatalogQuery$Creator r12 = r11.getCreator()
            java.lang.String r8 = r12.getId()
            com.medium.android.graphql.TagCuratedCatalogQuery$Creator r12 = r11.getCreator()
            java.lang.String r9 = r12.getName()
            com.medium.android.graphql.TagCuratedCatalogQuery$ItemsConnection r11 = r11.getItemsConnection()
            java.util.List r11 = r11.getItems()
            java.util.ArrayList r10 = new java.util.ArrayList
            r10.<init>()
            java.util.Iterator r11 = r11.iterator()
        L8b:
            boolean r12 = r11.hasNext()
            if (r12 == 0) goto Lb6
            java.lang.Object r12 = r11.next()
            com.medium.android.graphql.TagCuratedCatalogQuery$Item r12 = (com.medium.android.graphql.TagCuratedCatalogQuery.Item) r12
            com.medium.android.graphql.TagCuratedCatalogQuery$Entity r12 = r12.getEntity()
            if (r12 == 0) goto Laf
            com.medium.android.graphql.fragment.CatalogItemPostData r12 = r12.getCatalogItemPostData()
            if (r12 == 0) goto Laf
            com.medium.android.graphql.fragment.PostPreviewData r12 = r12.getPostPreviewData()
            if (r12 == 0) goto Laf
            q8d r13 = new q8d
            r13.<init>(r12)
            goto Lb0
        Laf:
            r13 = r3
        Lb0:
            if (r13 == 0) goto L8b
            r10.add(r13)
            goto L8b
        Lb6:
            d8d r5 = new d8d
            r5.<init>(r6, r7, r8, r9, r10)
            return r5
        Lbc:
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nc5.a(java.lang.String, yd4, p92):java.lang.Object");
    }
}
