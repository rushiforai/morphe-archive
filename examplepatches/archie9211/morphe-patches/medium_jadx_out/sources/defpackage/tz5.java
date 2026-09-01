package defpackage;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Bundle;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tz5 {
    public static String d;
    public static final tz5 a = new tz5();
    public static final ConcurrentHashMap b = new ConcurrentHashMap();
    public static final ConcurrentHashMap c = new ConcurrentHashMap();
    public static final AtomicBoolean e = new AtomicBoolean(false);

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:152:0x00fd A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x012a  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x012e A[Catch: all -> 0x0100, TryCatch #0 {all -> 0x0100, blocks: (B:34:0x00cf, B:37:0x00d6, B:43:0x00e4, B:49:0x00f4, B:55:0x0103, B:63:0x0120, B:67:0x012e, B:62:0x011c, B:40:0x00db, B:44:0x00eb, B:72:0x0151, B:73:0x0156, B:76:0x0166, B:78:0x016d, B:79:0x0174, B:82:0x018d, B:84:0x0195, B:85:0x019d, B:87:0x01a5, B:96:0x01e4, B:90:0x01bb, B:92:0x01c3, B:93:0x01cb, B:95:0x01d3, B:97:0x01ea, B:98:0x01f0, B:100:0x01f6, B:102:0x01fe, B:106:0x0216, B:107:0x021b, B:109:0x0221, B:111:0x023d, B:114:0x0245, B:116:0x024b, B:117:0x0253, B:118:0x025b, B:120:0x0261, B:121:0x0269, B:103:0x0209, B:59:0x0116), top: B:134:0x00cf, inners: #2 }] */
    /* JADX WARN: Type inference failed for: r0v17, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r0v39 */
    /* JADX WARN: Type inference failed for: r0v40 */
    /* JADX WARN: Type inference failed for: r21v0 */
    /* JADX WARN: Type inference failed for: r21v1, types: [java.lang.Long] */
    /* JADX WARN: Type inference failed for: r21v2 */
    /* JADX WARN: Type inference failed for: r21v3, types: [java.lang.Long] */
    /* JADX WARN: Type inference failed for: r21v4, types: [java.lang.Long] */
    /* JADX WARN: Type inference failed for: r21v5 */
    /* JADX WARN: Type inference failed for: r21v6 */
    /* JADX WARN: Type inference failed for: r21v7 */
    /* JADX WARN: Type inference failed for: r2v12, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r2v24 */
    /* JADX WARN: Type inference failed for: r2v40 */
    /* JADX WARN: Type inference failed for: r7v0 */
    /* JADX WARN: Type inference failed for: r7v1, types: [android.os.Bundle] */
    /* JADX WARN: Type inference failed for: r7v2 */
    /* JADX WARN: Type inference failed for: r7v3 */
    /* JADX WARN: Type inference failed for: r7v4, types: [android.os.BaseBundle] */
    /* JADX WARN: Type inference failed for: r7v5, types: [android.os.Bundle] */
    /* JADX WARN: Type inference failed for: r7v6, types: [android.os.BaseBundle] */
    /* JADX WARN: Type inference failed for: r7v7, types: [android.os.Bundle] */
    /* JADX WARN: Type inference failed for: r7v8 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final synchronized android.os.Bundle c(java.util.List r28, long r29, boolean r31, java.util.List r32) {
        /*
            Method dump skipped, instruction units count: 642
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tz5.c(java.util.List, long, boolean, java.util.List):android.os.Bundle");
    }

    public static final void d() {
        if (ec2.a.contains(tz5.class)) {
            return;
        }
        try {
            if (e.get()) {
                vz5 vz5VarA = a.a();
                int i = sz5.a[vz5VarA.ordinal()];
                if (i == 2) {
                    fz5.b(vz5.V1);
                    return;
                }
                if (i != 3) {
                    if (i == 4 && na4.b(ka4.IapLoggingLib5To7)) {
                        hz5.b(f94.a(), vz5VarA);
                        return;
                    }
                    return;
                }
                if (na4.b(ka4.IapLoggingLib2)) {
                    hz5.b(f94.a(), vz5VarA);
                } else {
                    fz5.b(vz5.V2_V4);
                }
            }
        } catch (Throwable th) {
            ec2.a(tz5.class, th);
        }
    }

    public final vz5 a() {
        Set set = ec2.a;
        try {
            if (set.contains(this)) {
                return null;
            }
            try {
                Context contextA = f94.a();
                ApplicationInfo applicationInfo = contextA.getPackageManager().getApplicationInfo(contextA.getPackageName(), 128);
                applicationInfo.getClass();
                String string = applicationInfo.metaData.getString("com.google.android.play.billingclient.version");
                if (string == null) {
                    return vz5.NONE;
                }
                List listP0 = muc.p0(string, new String[]{"."}, 3, 2);
                if (string.length() == 0) {
                    return vz5.V5_V7;
                }
                String strConcat = "GPBL.".concat(string);
                if (!set.contains(tz5.class)) {
                    try {
                        d = strConcat;
                    } catch (Throwable th) {
                        ec2.a(tz5.class, th);
                    }
                }
                Integer numO = tuc.O((String) listP0.get(0));
                if (numO == null) {
                    return vz5.V5_V7;
                }
                int iIntValue = numO.intValue();
                return iIntValue == 1 ? vz5.V1 : iIntValue < 5 ? vz5.V2_V4 : vz5.V5_V7;
            } catch (Exception unused) {
                return vz5.V5_V7;
            }
        } catch (Throwable th2) {
            ec2.a(this, th2);
            return null;
        }
    }

    public final String b(Bundle bundle, ov8 ov8Var, Bundle bundle2, ov8 ov8Var2, boolean z, boolean z2) {
        if (!ec2.a.contains(this)) {
            try {
                List<f09> listC = z2 ? pz5.c(z) : pz5.b(z);
                if (listC != null) {
                    for (f09 f09Var : listC) {
                        Map map = ov8.b;
                        Object objQ = aq7.q(pv8.IAPParameters, (String) f09Var.a, bundle, ov8Var);
                        String str = objQ instanceof String ? (String) objQ : null;
                        if (str != null && str.length() != 0) {
                            for (String str2 : (List) f09Var.b) {
                                Map map2 = ov8.b;
                                Object objQ2 = aq7.q(pv8.IAPParameters, str2, bundle2, ov8Var2);
                                String str3 = objQ2 instanceof String ? (String) objQ2 : null;
                                if (str3 != null && str3.length() != 0 && str3.equals(str)) {
                                    return z ? (String) f09Var.a : str2;
                                }
                            }
                        }
                    }
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return null;
            }
        }
        return null;
    }
}
