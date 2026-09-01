package defpackage;

import android.content.res.Resources;
import android.graphics.Bitmap;
import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mw9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public final /* synthetic */ Object e;
    public /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mw9(que queVar, String str, Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = queVar;
        this.e = str;
        this.f = obj;
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x003a, code lost:
    
        if (r0.b(r1, r7) == r2) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0048, code lost:
    
        if (defpackage.vx0.m0(r1, r3, r7) == r2) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x004a, code lost:
    
        return r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object i(java.lang.Object r8) {
        /*
            r7 = this;
            java.lang.Object r0 = r7.e
            bo4 r0 = (defpackage.bo4) r0
            java.lang.Object r1 = r7.f
            ib2 r1 = (defpackage.ib2) r1
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r7.c
            r4 = 0
            r5 = 2
            r6 = 1
            if (r3 == 0) goto L20
            if (r3 == r6) goto L1c
            if (r3 != r5) goto L16
            goto L1c
        L16:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r4
        L1c:
            defpackage.br7.v(r8)
            goto L4b
        L20:
            defpackage.br7.v(r8)
            java.lang.Object r8 = r7.d
            k2a r8 = (defpackage.k2a) r8
            zx3 r3 = defpackage.zx3.a
            boolean r3 = defpackage.g76.L(r1, r3)
            if (r3 == 0) goto L3d
            go4 r1 = new go4
            r1.<init>(r8, r6)
            r7.c = r6
            java.lang.Object r7 = r0.b(r1, r7)
            if (r7 != r2) goto L4b
            goto L4a
        L3d:
            ho4 r3 = new ho4
            r3.<init>(r0, r8, r4, r6)
            r7.c = r5
            java.lang.Object r7 = defpackage.vx0.m0(r1, r3, r7)
            if (r7 != r2) goto L4b
        L4a:
            return r2
        L4b:
            c1e r7 = defpackage.c1e.a
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mw9.i(java.lang.Object):java.lang.Object");
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                return new mw9((sw9) this.d, (s79) this.f, (String) obj2, n92Var, 0);
            case 1:
                return new mw9((que) this.d, (String) obj2, this.f, n92Var, 1);
            case 2:
                return new mw9((j1a) this.d, (nhc) this.f, (Resources) obj2, n92Var, 2);
            case 3:
                return new mw9((q1a) this.f, (k1a) obj2, n92Var, 3);
            case 4:
                return new mw9((que) this.d, (String) obj2, this.f, n92Var, 4);
            case 5:
                return new mw9((que) this.d, (String) obj2, this.f, n92Var, 5);
            case 6:
                return new mw9((ohc) this.d, (Resources) this.f, (mda) obj2, n92Var, 6);
            case 7:
                return new mw9((fha) this.f, (PublicationData) obj2, n92Var, 7);
            case 8:
                return new mw9((que) this.d, (String) obj2, this.f, n92Var, 8);
            case 9:
                return new mw9((que) this.d, (String) obj2, this.f, n92Var, 9);
            case 10:
                return new mw9((gz8) this.d, (nla) this.f, (hna) obj2, n92Var, 10);
            case 11:
                return new mw9((que) this.d, (String) obj2, this.f, n92Var, 11);
            case 12:
                mw9 mw9Var = new mw9((kva) this.f, (rx5) obj2, n92Var, 12);
                mw9Var.d = obj;
                return mw9Var;
            case 13:
                mw9 mw9Var2 = new mw9((rwa) this.f, (ft) obj2, n92Var, 13);
                mw9Var2.d = obj;
                return mw9Var2;
            case 14:
                return new mw9((m45) this.d, (v7c) this.f, (h4b) obj2, n92Var, 14);
            case 15:
                return new mw9((m45) this.d, (v7c) this.f, (l8b) obj2, n92Var, 15);
            case 16:
                mw9 mw9Var3 = new mw9((z9b) obj2, n92Var);
                mw9Var3.f = obj;
                return mw9Var3;
            case 17:
                return new mw9((zhb) this.d, (kv6) this.f, (lgb) obj2, n92Var, 17);
            case 18:
                return new mw9((nib) this.f, (String) obj2, n92Var, 18);
            case 19:
                mw9 mw9Var4 = new mw9((vx1) this.f, (b55) obj2, n92Var, 19);
                mw9Var4.d = obj;
                return mw9Var4;
            case 20:
                mw9 mw9Var5 = new mw9((dl3) this.f, (vsb) obj2, n92Var, 20);
                mw9Var5.d = obj;
                return mw9Var5;
            case 21:
                mw9 mw9Var6 = new mw9((vsb) this.f, (b55) obj2, n92Var, 21);
                mw9Var6.d = obj;
                return mw9Var6;
            case 22:
                mw9 mw9Var7 = new mw9((upc) this.f, (ou) obj2, n92Var, 22);
                mw9Var7.d = obj;
                return mw9Var7;
            case 23:
                return new mw9((bo4) this.d, (nhc) this.f, (Resources) obj2, n92Var, 23);
            case 24:
                return new mw9((ctg) this.f, (f3c) obj2, n92Var, 24);
            case 25:
                return new mw9((x45) this.f, (of5) obj2, n92Var, 25);
            case 26:
                return new mw9((j6c) this.f, (Bitmap) obj2, n92Var, 26);
            case 27:
                return new mw9((bgc) this.d, (s78) this.f, (ku2) obj2, n92Var, 27);
            case 28:
                mw9 mw9Var8 = new mw9((ib2) this.f, (bo4) obj2, n92Var, 28);
                mw9Var8.d = obj;
                return mw9Var8;
            default:
                return new mw9((uoc) this.d, (nhc) this.f, (Resources) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 7:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 8:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 9:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 10:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 11:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 12:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 13:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 14:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 15:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 16:
                return ((mw9) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 17:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 18:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 19:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 20:
                return ((mw9) create((tsb) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 21:
                return ((mw9) create((xrb) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 22:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 23:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 24:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 25:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 26:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 27:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 28:
                return ((mw9) create((k2a) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((mw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:103:0x0211, code lost:
    
        if (r2.a(r5, r1) == r3) goto L107;
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x0224, code lost:
    
        if (r2.a(r5, r1) == r3) goto L107;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:190:0x03aa  */
    /* JADX WARN: Removed duplicated region for block: B:193:0x03ba A[PHI: r3
      0x03ba: PHI (r3v61 java.lang.Object) = (r3v60 java.lang.Object), (r3v60 java.lang.Object), (r3v65 java.lang.Object) binds: [B:189:0x03a8, B:191:0x03b7, B:179:0x037a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:195:0x03c0  */
    /* JADX WARN: Removed duplicated region for block: B:330:0x066e  */
    /* JADX WARN: Removed duplicated region for block: B:333:0x068e  */
    /* JADX WARN: Removed duplicated region for block: B:390:0x0806 A[PHI: r5
      0x0806: PHI (r5v16 java.lang.Object) = (r5v15 java.lang.Object), (r5v15 java.lang.Object), (r5v20 java.lang.Object) binds: [B:386:0x07df, B:388:0x0803, B:380:0x07b7] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:392:0x080c  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x013c  */
    /* JADX WARN: Removed duplicated region for block: B:480:0x0a09  */
    /* JADX WARN: Removed duplicated region for block: B:485:0x0a20  */
    /* JADX WARN: Removed duplicated region for block: B:488:0x0a2b  */
    /* JADX WARN: Removed duplicated region for block: B:491:0x0a36  */
    /* JADX WARN: Removed duplicated region for block: B:528:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:552:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:561:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:593:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:98:0x01ec  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r26) {
        /*
            Method dump skipped, instruction units count: 2890
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mw9.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mw9(z9b z9bVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 16;
        this.e = z9bVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mw9(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.e = obj2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mw9(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.f = obj2;
        this.e = obj3;
    }
}
