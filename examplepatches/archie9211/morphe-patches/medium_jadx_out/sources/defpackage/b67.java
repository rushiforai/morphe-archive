package defpackage;

import android.content.Context;
import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b67 implements g2c {
    public final Bundle a;

    public b67(Context context) {
        context.getClass();
        Bundle bundle = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128).metaData;
        this.a = bundle == null ? Bundle.EMPTY : bundle;
    }

    @Override // defpackage.g2c
    public final Boolean a() {
        Bundle bundle = this.a;
        if (bundle.containsKey("firebase_sessions_enabled")) {
            return Boolean.valueOf(bundle.getBoolean("firebase_sessions_enabled"));
        }
        return null;
    }

    @Override // defpackage.g2c
    public final Object b(n92 n92Var) {
        return c1e.a;
    }

    @Override // defpackage.g2c
    public final in3 c() {
        Bundle bundle = this.a;
        if (bundle.containsKey("firebase_sessions_sessions_restart_timeout")) {
            return new in3(hlg.T(bundle.getInt("firebase_sessions_sessions_restart_timeout"), mn3.SECONDS));
        }
        return null;
    }

    @Override // defpackage.g2c
    public final Double d() {
        Bundle bundle = this.a;
        if (bundle.containsKey("firebase_sessions_sampling_rate")) {
            return Double.valueOf(bundle.getDouble("firebase_sessions_sampling_rate"));
        }
        return null;
    }
}
