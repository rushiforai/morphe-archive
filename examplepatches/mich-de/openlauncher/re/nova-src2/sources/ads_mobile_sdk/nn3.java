package ads_mobile_sdk;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.view.View;
import cl.w0;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashMap;
import java.util.concurrent.ExecutorService;

/* loaded from: classes2.dex */
public final class nn3 extends BroadcastReceiver implements b.j1, b.v1 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f7629a;

    /* renamed from: b, reason: collision with root package name */
    public final ExecutorService f7630b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f7631c = true;

    public nn3(Context context, ExecutorService executorService) {
        this.f7629a = context;
        this.f7630b = executorService;
    }

    @Override // b.j1
    public final void a(HashMap map) {
        boolean z11;
        synchronized (this) {
            z11 = this.f7631c;
        }
        map.put("up", Boolean.valueOf(z11));
    }

    @Override // b.j1
    public final void b(HashMap map) {
        boolean z11;
        synchronized (this) {
            z11 = this.f7631c;
        }
        map.put("up", Boolean.valueOf(z11));
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        if ("android.intent.action.USER_PRESENT".equals(intent.getAction())) {
            synchronized (this) {
                this.f7631c = true;
            }
        } else if ("android.intent.action.SCREEN_OFF".equals(intent.getAction())) {
            synchronized (this) {
                this.f7631c = false;
            }
        }
    }

    @Override // b.j1
    public final void a(HashMap map, Context context, View view) {
        boolean z11;
        synchronized (this) {
            z11 = this.f7631c;
        }
        map.put("up", Boolean.valueOf(z11));
    }

    @Override // b.v1
    public final ListenableFuture a() {
        return w0.d(new ab.e(this, 3), this.f7630b);
    }
}
