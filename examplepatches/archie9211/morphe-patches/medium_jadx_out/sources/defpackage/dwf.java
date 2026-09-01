package defpackage;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.google.firebase.auth.FirebaseAuth;
import com.pairip.VMRunner;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class dwf extends BroadcastReceiver {
    public final WeakReference a;
    public final wfd b;
    public final FirebaseAuth c;
    public final /* synthetic */ sv0 d;

    public dwf(sv0 sv0Var, Activity activity, wfd wfdVar, FirebaseAuth firebaseAuth) {
        this.d = sv0Var;
        this.a = new WeakReference(activity);
        this.b = wfdVar;
        this.c = firebaseAuth;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        VMRunner.invoke("wJCnRaN3qJy2kdOD", new Object[]{this, context, intent});
    }
}
