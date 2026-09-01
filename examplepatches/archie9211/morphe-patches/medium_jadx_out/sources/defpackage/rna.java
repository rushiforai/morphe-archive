package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import com.google.firebase.auth.FirebaseAuth;
import com.medium.android.postpage.share.a;
import com.medium.android.settings.main.SettingsFragment;
import gen.model.SourceParameter;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rna extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public /* synthetic */ Object e;
    public Object f;
    public final /* synthetic */ Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rna(Object obj, Object obj2, Object obj3, Object obj4, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.d = obj2;
        this.e = obj3;
        this.g = obj4;
    }

    private final Object i(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            u50 u50VarE = no7.E(new dl((sl) this.f, 5));
            om1 om1Var = new om1((l78) this.d, (l78) this.e, (l78) this.g, (n92) null);
            this.c = 1;
            if (wgf.h(u50VarE, om1Var, this) == tb2Var) {
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

    private final Object n(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            uua uuaVar = ((had) this.f).n;
            eh9 eh9Var = new eh9((nhc) this.d, (Resources) this.e, (u9d) this.g, 17);
            this.c = 1;
            if (uuaVar.a.b(eh9Var, this) == tb2Var) {
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

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0052, code lost:
    
        if (r11.a(r0, r10) == r1) goto L15;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object o(java.lang.Object r12) {
        /*
            r11 = this;
            java.lang.Object r0 = r11.f
            had r0 = (defpackage.had) r0
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r11.c
            r3 = 2
            r4 = 1
            if (r2 == 0) goto L20
            if (r2 == r4) goto L1b
            if (r2 != r3) goto L14
            defpackage.br7.v(r12)
            goto L55
        L14:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            r11 = 0
            return r11
        L1b:
            defpackage.br7.v(r12)
            r10 = r11
            goto L43
        L20:
            defpackage.br7.v(r12)
            r12 = r4
            tl r4 = r0.f
            java.lang.String r9 = r0.c
            java.lang.String r8 = r0.o
            java.lang.Object r2 = r11.d
            r5 = r2
            java.lang.String r5 = (java.lang.String) r5
            java.lang.Object r2 = r11.e
            r6 = r2
            java.lang.String r6 = (java.lang.String) r6
            java.lang.Object r2 = r11.g
            r7 = r2
            gen.model.SourceParameter r7 = (gen.model.SourceParameter) r7
            r11.c = r12
            r10 = r11
            java.lang.Object r12 = r4.u(r5, r6, r7, r8, r9, r10)
            if (r12 != r1) goto L43
            goto L54
        L43:
            g0e r12 = (defpackage.g0e) r12
            r6c r11 = r0.m
            y9d r0 = new y9d
            r0.<init>(r12)
            r10.c = r3
            java.lang.Object r11 = r11.a(r0, r10)
            if (r11 != r1) goto L55
        L54:
            return r1
        L55:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rna.o(java.lang.Object):java.lang.Object");
    }

    private final Object r(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            fa4 fa4Var = fa4.i;
            g01 g01Var = ((ecd) ((jcd) this.f)).a;
            nhc nhcVar = (nhc) this.d;
            Resources resources = (Resources) this.e;
            kbd kbdVar = (kbd) this.g;
            this.c = 1;
            if (fa4Var.A(g01Var, nhcVar, resources, kbdVar, this) == tb2Var) {
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

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.g;
        switch (i) {
            case 0:
                return new rna((tna) this.f, (nhc) this.d, (Resources) this.e, (gg5) obj2, n92Var, 0);
            case 1:
                return new rna((nua) this.f, (nhc) this.d, (Resources) this.e, (wta) obj2, n92Var, 1);
            case 2:
                return new rna((nua) this.f, (String) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 2);
            case 3:
                return new rna((b4b) this.f, (Map) this.d, (nx9) this.e, (au2) obj2, n92Var, 3);
            case 4:
                return new rna((a98) this.e, (b55) obj2, n92Var);
            case 5:
                rna rnaVar = new rna((wx6) this.d, (vx6) this.e, (b55) obj2, n92Var, 5);
                rnaVar.f = obj;
                return rnaVar;
            case 6:
                return new rna((bo4) this.f, (nhc) this.d, (Resources) this.e, (k5b) obj2, n92Var, 6);
            case 7:
                return new rna((k6b) this.f, (nhc) this.d, (Resources) this.e, (my6) obj2, n92Var, 7);
            case 8:
                return new rna((bo4) this.f, (nhc) this.d, (Resources) this.e, (m6b) obj2, n92Var, 8);
            case 9:
                return new rna((bo4) this.f, (nhc) this.d, (Resources) this.e, (c7b) obj2, n92Var, 9);
            case 10:
                return new rna((xab) this.f, (nhc) this.d, (Resources) this.e, (oab) obj2, n92Var, 10);
            case 11:
                return new rna((nib) this.f, (nhc) this.d, (Resources) this.e, (kv6) obj2, n92Var, 11);
            case 12:
                return new rna((nib) this.d, (String) this.e, (String) obj2, n92Var, 12);
            case 13:
                rna rnaVar2 = new rna((elb) this.d, (x51) this.e, (nx9) obj2, n92Var, 13);
                rnaVar2.f = obj;
                return rnaVar2;
            case 14:
                rna rnaVar3 = new rna((x45) this.d, (AtomicReference) this.e, (b55) obj2, n92Var, 14);
                rnaVar3.f = obj;
                return rnaVar3;
            case 15:
                return new rna((jrg) this.d, (SettingsFragment) this.e, (FirebaseAuth) obj2, n92Var, 15);
            case 16:
                return new rna((ca7) this.d, (s2a) this.e, (f3c) obj2, n92Var, 16);
            case 17:
                return new rna((bo4) this.f, (Context) this.d, (Resources) this.e, (i5c) obj2, n92Var, 17);
            case 18:
                return new rna((j6c) this.f, (nhc) this.d, (Resources) this.e, (a) obj2, n92Var, 18);
            case 19:
                return new rna((b55) this.d, (of5) this.e, (String) obj2, n92Var, 19);
            case 20:
                return new rna((j6c) this.d, (Bitmap) this.e, (String) obj2, n92Var, 20);
            case 21:
                rna rnaVar4 = new rna((xmc) obj2, n92Var);
                rnaVar4.e = obj;
                return rnaVar4;
            case 22:
                return new rna((y1d) this.f, (nhc) this.d, (Resources) this.e, (p1d) obj2, n92Var, 22);
            case 23:
                return new rna((y1d) this.f, (nhc) this.d, (Resources) this.e, (s1d) obj2, n92Var, 23);
            case 24:
                return new rna((y1d) this.f, (nhc) this.d, (Resources) this.e, (r1d) obj2, n92Var, 24);
            case 25:
                return new rna((sl) this.f, (l78) this.d, (l78) this.e, (l78) obj2, n92Var, 25);
            case 26:
                return new rna((had) this.f, (nhc) this.d, (Resources) this.e, (u9d) obj2, n92Var, 26);
            case 27:
                return new rna((had) this.f, (String) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 27);
            case 28:
                return new rna((jcd) this.f, (nhc) this.d, (Resources) this.e, (kbd) obj2, n92Var, 28);
            default:
                return new rna((jcd) this.f, (nhc) this.d, (Resources) this.e, (mbd) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((rna) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:167:0x0380, code lost:
    
        if (r0.a(r2, r5) == r1) goto L171;
     */
    /* JADX WARN: Code restructure failed: missing block: B:170:0x0393, code lost:
    
        if (r0.a(r2, r5) == r1) goto L171;
     */
    /* JADX WARN: Code restructure failed: missing block: B:194:0x0421, code lost:
    
        if (r0 == r2) goto L195;
     */
    /* JADX WARN: Code restructure failed: missing block: B:215:0x04a3, code lost:
    
        if (defpackage.bo.E(r2, r5) == r0) goto L220;
     */
    /* JADX WARN: Code restructure failed: missing block: B:219:0x04b3, code lost:
    
        if (r3 == r0) goto L220;
     */
    /* JADX WARN: Code restructure failed: missing block: B:493:?, code lost:
    
        return r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x01d0, code lost:
    
        if (defpackage.r6c.m(r1, r11, r5) == r0) goto L79;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:103:0x0248  */
    /* JADX WARN: Removed duplicated region for block: B:263:0x0593  */
    /* JADX WARN: Removed duplicated region for block: B:266:0x05a2 A[PHI: r2
      0x05a2: PHI (r2v53 java.lang.Object) = (r2v49 java.lang.Object), (r2v49 java.lang.Object), (r2v54 java.lang.Object) binds: [B:262:0x0591, B:264:0x059f, B:249:0x0554] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:268:0x05a8  */
    /* JADX WARN: Removed duplicated region for block: B:276:0x05c7  */
    /* JADX WARN: Removed duplicated region for block: B:279:0x05d5 A[PHI: r1
      0x05d5: PHI (r1v68 java.lang.Object) = (r1v64 java.lang.Object), (r1v64 java.lang.Object), (r1v69 java.lang.Object) binds: [B:275:0x05c5, B:277:0x05d2, B:251:0x0564] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:281:0x05db  */
    /* JADX WARN: Removed duplicated region for block: B:476:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:498:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:500:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r0v51, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r1v128 */
    /* JADX WARN: Type inference failed for: r1v17 */
    /* JADX WARN: Type inference failed for: r1v18, types: [b55] */
    /* JADX WARN: Type inference failed for: r2v114 */
    /* JADX WARN: Type inference failed for: r2v115 */
    /* JADX WARN: Type inference failed for: r2v61, types: [int] */
    /* JADX WARN: Type inference failed for: r2v62, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r2v72 */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r19) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 2490
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rna.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rna(xmc xmcVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 21;
        this.g = xmcVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rna(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
        this.g = obj3;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rna(a98 a98Var, b55 b55Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 4;
        this.e = a98Var;
        this.g = b55Var;
    }
}
