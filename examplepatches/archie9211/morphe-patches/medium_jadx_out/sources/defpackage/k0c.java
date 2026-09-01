package defpackage;

import android.app.Application;
import android.app.Service;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k0c implements a75 {
    public final Service a;
    public go2 b;

    public k0c(Service service) {
        this.a = service;
    }

    @Override // defpackage.a75
    public final Object c() {
        go2 go2Var = this.b;
        if (go2Var != null) {
            return go2Var;
        }
        Application application = this.a.getApplication();
        gq7.l(application instanceof a75, "Hilt service must be attached to an @HiltAndroidApp Application. Found: %s", application.getClass());
        go2 go2Var2 = new go2(((ko2) ((j0c) op8.V(j0c.class, application))).b);
        this.b = go2Var2;
        return go2Var2;
    }
}
