package defpackage;

import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import com.medium.android.data.post.model.ReportRepostReason;
import com.medium.android.data.settings.NotificationNetwork;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mqa extends p4d implements d55 {
    public final /* synthetic */ int b;
    public /* synthetic */ boolean c;
    public /* synthetic */ boolean d;
    public /* synthetic */ Object e;
    public final /* synthetic */ que f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mqa(int i, n92 n92Var, que queVar) {
        super(4, n92Var);
        this.b = i;
        this.f = queVar;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        que queVar = this.f;
        switch (i) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                Object obj5 = ((bjb) obj2).a;
                boolean zBooleanValue2 = ((Boolean) obj3).booleanValue();
                mqa mqaVar = new mqa(0, (n92) obj4, (nqa) queVar);
                mqaVar.c = zBooleanValue;
                mqaVar.e = obj5;
                mqaVar.d = zBooleanValue2;
                return mqaVar.invokeSuspend(c1eVar);
            default:
                boolean zBooleanValue3 = ((Boolean) obj2).booleanValue();
                boolean zBooleanValue4 = ((Boolean) obj3).booleanValue();
                mqa mqaVar2 = new mqa(1, (n92) obj4, (k6b) queVar);
                mqaVar2.e = (ReportRepostReason) obj;
                mqaVar2.c = zBooleanValue3;
                mqaVar2.d = zBooleanValue4;
                return mqaVar2.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        que queVar = this.f;
        switch (i) {
            case 0:
                boolean z = this.c;
                Object obj2 = this.e;
                boolean z2 = this.d;
                br7.v(obj);
                if (!z) {
                    Boolean bool = (Boolean) ((nqa) queVar).c.a("can_request_permission");
                    return new jqa(bool != null ? bool.booleanValue() : false);
                }
                Throwable thB = bjb.b(obj2);
                if (thB != null) {
                    return new hqa(m4.I(thB));
                }
                gee geeVar = (gee) obj2;
                geeVar.getClass();
                Boolean bool2 = geeVar.b;
                nj8 nj8Var = new nj8(R.string.notification_settings_daily_digest, "allow_digest_push_notifications", bool2 != null ? bool2.booleanValue() : true);
                Boolean bool3 = geeVar.n;
                nj8 nj8Var2 = new nj8(R.string.notification_settings_todays_highlights, "allow_todays_highlights_push_notifications", bool3 != null ? bool3.booleanValue() : true);
                Boolean bool4 = geeVar.d;
                eqa eqaVar = new eqa(d46.R(nj8Var, nj8Var2, new nj8(R.string.notification_settings_editorial_topic, "allow_editorial_topic_push_notifications", bool4 != null ? bool4.booleanValue() : true)));
                NotificationNetwork notificationNetwork = geeVar.h;
                if (notificationNetwork == null) {
                    notificationNetwork = NotificationNetwork.ALL;
                }
                oj8 oj8Var = new oj8("allow_post_push_notifications", R.string.notification_settings_post, notificationNetwork);
                Boolean bool5 = geeVar.i;
                nj8 nj8Var3 = new nj8(R.string.notification_settings_publication_featured, "allow_publication_featured_post_push_notifications", bool5 != null ? bool5.booleanValue() : true);
                NotificationNetwork notificationNetwork2 = geeVar.j;
                if (notificationNetwork2 == null) {
                    notificationNetwork2 = NotificationNetwork.ALL;
                }
                oj8 oj8Var2 = new oj8("allow_recommend_push_notifications", R.string.notification_settings_recommend, notificationNetwork2);
                NotificationNetwork notificationNetwork3 = geeVar.e;
                if (notificationNetwork3 == null) {
                    notificationNetwork3 = NotificationNetwork.ALL;
                }
                oj8 oj8Var3 = new oj8("allow_highlight_push_notifications", R.string.notification_settings_highlight, notificationNetwork3);
                NotificationNetwork notificationNetwork4 = geeVar.l;
                if (notificationNetwork4 == null) {
                    notificationNetwork4 = NotificationNetwork.ALL;
                }
                oj8 oj8Var4 = new oj8("allow_response_push_notifications", R.string.notification_settings_response, notificationNetwork4);
                NotificationNetwork notificationNetwork5 = geeVar.g;
                if (notificationNetwork5 == null) {
                    notificationNetwork5 = NotificationNetwork.ALL;
                }
                oj8 oj8Var5 = new oj8("allow_mention_push_notifications", R.string.notification_settings_mention, notificationNetwork5);
                Boolean bool6 = geeVar.m;
                eqa eqaVar2 = new eqa(d46.R(oj8Var, nj8Var3, oj8Var2, oj8Var3, oj8Var4, oj8Var5, new nj8(R.string.notification_settings_social_post, "allow_social_post_push_notifications", bool6 != null ? bool6.booleanValue() : true)));
                Boolean bool7 = geeVar.a;
                nj8 nj8Var4 = new nj8(R.string.notification_settings_catalog_followed, JWcjNoweKCnTr.cMKyw, bool7 != null ? bool7.booleanValue() : true);
                Boolean bool8 = geeVar.f;
                return new gqa(d46.R(eqaVar, eqaVar2, new eqa(d46.R(nj8Var4, new nj8(R.string.notification_settings_item_added_to_catalog, "allow_item_added_to_followed_catalog_push_notifications", bool8 != null ? bool8.booleanValue() : true)))), z2);
            default:
                ReportRepostReason reportRepostReason = (ReportRepostReason) this.e;
                boolean z3 = this.c;
                boolean z4 = this.d;
                br7.v(obj);
                if (reportRepostReason != null && !z4) {
                    z = true;
                }
                return new j6b(reportRepostReason, z3, z, ((k6b) queVar).g.b);
        }
    }
}
