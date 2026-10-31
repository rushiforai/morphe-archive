package c40;

import android.view.ViewTreeObserver;
import com.vungle.ads.internal.c1;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements ViewTreeObserver.OnPreDrawListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19659a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f19660b;

    public /* synthetic */ d(Object obj, int i5) {
        this.f19659a = i5;
        this.f19660b = obj;
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    public final boolean onPreDraw() {
        switch (this.f19659a) {
            case 0:
                return c1.a((c1) this.f19660b);
            default:
                return com.amplitude.android.sessionreplay.a.a((com.amplitude.android.sessionreplay.a) this.f19660b);
        }
    }
}
