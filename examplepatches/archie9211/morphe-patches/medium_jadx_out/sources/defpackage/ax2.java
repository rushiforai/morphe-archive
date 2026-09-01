package defpackage;

import com.medium.proto.event.CollectionFollowed;
import com.medium.proto.event.CollectionPresented;
import com.medium.proto.event.ListDownloadTapped;
import com.medium.proto.event.ListPrivacyChanged;
import com.medium.proto.event.ListPrivacyLevel;
import com.medium.proto.event.ListShare;
import com.medium.proto.event.NewsletterSubscribeClicked;
import com.medium.proto.event.NewsletterSubscribePresented;
import com.medium.proto.event.NewsletterUnsubscribeClicked;
import com.medium.proto.event.NightModeToggled;
import com.medium.proto.event.ProfileViewed;
import com.medium.proto.event.ScreenViewed;
import com.medium.proto.event.TagPresented;
import gen.model.DisplayModeTheme;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ax2 {
    public final /* synthetic */ int a;
    public final rqd b;

    public /* synthetic */ ax2(rqd rqdVar, int i) {
        this.a = i;
        this.b = rqdVar;
    }

    public void a(int i, String str, String str2, String str3, String str4, boolean z) {
        b09.I(str, str2, str4);
        rqd.a(this.b, new ListDownloadTapped(null, str, i, z, null, 17, null), str2, str3, false, null, str4, 24);
    }

    public void b(String str, String str2, String str3, String str4) {
        b09.I(str, str2, str4);
        rqd.a(this.b, new CollectionFollowed(null, null, str, str3, Boolean.TRUE, null, 35, null), str2, str3, false, null, str4, 24);
    }

    public void c(String str, ListPrivacyLevel listPrivacyLevel, String str2, String str3, String str4) {
        str.getClass();
        listPrivacyLevel.getClass();
        str2.getClass();
        str3.getClass();
        str4.getClass();
        rqd.a(this.b, new ListPrivacyChanged(null, str, listPrivacyLevel, null, 9, null), str2, str3, false, null, str4, 24);
    }

    public void d(String str, String str2, String str3, String str4) {
        str2.getClass();
        str4.getClass();
        rqd.a(this.b, new NewsletterSubscribeClicked(null, str, null, 5, null), str2, str3, false, null, str4, 24);
    }

    public void e(String str, String str2, String str3, String str4) {
        b09.I(str, str2, str4);
        rqd.a(this.b, new NewsletterUnsubscribeClicked(null, str, null, 5, null), str2, str3, false, null, str4, 24);
    }

    public void f(DisplayModeTheme displayModeTheme, String str, String str2, String str3) {
        b09.I(str, str2, str3);
        rqd.a(this.b, new NightModeToggled(null, displayModeTheme, null, 5, null), str, str2, false, null, str3, 24);
    }

    public void g(String str, String str2, String str3, String str4) {
        switch (this.a) {
            case 2:
                b09.I(str, str2, str4);
                rqd.a(this.b, new CollectionPresented(null, str, null, null, Boolean.TRUE, null, null, null, 237, null), str2, str3, false, null, str4, 24);
                break;
            default:
                b09.I(str, str2, str4);
                rqd.a(this.b, new TagPresented(null, null, str3, str, Boolean.TRUE, null, 35, null), str2, str3, false, null, str4, 24);
                break;
        }
    }

    public void h(String str, String str2, String str3, String str4) {
        ho2.Q(str, str2, str3, str4);
        rqd.a(this.b, new ListShare(null, str, null, 5, null), str2, str3, false, null, str4, 24);
    }

    public void i(String str, String str2, String str3, String str4) {
        str2.getClass();
        str4.getClass();
        rqd.a(this.b, new NewsletterSubscribePresented(null, str, null, 5, null), str2, str3, false, null, str4, 24);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void j(String str, String str2, String str3) {
        b09.I(str, str2, str3);
        rqd.a(this.b, new ScreenViewed(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0), str, str2, false, null, str3, 24);
    }

    public void k(String str, String str2, String str3, String str4) {
        b09.I(str, str2, str4);
        rqd.a(this.b, new ProfileViewed(null, str, null, null, null, null, null, 125, null), str2, str3, false, null, str4, 24);
    }
}
