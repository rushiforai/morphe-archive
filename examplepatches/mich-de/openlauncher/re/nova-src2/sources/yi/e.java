package yi;

import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.IBinder;

/* loaded from: classes3.dex */
public class e implements ServiceConnection {

    /* renamed from: a, reason: collision with root package name */
    public final Context f97343a;

    /* renamed from: b, reason: collision with root package name */
    public final int f97344b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f97345c;

    public e(Context context, int i5) {
        this.f97343a = context;
        this.f97344b = i5;
    }

    public final boolean l() {
        if (!this.f97345c) {
            try {
                Context context = this.f97343a;
                this.f97345c = context.bindService(d.b(context), this, this.f97344b);
            } catch (SecurityException e3) {
                mc0.d.f76206a.p(e3, "LauncherClient Unable to connect to overlay service", new Object[0]);
            }
        }
        return this.f97345c;
    }

    public final void m() {
        if (this.f97345c) {
            try {
                this.f97343a.unbindService(this);
            } catch (Exception e3) {
                mc0.d.f76206a.p(e3, "LauncherClient unbindSelf", new Object[0]);
            }
            this.f97345c = false;
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName componentName) {
    }
}
