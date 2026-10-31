package com.fyber.inneractive.sdk.renderers;

import android.graphics.Rect;
import android.os.Handler;
import android.widget.RelativeLayout;
import com.fyber.inneractive.sdk.flow.q0;
import com.fyber.inneractive.sdk.network.z0;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: b, reason: collision with root package name */
    public final RelativeLayout f30973b;

    /* renamed from: i, reason: collision with root package name */
    public final g f30980i;

    /* renamed from: c, reason: collision with root package name */
    public float f30974c = 0.0f;

    /* renamed from: d, reason: collision with root package name */
    public int f30975d = 1;

    /* renamed from: e, reason: collision with root package name */
    public float f30976e = 0.0f;

    /* renamed from: f, reason: collision with root package name */
    public long f30977f = 0;

    /* renamed from: g, reason: collision with root package name */
    public boolean f30978g = false;

    /* renamed from: h, reason: collision with root package name */
    public boolean f30979h = false;

    /* renamed from: j, reason: collision with root package name */
    public final b f30981j = new b(this);

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.util.j f30972a = new com.fyber.inneractive.sdk.util.j(4, new c());

    public d(com.fyber.inneractive.sdk.response.f fVar, RelativeLayout relativeLayout, g gVar) {
        this.f30973b = relativeLayout;
        this.f30980i = gVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0078  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a() {
        boolean z11;
        String str;
        IAlog.a("IAVisibilityTracker: onCheckVisibility", new Object[0]);
        float f11 = this.f30975d / 100.0f;
        com.fyber.inneractive.sdk.util.j jVar = this.f30972a;
        Object objPoll = jVar.f31196a.poll();
        if (objPoll == null) {
            objPoll = jVar.f31197b.a();
        }
        Rect rect = (Rect) objPoll;
        RelativeLayout relativeLayout = this.f30973b;
        float fWidth = (relativeLayout.getParent() != null && relativeLayout.isShown() && relativeLayout.hasWindowFocus() && relativeLayout.getGlobalVisibleRect(rect)) ? (rect.width() * rect.height()) / (relativeLayout.getWidth() * relativeLayout.getHeight()) : 0.0f;
        this.f30972a.f31196a.offer(rect);
        this.f30974c = fWidth;
        if (fWidth >= f11) {
            float f12 = this.f30976e * 1000.0f;
            long jCurrentTimeMillis = System.currentTimeMillis();
            long j11 = this.f30977f;
            z11 = f12 < ((float) (jCurrentTimeMillis - j11)) && j11 != 0;
        }
        IAlog.a("BannerVisibilityTracker | visible = %s, minVis = %f", Boolean.valueOf(z11), Float.valueOf(f11));
        if (!z11 || !this.f30978g) {
            if (this.f30978g) {
                float f13 = this.f30974c;
                if (f13 < f11) {
                    this.f30977f = 0L;
                } else if (f13 >= f11 && this.f30977f == 0) {
                    this.f30977f = System.currentTimeMillis();
                }
                Handler handler = com.fyber.inneractive.sdk.util.r.f31216b;
                handler.removeCallbacks(this.f30981j);
                handler.postDelayed(this.f30981j, 50L);
                return;
            }
            return;
        }
        if (this.f30980i == null || this.f30979h) {
            return;
        }
        this.f30979h = true;
        IAlog.a("BannerVisibilityTracker | firing viewable", new Object[0]);
        n nVar = this.f30980i.f30989a;
        nVar.getClass();
        try {
            com.fyber.inneractive.sdk.flow.x xVar = nVar.f28031b;
            if (xVar == null || ((q0) xVar).f28438b == null || (str = ((com.fyber.inneractive.sdk.response.f) ((q0) xVar).f28438b).f31060u) == null || str.trim().length() <= 0) {
                return;
            }
            IAlog.e("%sfiring banner mrc visibility impression!", IAlog.a(nVar));
            IAlog.d("MRC_VISIBILITY_IMPRESSION", new Object[0]);
            z0.b(str);
        } catch (Exception unused) {
        }
    }
}
