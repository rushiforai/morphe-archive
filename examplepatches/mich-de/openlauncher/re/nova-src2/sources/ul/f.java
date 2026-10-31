package ul;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class f extends BroadcastReceiver {

    /* renamed from: b, reason: collision with root package name */
    public static final AtomicReference f91316b = new AtomicReference();

    /* renamed from: a, reason: collision with root package name */
    public final Context f91317a;

    public f(Context context) {
        this.f91317a = context;
    }

    public static void a(Context context) {
        AtomicReference atomicReference = f91316b;
        if (atomicReference.get() == null) {
            f fVar = new f(context);
            while (!atomicReference.compareAndSet(null, fVar)) {
                if (atomicReference.get() != null) {
                    return;
                }
            }
            context.registerReceiver(fVar, new IntentFilter("android.intent.action.USER_UNLOCKED"));
        }
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        synchronized (g.f91318k) {
            try {
                Iterator it = ((z.d) g.f91319l.values()).iterator();
                while (it.hasNext()) {
                    ((g) it.next()).e();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        this.f91317a.unregisterReceiver(this);
    }
}
