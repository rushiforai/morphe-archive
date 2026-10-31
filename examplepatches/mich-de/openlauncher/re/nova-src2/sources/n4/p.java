package n4;

import android.app.Notification;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import l1.a2;

/* loaded from: classes2.dex */
public final class p extends g0 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f77846e;

    /* renamed from: f, reason: collision with root package name */
    public Object f77847f;

    public /* synthetic */ p(boolean z11) {
        this.f77846e = 0;
    }

    @Override // n4.g0
    public final void b(a2 a2Var) {
        switch (this.f77846e) {
            case 0:
                Notification.BigTextStyle bigTextStyleBigText = new Notification.BigTextStyle((Notification.Builder) a2Var.f73008b).setBigContentTitle(this.f77808b).bigText((CharSequence) this.f77847f);
                if (this.f77810d) {
                    bigTextStyleBigText.setSummaryText(this.f77809c);
                    break;
                }
                break;
            default:
                Notification.InboxStyle bigContentTitle = new Notification.InboxStyle((Notification.Builder) a2Var.f73008b).setBigContentTitle(this.f77808b);
                if (this.f77810d) {
                    bigContentTitle.setSummaryText(this.f77809c);
                }
                Iterator it = ((ArrayList) this.f77847f).iterator();
                while (it.hasNext()) {
                    bigContentTitle.addLine((CharSequence) it.next());
                }
                break;
        }
    }

    @Override // n4.g0
    public final String c() {
        switch (this.f77846e) {
            case 0:
                return "androidx.core.app.NotificationCompat$BigTextStyle";
            default:
                return "androidx.core.app.NotificationCompat$InboxStyle";
        }
    }

    @Override // n4.g0
    public final void d(Bundle bundle) {
        switch (this.f77846e) {
            case 0:
                super.d(bundle);
                this.f77847f = bundle.getCharSequence("android.bigText");
                break;
            default:
                super.d(bundle);
                ArrayList arrayList = (ArrayList) this.f77847f;
                arrayList.clear();
                if (bundle.containsKey("android.textLines")) {
                    Collections.addAll(arrayList, bundle.getCharSequenceArray("android.textLines"));
                    break;
                }
                break;
        }
    }

    public void e(String str) {
        this.f77847f = r.c(str);
    }

    public p(int i5) {
        this.f77846e = i5;
        switch (i5) {
            case 1:
                this.f77847f = new ArrayList();
                break;
        }
    }
}
