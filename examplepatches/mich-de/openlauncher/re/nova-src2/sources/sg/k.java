package sg;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.RootTelemetryConfiguration;
import java.util.Objects;

/* loaded from: classes.dex */
public final class k implements d, c {

    /* renamed from: b, reason: collision with root package name */
    public static k f87444b;

    /* renamed from: c, reason: collision with root package name */
    public static final RootTelemetryConfiguration f87445c = new RootTelemetryConfiguration(false, 0, false, 0, 0);

    /* renamed from: a, reason: collision with root package name */
    public Object f87446a;

    public k(e eVar) {
        Objects.requireNonNull(eVar);
        this.f87446a = eVar;
    }

    public static synchronized k b() {
        try {
            if (f87444b == null) {
                f87444b = new k();
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return f87444b;
    }

    @Override // sg.d
    public void a(ConnectionResult connectionResult) {
        e eVar = (e) this.f87446a;
        if (connectionResult.f31779g == 0) {
            eVar.getRemoteService(null, eVar.getScopes());
        } else if (eVar.zzl() != null) {
            eVar.zzl().onConnectionFailed(connectionResult);
        }
    }

    @Override // sg.c
    public void onConnectionFailed(ConnectionResult connectionResult) {
        ((qg.h) this.f87446a).onConnectionFailed(connectionResult);
    }
}
