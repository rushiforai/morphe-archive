package defpackage;

import android.content.Context;
import com.google.firebase.messaging.FirebaseMessagingRegistrar;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class dz2 implements dz1 {
    public final /* synthetic */ int a;
    public final /* synthetic */ rqa b;

    public /* synthetic */ dz2(rqa rqaVar, int i) {
        this.a = i;
        this.b = rqaVar;
    }

    @Override // defpackage.dz1
    public final Object f(iq1 iq1Var) {
        int i = this.a;
        rqa rqaVar = this.b;
        switch (i) {
            case 0:
                return new fz2((Context) iq1Var.c(Context.class), ((xj4) iq1Var.c(xj4.class)).f(), iq1Var.S(zi5.class), iq1Var.e(e33.class), (Executor) iq1Var.o(rqaVar));
            default:
                return FirebaseMessagingRegistrar.lambda$getComponents$0(rqaVar, iq1Var);
        }
    }
}
