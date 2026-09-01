package defpackage;

import android.content.Intent;
import android.os.Binder;
import android.os.Process;
import android.util.Log;
import com.google.firebase.messaging.FirebaseMessagingService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x6f extends Binder {
    public final rz2 e;

    public x6f(rz2 rz2Var) {
        this.e = rz2Var;
    }

    public final void a(y6f y6fVar) {
        if (Binder.getCallingUid() != Process.myUid()) {
            throw new SecurityException("Binding only allowed within app");
        }
        if (Log.isLoggable("FirebaseMessaging", 3)) {
            Log.d("FirebaseMessaging", "service received new intent via bind strategy");
        }
        Intent intent = y6fVar.a;
        FirebaseMessagingService firebaseMessagingService = (FirebaseMessagingService) this.e.b;
        wfd wfdVar = new wfd();
        firebaseMessagingService.a.execute(new ss(firebaseMessagingService, intent, wfdVar, 8));
        wfdVar.a.b(new b70(1), new o19(14, y6fVar));
    }
}
