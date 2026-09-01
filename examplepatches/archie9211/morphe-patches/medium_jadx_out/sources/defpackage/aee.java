package defpackage;

import java.util.Calendar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class aee extends p4d implements b55 {
    public rya b;
    public nya c;
    public Calendar d;
    public Object e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ bee h;
    public final /* synthetic */ String i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public aee(bee beeVar, String str, n92 n92Var) {
        super(2, n92Var);
        this.h = beeVar;
        this.i = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        aee aeeVar = new aee(this.h, this.i, n92Var);
        aeeVar.g = obj;
        return aeeVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((aee) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x00df, code lost:
    
        if (r5.a(r11, r10) == r0) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00e2, code lost:
    
        r1 = r6;
        r2 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00fd, code lost:
    
        if (r5.a(r2, r10) == r0) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x011c, code lost:
    
        if (defpackage.r6c.m(r11, r1, r10) == r0) goto L41;
     */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0100 A[PHI: r6 r8
      0x0100: PHI (r6v9 nya) = (r6v7 nya), (r6v11 nya) binds: [B:28:0x00c1, B:35:0x00e4] A[DONT_GENERATE, DONT_INLINE]
      0x0100: PHI (r8v8 rya) = (r8v6 rya), (r8v9 rya) binds: [B:28:0x00c1, B:35:0x00e4] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r11) {
        /*
            Method dump skipped, instruction units count: 310
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.aee.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
