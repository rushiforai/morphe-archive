package defpackage;

import com.medium.android.profile.ui.you.YouProfileFragment;
import com.medium.android.yourfollowingfeed.ui.YourFollowingFeedFragment;
import com.medium.android.yourlibrary.YourLibraryFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ood extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ood(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                return new ood((mt2) obj2, n92Var, 0);
            case 1:
                return new ood((mtd) obj2, n92Var, 1);
            case 2:
                return new ood((e2e) obj2, n92Var, 2);
            case 3:
                return new ood((mfe) obj2, n92Var, 3);
            case 4:
                return new ood((rya) obj2, n92Var, 4);
            case 5:
                return new ood((j2f) obj2, n92Var, 5);
            case 6:
                return new ood((t2f) obj2, n92Var, 6);
            case 7:
                return new ood((w6f) obj2, n92Var, 7);
            case 8:
                return new ood((YouProfileFragment) obj2, n92Var, 8);
            case 9:
                return new ood((YourFollowingFeedFragment) obj2, n92Var, 9);
            case 10:
                return new ood((YourLibraryFragment) obj2, n92Var, 10);
            case 11:
                return new ood((x2g) obj2, n92Var, 11);
            default:
                return new ood((h9g) obj2, n92Var, 12);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((ood) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((ood) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((ood) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((ood) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((ood) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((ood) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                return ((ood) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 7:
                return ((ood) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 8:
                return ((ood) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 9:
                return ((ood) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 10:
                return ((ood) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 11:
                return ((ood) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((ood) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:63:0x0109, code lost:
    
        if (r2.a(defpackage.u6f.a, r22) == r1) goto L67;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x011d, code lost:
    
        if (r2.a(defpackage.t6f.a, r22) == r1) goto L67;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r23) {
        /*
            Method dump skipped, instruction units count: 672
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ood.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
