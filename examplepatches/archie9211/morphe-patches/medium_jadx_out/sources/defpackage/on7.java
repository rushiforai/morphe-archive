package defpackage;

import com.google.firebase.messaging.FirebaseMessaging;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class on7 implements f8a {
    public static FirebaseMessaging a() {
        FirebaseMessaging firebaseMessaging;
        synchronized (FirebaseMessaging.class) {
            firebaseMessaging = FirebaseMessaging.getInstance(xj4.d());
        }
        firebaseMessaging.getClass();
        return firebaseMessaging;
    }

    public static kb2 b() {
        r13 r13Var = xg3.a;
        vz2 vz2Var = vz2.c;
        iq7.s(vz2Var);
        return vz2Var;
    }
}
