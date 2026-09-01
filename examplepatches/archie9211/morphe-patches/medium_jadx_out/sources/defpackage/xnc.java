package defpackage;

import com.medium.android.graphql.fragment.UserActivityData;
import com.medium.android.graphql.fragment.UserRepostItemData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xnc extends p4d implements c55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xnc(Object obj, n92 n92Var, int i) {
        super(3, n92Var);
        this.b = i;
        this.f = obj;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj4 = this.f;
        switch (i) {
            case 0:
                int iIntValue = ((Number) obj2).intValue();
                xnc xncVar = new xnc((ync) obj4, (n92) obj3, 0);
                xncVar.e = (do4) obj;
                xncVar.d = iIntValue;
                return xncVar.invokeSuspend(c1eVar);
            case 1:
                int iIntValue2 = ((Number) obj).intValue();
                xnc xncVar2 = new xnc((q9e) obj4, (n92) obj3, 1);
                xncVar2.d = iIntValue2;
                xncVar2.e = (UserActivityData) obj2;
                return xncVar2.invokeSuspend(c1eVar);
            default:
                int iIntValue3 = ((Number) obj).intValue();
                xnc xncVar3 = new xnc((ime) obj4, (n92) obj3, 2);
                xncVar3.d = iIntValue3;
                xncVar3.e = (UserRepostItemData) obj2;
                return xncVar3.invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:204:0x0720, code lost:
    
        if (r3.a(r1, r115) == r6) goto L219;
     */
    /* JADX WARN: Code restructure failed: missing block: B:218:0x0763, code lost:
    
        if (r3.a(r1, r115) != r6) goto L220;
     */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:148:0x05cc  */
    /* JADX WARN: Removed duplicated region for block: B:211:0x0739  */
    /* JADX WARN: Removed duplicated region for block: B:217:0x0756  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r116) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1924
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xnc.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
