package defpackage;

import android.content.Context;
import android.content.res.Resources;
import gen.model.SourceParameter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class uk8 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public Object e;
    public Object f;
    public /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uk8(bo4 bo4Var, x45 x45Var, m45 m45Var, cqb cqbVar, Resources resources, n92 n92Var) {
        super(2, n92Var);
        this.b = 16;
        this.d = bo4Var;
        this.e = x45Var;
        this.f = m45Var;
        this.h = cqbVar;
        this.g = resources;
    }

    /* JADX WARN: Removed duplicated region for block: B:74:0x0133 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0104 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object i(java.lang.Object r15) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 342
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uk8.i(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:75:0x017b, code lost:
    
        if (r3.F0(r24) != r4) goto L77;
     */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00cf  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object n(java.lang.Object r25) {
        /*
            Method dump skipped, instruction units count: 391
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uk8.n(java.lang.Object):java.lang.Object");
    }

    private final Object o(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            bo4 bo4Var = (bo4) this.d;
            dac dacVar = new dac((akc) this.f, (qlb) this.h, (nhc) this.e, (Resources) this.g, 0);
            this.c = 1;
            if (bo4Var.b(dacVar, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }

    private final Object r(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            bo4 bo4Var = (bo4) this.d;
            dac dacVar = new dac((akc) this.f, (hha) this.h, (nhc) this.e, (Resources) this.g, 1);
            this.c = 1;
            if (bo4Var.b(dacVar, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Path cross not found for [B:22:0x0070, B:27:0x008b], limit reached: 41 */
    /* JADX WARN: Path cross not found for [B:27:0x008b, B:22:0x0070], limit reached: 41 */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0081 A[Catch: all -> 0x0026, PHI: r2 r5 r7 r8
      0x0081: PHI (r2v3 java.lang.Object) = (r2v2 java.lang.Object), (r2v7 java.lang.Object) binds: [B:23:0x007e, B:15:0x003d] A[DONT_GENERATE, DONT_INLINE]
      0x0081: PHI (r5v7 ??) = (r5v12 ??), (r5v13 ??) binds: [B:23:0x007e, B:15:0x003d] A[DONT_GENERATE, DONT_INLINE]
      0x0081: PHI (r7v4 ??) = (r7v9 ??), (r7v10 ??) binds: [B:23:0x007e, B:15:0x003d] A[DONT_GENERATE, DONT_INLINE]
      0x0081: PHI (r8v3 do4) = (r8v2 do4), (r8v7 do4) binds: [B:23:0x007e, B:15:0x003d] A[DONT_GENERATE, DONT_INLINE], TryCatch #0 {all -> 0x0026, blocks: (B:15:0x003d, B:25:0x0081, B:22:0x0070, B:27:0x008b, B:8:0x0022), top: B:42:0x000c }] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x008b A[Catch: all -> 0x0026, TRY_LEAVE, TryCatch #0 {all -> 0x0026, blocks: (B:15:0x003d, B:25:0x0081, B:22:0x0070, B:27:0x008b, B:8:0x0022), top: B:42:0x000c }] */
    /* JADX WARN: Type inference failed for: r11v2, types: [b2] */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v12 */
    /* JADX WARN: Type inference failed for: r5v13 */
    /* JADX WARN: Type inference failed for: r5v14 */
    /* JADX WARN: Type inference failed for: r5v15 */
    /* JADX WARN: Type inference failed for: r5v16 */
    /* JADX WARN: Type inference failed for: r5v2, types: [wj1] */
    /* JADX WARN: Type inference failed for: r5v3 */
    /* JADX WARN: Type inference failed for: r5v5 */
    /* JADX WARN: Type inference failed for: r5v6, types: [java.lang.Object, wj1] */
    /* JADX WARN: Type inference failed for: r5v7, types: [java.lang.Object, wj1] */
    /* JADX WARN: Type inference failed for: r7v1, types: [qlb] */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v12 */
    /* JADX WARN: Type inference failed for: r7v13 */
    /* JADX WARN: Type inference failed for: r7v14 */
    /* JADX WARN: Type inference failed for: r7v2, types: [java.lang.Object, qlb] */
    /* JADX WARN: Type inference failed for: r7v3, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r7v4, types: [java.lang.Object, qlb] */
    /* JADX WARN: Type inference failed for: r7v9 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x0089 -> B:22:0x0070). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x009c -> B:22:0x0070). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object u(java.lang.Object r11) throws java.lang.Throwable {
        /*
            r10 = this;
            java.lang.Object r0 = r10.h
            m45 r0 = (defpackage.m45) r0
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r10.c
            r3 = 3
            r4 = 2
            r5 = 1
            r6 = 0
            if (r2 == 0) goto L41
            if (r2 == r5) goto L14
            if (r2 == r4) goto L2f
            if (r2 != r3) goto L29
        L14:
            java.lang.Object r2 = r10.f
            java.lang.Object r5 = r10.e
            wj1 r5 = (defpackage.wj1) r5
            java.lang.Object r7 = r10.d
            qlb r7 = (defpackage.qlb) r7
            java.lang.Object r8 = r10.g
            do4 r8 = (defpackage.do4) r8
            defpackage.br7.v(r11)     // Catch: java.lang.Throwable -> L26
            goto L70
        L26:
            r10 = move-exception
            goto La0
        L29:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r6
        L2f:
            java.lang.Object r2 = r10.f
            java.lang.Object r5 = r10.e
            wj1 r5 = (defpackage.wj1) r5
            java.lang.Object r7 = r10.d
            qlb r7 = (defpackage.qlb) r7
            java.lang.Object r8 = r10.g
            do4 r8 = (defpackage.do4) r8
            defpackage.br7.v(r11)     // Catch: java.lang.Throwable -> L26
            goto L81
        L41:
            defpackage.br7.v(r11)
            java.lang.Object r11 = r10.g
            r8 = r11
            do4 r8 = (defpackage.do4) r8
            qlb r7 = new qlb
            r7.<init>()
            vec r11 = new vec
            r11.<init>()
            r7.a = r11
            r11 = 6
            uz0 r11 = defpackage.pwd.e(r5, r11, r6)
            java.lang.Object r2 = r7.w(r11, r0)     // Catch: java.lang.Throwable -> L9e
            r10.g = r8     // Catch: java.lang.Throwable -> L9e
            r10.d = r7     // Catch: java.lang.Throwable -> L9e
            r10.e = r11     // Catch: java.lang.Throwable -> L9e
            r10.f = r2     // Catch: java.lang.Throwable -> L9e
            r10.c = r5     // Catch: java.lang.Throwable -> L9e
            java.lang.Object r5 = r8.a(r2, r10)     // Catch: java.lang.Throwable -> L9e
            if (r5 != r1) goto L6f
            goto L9b
        L6f:
            r5 = r11
        L70:
            r10.g = r8     // Catch: java.lang.Throwable -> L26
            r10.d = r7     // Catch: java.lang.Throwable -> L26
            r10.e = r5     // Catch: java.lang.Throwable -> L26
            r10.f = r2     // Catch: java.lang.Throwable -> L26
            r10.c = r4     // Catch: java.lang.Throwable -> L26
            java.lang.Object r11 = r5.q(r10)     // Catch: java.lang.Throwable -> L26
            if (r11 != r1) goto L81
            goto L9b
        L81:
            java.lang.Object r11 = r7.w(r5, r0)     // Catch: java.lang.Throwable -> L26
            boolean r9 = defpackage.g76.L(r11, r2)     // Catch: java.lang.Throwable -> L26
            if (r9 != 0) goto L70
            r10.g = r8     // Catch: java.lang.Throwable -> L26
            r10.d = r7     // Catch: java.lang.Throwable -> L26
            r10.e = r5     // Catch: java.lang.Throwable -> L26
            r10.f = r11     // Catch: java.lang.Throwable -> L26
            r10.c = r3     // Catch: java.lang.Throwable -> L26
            java.lang.Object r2 = r8.a(r11, r10)     // Catch: java.lang.Throwable -> L26
            if (r2 != r1) goto L9c
        L9b:
            return r1
        L9c:
            r2 = r11
            goto L70
        L9e:
            r10 = move-exception
            r5 = r11
        La0:
            java.lang.Object r11 = r7.a
            b2 r11 = (defpackage.b2) r11
            if (r11 == 0) goto La9
            r11.s0(r5)
        La9:
            java.lang.Object r11 = r7.a
            b2 r11 = (defpackage.b2) r11
            if (r11 == 0) goto Lb0
            goto Lb5
        Lb0:
            java.lang.String r0 = "Called dispose on a manager that has been disposed of"
            defpackage.xx9.b(r0)
        Lb5:
            r11.l0()
            r7.a = r6
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uk8.u(java.lang.Object):java.lang.Object");
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.h;
        switch (i) {
            case 0:
                return new uk8((nl8) this.d, (nhc) this.e, (sb2) this.f, (Resources) this.g, (wk8) obj2, n92Var, 0);
            case 1:
                return new uk8((nl8) this.d, (String) this.f, (String) this.g, (SourceParameter) obj2, n92Var, 1);
            case 2:
                return new uk8((nl8) this.d, (String) this.f, (String) this.g, (SourceParameter) obj2, n92Var, 2);
            case 3:
                uk8 uk8Var = new uk8((et8) this.g, (yd4) obj2, n92Var, 3);
                uk8Var.f = obj;
                return uk8Var;
            case 4:
                uk8 uk8Var2 = new uk8((qt8) this.g, (yd4) obj2, n92Var, 4);
                uk8Var2.f = obj;
                return uk8Var2;
            case 5:
                return new uk8((tl) this.d, (String) this.e, (String) this.f, (SourceParameter) this.g, (String) obj2, n92Var, 5);
            case 6:
                return new uk8((sw9) this.d, (nya) this.e, (rya) this.f, (rya) this.g, (pya) obj2, n92Var, 6);
            case 7:
                return new uk8((qx9) this.d, (nhc) this.e, (sb2) this.f, (Resources) this.g, (md3) obj2, n92Var, 7);
            case 8:
                return new uk8((vaa) this.d, (nhc) this.e, (sb2) this.f, (Resources) this.g, (a1a) obj2, n92Var, 8);
            case 9:
                uk8 uk8Var3 = new uk8(this.g, (lca) obj2, n92Var, 9);
                uk8Var3.f = obj;
                return uk8Var3;
            case 10:
                return new uk8((dda) this.d, (nhc) this.e, (sb2) this.f, (Resources) this.g, (gg5) obj2, n92Var, 10);
            case 11:
                return new uk8((fha) this.d, (cqb) this.e, (sb2) this.f, (Resources) this.g, (mda) obj2, n92Var, 11);
            case 12:
                return new uk8((fha) this.d, (String) this.e, (String) this.f, (String) this.g, (uga) obj2, n92Var, 12);
            case 13:
                return new uk8((zha) this.d, (nhc) this.e, (sb2) this.f, (Resources) this.g, (lha) obj2, n92Var, 13);
            case 14:
                return new uk8((pka) this.d, (nhc) this.e, (Resources) this.g, (xja) this.f, (md3) obj2, n92Var);
            case 15:
                return new uk8((pka) this.e, (String) this.f, (String) this.g, (SourceParameter) obj2, n92Var, 15);
            case 16:
                return new uk8((bo4) this.d, (x45) this.e, (m45) this.f, (cqb) obj2, (Resources) this.g, n92Var);
            case 17:
                return new uk8((nna) this.e, (String) this.f, (String) this.g, (SourceParameter) obj2, n92Var, 17);
            case 18:
                return new uk8((eoa) this.d, (nhc) this.e, (sb2) this.f, (Resources) this.g, (gg5) obj2, n92Var, 18);
            case 19:
                return new uk8((rx5) this.d, (kva) this.e, (cfc) this.f, (z46) this.g, (ew5) obj2, n92Var, 19);
            case 20:
                uk8 uk8Var4 = new uk8((swa) this.f, (rwa) this.g, (ft) obj2, n92Var, 20);
                uk8Var4.e = obj;
                return uk8Var4;
            case 21:
                return new uk8((z9b) this.d, (nhc) this.e, (zm7) obj2, (sb2) this.f, (Resources) this.g, n92Var);
            case 22:
                return new uk8((jbb) this.d, (nhc) this.e, (sb2) this.f, (Resources) this.g, (oab) obj2, n92Var, 22);
            case 23:
                return new uk8((hwb) this.f, this.g, (dsd) obj2, n92Var, 23);
            case 24:
                return new uk8(this.d, (nhc) this.e, (Resources) this.g, this.f, obj2, n92Var, 24);
            case 25:
                return new uk8((of5) this.d, (Context) this.e, (ug7) this.f, (x45) this.g, (l78) obj2, n92Var, 25);
            case 26:
                return new uk8(this.d, (nhc) this.e, (Resources) this.g, this.f, obj2, n92Var, 26);
            case 27:
                return new uk8(this.d, (nhc) this.e, (Resources) this.g, this.f, obj2, n92Var, 27);
            case 28:
                uk8 uk8Var5 = new uk8((m45) obj2, n92Var);
                uk8Var5.g = obj;
                return uk8Var5;
            default:
                return new uk8((uoc) this.e, (ArrayList) this.f, (ArrayList) this.g, (List) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((uk8) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((uk8) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 7:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 8:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 9:
                return ((uk8) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 10:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 11:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 12:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 13:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 14:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 15:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 16:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 17:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 18:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 19:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 20:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 21:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 22:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 23:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 24:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 25:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 26:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 27:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 28:
                return ((uk8) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((uk8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:381:0x095b, code lost:
    
        if (defpackage.r6c.m(r3, r6, r1) != r5) goto L383;
     */
    /* JADX WARN: Code restructure failed: missing block: B:405:0x09f2, code lost:
    
        if (defpackage.r6c.m(r3, r6, r1) != r5) goto L407;
     */
    /* JADX WARN: Removed duplicated region for block: B:147:0x038f A[PHI: r0
      0x038f: PHI (r0v126 java.lang.Object) = (r0v125 java.lang.Object), (r0v125 java.lang.Object), (r0v131 java.lang.Object) binds: [B:143:0x0379, B:145:0x038c, B:135:0x0347] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:149:0x0395  */
    /* JADX WARN: Removed duplicated region for block: B:182:0x045c A[PHI: r0
      0x045c: PHI (r0v110 java.lang.Object) = (r0v109 java.lang.Object), (r0v109 java.lang.Object), (r0v115 java.lang.Object) binds: [B:178:0x0446, B:180:0x0459, B:172:0x0416] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:184:0x0462  */
    /* JADX WARN: Removed duplicated region for block: B:220:0x0550  */
    /* JADX WARN: Removed duplicated region for block: B:226:0x059f  */
    /* JADX WARN: Removed duplicated region for block: B:427:0x0a69 A[PHI: r0 r1
      0x0a69: PHI (r0v19 g8e) = (r0v18 g8e), (r0v18 g8e), (r0v23 g8e) binds: [B:423:0x0a4b, B:425:0x0a66, B:417:0x0a18] A[DONT_GENERATE, DONT_INLINE]
      0x0a69: PHI (r1v9 uk8) = (r1v8 uk8), (r1v8 uk8), (r1v0 uk8) binds: [B:423:0x0a4b, B:425:0x0a66, B:417:0x0a18] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:449:0x0ae6 A[PHI: r0 r1
      0x0ae6: PHI (r0v8 g8e) = (r0v7 g8e), (r0v7 g8e), (r0v12 g8e) binds: [B:445:0x0acc, B:447:0x0ae3, B:439:0x0a99] A[DONT_GENERATE, DONT_INLINE]
      0x0ae6: PHI (r1v5 uk8) = (r1v4 uk8), (r1v4 uk8), (r1v0 uk8) binds: [B:445:0x0acc, B:447:0x0ae3, B:439:0x0a99] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:497:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:504:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:530:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:544:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:547:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r28) {
        /*
            Method dump skipped, instruction units count: 2964
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uk8.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uk8(m45 m45Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 28;
        this.h = m45Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uk8(nl8 nl8Var, String str, String str2, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nl8Var;
        this.f = str;
        this.g = str2;
        this.h = sourceParameter;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uk8(pka pkaVar, nhc nhcVar, Resources resources, xja xjaVar, md3 md3Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 14;
        this.d = pkaVar;
        this.e = nhcVar;
        this.g = resources;
        this.f = xjaVar;
        this.h = md3Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uk8(z9b z9bVar, nhc nhcVar, zm7 zm7Var, sb2 sb2Var, Resources resources, n92 n92Var) {
        super(2, n92Var);
        this.b = 21;
        this.d = z9bVar;
        this.e = nhcVar;
        this.h = zm7Var;
        this.f = sb2Var;
        this.g = resources;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uk8(que queVar, Serializable serializable, Serializable serializable2, Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = queVar;
        this.f = serializable;
        this.g = serializable2;
        this.h = obj;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uk8(Object obj, nhc nhcVar, Resources resources, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.f = obj2;
        this.h = obj3;
        this.e = nhcVar;
        this.g = resources;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uk8(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.g = obj;
        this.h = obj2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uk8(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.g = obj2;
        this.h = obj3;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uk8(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
        this.f = obj3;
        this.g = obj4;
        this.h = obj5;
    }
}
