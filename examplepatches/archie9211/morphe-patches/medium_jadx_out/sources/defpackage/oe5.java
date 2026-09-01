package defpackage;

import android.adservices.measurement.MeasurementManager;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import java.util.Iterator;
import java.util.Set;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oe5 {
    public static final oe5 a = new oe5();
    public static final String b;
    public static boolean c;
    public static pe5 d;
    public static String e;

    static {
        String string = oe5.class.toString();
        string.getClass();
        b = string;
    }

    public final boolean a() {
        String str = b;
        if (ec2.a.contains(this)) {
            return false;
        }
        try {
            if (!c || Build.VERSION.SDK_INT < 33) {
                return false;
            }
            try {
                Class.forName("android.adservices.measurement.MeasurementManager");
                Class.forName("android.os.OutcomeReceiver");
                return true;
            } catch (Error e2) {
                Log.i(str, "FAILURE_NO_MEASUREMENT_MANAGER_CLASS");
                pe5 pe5Var = d;
                if (pe5Var == null) {
                    g76.g0("gpsDebugLogger");
                    throw null;
                }
                Bundle bundle = new Bundle();
                bundle.putString("gps_ara_failed_reason", e2.toString());
                pe5Var.a("gps_ara_failed", bundle);
                return false;
            } catch (Exception e3) {
                Log.i(str, "FAILURE_NO_MEASUREMENT_MANAGER_CLASS");
                pe5 pe5Var2 = d;
                if (pe5Var2 == null) {
                    g76.g0("gpsDebugLogger");
                    throw null;
                }
                Bundle bundle2 = new Bundle();
                bundle2.putString("gps_ara_failed_reason", e3.toString());
                pe5Var2.a("gps_ara_failed", bundle2);
                return false;
            }
        } catch (Throwable th) {
            ec2.a(this, th);
            return false;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v3, types: [java.lang.String] */
    public final String b(i40 i40Var) {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            JSONObject jSONObject = i40Var.a;
            if (jSONObject != null && jSONObject.length() != 0) {
                Iterator<String> itKeys = jSONObject.keys();
                itKeys.getClass();
                this = szb.L0(szb.N0(szb.F0(itKeys), new ce(21, jSONObject)), "&");
                return this;
            }
            return "";
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public final void c(String str, i40 i40Var) {
        String str2 = b;
        Set set = ec2.a;
        if (set.contains(this)) {
            return;
        }
        try {
            if (set.contains(this)) {
                return;
            }
            try {
                String string = i40Var.a.getString("_eventName");
                if (g76.L(string, "_removed_")) {
                    return;
                }
                string.getClass();
                int i = 0;
                if (!muc.Q(string, "gps", false) && a()) {
                    Context contextA = f94.a();
                    try {
                        MeasurementManager measurementManager = (MeasurementManager) contextA.getSystemService(MeasurementManager.class);
                        if (measurementManager == null) {
                            measurementManager = MeasurementManager.get(contextA.getApplicationContext());
                        }
                        if (measurementManager == null) {
                            Log.w(str2, "FAILURE_GET_MEASUREMENT_MANAGER");
                            pe5 pe5Var = d;
                            if (pe5Var == null) {
                                g76.g0("gpsDebugLogger");
                                throw null;
                            }
                            Bundle bundle = new Bundle();
                            bundle.putString("gps_ara_failed_reason", "Failed to get measurement manager");
                            pe5Var.a("gps_ara_failed", bundle);
                            return;
                        }
                        String strB = b(i40Var);
                        StringBuilder sb = new StringBuilder();
                        String str3 = e;
                        if (str3 == null) {
                            g76.g0("serverUri");
                            throw null;
                        }
                        sb.append(str3);
                        sb.append("?app_id=");
                        sb.append(str);
                        sb.append('&');
                        sb.append(strB);
                        Uri uri = Uri.parse(sb.toString());
                        uri.getClass();
                        measurementManager.registerTrigger(uri, f94.c(), new ne5(i));
                    } catch (Error e2) {
                        Log.w(str2, "FAILURE_TRIGGER_REGISTRATION_FAILED");
                        pe5 pe5Var2 = d;
                        if (pe5Var2 == null) {
                            g76.g0("gpsDebugLogger");
                            throw null;
                        }
                        Bundle bundle2 = new Bundle();
                        bundle2.putString("gps_ara_failed_reason", e2.toString());
                        pe5Var2.a("gps_ara_failed", bundle2);
                    } catch (Exception e3) {
                        Log.w(str2, "FAILURE_TRIGGER_REGISTRATION_FAILED");
                        pe5 pe5Var3 = d;
                        if (pe5Var3 == null) {
                            g76.g0("gpsDebugLogger");
                            throw null;
                        }
                        Bundle bundle3 = new Bundle();
                        bundle3.putString("gps_ara_failed_reason", e3.toString());
                        pe5Var3.a("gps_ara_failed", bundle3);
                    }
                }
            } catch (Throwable th) {
                ec2.a(this, th);
            }
        } catch (Throwable th2) {
            ec2.a(this, th2);
        }
    }

    public final void d(String str, i40 i40Var) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            f94.c().execute(new me5(str, i40Var, 0));
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
