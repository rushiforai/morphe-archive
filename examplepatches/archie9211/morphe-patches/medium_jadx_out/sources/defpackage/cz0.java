package defpackage;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.telephony.TelephonyManager;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.pairip.VMRunner;
import java.util.Set;
import java.util.concurrent.ThreadPoolExecutor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class cz0 extends eld implements ge8 {
    public static final Set g = k80.S0(new Integer[]{0, 4, 5, 2, 3});
    public static final Set h = k80.S0(new Integer[]{1, 2, 4, 7, 11, 16});
    public static final Set i = k80.S0(new Integer[]{3, 5, 6, 8, 9, 10, 12, 14, 15, 17});
    public static final Set j = k80.S0(new Integer[]{13, 18, 19});
    public static final Set k = qo7.B(20);
    public final f66 c;
    public final ThreadPoolExecutor d;
    public final l01 e;
    public volatile fe8 f;

    public cz0(f66 f66Var, ThreadPoolExecutor threadPoolExecutor) {
        l01.a.getClass();
        j01 j01Var = k01.b;
        f66Var.getClass();
        this.c = f66Var;
        this.d = threadPoolExecutor;
        this.e = j01Var;
        this.f = new fe8(null, null, null, null, null, null, null, 127);
    }

    @Override // defpackage.ge8
    public final fe8 K0() {
        return this.f;
    }

    @Override // defpackage.ge8
    public final void a(Context context) {
        if (this.b.compareAndSet(true, false)) {
            context.unregisterReceiver(this);
        }
    }

    public final void d(Context context) {
        fe8 fe8Var;
        String str;
        String str2;
        fe8 fe8Var2;
        CharSequence simCarrierIdName;
        Object systemService = context.getSystemService("connectivity");
        ConnectivityManager connectivityManager = systemService instanceof ConnectivityManager ? (ConnectivityManager) systemService : null;
        NetworkInfo activeNetworkInfo = connectivityManager != null ? connectivityManager.getActiveNetworkInfo() : null;
        if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
            fe8Var = new fe8(ee8.NETWORK_NOT_CONNECTED, null, null, null, null, null, null, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
        } else if (activeNetworkInfo.getType() == 1) {
            fe8Var = new fe8(ee8.NETWORK_WIFI, null, null, null, null, null, null, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
        } else if (activeNetworkInfo.getType() == 9) {
            fe8Var = new fe8(ee8.NETWORK_ETHERNET, null, null, null, null, null, null, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
        } else if (g.contains(Integer.valueOf(activeNetworkInfo.getType()))) {
            int subtype = activeNetworkInfo.getSubtype();
            ee8 ee8Var = h.contains(Integer.valueOf(subtype)) ? ee8.NETWORK_2G : i.contains(Integer.valueOf(subtype)) ? ee8.NETWORK_3G : j.contains(Integer.valueOf(subtype)) ? ee8.NETWORK_4G : k.contains(Integer.valueOf(subtype)) ? ee8.NETWORK_5G : ee8.NETWORK_MOBILE_OTHER;
            switch (subtype) {
                case 1:
                    str = "GPRS";
                    str2 = str;
                    break;
                case 2:
                    str = "Edge";
                    str2 = str;
                    break;
                case 3:
                    str = "UMTS";
                    str2 = str;
                    break;
                case 4:
                    str = "CDMA";
                    str2 = str;
                    break;
                case 5:
                    str = "CDMAEVDORev0";
                    str2 = str;
                    break;
                case 6:
                    str = "CDMAEVDORevA";
                    str2 = str;
                    break;
                case 7:
                    str = "CDMA1x";
                    str2 = str;
                    break;
                case 8:
                    str = "HSDPA";
                    str2 = str;
                    break;
                case 9:
                    str = "HSUPA";
                    str2 = str;
                    break;
                case 10:
                    str = "HSPA";
                    str2 = str;
                    break;
                case 11:
                    str = "iDen";
                    str2 = str;
                    break;
                case 12:
                    str = "CDMAEVDORevB";
                    str2 = str;
                    break;
                case 13:
                    str = "LTE";
                    str2 = str;
                    break;
                case 14:
                    str = "eHRPD";
                    str2 = str;
                    break;
                case 15:
                    str = "HSPA+";
                    str2 = str;
                    break;
                case 16:
                    str = "GSM";
                    str2 = str;
                    break;
                case 17:
                    str = "TD_SCDMA";
                    str2 = str;
                    break;
                case 18:
                    str = "IWLAN";
                    str2 = str;
                    break;
                case 19:
                    str = "LTE_CA";
                    str2 = str;
                    break;
                case 20:
                    str = "New Radio";
                    str2 = str;
                    break;
                default:
                    str2 = null;
                    break;
            }
            if (((j01) this.e).d) {
                Object systemService2 = context.getSystemService("phone");
                TelephonyManager telephonyManager = systemService2 instanceof TelephonyManager ? (TelephonyManager) systemService2 : null;
                if (telephonyManager == null || (simCarrierIdName = telephonyManager.getSimCarrierIdName()) == null) {
                    simCarrierIdName = "Unknown Carrier Name";
                }
                fe8Var2 = new fe8(ee8Var, simCarrierIdName.toString(), telephonyManager != null ? Long.valueOf(telephonyManager.getSimCarrierId()) : null, null, null, null, str2, 56);
            } else {
                fe8Var2 = new fe8(ee8Var, null, null, null, null, null, str2, 62);
            }
            fe8Var = fe8Var2;
        } else {
            fe8Var = new fe8(ee8.NETWORK_OTHER, null, null, null, null, null, null, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
        }
        this.f = fe8Var;
    }

    @Override // defpackage.ge8
    public final void l0(Context context) {
        context.getClass();
        b(context, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
        d(context);
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        VMRunner.invoke("YvZAyw9XYU0QGLbe", new Object[]{this, context, intent});
    }
}
