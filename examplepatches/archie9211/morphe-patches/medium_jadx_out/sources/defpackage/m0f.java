package defpackage;

import com.medium.android.graphql.GetSubscriberGlobalStatsQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class m0f {
    public final rrc a;
    public final r6c b = k40.x(0, 7, null);

    public m0f(rrc rrcVar) {
        this.a = rrcVar;
    }

    public static g0f b(GetSubscriberGlobalStatsQuery.UserResult userResult) {
        GetSubscriberGlobalStatsQuery.Totals totals;
        GetSubscriberGlobalStatsQuery.Totals totals2;
        GetSubscriberGlobalStatsQuery.OnUser onUser = userResult.getOnUser();
        GetSubscriberGlobalStatsQuery.OnNotFound onNotFound = userResult.getOnNotFound();
        GetSubscriberGlobalStatsQuery.OnSuspended onSuspended = userResult.getOnSuspended();
        GetSubscriberGlobalStatsQuery.OnAccountSuspended onAccountSuspended = userResult.getOnAccountSuspended();
        GetSubscriberGlobalStatsQuery.OnBlocked onBlocked = userResult.getOnBlocked();
        GetSubscriberGlobalStatsQuery.OnGraphqlEmptyId onGraphqlEmptyId = userResult.getOnGraphqlEmptyId();
        if (onUser == null) {
            return onNotFound != null ? new d0f(new IllegalStateException(onNotFound.getMessage())) : onSuspended != null ? new d0f(new IllegalStateException(onSuspended.getMessage())) : onAccountSuspended != null ? new d0f(new IllegalStateException(onAccountSuspended.getMessage())) : onBlocked != null ? new d0f(new IllegalStateException(onBlocked.getMessage())) : onGraphqlEmptyId != null ? new d0f(new IllegalStateException(onGraphqlEmptyId.getMessage())) : new d0f(new IllegalStateException("Unknown error"));
        }
        GetSubscriberGlobalStatsQuery.AudienceStats audienceStats = onUser.getViewerEdge().getAudienceStats();
        Integer subscribersPreviousMonth = null;
        Integer subscribers = (audienceStats == null || (totals2 = audienceStats.getTotals()) == null) ? null : totals2.getSubscribers();
        if (subscribers == null || subscribers.intValue() == 0) {
            return c0f.a;
        }
        Long createdAt = onUser.getViewerEdge().getCreatedAt();
        if (createdAt == null || createdAt.longValue() <= 0) {
            createdAt = null;
        }
        int iIntValue = subscribers.intValue();
        GetSubscriberGlobalStatsQuery.AudienceStats audienceStats2 = onUser.getViewerEdge().getAudienceStats();
        if (audienceStats2 != null && (totals = audienceStats2.getTotals()) != null) {
            subscribersPreviousMonth = totals.getSubscribersPreviousMonth();
        }
        return new f0f(createdAt, iIntValue, subscribersPreviousMonth, false);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r5, defpackage.yd4 r6, defpackage.p92 r7) {
        /*
            r4 = this;
            boolean r0 = r7 instanceof defpackage.i0f
            if (r0 == 0) goto L13
            r0 = r7
            i0f r0 = (defpackage.i0f) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            i0f r0 = new i0f
            r0.<init>(r4, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r4 = r7.a
            return r4
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r7)
            r0.d = r3
            rrc r4 = r4.a
            java.lang.Object r4 = r4.h(r5, r6, r0)
            if (r4 != r1) goto L40
            return r1
        L40:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m0f.a(java.lang.String, yd4, p92):java.lang.Object");
    }
}
