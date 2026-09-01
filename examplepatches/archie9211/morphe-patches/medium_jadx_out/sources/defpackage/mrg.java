package defpackage;

import com.google.firebase.auth.FirebaseAuth;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mrg implements Runnable {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ FirebaseAuth b;

    public mrg(FirebaseAuth firebaseAuth) {
        this.b = firebaseAuth;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        FirebaseAuth firebaseAuth = this.b;
        switch (i) {
            case 0:
                Iterator it2 = firebaseAuth.c.iterator();
                if (it2.hasNext()) {
                    throw ev6.q(it2);
                }
                return;
            default:
                Iterator it3 = firebaseAuth.d.iterator();
                if (it3.hasNext()) {
                    throw ev6.q(it3);
                }
                Iterator it4 = firebaseAuth.b.iterator();
                if (it4.hasNext()) {
                    throw ev6.q(it4);
                }
                return;
        }
    }

    public mrg(FirebaseAuth firebaseAuth, p66 p66Var) {
        this.b = firebaseAuth;
    }
}
