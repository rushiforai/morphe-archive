package en;

import android.content.Context;
import android.os.Bundle;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes.dex */
public final class a implements p {

    /* renamed from: a, reason: collision with root package name */
    public final Bundle f52810a;

    public a(Context appContext) {
        Intrinsics.g(appContext, "appContext");
        Bundle bundle = appContext.getPackageManager().getApplicationInfo(appContext.getPackageName(), 128).metaData;
        this.f52810a = bundle == null ? Bundle.EMPTY : bundle;
    }

    @Override // en.p
    public final Boolean a() {
        Bundle bundle = this.f52810a;
        if (bundle.containsKey("firebase_sessions_enabled")) {
            return Boolean.valueOf(bundle.getBoolean("firebase_sessions_enabled"));
        }
        return null;
    }

    @Override // en.p
    public final Duration b() {
        Bundle bundle = this.f52810a;
        if (bundle.containsKey("firebase_sessions_sessions_restart_timeout")) {
            return new Duration(DurationKt.g(bundle.getInt("firebase_sessions_sessions_restart_timeout"), DurationUnit.f72046e));
        }
        return null;
    }

    @Override // en.p
    public final Double c() {
        Bundle bundle = this.f52810a;
        if (bundle.containsKey("firebase_sessions_sampling_rate")) {
            return Double.valueOf(bundle.getDouble("firebase_sessions_sampling_rate"));
        }
        return null;
    }

    @Override // en.p
    public final Object d(Continuation continuation) {
        return Unit.f71706a;
    }
}
