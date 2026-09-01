package defpackage;

import com.medium.proto.event.ResponseCollapsed;
import com.medium.proto.event.ResponseContinue;
import com.medium.proto.event.ResponseExpanded;
import com.medium.proto.event.ResponseHidden;
import com.medium.proto.event.StatsPostClicked;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qy2 {
    public final rqd a;

    public /* synthetic */ qy2(rqd rqdVar) {
        this.a = rqdVar;
    }

    public void a(String str, String str2, String str3, String str4) {
        b09.I(str, str2, str4);
        rqd.a(this.a, new StatsPostClicked(null, str, null, 5, null), str2, str3, false, null, str4, 24);
    }

    public void b(String str, String str2, String str3, Integer num, String str4, String str5, String str6) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        str4.getClass();
        str6.getClass();
        rqd.a(this.a, new ResponseCollapsed(null, str, str2, null, str3, num, null, 73, null), str4, str5, false, null, str6, 24);
    }

    public void c(String str, String str2, String str3, Integer num, String str4, String str5, String str6) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        str4.getClass();
        str6.getClass();
        rqd.a(this.a, new ResponseExpanded(null, str, str2, null, str3, num, null, 73, null), str4, str5, false, null, str6, 24);
    }

    public void d(String str, String str2, String str3, Integer num, String str4, String str5, String str6) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        str4.getClass();
        str6.getClass();
        rqd.a(this.a, new ResponseContinue(null, str, str2, null, str3, num, null, 73, null), str4, str5, false, null, str6, 24);
    }

    public void e(String str, String str2, String str3, String str4) {
        ho2.Q(str, str2, str3, str4);
        rqd.a(this.a, new ResponseHidden(null, str, null, 5, null), str2, str3, false, null, str4, 24);
    }
}
