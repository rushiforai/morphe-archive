package com.vungle.ads.internal.ui.view;

import android.app.Activity;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import java.lang.ref.WeakReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l extends com.vungle.ads.internal.util.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m f47633a;

    public l(m mVar) {
        this.f47633a = mVar;
    }

    @Override // com.vungle.ads.internal.util.b
    public final void a(Activity activity) throws IllegalStateException {
        Intrinsics.g(activity, "activity");
        WeakReference weakReference = this.f47633a.f47636f;
        if (Intrinsics.b(weakReference != null ? (Activity) weakReference.get() : null, activity)) {
            boolean z11 = u.f47714a;
            t.a("NativeAd-VideoContentView", "onActivityPaused and pause video");
            d videoView = this.f47633a.getVideoView();
            if (videoView != null) {
                videoView.h();
            }
        }
    }

    @Override // com.vungle.ads.internal.util.b
    public final void b(Activity activity) throws IllegalStateException {
        Intrinsics.g(activity, "activity");
        WeakReference weakReference = this.f47633a.f47636f;
        if (Intrinsics.b(weakReference != null ? (Activity) weakReference.get() : null, activity)) {
            boolean z11 = u.f47714a;
            t.a("NativeAd-VideoContentView", "onActivityResumed and try to play video");
            d videoView = this.f47633a.getVideoView();
            if (videoView != null) {
                videoView.j();
            }
        }
    }
}
