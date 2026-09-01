package defpackage;

import androidx.work.impl.workers.ConstraintTrackingWorker;
import com.medium.android.donkey.DonkeyApplication;
import com.medium.android.explore.ui.ExploreFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m1(nsb nsbVar, int i, n92 n92Var, int i2) {
        super(2, n92Var);
        this.b = i2;
        this.d = nsbVar;
        this.c = i;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                return new m1((n1) obj2, n92Var, 0);
            case 1:
                return new m1((ua) obj2, n92Var, 1);
            case 2:
                return new m1((ze) obj2, n92Var, 2);
            case 3:
                return new m1((lb0) obj2, n92Var, 3);
            case 4:
                return new m1((lig) obj2, n92Var, 4);
            case 5:
                return new m1((gq0) obj2, n92Var, 5);
            case 6:
                return new m1((ConstraintTrackingWorker) obj2, n92Var, 6);
            case 7:
                return new m1((gl2) obj2, n92Var, 7);
            case 8:
                return new m1((my2) obj2, n92Var, 8);
            case 9:
                return new m1((qe3) obj2, n92Var, 9);
            case 10:
                return new m1((DonkeyApplication) obj2, n92Var, 10);
            case 11:
                return new m1((tj3) obj2, n92Var, 11);
            case 12:
                return new m1((ExploreFragment) obj2, n92Var, 12);
            case 13:
                return new m1((f74) obj2, n92Var, 13);
            case 14:
                return new m1((v16) obj2, n92Var, 14);
            case 15:
                return new m1((to4) obj2, n92Var, 15);
            case 16:
                return new m1((ls4) obj2, n92Var, 16);
            case 17:
                return new m1((qu4) obj2, n92Var, 17);
            case 18:
                return new m1((sx4) obj2, n92Var, 18);
            case 19:
                return new m1((x80) obj2, n92Var, 19);
            case 20:
                return new m1((xc5) obj2, n92Var, 20);
            case 21:
                return new m1((dl5) obj2, n92Var, 21);
            case 22:
                return new m1((ar5) obj2, n92Var, 22);
            case 23:
                return new m1((lv5) obj2, n92Var, 23);
            case 24:
                return new m1((x86) obj2, n92Var, 24);
            case 25:
                return new m1((ur6) obj2, this.c, n92Var, 25);
            case 26:
                return new m1((gg5) obj2, n92Var, 26);
            case 27:
                return new m1((pw6) obj2, this.c, n92Var, 27);
            case 28:
                return new m1((me7) obj2, n92Var, 28);
            default:
                return new m1((pe7) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) throws Throwable {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 25:
                ((m1) create((xrb) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 27:
                ((m1) create((xrb) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
        }
        return ((m1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0059, code lost:
    
        if (defpackage.gr7.o(getContext()).a(new defpackage.rd5(r4, r2), r16) == r1) goto L21;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Path cross not found for [B:14:0x0034, B:17:0x003d], limit reached: 463 */
    /* JADX WARN: Path cross not found for [B:17:0x003d, B:14:0x0034], limit reached: 463 */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0030  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00c5  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x003f -> B:12:0x0030). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x0059 -> B:23:0x005d). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r17) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1718
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m1.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m1(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
    }
}
