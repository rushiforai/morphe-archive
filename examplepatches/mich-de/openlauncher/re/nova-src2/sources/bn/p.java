package bn;

import android.app.Application;
import android.content.Context;
import android.util.Log;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final ul.g f18256a;

    /* renamed from: b, reason: collision with root package name */
    public final en.k f18257b;

    public p(ul.g firebaseApp, en.k settings, CoroutineContext backgroundDispatcher, w0 sessionsActivityLifecycleCallbacks) {
        Intrinsics.g(firebaseApp, "firebaseApp");
        Intrinsics.g(settings, "settings");
        Intrinsics.g(backgroundDispatcher, "backgroundDispatcher");
        Intrinsics.g(sessionsActivityLifecycleCallbacks, "sessionsActivityLifecycleCallbacks");
        this.f18256a = firebaseApp;
        this.f18257b = settings;
        firebaseApp.a();
        Context applicationContext = firebaseApp.f91320a.getApplicationContext();
        if (applicationContext instanceof Application) {
            ((Application) applicationContext).registerActivityLifecycleCallbacks(sessionsActivityLifecycleCallbacks);
            t70.m0.t(t70.k0.a(backgroundDispatcher), null, null, new b00.e(this, sessionsActivityLifecycleCallbacks, null, 23), 3);
        } else {
            Log.e("FirebaseSessions", "Failed to register lifecycle callbacks, unexpected context " + applicationContext.getClass() + '.');
        }
    }
}
