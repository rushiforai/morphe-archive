package defpackage;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.util.Log;
import com.pairip.VMRunner;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class t5d extends BroadcastReceiver {
    public final /* synthetic */ int a = 0;
    public Context b;
    public Object c;

    public t5d(d2f d2fVar) {
        this.c = d2fVar;
    }

    public void a() {
        if (Log.isLoggable("FirebaseMessaging", 3) || (Build.VERSION.SDK_INT == 23 && Log.isLoggable("FirebaseMessaging", 3))) {
            Log.d("FirebaseMessaging", "Connectivity change received registered");
        }
        IntentFilter intentFilter = new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE");
        u5d u5dVar = (u5d) this.c;
        if (u5dVar != null) {
            Context context = u5dVar.c.b;
            this.b = context;
            context.registerReceiver(this, intentFilter);
        }
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        VMRunner.invoke("nuJNKt549FowGLhw", new Object[]{this, context, intent});
    }

    public /* synthetic */ t5d() {
    }
}
