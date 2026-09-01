package defpackage;

import com.medium.android.unsplash.data.UnsplashRepository;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class n57 {
    public final UnsplashRepository a;
    public final n0c b;

    public n57(UnsplashRepository unsplashRepository, int i) {
        switch (i) {
            case 1:
                this.a = unsplashRepository;
                this.b = new n0c((yd4) null, (Object) 1, 3);
                break;
            default:
                this.a = unsplashRepository;
                this.b = new n0c((yd4) null, (Object) 1, 3);
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object a(java.lang.Integer r6, int r7, defpackage.p92 r8) {
        /*
            r5 = this;
            boolean r0 = r8 instanceof defpackage.l57
            if (r0 == 0) goto L13
            r0 = r8
            l57 r0 = (defpackage.l57) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            l57 r0 = new l57
            r0.<init>(r5, r8)
        L18:
            java.lang.Object r8 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L36
            if (r2 != r4) goto L30
            int r7 = r0.c
            java.lang.Integer r6 = r0.b
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r5 = r8.a
            goto L50
        L30:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L36:
            defpackage.br7.v(r8)
            if (r6 == 0) goto L40
            int r8 = r6.intValue()
            goto L41
        L40:
            r8 = r4
        L41:
            r0.b = r6
            r0.c = r7
            r0.f = r4
            com.medium.android.unsplash.data.UnsplashRepository r5 = r5.a
            java.lang.Object r5 = r5.m68loadPhotos0E7RQCE(r8, r7, r0)
            if (r5 != r1) goto L50
            return r1
        L50:
            java.lang.Throwable r8 = defpackage.bjb.b(r5)
            if (r8 == 0) goto L6c
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            java.lang.String r1 = "Failed to load page "
            r0.<init>(r1)
            r0.append(r6)
            java.lang.String r0 = r0.toString()
            uld r1 = defpackage.wld.a
            r2 = 0
            java.lang.Object[] r2 = new java.lang.Object[r2]
            r1.e(r8, r0, r2)
        L6c:
            boolean r8 = r5 instanceof defpackage.ajb
            if (r8 != 0) goto La9
            zcb r5 = (defpackage.zcb) r5
            java.lang.Object r8 = r5.b
            java.util.List r8 = (java.util.List) r8
            if (r8 != 0) goto L7a
            ey3 r8 = defpackage.ey3.a
        L7a:
            adb r5 = r5.a
            yi5 r5 = r5.f
            java.lang.String r0 = "x-total"
            java.lang.String r5 = r5.d(r0)
            if (r5 == 0) goto L91
            int r5 = java.lang.Integer.parseInt(r5)
            int r5 = r5 / r7
            java.lang.Integer r7 = new java.lang.Integer
            r7.<init>(r5)
            goto L92
        L91:
            r7 = r3
        L92:
            wz8 r5 = new wz8
            boolean r7 = defpackage.g76.L(r6, r7)
            if (r7 != 0) goto La6
            if (r6 == 0) goto La6
            int r6 = r6.intValue()
            int r6 = r6 + r4
            java.lang.Integer r3 = new java.lang.Integer
            r3.<init>(r6)
        La6:
            r5.<init>(r3, r8)
        La9:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n57.a(java.lang.Integer, int, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(java.lang.Integer r6, java.lang.String r7, int r8, defpackage.p92 r9) {
        /*
            r5 = this;
            boolean r0 = r9 instanceof defpackage.mtb
            if (r0 == 0) goto L13
            r0 = r9
            mtb r0 = (defpackage.mtb) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            mtb r0 = new mtb
            r0.<init>(r5, r9)
        L18:
            java.lang.Object r9 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L36
            if (r2 != r4) goto L30
            int r8 = r0.c
            java.lang.Integer r6 = r0.b
            defpackage.br7.v(r9)
            bjb r9 = (defpackage.bjb) r9
            java.lang.Object r5 = r9.a
            goto L50
        L30:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L36:
            defpackage.br7.v(r9)
            if (r6 == 0) goto L40
            int r9 = r6.intValue()
            goto L41
        L40:
            r9 = r4
        L41:
            r0.b = r6
            r0.c = r8
            r0.f = r4
            com.medium.android.unsplash.data.UnsplashRepository r5 = r5.a
            java.lang.Object r5 = r5.m69searchPhotosBWLJW6A(r7, r9, r8, r0)
            if (r5 != r1) goto L50
            return r1
        L50:
            java.lang.Throwable r7 = defpackage.bjb.b(r5)
            if (r7 == 0) goto L6c
            java.lang.StringBuilder r9 = new java.lang.StringBuilder
            java.lang.String r0 = "Failed to load page "
            r9.<init>(r0)
            r9.append(r6)
            java.lang.String r9 = r9.toString()
            uld r0 = defpackage.wld.a
            r1 = 0
            java.lang.Object[] r1 = new java.lang.Object[r1]
            r0.e(r7, r9, r1)
        L6c:
            boolean r7 = r5 instanceof defpackage.ajb
            if (r7 != 0) goto La6
            zcb r5 = (defpackage.zcb) r5
            java.lang.Object r5 = r5.b
            com.medium.android.unsplash.data.SearchResponse r5 = (com.medium.android.unsplash.data.SearchResponse) r5
            if (r5 == 0) goto L83
            int r7 = r5.getTotalPages()
            int r7 = r7 / r8
            java.lang.Integer r8 = new java.lang.Integer
            r8.<init>(r7)
            goto L84
        L83:
            r8 = r3
        L84:
            wz8 r7 = new wz8
            if (r5 == 0) goto L8e
            java.util.List r5 = r5.getResults()
            if (r5 != 0) goto L90
        L8e:
            ey3 r5 = defpackage.ey3.a
        L90:
            boolean r8 = defpackage.g76.L(r6, r8)
            if (r8 != 0) goto La2
            if (r6 == 0) goto La2
            int r6 = r6.intValue()
            int r6 = r6 + r4
            java.lang.Integer r3 = new java.lang.Integer
            r3.<init>(r6)
        La2:
            r7.<init>(r3, r5)
            return r7
        La6:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n57.b(java.lang.Integer, java.lang.String, int, p92):java.lang.Object");
    }
}
