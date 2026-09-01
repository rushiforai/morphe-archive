package defpackage;

import android.content.Context;
import android.content.IntentFilter;
import android.location.Location;
import android.location.LocationManager;
import android.os.PowerManager;
import android.util.Log;
import java.util.Calendar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c20 extends n4 {
    public final /* synthetic */ int c = 0;
    public final /* synthetic */ f20 d;
    public final Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c20(f20 f20Var, Context context) {
        super(f20Var);
        this.d = f20Var;
        this.e = (PowerManager) context.getApplicationContext().getSystemService("power");
    }

    @Override // defpackage.n4
    public final IntentFilter e() {
        switch (this.c) {
            case 0:
                IntentFilter intentFilter = new IntentFilter();
                intentFilter.addAction("android.os.action.POWER_SAVE_MODE_CHANGED");
                return intentFilter;
            default:
                IntentFilter intentFilter2 = new IntentFilter();
                intentFilter2.addAction("android.intent.action.TIME_SET");
                intentFilter2.addAction("android.intent.action.TIMEZONE_CHANGED");
                intentFilter2.addAction("android.intent.action.TIME_TICK");
                return intentFilter2;
        }
    }

    @Override // defpackage.n4
    public final int g() {
        Location location;
        boolean z;
        long j;
        int i = this.c;
        Object obj = this.e;
        switch (i) {
            case 0:
                if (!x10.a((PowerManager) obj)) {
                    break;
                }
                break;
            default:
                vwa vwaVar = (vwa) obj;
                LocationManager locationManager = (LocationManager) vwaVar.c;
                ur urVar = (ur) vwaVar.d;
                if (urVar.b > System.currentTimeMillis()) {
                    z = urVar.a;
                } else {
                    Context context = (Context) vwaVar.b;
                    Location lastKnownLocation = null;
                    if (tp7.p(context, "android.permission.ACCESS_COARSE_LOCATION") == 0) {
                        try {
                        } catch (Exception e) {
                            Log.d("TwilightManager", "Failed to get last known location", e);
                        }
                        Location lastKnownLocation2 = locationManager.isProviderEnabled("network") ? locationManager.getLastKnownLocation("network") : null;
                        location = lastKnownLocation2;
                    } else {
                        location = null;
                    }
                    if (tp7.p(context, "android.permission.ACCESS_FINE_LOCATION") == 0) {
                        try {
                            if (locationManager.isProviderEnabled("gps")) {
                                lastKnownLocation = locationManager.getLastKnownLocation("gps");
                            }
                        } catch (Exception e2) {
                            Log.d("TwilightManager", "Failed to get last known location", e2);
                        }
                    }
                    if (lastKnownLocation == null || location == null ? lastKnownLocation != null : lastKnownLocation.getTime() > location.getTime()) {
                        location = lastKnownLocation;
                    }
                    if (location != null) {
                        long jCurrentTimeMillis = System.currentTimeMillis();
                        dud dudVar = dud.e;
                        if (dudVar == null) {
                            dudVar = new dud();
                            dud.e = dudVar;
                        }
                        dud dudVar2 = dudVar;
                        dudVar2.a(location.getLatitude(), location.getLongitude(), jCurrentTimeMillis - 86400000);
                        dudVar2.a(location.getLatitude(), location.getLongitude(), jCurrentTimeMillis);
                        z = dudVar2.b == 1;
                        long j2 = dudVar2.d;
                        long j3 = dudVar2.c;
                        dudVar2.a(location.getLatitude(), location.getLongitude(), jCurrentTimeMillis + 86400000);
                        long j4 = dudVar2.d;
                        if (j2 == -1 || j3 == -1) {
                            j = jCurrentTimeMillis + 43200000;
                        } else {
                            if (jCurrentTimeMillis > j3) {
                                j2 = j4;
                            } else if (jCurrentTimeMillis > j2) {
                                j2 = j3;
                            }
                            j = j2 + 60000;
                        }
                        urVar.a = z;
                        urVar.b = j;
                    } else {
                        Log.i("TwilightManager", "Could not get last known location. This is probably because the app does not have any location permissions. Falling back to hardcoded sunrise/sunset values.");
                        int i2 = Calendar.getInstance().get(11);
                        if (i2 < 6 || i2 >= 22) {
                            z = true;
                        }
                    }
                }
                if (!z) {
                    break;
                }
                break;
        }
        return 1;
    }

    @Override // defpackage.n4
    public final void q() throws IllegalAccessException {
        int i = this.c;
        f20 f20Var = this.d;
        switch (i) {
            case 0:
                f20Var.m(true, true);
                break;
            default:
                f20Var.m(true, true);
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c20(f20 f20Var, vwa vwaVar) {
        super(f20Var);
        this.d = f20Var;
        this.e = vwaVar;
    }
}
