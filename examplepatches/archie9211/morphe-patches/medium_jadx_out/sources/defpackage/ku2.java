package defpackage;

import android.content.res.Resources;
import android.speech.tts.Voice;
import com.medium.android.donkey.write.EditPostFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ku2 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public Object e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ku2(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
        this.f = obj3;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.f;
        switch (i) {
            case 0:
                ku2 ku2Var = new ku2((mu2) this.e, (b55) obj2, n92Var, 0);
                ku2Var.d = obj;
                return ku2Var;
            case 1:
                return new ku2((sy2) this.d, (s78) this.e, (ku2) obj2, n92Var, 1);
            case 2:
                ku2 ku2Var2 = new ku2((v13) this.e, (b55) obj2, n92Var, 2);
                ku2Var2.d = obj;
                return ku2Var2;
            case 3:
                return new ku2((v13) this.d, (s78) this.e, (b55) obj2, n92Var, 3);
            case 4:
                return new ku2((y23) this.d, (String) this.e, (String) obj2, n92Var, 4);
            case 5:
                return new ku2((y23) this.d, (Voice) this.e, (String) obj2, n92Var, 5);
            case 6:
                return new ku2((m45) this.d, (v7c) this.e, (t53) obj2, n92Var, 6);
            case 7:
                ku2 ku2Var3 = new ku2((wc3) obj2, n92Var, 7);
                ku2Var3.d = obj;
                return ku2Var3;
            case 8:
                return new ku2((uf3) this.d, (nhc) this.e, (Resources) obj2, n92Var, 8);
            case 9:
                ku2 ku2Var4 = new ku2((dl3) this.e, (rl3) obj2, n92Var, 9);
                ku2Var4.d = obj;
                return ku2Var4;
            case 10:
                ku2 ku2Var5 = new ku2((rl3) this.e, (nk3) obj2, n92Var, 10);
                ku2Var5.d = obj;
                return ku2Var5;
            case 11:
                return new ku2((EditPostFragment) this.e, (nld) obj2, n92Var, 11);
            case 12:
                return new ku2((nhc) this.d, (Resources) this.e, (is3) obj2, n92Var, 12);
            case 13:
                ku2 ku2Var6 = new ku2((ib4) obj2, n92Var, 13);
                ku2Var6.d = obj;
                return ku2Var6;
            case 14:
                return new ku2((kv6) this.d, (xb4) this.e, (l78) obj2, n92Var, 14);
            case 15:
                ku2 ku2Var7 = new ku2((uc4) obj2, n92Var, 15);
                ku2Var7.d = obj;
                return ku2Var7;
            case 16:
                ku2 ku2Var8 = new ku2((lig) obj2, n92Var, 16);
                ku2Var8.d = obj;
                return ku2Var8;
            case 17:
                ku2 ku2Var9 = new ku2((ad) this.e, (h00) obj2, n92Var, 17);
                ku2Var9.d = obj;
                return ku2Var9;
            case 18:
                return new ku2((fj4) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 18);
            case 19:
                return new ku2((xm4) this.d, (String) this.e, (String) obj2, n92Var, 19);
            case 20:
                ku2 ku2Var10 = new ku2((d56) this.e, (un4) obj2, n92Var, 20);
                ku2Var10.d = obj;
                return ku2Var10;
            case 21:
                ku2 ku2Var11 = new ku2((oo4) this.e, (do4) obj2, n92Var, 21);
                ku2Var11.d = obj;
                return ku2Var11;
            case 22:
                ku2 ku2Var12 = new ku2((pja) this.e, (yk) obj2, n92Var, 22);
                ku2Var12.d = obj;
                return ku2Var12;
            case 23:
                return new ku2((m68) this.d, (c56) this.e, (yh3) obj2, n92Var, 23);
            case 24:
                ku2 ku2Var13 = new ku2((qu4) obj2, n92Var, 24);
                ku2Var13.d = obj;
                return ku2Var13;
            case 25:
                return new ku2((ax4) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 25);
            case 26:
                return new ku2((sy4) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 26);
            case 27:
                ku2 ku2Var14 = new ku2((s26) this.e, (String) obj2, n92Var, 27);
                ku2Var14.d = obj;
                return ku2Var14;
            case 28:
                ku2 ku2Var15 = new ku2((s26) this.e, (String) obj2, n92Var, 28);
                ku2Var15.d = obj;
                return ku2Var15;
            default:
                return new ku2((uz0) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((ku2) create((xrb) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 7:
                return ((ku2) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 8:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 9:
                return ((ku2) create((ql) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 10:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 11:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 12:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 13:
                return ((ku2) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 14:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 15:
                return ((ku2) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 16:
                return ((ku2) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 17:
                return ((ku2) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 18:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 19:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 20:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 21:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 22:
                return ((ku2) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 23:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 24:
                return ((ku2) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 25:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 26:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 27:
                return ((ku2) create((yd4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 28:
                return ((ku2) create((yd4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((ku2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:101:0x01dc, code lost:
    
        if (r2.a(r3, r19) == r10) goto L102;
     */
    /* JADX WARN: Code restructure failed: missing block: B:127:0x0271, code lost:
    
        if (defpackage.r6c.m(r6, r7, r19) != r4) goto L129;
     */
    /* JADX WARN: Code restructure failed: missing block: B:214:0x0414, code lost:
    
        if (r2.a(r3, r19) == r10) goto L215;
     */
    /* JADX WARN: Code restructure failed: missing block: B:235:0x0497, code lost:
    
        if (defpackage.wgf.l(r4, r0, r19) != r3) goto L237;
     */
    /* JADX WARN: Code restructure failed: missing block: B:262:0x0530, code lost:
    
        if (r3.a(r12, r19) == r9) goto L270;
     */
    /* JADX WARN: Code restructure failed: missing block: B:264:0x0533, code lost:
    
        r2 = r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:266:0x0546, code lost:
    
        if (r3.a(r5, r19) == r9) goto L270;
     */
    /* JADX WARN: Code restructure failed: missing block: B:269:0x055e, code lost:
    
        if (defpackage.r6c.m(r4, r5, r19) == r9) goto L270;
     */
    /* JADX WARN: Code restructure failed: missing block: B:284:0x05b3, code lost:
    
        if (r0.a(r4, r19) == r2) goto L285;
     */
    /* JADX WARN: Code restructure failed: missing block: B:309:0x063e, code lost:
    
        if (r0.a(r4, r19) == r2) goto L310;
     */
    /* JADX WARN: Code restructure failed: missing block: B:357:0x070d, code lost:
    
        if (r0.a(r19) == r4) goto L358;
     */
    /* JADX WARN: Code restructure failed: missing block: B:412:0x0824, code lost:
    
        if (r0.a(r4, r19) == r2) goto L413;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x018c, code lost:
    
        if (r2.a(r3, r19) == r10) goto L87;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:125:0x025a  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x02f6  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0047  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0051 A[Catch: all -> 0x0025, TryCatch #3 {all -> 0x0025, blocks: (B:8:0x001f, B:18:0x0049, B:20:0x0051, B:21:0x005e, B:28:0x006e, B:15:0x003b, B:30:0x0071, B:32:0x0076, B:33:0x0077, B:14:0x0036, B:22:0x005f, B:24:0x0065), top: B:516:0x0013, inners: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:261:0x050d  */
    /* JADX WARN: Removed duplicated region for block: B:265:0x0535  */
    /* JADX WARN: Removed duplicated region for block: B:349:0x06eb  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:354:0x06fd A[PHI: r7
      0x06fd: PHI (r7v7 java.lang.Object) = (r7v6 java.lang.Object), (r7v8 java.lang.Object) binds: [B:348:0x06e9, B:353:0x06fc] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:356:0x0703  */
    /* JADX WARN: Type inference failed for: r3v0 */
    /* JADX WARN: Type inference failed for: r3v101, types: [wj1] */
    /* JADX WARN: Type inference failed for: r3v103, types: [uz0] */
    /* JADX WARN: Type inference failed for: r3v104, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r3v105, types: [wj1] */
    /* JADX WARN: Type inference failed for: r3v109 */
    /* JADX WARN: Type inference failed for: r3v110 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x0045 -> B:18:0x0049). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r20) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 2752
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ku2.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ku2(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.f = obj2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ku2(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
    }
}
