package defpackage;

import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.core.susi.SusiOperation;
import com.medium.proto.event.AnalyticsEventCommonFields;
import com.medium.proto.event.OnboardingCompleted;
import com.medium.proto.event.SignUpSignInEmailFormSubmitted;
import com.medium.proto.event.SignUpSignInEmailFormViewed;
import com.medium.proto.event.SignUpSignInMethodClicked;
import com.medium.proto.event.SignUpSignInSuccess;
import com.medium.proto.event.SignUpSignInViewed;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a13 {
    public final rqd a;
    public final zk2 b;

    public /* synthetic */ a13(rqd rqdVar, zk2 zk2Var) {
        this.a = rqdVar;
        this.b = zk2Var;
    }

    public void a(String str, String str2, String str3, String str4) {
        ho2.Q(str, str2, str3, str4);
        rqd.a(this.a, new OnboardingCompleted(null, this.b.n(), "app", null, 9, null), str4, str2, false, str3, str, 8);
    }

    public void b(SusiOperation susiOperation, String str, String str2, String str3, String str4) {
        susiOperation.getClass();
        str.getClass();
        str3.getClass();
        AnalyticsEventCommonFields analyticsEventCommonFields = null;
        String str5 = "app";
        rqd.a(this.a, new SignUpSignInEmailFormSubmitted(analyticsEventCommonFields, str5, susiOperation.getValue(), this.b.p(), str4, null, 33, null), str3, str2, false, null, str, 24);
    }

    public void c(SusiOperation susiOperation, String str, String str2, String str3) {
        susiOperation.getClass();
        str.getClass();
        str2.getClass();
        str3.getClass();
        AnalyticsEventCommonFields analyticsEventCommonFields = null;
        String str4 = "app";
        rqd.a(this.a, new SignUpSignInEmailFormViewed(analyticsEventCommonFields, str4, susiOperation.getValue(), this.b.p(), null, 17, null), str3, str2, false, null, str, 24);
    }

    public void d(l3d l3dVar, SusiOperation susiOperation, String str, String str2, String str3) {
        susiOperation.getClass();
        str3.getClass();
        rqd.a(this.a, new SignUpSignInMethodClicked(null, "app", susiOperation.getValue(), l3dVar != null ? l3dVar.getValue() : null, this.b.p(), null, 33, null), str3, str2, true, null, str, 16);
    }

    public void f(SusiOperation susiOperation, String str, String str2, String str3) {
        susiOperation.getClass();
        str3.getClass();
        rqd.a(this.a, new SignUpSignInViewed(null, "app", susiOperation.getValue(), this.b.p(), null, 17, null), str3, str2, false, null, str, 24);
    }

    public void e(l3d l3dVar, SusiOperation susiOperation, String str, String str2, String str3, String str4) {
        ho2.Q(str, str2, str3, str4);
        String value = susiOperation != null ? susiOperation.getValue() : null;
        String value2 = l3dVar != null ? l3dVar.getValue() : null;
        zk2 zk2Var = this.b;
        rqd.a(this.a, new SignUpSignInSuccess(null, Plbho.YLTYsAHzE, value, value2, null, zk2Var.p(), zk2Var.n(), str4, null, 273, null), str3, str2, true, null, str, 16);
    }
}
