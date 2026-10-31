package vj;

import android.window.BackEvent;
import android.window.OnBackAnimationCallback;

/* loaded from: classes3.dex */
public final class d implements OnBackAnimationCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ b f92793a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f92794b;

    public d(e eVar, b bVar) {
        this.f92794b = eVar;
        this.f92793a = bVar;
    }

    public final void onBackCancelled() {
        if (this.f92794b.f92792a != null) {
            this.f92793a.c();
        }
    }

    public final void onBackInvoked() {
        this.f92793a.d();
    }

    public final void onBackProgressed(BackEvent backEvent) {
        if (this.f92794b.f92792a != null) {
            this.f92793a.a(new g.b(backEvent));
        }
    }

    public final void onBackStarted(BackEvent backEvent) {
        if (this.f92794b.f92792a != null) {
            this.f92793a.b(new g.b(backEvent));
        }
    }
}
