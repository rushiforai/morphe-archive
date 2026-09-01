package defpackage;

import android.graphics.Bitmap;
import com.facebook.FacebookException;
import com.medium.android.core.models.BillingPeriod;
import com.medium.android.payments.ui.subscription.SubscriptionViewModel;
import com.medium.android.postpage.share.a;
import java.util.Calendar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class eub extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public eub(h6c h6cVar, gz8 gz8Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 5;
        this.e = h6cVar;
        this.d = gz8Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                return new eub((gz8) this.d, (hub) obj2, n92Var, 0);
            case 1:
                return new eub((FacebookException) this.d, (f3c) obj2, n92Var, 1);
            case 2:
                return new eub((Exception) this.d, (f3c) obj2, n92Var, 2);
            case 3:
                return new eub((a) this.d, (j6c) obj2, n92Var, 3);
            case 4:
                return new eub((d13) this.d, (kv6) obj2, n92Var, 4);
            case 5:
                return new eub((h6c) obj2, (gz8) this.d, n92Var);
            case 6:
                return new eub((j6c) this.d, (Bitmap) obj2, n92Var, 6);
            case 7:
                eub eubVar = new eub((j6c) obj2, n92Var, 7);
                eubVar.d = obj;
                return eubVar;
            case 8:
                return new eub((g7c) this.d, (t0c) obj2, n92Var, 8);
            case 9:
                return new eub((x7c) this.d, (y7c) obj2, n92Var, 9);
            case 10:
                eub eubVar2 = new eub((o8c) obj2, n92Var, 10);
                eubVar2.d = obj;
                return eubVar2;
            case 11:
                return new eub((bo4) this.d, (u8c) obj2, n92Var, 11);
            case 12:
                return new eub((l9c) obj2, n92Var, 12);
            case 13:
                eub eubVar3 = new eub((wac) obj2, n92Var, 13);
                eubVar3.d = obj;
                return eubVar3;
            case 14:
                eub eubVar4 = new eub((sdc) obj2, n92Var, 14);
                eubVar4.d = obj;
                return eubVar4;
            case 15:
                return new eub((o2b) obj2, n92Var, 15);
            case 16:
                return new eub((m68) this.d, (ejc) obj2, n92Var, 16);
            case 17:
                return new eub((ihc) this.d, (s4) obj2, n92Var, 17);
            case 18:
                return new eub((jhc) this.d, (s4) obj2, n92Var, 18);
            case 19:
                return new eub((ms) this.d, (ww) obj2, n92Var, 19);
            case 20:
                return new eub((kv6) this.d, (isc) obj2, n92Var, 20);
            case 21:
                return new eub((zsc) this.d, (Calendar) obj2, n92Var, 21);
            case 22:
                return new eub((hwc) this.d, (uua) obj2, n92Var, 22);
            case 23:
                return new eub((kv6) this.d, (gxc) obj2, n92Var, 23);
            case 24:
                return new eub((SubscriptionViewModel) this.d, (BillingPeriod) obj2, n92Var, 24);
            case 25:
                return new eub((j4d) this.d, (d4d) obj2, n92Var, 25);
            case 26:
                eub eubVar5 = new eub((j4d) obj2, n92Var, 26);
                eubVar5.d = obj;
                return eubVar5;
            case 27:
                return new eub((kv6) this.d, (t9d) obj2, n92Var, 27);
            case 28:
                return new eub((upc) this.d, (x45) obj2, n92Var, 28);
            default:
                return new eub((kv6) this.d, (ted) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((eub) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:209:0x0472, code lost:
    
        if (r1.invoke(r2, r4) != r0) goto L211;
     */
    /* JADX WARN: Code restructure failed: missing block: B:341:0x07a8, code lost:
    
        if (r2.a(r3, r4) == r1) goto L342;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:158:0x0392  */
    /* JADX WARN: Removed duplicated region for block: B:208:0x046a A[PHI: r1 r2
      0x046a: PHI (r1v70 r91) = (r1v76 r91), (r1v83 r91) binds: [B:206:0x0467, B:202:0x0431] A[DONT_GENERATE, DONT_INLINE]
      0x046a: PHI (r2v43 java.lang.Object) = (r2v46 java.lang.Object), (r2v47 java.lang.Object) binds: [B:206:0x0467, B:202:0x0431] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:253:0x055e A[PHI: r0 r4
      0x055e: PHI (r0v45 java.lang.Object) = (r0v44 java.lang.Object), (r0v44 java.lang.Object), (r0v50 java.lang.Object) binds: [B:249:0x0544, B:251:0x055b, B:243:0x0511] A[DONT_GENERATE, DONT_INLINE]
      0x055e: PHI (r4v5 eub) = (r4v4 eub), (r4v4 eub), (r4v0 eub) binds: [B:249:0x0544, B:251:0x055b, B:243:0x0511] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:255:0x0564  */
    /* JADX WARN: Removed duplicated region for block: B:312:0x06a1  */
    /* JADX WARN: Removed duplicated region for block: B:479:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:494:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r1v41, types: [g7c] */
    /* JADX WARN: Type inference failed for: r3v0, types: [int] */
    /* JADX WARN: Type inference failed for: r3v26, types: [int] */
    /* JADX WARN: Type inference failed for: r3v29, types: [c7c] */
    /* JADX WARN: Type inference failed for: r3v30 */
    /* JADX WARN: Type inference failed for: r3v48 */
    /* JADX WARN: Type inference failed for: r3v49 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:209:0x0472 -> B:211:0x0476). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r31) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 2526
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.eub.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ eub(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ eub(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
    }
}
