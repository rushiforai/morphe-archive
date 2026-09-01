package defpackage;

import com.facebook.FacebookException;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.graphql.type.AppConfigSupportStatus;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class j0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j0(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
    }

    private final Object i(Object obj) {
        l2a l2aVar = (l2a) this.d;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            dr0 dr0Var = new dr0(l2aVar);
            xx2 xx2Var = (xx2) ((cr0) this.e);
            xx2Var.getClass();
            synchronized (xx2Var.k) {
                xx2Var.k.add(dr0Var);
            }
            n nVar = new n((cr0) this.e, 18, dr0Var);
            this.d = null;
            this.c = 1;
            if (ur7.w(l2aVar, nVar, this) == tb2Var) {
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
        Object obj2 = this.e;
        switch (i) {
            case 0:
                return new j0((m68) this.d, (sr5) obj2, n92Var, 0);
            case 1:
                return new j0((m68) this.d, (tr5) obj2, n92Var, 1);
            case 2:
                j0 j0Var = new j0((r9) obj2, n92Var, 2);
                j0Var.d = obj;
                return j0Var;
            case 3:
                return new j0((ua) obj2, n92Var, 3);
            case 4:
                return new j0((wb) this.d, (nhc) obj2, n92Var, 4);
            case 5:
                return new j0((wb) this.d, (aa2) obj2, n92Var, 5);
            case 6:
                return new j0((oc) this.d, (nhc) obj2, n92Var, 6);
            case 7:
                return new j0((oc) this.d, (bhc) obj2, n92Var, 7);
            case 8:
                return new j0((oc) this.d, (AppConfigSupportStatus) obj2, n92Var, 8);
            case 9:
                return new j0((kv6) this.d, (tf) obj2, n92Var, 9);
            case 10:
                return new j0((kv6) this.d, (ig) obj2, n92Var, 10);
            case 11:
                return new j0((kv6) this.d, (wg) obj2, n92Var, 11);
            case 12:
                return new j0((kv6) this.d, (oh) obj2, n92Var, 12);
            case 13:
                return new j0((kv6) this.d, (hi) obj2, n92Var, 13);
            case 14:
                return new j0((kv6) this.d, (ti) obj2, n92Var, 14);
            case 15:
                return new j0((kv6) this.d, (fj) obj2, n92Var, 15);
            case 16:
                return new j0((cl) this.d, (nk3) obj2, n92Var, 16);
            case 17:
                return new j0((cq) this.d, (s26) obj2, n92Var, 17);
            case 18:
                j0 j0Var2 = new j0((kr) obj2, n92Var, 18);
                j0Var2.d = obj;
                return j0Var2;
            case 19:
                j0 j0Var3 = new j0((dd9) obj2, n92Var, 19);
                j0Var3.d = obj;
                return j0Var3;
            case 20:
                return new j0((w50) this.d, (String) obj2, n92Var, 20);
            case 21:
                return new j0((lb0) this.d, (rv2) obj2, n92Var, 21);
            case 22:
                return new j0((yd0) this.d, (FacebookException) obj2, n92Var, 22);
            case 23:
                return new j0((yd0) this.d, (SusiOperation) obj2, n92Var, 23);
            case 24:
                j0 j0Var4 = new j0((yd0) obj2, n92Var, 24);
                j0Var4.d = obj;
                return j0Var4;
            case 25:
                j0 j0Var5 = new j0((jn0) obj2, n92Var, 25);
                j0Var5.d = obj;
                return j0Var5;
            case 26:
                return new j0((zr4) this.d, (pod) obj2, n92Var, 26);
            case 27:
                j0 j0Var6 = new j0((cr0) obj2, n92Var, 27);
                j0Var6.d = obj;
                return j0Var6;
            case 28:
                return new j0((ny0) this.d, (zwa) obj2, n92Var, 28);
            default:
                return new j0((uy0) this.d, (le0) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((j0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:193:0x0491, code lost:
    
        if (defpackage.r6c.m((defpackage.r6c) r2, r5, r21) == r0) goto L194;
     */
    /* JADX WARN: Code restructure failed: missing block: B:370:0x082f, code lost:
    
        if (r0.a(r3, r21) == r8) goto L374;
     */
    /* JADX WARN: Code restructure failed: missing block: B:373:0x0841, code lost:
    
        if (r0.a(r2, r21) == r8) goto L374;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x01fb, code lost:
    
        if (defpackage.r6c.m(r4, r5, r21) != r9) goto L98;
     */
    /* JADX WARN: Removed duplicated region for block: B:154:0x039d  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x03cc  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x03e5  */
    /* JADX WARN: Removed duplicated region for block: B:367:0x081f A[PHI: r3
      0x081f: PHI (r3v11 to3) = (r3v10 to3), (r3v16 to3) binds: [B:365:0x081c, B:355:0x07d5] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:369:0x0823  */
    /* JADX WARN: Removed duplicated region for block: B:372:0x0832  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x01e9  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:157:0x03bb -> B:159:0x03bf). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r22) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 2322
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.j0.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j0(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
    }
}
