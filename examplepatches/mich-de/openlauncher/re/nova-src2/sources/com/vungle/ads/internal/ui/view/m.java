package com.vungle.ads.internal.ui.view;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.IntentFilter;
import android.net.Uri;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.vungle.ads.NativeVideoPlaybackError;
import com.vungle.ads.R;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.l2;
import com.vungle.ads.internal.o1;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import com.vungle.ads.internal.util.v;
import com.vungle.ads.internal.util.w;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class m extends e implements com.vungle.ads.nativead.a, com.vungle.ads.nativead.b, v {

    /* renamed from: d, reason: collision with root package name */
    public d f47634d;

    /* renamed from: e, reason: collision with root package name */
    public ImageView f47635e;

    /* renamed from: f, reason: collision with root package name */
    public WeakReference f47636f;

    /* renamed from: g, reason: collision with root package name */
    public final AtomicBoolean f47637g;

    /* renamed from: h, reason: collision with root package name */
    public final AtomicBoolean f47638h;

    /* renamed from: i, reason: collision with root package name */
    public final AtomicBoolean f47639i;

    /* renamed from: j, reason: collision with root package name */
    public final AtomicBoolean f47640j;

    /* renamed from: k, reason: collision with root package name */
    public final AtomicBoolean f47641k;

    /* renamed from: l, reason: collision with root package name */
    public final AtomicBoolean f47642l;

    /* renamed from: m, reason: collision with root package name */
    public final l2 f47643m;
    public final w n;
    public final AtomicBoolean o;

    /* renamed from: p, reason: collision with root package name */
    public final AtomicBoolean f47644p;

    /* renamed from: q, reason: collision with root package name */
    public final l f47645q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(Context context, o1 internal) {
        super(context, internal);
        Intrinsics.g(context, "context");
        Intrinsics.g(internal, "internal");
        this.f47637g = new AtomicBoolean(false);
        this.f47638h = new AtomicBoolean(false);
        this.f47639i = new AtomicBoolean(false);
        this.f47640j = new AtomicBoolean(false);
        this.f47641k = new AtomicBoolean(false);
        this.f47642l = new AtomicBoolean(false);
        this.f47643m = new l2(Sdk.SDKMetric.SDKMetricType.NATIVE_VIDEO_PREPARE_DURATION_MS);
        this.n = new w();
        this.o = new AtomicBoolean(false);
        this.f47644p = new AtomicBoolean(false);
        this.f47645q = new l(this);
    }

    public static /* synthetic */ void getVideoView$annotations() {
    }

    public final void b() {
        this.f47643m.d();
        AnalyticsClient.a(AnalyticsClient.INSTANCE, this.f47643m, getInternal().f47472m, 4);
    }

    public int getCurrentTime() {
        d dVar = this.f47634d;
        if (dVar != null) {
            return dVar.getCurrentPositionMs();
        }
        return 0;
    }

    public int getDuration() {
        d dVar = this.f47634d;
        if (dVar != null) {
            return dVar.getDurationMs();
        }
        return 0;
    }

    @Nullable
    public final d getVideoView() {
        return this.f47634d;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        Object objA;
        super.onAttachedToWindow();
        try {
            int i5 = Result.f71687b;
            if (!this.o.getAndSet(true)) {
                boolean z11 = u.f47714a;
                t.a("NativeAd-VideoContentView", "registerReceiver()");
                this.f47644p.set(false);
                this.n.a(this);
                getContext().registerReceiver(this.n, new IntentFilter("android.media.RINGER_MODE_CHANGED"));
            }
            objA = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            boolean z12 = u.f47714a;
            t.a("NativeAd-VideoContentView", "registerReceiver", thA);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        Object objA;
        super.onDetachedFromWindow();
        try {
            int i5 = Result.f71687b;
            if (this.o.getAndSet(false)) {
                boolean z11 = u.f47714a;
                t.a("NativeAd-VideoContentView", "unregisterReceiver()");
                this.n.a(null);
                getContext().unregisterReceiver(this.n);
            }
            objA = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            boolean z12 = u.f47714a;
            t.a("NativeAd-VideoContentView", "unregisterReceiver", thA);
        }
    }

    public final void setVideoView(@Nullable d dVar) {
        this.f47634d = dVar;
    }

    public static final void a(m this$0, View view) {
        Intrinsics.g(this$0, "this$0");
        d dVar = this$0.f47634d;
        if (dVar != null) {
            boolean z11 = dVar.o;
            dVar.setMuted(!z11);
            if (z11) {
                ImageView imageView = this$0.f47635e;
                if (imageView != null) {
                    imageView.setImageResource(R.drawable.liftoff_icon_unmute);
                    return;
                }
                return;
            }
            ImageView imageView2 = this$0.f47635e;
            if (imageView2 != null) {
                imageView2.setImageResource(R.drawable.liftoff_icon_mute);
            }
        }
    }

    @Override // com.vungle.ads.internal.ui.view.e
    public final void a(Context context) throws IllegalStateException {
        Activity activity;
        Intrinsics.g(context, "context");
        boolean z11 = u.f47714a;
        t.a("NativeAd-VideoContentView", "initView");
        ImageView imageView$vungle_ads_release = getImageView$vungle_ads_release();
        int i5 = 8;
        if (imageView$vungle_ads_release != null) {
            imageView$vungle_ads_release.setVisibility(8);
        }
        com.vungle.ads.internal.util.d dVar = com.vungle.ads.internal.util.d.f47677f;
        com.vungle.ads.internal.util.a.a(this.f47645q);
        boolean zV = getInternal().v();
        t.a("NativeAd-VideoContentView", "startMuted=" + zV);
        d dVar2 = new d(context);
        this.f47634d = dVar2;
        dVar2.setMuted(zV);
        d dVar3 = this.f47634d;
        if (dVar3 != null) {
            dVar3.setLooping(false);
        }
        d dVar4 = this.f47634d;
        if (dVar4 != null) {
            dVar4.m();
        }
        d dVar5 = this.f47634d;
        if (dVar5 != null) {
            dVar5.setVideoLifecycleCallback(this);
        }
        d dVar6 = this.f47634d;
        if (dVar6 != null) {
            dVar6.setVideoTransformCallback$vungle_ads_release(new k30.e(this, i5));
        }
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams.addRule(13);
        d dVar7 = this.f47634d;
        if (dVar7 != null) {
            dVar7.setLayoutParams(layoutParams);
        }
        addView(this.f47634d);
        this.f47635e = new ImageView(context);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams2.addRule(5);
        layoutParams2.addRule(6);
        ImageView imageView = this.f47635e;
        if (imageView != null) {
            imageView.setLayoutParams(layoutParams2);
        }
        ImageView imageView2 = this.f47635e;
        if (imageView2 != null) {
            imageView2.setClickable(true);
        }
        ImageView imageView3 = this.f47635e;
        if (imageView3 != null) {
            imageView3.setOnClickListener(new fk.t(this, 21));
        }
        if (zV) {
            ImageView imageView4 = this.f47635e;
            if (imageView4 != null) {
                imageView4.setImageResource(R.drawable.liftoff_icon_mute);
            }
        } else {
            ImageView imageView5 = this.f47635e;
            if (imageView5 != null) {
                imageView5.setImageResource(R.drawable.liftoff_icon_unmute);
            }
        }
        addView(this.f47635e);
        ImageView imageView6 = this.f47635e;
        if (imageView6 != null) {
            imageView6.bringToFront();
        }
        requestLayout();
        Object objA = null;
        try {
            int i11 = Result.f71687b;
            if (!(context instanceof Activity)) {
                while (true) {
                    if (!(context instanceof ContextWrapper)) {
                        activity = null;
                        break;
                    } else if (context instanceof Activity) {
                        activity = (Activity) context;
                        break;
                    } else {
                        context = ((ContextWrapper) context).getBaseContext();
                        Intrinsics.f(context, "ctx.baseContext");
                    }
                }
            } else {
                activity = (Activity) context;
            }
            if (activity != null) {
                this.f47636f = new WeakReference(activity);
            }
            boolean z12 = u.f47714a;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("adActivity=");
            WeakReference weakReference = this.f47636f;
            sb2.append(weakReference != null ? (Activity) weakReference.get() : null);
            t.a("NativeAd-VideoContentView", sb2.toString());
            int i12 = Result.f71687b;
        } catch (Throwable th2) {
            int i13 = Result.f71687b;
            ResultKt.a(th2);
        }
        this.f47643m.e();
        try {
            Uri uri = Uri.parse(getInternal().p());
            Intrinsics.f(uri, "parse(this)");
            d dVar8 = this.f47634d;
            if (dVar8 != null) {
                dVar8.setSource(uri);
            }
            d dVar9 = this.f47634d;
            if (dVar9 != null) {
                dVar9.i();
                objA = Unit.f71706a;
            }
        } catch (Throwable th3) {
            int i14 = Result.f71687b;
            objA = ResultKt.a(th3);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            a(String.valueOf(thA.getLocalizedMessage()), -2);
        }
    }

    public static final void a(m this$0, float f11, float f12) {
        Intrinsics.g(this$0, "this$0");
        ImageView imageView = this$0.f47635e;
        if (imageView != null) {
            imageView.setTranslationX(f11);
        }
        ImageView imageView2 = this$0.f47635e;
        if (imageView2 == null) {
            return;
        }
        imageView2.setTranslationY(f12);
    }

    @Override // com.vungle.ads.internal.util.v
    public final void a(boolean z11) {
        d dVar;
        d dVar2 = this.f47634d;
        Boolean boolValueOf = dVar2 != null ? Boolean.valueOf(dVar2.o) : null;
        boolean z12 = u.f47714a;
        t.a("NativeAd-VideoContentView", "silentModeEnabled=" + z11 + " currentIsMuted=" + boolValueOf);
        if (!this.f47644p.getAndSet(true) || boolValueOf == null || Boolean.valueOf(z11).equals(boolValueOf) || (dVar = this.f47634d) == null) {
            return;
        }
        boolean z13 = dVar.o;
        dVar.setMuted(!z13);
        if (!z13) {
            ImageView imageView = this.f47635e;
            if (imageView != null) {
                imageView.setImageResource(R.drawable.liftoff_icon_mute);
                return;
            }
            return;
        }
        ImageView imageView2 = this.f47635e;
        if (imageView2 != null) {
            imageView2.setImageResource(R.drawable.liftoff_icon_unmute);
        }
    }

    public final void a(int i5) {
        if (1 <= i5 && i5 < 25) {
            if (this.f47637g.compareAndSet(false, true)) {
                int duration = getDuration();
                Pair pair = new Pair("OM_KEY_DURATION", Integer.valueOf(duration));
                d dVar = this.f47634d;
                Map mapJ0 = MapsKt.j0(pair, new Pair("OM_KEY_VOLUME", Integer.valueOf(!Intrinsics.b(dVar != null ? Boolean.valueOf(dVar.o) : null, Boolean.TRUE) ? 1 : 0)));
                getInternal().a(String.valueOf(duration));
                getInternal().a(4, mapJ0);
                return;
            }
            return;
        }
        if (25 <= i5 && i5 < 50) {
            if (this.f47638h.compareAndSet(false, true)) {
                o1.a(getInternal(), "checkpoint.25");
                getInternal().a(5, (Map) null);
                return;
            }
            return;
        }
        if (50 <= i5 && i5 < 75) {
            if (this.f47639i.compareAndSet(false, true)) {
                o1.a(getInternal(), "checkpoint.50");
                getInternal().a(6, (Map) null);
                return;
            }
            return;
        }
        if (75 <= i5 && i5 < 100) {
            if (this.f47640j.compareAndSet(false, true)) {
                o1.a(getInternal(), "checkpoint.75");
                getInternal().a(7, (Map) null);
                return;
            }
            return;
        }
        if (i5 < 100 || !this.f47641k.compareAndSet(false, true)) {
            return;
        }
        o1.a(getInternal(), "checkpoint.100");
    }

    public final void a(String extra, int i5) {
        Intrinsics.g(extra, "extra");
        if (this.f47642l.getAndSet(true)) {
            return;
        }
        Context context = getContext();
        Intrinsics.f(context, "context");
        super.a(context);
        ImageView imageView$vungle_ads_release = getImageView$vungle_ads_release();
        if (imageView$vungle_ads_release != null) {
            imageView$vungle_ads_release.setVisibility(0);
        }
        ImageView imageView = this.f47635e;
        if (imageView != null) {
            imageView.setVisibility(8);
        }
        d dVar = this.f47634d;
        if (dVar != null) {
            dVar.setVisibility(8);
        }
        new NativeVideoPlaybackError("w=" + i5 + " e=" + extra + " url=" + getInternal().q()).setLogEntry$vungle_ads_release(getInternal().e()).logErrorNoReturnValue$vungle_ads_release();
    }

    @Override // com.vungle.ads.internal.ui.view.e
    public final void a() throws IllegalStateException {
        Object objA;
        boolean z11 = u.f47714a;
        t.a("NativeAd-VideoContentView", "destroy()");
        try {
            int i5 = Result.f71687b;
            if (this.o.getAndSet(false)) {
                t.a("NativeAd-VideoContentView", "unregisterReceiver()");
                this.n.a(null);
                getContext().unregisterReceiver(this.n);
            }
            objA = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            boolean z12 = u.f47714a;
            t.a("NativeAd-VideoContentView", "unregisterReceiver", thA);
        }
        WeakReference weakReference = this.f47636f;
        if (weakReference != null) {
            weakReference.clear();
        }
        this.f47636f = null;
        com.vungle.ads.internal.util.d dVar = com.vungle.ads.internal.util.d.f47677f;
        com.vungle.ads.internal.util.a.b(this.f47645q);
        d dVar2 = this.f47634d;
        if (dVar2 != null) {
            dVar2.l();
        }
        this.f47634d = null;
        super.a();
    }
}
