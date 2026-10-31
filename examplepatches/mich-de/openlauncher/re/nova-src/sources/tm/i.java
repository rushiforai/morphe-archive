package tm;

import com.google.firebase.messaging.FirebaseMessaging;
import t5.d0;

/* loaded from: classes3.dex */
public final /* synthetic */ class i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ FirebaseMessaging f89478a;

    public final void a() {
        FirebaseMessaging firebaseMessaging = this.f89478a;
        d0 d0Var = FirebaseMessaging.f34752m;
        if (firebaseMessaging.d() == null) {
            return;
        }
        synchronized (firebaseMessaging) {
            if (!firebaseMessaging.f34763k) {
                firebaseMessaging.g(0L);
            }
        }
    }
}
