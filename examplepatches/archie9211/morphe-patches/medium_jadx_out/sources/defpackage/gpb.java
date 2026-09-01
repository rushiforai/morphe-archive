package defpackage;

import android.os.Bundle;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gpb {
    public final hpb a;
    public final i5b b;
    public boolean e;
    public Bundle f;
    public boolean g;
    public final uob c = new uob(23);
    public final LinkedHashMap d = new LinkedHashMap();
    public boolean h = true;

    public gpb(hpb hpbVar, i5b i5bVar) {
        this.a = hpbVar;
        this.b = i5bVar;
    }

    public final void a() {
        hpb hpbVar = this.a;
        if (((ky6) hpbVar.getLifecycle()).d != vx6.INITIALIZED) {
            ygf.f("Restarter must be created only during owner's initialization stage");
        } else {
            if (this.e) {
                ygf.f("SavedStateRegistry was already attached.");
                return;
            }
            this.b.invoke();
            hpbVar.getLifecycle().a(new di4(5, this));
            this.e = true;
        }
    }
}
