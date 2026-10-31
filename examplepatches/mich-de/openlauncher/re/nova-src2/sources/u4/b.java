package u4;

import a5.k1;
import android.location.Location;
import android.location.LocationManager;
import android.os.Build;
import android.os.CancellationSignal;
import android.os.Looper;
import android.os.SystemClock;
import c1.j;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import java.util.WeakHashMap;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import k30.z;
import o9.d4;
import s90.s0;
import w4.d;

/* loaded from: classes2.dex */
public abstract class b {
    static {
        new WeakHashMap();
    }

    public static void a(LocationManager locationManager, String str, d dVar, ThreadPoolExecutor threadPoolExecutor, z zVar) {
        CancellationSignal cancellationSignal;
        if (dVar != null) {
            synchronized (dVar) {
                try {
                    if (dVar.f93746c == null) {
                        CancellationSignal cancellationSignal2 = new CancellationSignal();
                        dVar.f93746c = cancellationSignal2;
                        if (dVar.f93744a) {
                            cancellationSignal2.cancel();
                        }
                    }
                    cancellationSignal = dVar.f93746c;
                } finally {
                }
            }
        } else {
            cancellationSignal = null;
        }
        if (Build.VERSION.SDK_INT >= 30) {
            k1.c(locationManager, str, cancellationSignal, threadPoolExecutor, zVar);
            return;
        }
        if (cancellationSignal != null) {
            cancellationSignal.throwIfCanceled();
        }
        Location lastKnownLocation = locationManager.getLastKnownLocation(str);
        if (lastKnownLocation != null && SystemClock.elapsedRealtime() - TimeUnit.NANOSECONDS.toMillis(lastKnownLocation.getElapsedRealtimeNanos()) < h.f42227c) {
            threadPoolExecutor.execute(new s0(3, zVar, lastKnownLocation));
            return;
        }
        a aVar = new a(locationManager, threadPoolExecutor, zVar);
        locationManager.requestLocationUpdates(str, 0L, 0.0f, aVar, Looper.getMainLooper());
        if (cancellationSignal != null) {
            cancellationSignal.setOnCancelListener(new j(aVar, 2));
        }
        synchronized (aVar) {
            try {
                if (aVar.f90550e) {
                    return;
                }
                d4 d4Var = new d4(aVar, 11);
                aVar.f90551f = d4Var;
                aVar.f90548c.postDelayed(d4Var, 30000L);
            } finally {
            }
        }
    }
}
