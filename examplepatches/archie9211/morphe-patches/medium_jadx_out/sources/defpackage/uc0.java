package defpackage;

import android.content.Context;
import android.content.res.Resources;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uc0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public Object e;
    public Object f;
    public Object g;
    public Object h;
    public Object i;
    public /* synthetic */ Object j;
    public final /* synthetic */ Object k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uc0(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, Object obj8, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.f = obj2;
        this.g = obj3;
        this.h = obj4;
        this.i = obj5;
        this.d = obj6;
        this.j = obj7;
        this.k = obj8;
    }

    public static final void i(nya nyaVar, id1 id1Var, List list) {
        nyaVar.a = false;
        id1Var.K = null;
        vob vobVar = id1Var.z;
        vobVar.d("reorder_last_from_index", null);
        vobVar.d("reorder_last_to_index", null);
        id1Var.m(fy3.a);
        list.clear();
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.k;
        switch (i) {
            case 0:
                return new uc0((yd0) this.e, (nhc) this.f, (Resources) this.g, (zg7) this.h, (iy6) this.i, (String) this.d, (Context) this.j, (vq6) obj2, n92Var, 0);
            case 1:
                uc0 uc0Var = new uc0((id1) obj2, n92Var, (String) this.d);
                uc0Var.j = obj;
                return uc0Var;
            case 2:
                uc0 uc0Var2 = new uc0((ju3) obj2, n92Var);
                uc0Var2.j = obj;
                return uc0Var2;
            case 3:
                uc0 uc0Var3 = new uc0((rp7) this.i, (String) this.j, (Class) obj2, n92Var, 3);
                uc0Var3.h = obj;
                return uc0Var3;
            case 4:
                uc0 uc0Var4 = new uc0((rp7) this.i, (String) this.j, this.k, n92Var, 4);
                uc0Var4.h = obj;
                return uc0Var4;
            case 5:
                uc0 uc0Var5 = new uc0((n0c) this.j, (d55) obj2, n92Var, 5);
                uc0Var5.d = obj;
                return uc0Var5;
            case 6:
                return new uc0((d1c) this.j, (y0c) obj2, n92Var, 6);
            default:
                return new uc0((bo4) this.e, (g49) this.f, (j78) this.g, (j78) this.h, (j78) this.i, (j78) this.d, (j78) this.j, (j78) obj2, n92Var, 7);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((uc0) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:251:0x061d, code lost:
    
        if (defpackage.r6c.m(r3, r6, r30) != r2) goto L253;
     */
    /* JADX WARN: Code restructure failed: missing block: B:268:0x06ec, code lost:
    
        if (defpackage.r6c.m(r2, r9, r30) == r1) goto L269;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x02b6, code lost:
    
        if (defpackage.r6c.m(r3, r13, r30) != r8) goto L93;
     */
    /* JADX WARN: Removed duplicated region for block: B:245:0x0595  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0129  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0141  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0146  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0272  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x028d A[PHI: r3 r5 r6 r7
      0x028d: PHI (r3v50 nya) = (r3v47 nya), (r3v47 nya), (r3v58 nya) binds: [B:86:0x0270, B:88:0x028a, B:65:0x01a3] A[DONT_GENERATE, DONT_INLINE]
      0x028d: PHI (r5v24 nya) = (r5v21 nya), (r5v21 nya), (r5v28 nya) binds: [B:86:0x0270, B:88:0x028a, B:65:0x01a3] A[DONT_GENERATE, DONT_INLINE]
      0x028d: PHI (r6v24 rya) = (r6v23 rya), (r6v23 rya), (r6v26 rya) binds: [B:86:0x0270, B:88:0x028a, B:65:0x01a3] A[DONT_GENERATE, DONT_INLINE]
      0x028d: PHI (r7v31 rya) = (r7v28 rya), (r7v28 rya), (r7v35 rya) binds: [B:86:0x0270, B:88:0x028a, B:65:0x01a3] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r31) {
        /*
            Method dump skipped, instruction units count: 1882
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uc0.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uc0(ju3 ju3Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 2;
        this.k = ju3Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uc0(rp7 rp7Var, String str, Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.i = rp7Var;
        this.j = str;
        this.k = obj;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uc0(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.j = obj;
        this.k = obj2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uc0(id1 id1Var, n92 n92Var, String str) {
        super(2, n92Var);
        this.b = 1;
        this.k = id1Var;
        this.d = str;
    }
}
