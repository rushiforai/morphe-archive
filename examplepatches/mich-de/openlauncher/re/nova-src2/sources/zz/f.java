package zz;

import android.media.MediaRouter;

/* loaded from: classes.dex */
public final class f extends MediaRouter.SimpleCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g f98841a;

    public f(g gVar) {
        this.f98841a = gVar;
    }

    @Override // android.media.MediaRouter.SimpleCallback, android.media.MediaRouter.Callback
    public final void onRouteSelected(MediaRouter mediaRouter, int i5, MediaRouter.RouteInfo routeInfo) {
        this.f98841a.c().a();
    }
}
