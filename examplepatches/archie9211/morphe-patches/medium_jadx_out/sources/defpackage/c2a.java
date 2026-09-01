package defpackage;

import android.app.Activity;
import android.app.Fragment;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c2a extends tx3 {
    final /* synthetic */ d2a this$0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class a extends tx3 {
        final /* synthetic */ d2a this$0;

        public a(d2a d2aVar) {
            this.this$0 = d2aVar;
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityPostResumed(Activity activity) {
            activity.getClass();
            this.this$0.a();
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityPostStarted(Activity activity) {
            activity.getClass();
            d2a d2aVar = this.this$0;
            int i = d2aVar.a + 1;
            d2aVar.a = i;
            if (i == 1 && d2aVar.d) {
                d2aVar.f.e(ux6.ON_START);
                d2aVar.d = false;
            }
        }
    }

    public c2a(d2a d2aVar) {
        this.this$0 = d2aVar;
    }

    @Override // defpackage.tx3, android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle bundle) {
        activity.getClass();
        if (Build.VERSION.SDK_INT < 29) {
            int i = f5b.b;
            Fragment fragmentFindFragmentByTag = activity.getFragmentManager().findFragmentByTag("androidx.lifecycle.LifecycleDispatcher.report_fragment_tag");
            fragmentFindFragmentByTag.getClass();
            ((f5b) fragmentFindFragmentByTag).a = this.this$0.h;
        }
    }

    @Override // defpackage.tx3, android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPaused(Activity activity) {
        activity.getClass();
        d2a d2aVar = this.this$0;
        int i = d2aVar.b - 1;
        d2aVar.b = i;
        if (i == 0) {
            Handler handler = d2aVar.e;
            handler.getClass();
            handler.postDelayed(d2aVar.g, 700L);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPreCreated(Activity activity, Bundle bundle) {
        activity.getClass();
        nm.z(activity, new a(this.this$0));
    }

    @Override // defpackage.tx3, android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
        activity.getClass();
        d2a d2aVar = this.this$0;
        int i = d2aVar.a - 1;
        d2aVar.a = i;
        if (i == 0 && d2aVar.c) {
            d2aVar.f.e(ux6.ON_STOP);
            d2aVar.d = true;
        }
    }
}
