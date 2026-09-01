package defpackage;

import android.net.nsd.NsdManager;
import android.net.nsd.NsdServiceInfo;
import java.util.HashMap;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xa3 {
    public static final xa3 a = new xa3();
    public static final HashMap b = new HashMap();

    public static final void a(String str) {
        xa3 xa3Var;
        HashMap map;
        Set set = ec2.a;
        if (set.contains(xa3.class)) {
            return;
        }
        try {
            xa3Var = a;
            map = b;
        } catch (Throwable th) {
            ec2.a(xa3.class, th);
        }
        if (set.contains(xa3Var)) {
            return;
        }
        try {
            NsdManager.RegistrationListener registrationListener = (NsdManager.RegistrationListener) map.get(str);
            if (registrationListener != null) {
                Object systemService = f94.a().getSystemService("servicediscovery");
                systemService.getClass();
                try {
                    ((NsdManager) systemService).unregisterService(registrationListener);
                } catch (IllegalArgumentException unused) {
                    f94 f94Var = f94.a;
                }
                map.remove(str);
                return;
            }
            return;
        } catch (Throwable th2) {
            ec2.a(xa3Var, th2);
            return;
        }
        ec2.a(xa3.class, th);
    }

    public static final boolean b() {
        if (!ec2.a.contains(xa3.class)) {
            try {
                xe4 xe4VarB = af4.b(f94.b());
                if (xe4VarB != null) {
                    if (xe4VarB.c.contains(ygc.Enabled)) {
                        return true;
                    }
                }
            } catch (Throwable th) {
                ec2.a(xa3.class, th);
                return false;
            }
        }
        return false;
    }

    public final boolean c(String str) {
        if (ec2.a.contains(this)) {
            return false;
        }
        try {
            HashMap map = b;
            if (map.containsKey(str)) {
                return true;
            }
            f94 f94Var = f94.a;
            String strReplace = "18.2.3".replace('.', '|');
            strReplace.getClass();
            String str2 = "fbsdk_" + "android-".concat(strReplace) + '_' + str;
            NsdServiceInfo nsdServiceInfo = new NsdServiceInfo();
            nsdServiceInfo.setServiceType("_fb._tcp.");
            nsdServiceInfo.setServiceName(str2);
            nsdServiceInfo.setPort(80);
            Object systemService = f94.a().getSystemService("servicediscovery");
            systemService.getClass();
            wa3 wa3Var = new wa3(str2, str);
            map.put(str, wa3Var);
            ((NsdManager) systemService).registerService(nsdServiceInfo, 1, wa3Var);
            return true;
        } catch (Throwable th) {
            ec2.a(this, th);
            return false;
        }
    }
}
