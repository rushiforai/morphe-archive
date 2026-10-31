package yi;

import android.app.Activity;
import android.content.ComponentName;
import android.os.IBinder;
import android.os.IInterface;
import java.lang.ref.WeakReference;

/* loaded from: classes3.dex */
public final class a extends e {

    /* renamed from: g, reason: collision with root package name */
    public static a f97315g;

    /* renamed from: d, reason: collision with root package name */
    public aj.a f97316d;

    /* renamed from: e, reason: collision with root package name */
    public WeakReference f97317e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f97318f;

    public static a n(Activity activity) {
        if (f97315g == null) {
            f97315g = new a(activity.getApplicationContext(), 33);
        }
        return f97315g;
    }

    public final aj.a o(d dVar) {
        this.f97317e = new WeakReference(dVar);
        return this.f97316d;
    }

    @Override // yi.e, android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        aj.a cVar;
        int i5 = aj.d.f13523b;
        if (iBinder == null) {
            cVar = null;
        } else {
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.libraries.launcherclient.ILauncherOverlay");
            cVar = iInterfaceQueryLocalInterface instanceof aj.a ? (aj.a) iInterfaceQueryLocalInterface : new aj.c(iBinder);
        }
        p(cVar);
    }

    @Override // yi.e, android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        p(null);
        if (this.f97318f && this.f97316d == null) {
            m();
        }
    }

    public final void p(aj.a aVar) {
        this.f97316d = aVar;
        WeakReference weakReference = this.f97317e;
        d dVar = weakReference != null ? (d) weakReference.get() : null;
        if (dVar != null) {
            aj.a aVar2 = this.f97316d;
            dVar.f97333d.f("Connected", aVar2 != null);
            dVar.f97337h = aVar2;
            if (aVar2 == null) {
                dVar.d(0);
            } else if (dVar.f97342m != null) {
                dVar.g();
            }
        }
    }
}
