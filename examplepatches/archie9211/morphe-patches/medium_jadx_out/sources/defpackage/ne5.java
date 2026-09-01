package defpackage;

import android.os.Bundle;
import android.os.OutcomeReceiver;
import android.util.Log;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ne5 implements OutcomeReceiver {
    public final /* synthetic */ int a;

    public /* synthetic */ ne5(int i) {
        this.a = i;
    }

    public final void onError(Throwable th) {
        String str;
        pe5 pe5Var;
        String str2;
        pe5 pe5Var2;
        switch (this.a) {
            case 0:
                Exception exc = (Exception) th;
                exc.getClass();
                if (!ec2.a.contains(oe5.class)) {
                    try {
                        str = oe5.b;
                    } catch (Throwable th2) {
                        ec2.a(oe5.class, th2);
                        str = null;
                    }
                    break;
                } else {
                    str = null;
                }
                Log.d(str, "OUTCOME_RECEIVER_TRIGGER_FAILURE");
                if (!ec2.a.contains(oe5.class)) {
                    try {
                        pe5Var = oe5.d;
                    } catch (Throwable th3) {
                        ec2.a(oe5.class, th3);
                        pe5Var = null;
                    }
                    break;
                } else {
                    pe5Var = null;
                }
                if (pe5Var == null) {
                    g76.g0("gpsDebugLogger");
                    throw null;
                }
                Bundle bundle = new Bundle();
                bundle.putString("gps_ara_failed_reason", exc.toString());
                pe5Var.a("gps_ara_failed", bundle);
                return;
            default:
                Exception exc2 = (Exception) th;
                exc2.getClass();
                if (!ec2.a.contains(qx8.class)) {
                    try {
                        str2 = qx8.b;
                    } catch (Throwable th4) {
                        ec2.a(qx8.class, th4);
                        str2 = null;
                    }
                    break;
                } else {
                    str2 = null;
                }
                Log.e(str2, exc2.toString());
                if (!ec2.a.contains(qx8.class)) {
                    try {
                        pe5Var2 = qx8.f;
                    } catch (Throwable th5) {
                        ec2.a(qx8.class, th5);
                        pe5Var2 = null;
                    }
                    break;
                } else {
                    pe5Var2 = null;
                }
                if (pe5Var2 == null) {
                    g76.g0("gpsDebugLogger");
                    throw null;
                }
                Bundle bundle2 = new Bundle();
                bundle2.putString("gps_pa_failed_reason", exc2.toString());
                pe5Var2.a("gps_pa_failed", bundle2);
                return;
        }
    }

    public final void onResult(Object obj) {
        String str;
        pe5 pe5Var;
        String str2;
        pe5 pe5Var2;
        int i = this.a;
        obj.getClass();
        switch (i) {
            case 0:
                if (ec2.a.contains(oe5.class)) {
                    str = null;
                } else {
                    try {
                        str = oe5.b;
                    } catch (Throwable th) {
                        ec2.a(oe5.class, th);
                        str = null;
                    }
                }
                Log.d(str, "OUTCOME_RECEIVER_TRIGGER_SUCCESS");
                if (ec2.a.contains(oe5.class)) {
                    pe5Var = null;
                } else {
                    try {
                        pe5Var = oe5.d;
                    } catch (Throwable th2) {
                        ec2.a(oe5.class, th2);
                        pe5Var = null;
                    }
                }
                if (pe5Var != null) {
                    pe5Var.a("gps_ara_succeed", null);
                    return;
                } else {
                    g76.g0("gpsDebugLogger");
                    throw null;
                }
            default:
                if (ec2.a.contains(qx8.class)) {
                    str2 = null;
                } else {
                    try {
                        str2 = qx8.b;
                    } catch (Throwable th3) {
                        ec2.a(qx8.class, th3);
                        str2 = null;
                    }
                }
                Log.i(str2, "Successfully joined custom audience");
                if (ec2.a.contains(qx8.class)) {
                    pe5Var2 = null;
                } else {
                    try {
                        pe5Var2 = qx8.f;
                    } catch (Throwable th4) {
                        ec2.a(qx8.class, th4);
                        pe5Var2 = null;
                    }
                }
                if (pe5Var2 != null) {
                    pe5Var2.a("gps_pa_succeed", null);
                    return;
                } else {
                    g76.g0("gpsDebugLogger");
                    throw null;
                }
        }
    }
}
