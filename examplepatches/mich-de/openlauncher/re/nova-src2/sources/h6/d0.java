package h6;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class d0 extends Service implements a0 {

    /* renamed from: a, reason: collision with root package name */
    public final fl.l f59351a = new fl.l(this);

    @Override // h6.a0
    public final u getLifecycle() {
        return (c0) this.f59351a.f55376d;
    }

    @Override // android.app.Service
    public final IBinder onBind(Intent intent) {
        Intrinsics.g(intent, "intent");
        fl.l lVar = this.f59351a;
        lVar.getClass();
        lVar.r(s.ON_START);
        return null;
    }

    @Override // android.app.Service
    public void onCreate() {
        fl.l lVar = this.f59351a;
        lVar.getClass();
        lVar.r(s.ON_CREATE);
        super.onCreate();
    }

    @Override // android.app.Service
    public void onDestroy() {
        fl.l lVar = this.f59351a;
        lVar.getClass();
        lVar.r(s.ON_STOP);
        lVar.r(s.ON_DESTROY);
        super.onDestroy();
    }

    @Override // android.app.Service
    public final void onStart(Intent intent, int i5) {
        fl.l lVar = this.f59351a;
        lVar.getClass();
        lVar.r(s.ON_START);
        super.onStart(intent, i5);
    }
}
