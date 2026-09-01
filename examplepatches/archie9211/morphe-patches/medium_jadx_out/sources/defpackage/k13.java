package defpackage;

import com.medium.android.graphql.fragment.HomeFeedItemData;
import com.medium.android.graphql.fragment.PostPreviewData;
import com.medium.android.graphql.fragment.TopicFeedItemData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class k13 extends p4d implements d55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ k13(Object obj, Object obj2, n92 n92Var, int i) {
        super(4, n92Var);
        this.b = i;
        this.e = obj;
        this.f = obj2;
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x02e3  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r59) {
        /*
            Method dump skipped, instruction units count: 1220
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k13.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj5 = this.f;
        switch (i) {
            case 0:
                ((Number) obj3).longValue();
                k13 k13Var = new k13((pya) this.e, (l13) obj5, (n92) obj4, 0);
                k13Var.d = (Throwable) obj2;
                return k13Var.invokeSuspend(c1eVar);
            case 1:
                int iIntValue = ((Number) obj).intValue();
                k13 k13Var2 = new k13(1, (n92) obj4, (bq5) obj5);
                k13Var2.c = iIntValue;
                k13Var2.d = (HomeFeedItemData) obj2;
                k13Var2.e = (PostPreviewData) obj3;
                return k13Var2.invokeSuspend(c1eVar);
            case 2:
                ((Number) obj3).intValue();
                k13 k13Var3 = new k13((n57) this.e, (String) obj5, (n92) obj4, 2);
                k13Var3.d = (Integer) obj;
                return k13Var3.invokeSuspend(c1eVar);
            case 3:
                int iIntValue2 = ((Number) obj).intValue();
                k13 k13Var4 = new k13(3, (n92) obj4, (had) obj5);
                k13Var4.c = iIntValue2;
                k13Var4.d = (TopicFeedItemData) obj2;
                k13Var4.e = (PostPreviewData) obj3;
                return k13Var4.invokeSuspend(c1eVar);
            case 4:
                int iIntValue3 = ((Number) obj).intValue();
                k13 k13Var5 = new k13(4, (n92) obj4, (odd) obj5);
                k13Var5.c = iIntValue3;
                k13Var5.d = (TopicFeedItemData) obj2;
                k13Var5.e = (PostPreviewData) obj3;
                return k13Var5.invokeSuspend(c1eVar);
            default:
                int iIntValue4 = ((Number) obj).intValue();
                k13 k13Var6 = new k13(5, (n92) obj4, (ref) obj5);
                k13Var6.c = iIntValue4;
                k13Var6.d = (HomeFeedItemData) obj2;
                k13Var6.e = (PostPreviewData) obj3;
                return k13Var6.invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ k13(int i, n92 n92Var, que queVar) {
        super(4, n92Var);
        this.b = i;
        this.f = queVar;
    }
}
