package u4;

import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.Executor;
import k30.z;
import o9.d4;
import s90.s0;

/* loaded from: classes2.dex */
public final class a implements LocationListener {

    /* renamed from: a, reason: collision with root package name */
    public final LocationManager f90546a;

    /* renamed from: b, reason: collision with root package name */
    public final Executor f90547b;

    /* renamed from: c, reason: collision with root package name */
    public final Handler f90548c = new Handler(Looper.getMainLooper());

    /* renamed from: d, reason: collision with root package name */
    public z f90549d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f90550e;

    /* renamed from: f, reason: collision with root package name */
    public d4 f90551f;

    public a(LocationManager locationManager, Executor executor, z zVar) {
        this.f90546a = locationManager;
        this.f90547b = executor;
        this.f90549d = zVar;
    }

    @Override // android.location.LocationListener
    public final void onLocationChanged(Location location) {
        synchronized (this) {
            try {
                if (this.f90550e) {
                    return;
                }
                this.f90550e = true;
                this.f90547b.execute(new s0(4, this.f90549d, location));
                this.f90549d = null;
                this.f90546a.removeUpdates(this);
                d4 d4Var = this.f90551f;
                if (d4Var != null) {
                    this.f90548c.removeCallbacks(d4Var);
                    this.f90551f = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // android.location.LocationListener
    public final void onProviderDisabled(String str) {
        onLocationChanged((Location) null);
    }

    @Override // android.location.LocationListener
    public final void onProviderEnabled(String str) {
    }

    @Override // android.location.LocationListener
    public final void onStatusChanged(String str, int i5, Bundle bundle) {
    }
}
