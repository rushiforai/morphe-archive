package tm;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class v extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public w f89526a;

    @Override // android.content.BroadcastReceiver
    public final synchronized void onReceive(Context context, Intent intent) {
        w wVar = this.f89526a;
        if (wVar == null) {
            return;
        }
        if (wVar.c()) {
            w wVar2 = this.f89526a;
            wVar2.f89533d.f89523e.schedule(wVar2, 0L, TimeUnit.SECONDS);
            context.unregisterReceiver(this);
            this.f89526a = null;
        }
    }
}
