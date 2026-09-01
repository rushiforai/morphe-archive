package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fb5 {
    public final kla a;

    public fb5(kla klaVar) {
        this.a = klaVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.eb5
            if (r0 == 0) goto L13
            r0 = r6
            eb5 r0 = (defpackage.eb5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            eb5 r0 = new eb5
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            defpackage.br7.v(r6)
            bjb r6 = (defpackage.bjb) r6
            java.lang.Object r4 = r6.a
            goto L42
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r6)
            r0.d = r3
            yd4 r6 = defpackage.yd4.CacheFirst
            kla r4 = r4.a
            java.lang.Object r4 = r4.l(r5, r6, r0)
            if (r4 != r1) goto L42
            return r1
        L42:
            boolean r5 = r4 instanceof defpackage.ajb
            if (r5 != 0) goto L75
            com.medium.android.graphql.PublicationPostTimelineQuery$PostTimeline r4 = (com.medium.android.graphql.PublicationPostTimelineQuery.PostTimeline) r4
            java.util.List r4 = r4.getYears()
            java.util.ArrayList r5 = new java.util.ArrayList
            r6 = 10
            int r6 = defpackage.cu1.k0(r4, r6)
            r5.<init>(r6)
            java.util.Iterator r4 = r4.iterator()
        L5b:
            boolean r6 = r4.hasNext()
            if (r6 == 0) goto L74
            java.lang.Object r6 = r4.next()
            com.medium.android.graphql.PublicationPostTimelineQuery$Year r6 = (com.medium.android.graphql.PublicationPostTimelineQuery.Year) r6
            int r6 = r6.getYear()
            java.lang.Integer r0 = new java.lang.Integer
            r0.<init>(r6)
            r5.add(r0)
            goto L5b
        L74:
            return r5
        L75:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fb5.a(java.lang.String, p92):java.lang.Object");
    }
}
