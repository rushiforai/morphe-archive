package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.app.Application;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.ViewGroup;
import com.vungle.ads.internal.protos.Sdk;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Bu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0815Bu extends AbstractC1948ik<C0811Bq> {
    public int A00;
    public final int A01;
    public final C7O A04;
    public final C0958Hi A05;
    public final ViewOnClickListenerC0884El A06;
    public final List<String> A08;
    public final Application.ActivityLifecycleCallbacks A02 = new Application.ActivityLifecycleCallbacks() { // from class: com.facebook.ads.internal.view.rewardedvideo.EndCardV2ScreenshotRecyclerAdapter$1
        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivityCreated(Activity activity, Bundle bundle) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivityDestroyed(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivityPaused(Activity activity) {
            if (activity == this.A00.A05.A0E()) {
                this.A00.A03.removeCallbacks(this.A00.A07);
            }
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivityResumed(Activity activity) {
            this.A00.A03.post(this.A00.A07);
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivityStarted(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivityStopped(Activity activity) {
        }
    };
    public final Handler A03 = new Handler(Looper.getMainLooper());
    public final Runnable A07 = new RunnableC1829gk(this);

    public C0815Bu(C0958Hi c0958Hi, List<String> screenshotUrls, int i5, C7O c7o, ViewOnClickListenerC0884El viewOnClickListenerC0884El, int i11) {
        this.A08 = screenshotUrls;
        this.A01 = i5;
        this.A05 = c0958Hi;
        this.A04 = c7o;
        this.A06 = viewOnClickListenerC0884El;
        this.A00 = i11;
        this.A03.post(this.A07);
        if (Build.VERSION.SDK_INT >= 29 && this.A05.A0E() != null) {
            this.A05.A0E().registerActivityLifecycleCallbacks(this.A02);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC1948ik
    /* renamed from: A05, reason: merged with bridge method [inline-methods] */
    public final C0811Bq A0F(ViewGroup viewGroup, int i5) {
        C0809Bo c0809Bo = new C0809Bo(this.A05);
        if (C2203mv.A1C(this.A05)) {
            c0809Bo.setOnClickListener(new ViewOnClickListenerC1828gj(this));
        }
        return new C0811Bq(c0809Bo);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC1948ik
    /* renamed from: A07, reason: merged with bridge method [inline-methods] */
    public final void A0M(C0811Bq c0811Bq, int i5) {
        String str = this.A08.get(i5 % this.A08.size());
        ViewGroup.MarginLayoutParams marginLayoutParams = new ViewGroup.MarginLayoutParams(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, -1);
        int i11 = this.A01;
        int actualPosition = this.A01;
        marginLayoutParams.setMargins(i11, 0, actualPosition, 0);
        c0811Bq.A0w().setLayoutParams(marginLayoutParams);
        c0811Bq.A0w().setUrl(str);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1948ik
    public final int A0B() {
        return this.A08.size() * 1000;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1948ik
    public final void A0N(C7O c7o) {
        super.A0N(c7o);
        this.A03.removeCallbacks(this.A07);
        if (Build.VERSION.SDK_INT >= 29 && this.A05.A0E() != null) {
            this.A05.A0E().unregisterActivityLifecycleCallbacks(this.A02);
        }
    }

    public final void A0Q(int i5) {
        this.A00 = i5;
    }
}
