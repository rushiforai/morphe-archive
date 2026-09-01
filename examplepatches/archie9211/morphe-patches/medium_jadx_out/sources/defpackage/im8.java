package defpackage;

import android.os.Bundle;
import com.google.firebase.auth.FirebaseAuth;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class im8 {
    public final Bundle a;

    public im8(Bundle bundle) {
        this.a = bundle;
    }

    public static md5 a() {
        FirebaseAuth firebaseAuth = FirebaseAuth.getInstance();
        vp7.n("twitter.com");
        vp7.p(firebaseAuth);
        return new md5(firebaseAuth);
    }
}
