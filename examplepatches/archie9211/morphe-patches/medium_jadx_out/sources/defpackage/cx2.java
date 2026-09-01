package defpackage;

import com.medium.proto.event.PrepublishPublishAttempted;
import com.medium.proto.event.PrepublishPublishFailed;
import com.medium.proto.event.PrepublishPublished;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cx2 {
    public final rqd a;

    public /* synthetic */ cx2(rqd rqdVar) {
        this.a = rqdVar;
    }

    public void a(String str, String str2, String str3, String str4) {
        b09.I(str, str2, str4);
        rqd.a(this.a, new PrepublishPublishAttempted(null, str, null, 5, null), str2, str3, false, null, str4, 24);
    }

    public void b(String str, String str2, String str3, String str4) {
        b09.I(str, str2, str4);
        rqd.a(this.a, new PrepublishPublishFailed(null, str, null, 5, null), str2, str3, false, null, str4, 24);
    }

    public void c(String str, String str2, String str3, String str4) {
        b09.I(str, str2, str4);
        rqd.a(this.a, new PrepublishPublished(null, str, null, 5, null), str2, str3, false, null, str4, 24);
    }
}
