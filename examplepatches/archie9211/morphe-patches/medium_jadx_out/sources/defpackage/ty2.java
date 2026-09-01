package defpackage;

import com.medium.proto.event.AnalyticsEventCommonFields;
import com.medium.proto.event.CopyStoryLink;
import com.medium.proto.event.EditorImageInserted;
import com.medium.proto.event.EditorImageUploaded;
import com.medium.proto.event.LinkRelayed;
import com.medium.proto.event.PostShare;
import com.medium.proto.event.PostStreamScrolled;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ty2 implements nq9 {
    public final rqd a;

    public /* synthetic */ ty2(rqd rqdVar) {
        this.a = rqdVar;
    }

    public void a(String str, String str2) {
        str2.getClass();
        rqd.a(this.a, new LinkRelayed(null, str, null, 5, null), str2, null, false, null, null, 60);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void b(String str, String str2, String str3) {
        str.getClass();
        str3.getClass();
        rqd.a(this.a, new EditorImageInserted(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0), str, str2, false, null, str3, 24);
    }

    public void c(String str, Long l, String str2, String str3, String str4, String str5, String str6) {
        str4.getClass();
        str6.getClass();
        rqd.a(this.a, new EditorImageUploaded(null, str, str2, "android_full", l, str3, null, 65, null), str4, str5, false, null, str6, 24);
    }

    public void d(String str, String str2, String str3, String str4) {
        ho2.Q(str, str2, str3, str4);
        rqd.a(this.a, new CopyStoryLink(null, str, null, Boolean.TRUE, null, null, 53, null), str2, str3, false, null, str4, 24);
    }

    public void e(String str, boolean z, boolean z2, int i, ArrayList arrayList, ArrayList arrayList2, int i2, ArrayList arrayList3, String str2, long j, String str3, String str4) {
        b09.I(str, str3, str4);
        AnalyticsEventCommonFields analyticsEventCommonFields = null;
        List list = null;
        List list2 = null;
        h21 h21Var = null;
        rqd.a(this.a, new PostStreamScrolled(analyticsEventCommonFields, d46.Q(str), list, list2, arrayList, Long.valueOf(j), Integer.valueOf(i), Integer.valueOf(i2), Long.valueOf(System.currentTimeMillis()), arrayList3, d46.Q(Boolean.valueOf(z)), str2, arrayList2, Boolean.valueOf(z2), h21Var, 16397, null), str3, null, false, null, str4, 28);
    }

    public void f(String str, String str2, String str3, String str4) {
        ho2.Q(str, str2, str3, str4);
        rqd.a(this.a, new PostShare(null, str, null, null, 13, null), str2, str3, false, null, str4, 24);
    }
}
