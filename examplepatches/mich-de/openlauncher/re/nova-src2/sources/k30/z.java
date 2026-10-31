package k30;

import android.location.Location;

/* loaded from: classes4.dex */
public final /* synthetic */ class z implements z4.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h0 f71095a;

    @Override // z4.a
    public final void accept(Object obj) {
        Location location = (Location) obj;
        mc0.d.f76206a.h("getCurrentLocation %s", location != null ? location.getProvider() : null);
        h0 h0Var = this.f71095a;
        h0Var.f70989q = location == null ? h0Var.f70989q : location;
        if (location != null) {
            h0Var.f();
        }
    }
}
