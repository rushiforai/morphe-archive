package defpackage;

import android.content.res.Resources;
import com.medium.android.graphql.fragment.FullPostData;
import com.medium.android.graphql.fragment.PostMetaData;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zo5 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zo5(Object obj, Object obj2, Object obj3, Object obj4, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.g = obj;
        this.d = obj2;
        this.e = obj3;
        this.f = obj4;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.f;
        switch (i) {
            case 0:
                return new zo5((ap5) this.g, (String) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 0);
            case 1:
                return new zo5((bq5) this.g, (String) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 1);
            case 2:
                return new zo5((bo4) this.g, (vq5) this.d, (j78) this.e, (j78) obj2, n92Var, 2);
            case 3:
                zo5 zo5Var = new zo5((l78) this.e, (n16) obj2, n92Var, 3);
                zo5Var.d = obj;
                return zo5Var;
            case 4:
                return new zo5((m88) this.g, (nhc) this.d, (Resources) this.e, (h88) obj2, n92Var, 4);
            case 5:
                return new zo5((m88) this.g, (nhc) this.d, (Resources) this.e, (j88) obj2, n92Var, 5);
            case 6:
                zo5 zo5Var2 = new zo5((hwb) this.d, (ba8) this.e, (dsd) obj2, n92Var);
                zo5Var2.g = obj;
                return zo5Var2;
            case 7:
                zo5 zo5Var3 = new zo5((uz) obj2, n92Var, 7);
                zo5Var3.e = obj;
                return zo5Var3;
            case 8:
                return new zo5((nk8) this.g, (nhc) this.d, (Resources) this.e, (jk8) obj2, n92Var, 8);
            case 9:
                return new zo5((tk8) this.e, (String) this.d, (SourceParameter) obj2, n92Var, 9);
            case 10:
                return new zo5((al8) this.g, (nhc) this.d, (Resources) this.e, (wk8) obj2, n92Var, 10);
            case 11:
                return new zo5((nl8) this.e, (String) this.d, (SourceParameter) obj2, n92Var, 11);
            case 12:
                zo5 zo5Var4 = new zo5((wp9) obj2, n92Var, 12);
                zo5Var4.e = obj;
                return zo5Var4;
            case 13:
                return new zo5((sw9) this.g, (PostMetaData) this.d, (nya) this.e, (rya) obj2, n92Var, 13);
            case 14:
                return new zo5((n39) this.g, (sw9) this.d, (FullPostData) this.e, (m45) obj2, n92Var, 14);
            case 15:
                return new zo5((fx9) this.g, (nhc) this.d, (Resources) this.e, (md3) obj2, n92Var, 15);
            case 16:
                return new zo5((qx9) this.g, (String) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 16);
            case 17:
                return new zo5((q1a) this.g, (nhc) this.d, (sb2) this.e, (Resources) obj2, n92Var, 17);
            case 18:
                zo5 zo5Var5 = new zo5((n4a) obj2, n92Var, 18);
                zo5Var5.e = obj;
                return zo5Var5;
            case 19:
                return new zo5((kaa) this.g, (nhc) this.d, (Resources) this.e, (a1a) obj2, n92Var, 19);
            case 20:
                return new zo5((lca) this.g, (nhc) this.d, (Resources) this.e, (mba) obj2, n92Var, 20);
            case 21:
                zo5 zo5Var6 = new zo5(this.e, (lca) obj2, n92Var, 21);
                zo5Var6.d = obj;
                return zo5Var6;
            case 22:
                return new zo5((lca) this.g, (String) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 22);
            case 23:
                return new zo5((rca) this.g, (nhc) this.d, (Resources) this.e, (gg5) obj2, n92Var, 23);
            case 24:
                return new zo5((gga) this.g, (ohc) this.d, (Resources) this.e, (mda) obj2, n92Var, 24);
            case 25:
                return new zo5((oha) this.g, (nhc) this.d, (Resources) this.e, (lha) obj2, n92Var, 25);
            case 26:
                return new zo5((rja) this.g, (nhc) this.d, (Resources) this.e, (md3) obj2, n92Var, 26);
            case 27:
                return new zo5((rja) this.g, (String) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 27);
            case 28:
                return new zo5((nna) this.g, (nhc) this.d, (Resources) this.e, (nla) obj2, n92Var, 28);
            default:
                return new zo5((nna) this.g, (String) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((zo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:280:0x05f0, code lost:
    
        if (defpackage.r6c.m(r3, r4, r5) != r1) goto L282;
     */
    /* JADX WARN: Code restructure failed: missing block: B:425:0x09a1, code lost:
    
        if (defpackage.dm2.D(r3, r7, r5) == r0) goto L426;
     */
    /* JADX WARN: Removed duplicated region for block: B:197:0x0424  */
    /* JADX WARN: Removed duplicated region for block: B:301:0x065b A[PHI: r0 r5
      0x065b: PHI (r0v60 g8e) = (r0v59 g8e), (r0v59 g8e), (r0v64 g8e) binds: [B:297:0x0642, B:299:0x0658, B:291:0x0612] A[DONT_GENERATE, DONT_INLINE]
      0x065b: PHI (r5v16 zo5) = (r5v15 zo5), (r5v15 zo5), (r5v0 zo5) binds: [B:297:0x0642, B:299:0x0658, B:291:0x0612] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:336:0x0725 A[PHI: r0 r5
      0x0725: PHI (r0v44 b8e) = (r0v42 b8e), (r0v43 b8e), (r0v50 b8e) binds: [B:329:0x06fc, B:334:0x0722, B:322:0x06c4] A[DONT_GENERATE, DONT_INLINE]
      0x0725: PHI (r5v12 zo5) = (r5v10 zo5), (r5v11 zo5), (r5v0 zo5) binds: [B:329:0x06fc, B:334:0x0722, B:322:0x06c4] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:421:0x097d  */
    /* JADX WARN: Removed duplicated region for block: B:424:0x0989  */
    /* JADX WARN: Removed duplicated region for block: B:502:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:510:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:529:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:535:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:423:0x0987 -> B:428:0x09a5). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:425:0x09a1 -> B:428:0x09a5). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r21) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 2756
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zo5.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zo5(que queVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = queVar;
        this.d = str;
        this.f = sourceParameter;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zo5(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zo5(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.f = obj2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zo5(hwb hwbVar, ba8 ba8Var, dsd dsdVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 6;
        this.d = hwbVar;
        this.e = ba8Var;
        this.f = dsdVar;
    }
}
