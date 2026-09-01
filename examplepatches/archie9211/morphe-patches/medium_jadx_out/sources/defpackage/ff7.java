package defpackage;

import android.os.Looper;
import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import java.util.Arrays;
import java.util.Iterator;
import java.util.ServiceConfigurationError;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class ff7 {
    public static final ei5 a;

    static {
        String property;
        int i = a7d.a;
        Object next = null;
        try {
            property = System.getProperty("kotlinx.coroutines.fast.service.loader");
        } catch (SecurityException unused) {
            property = null;
        }
        if (property != null) {
            Boolean.parseBoolean(property);
        }
        try {
            Iterator it2 = szb.O0(szb.F0(Arrays.asList(new yo()).iterator())).iterator();
            if (it2.hasNext()) {
                next = it2.next();
                if (it2.hasNext()) {
                    ((yo) next).getClass();
                    do {
                        ((yo) it2.next()).getClass();
                    } while (it2.hasNext());
                }
            }
            if (((yo) next) == null) {
                ygf.f("Module with the Main dispatcher is missing. Add dependency providing the Main dispatcher, e.g. 'kotlinx-coroutines-android' and ensure it has the same version as 'kotlinx-coroutines-core'");
                return;
            }
            Looper mainLooper = Looper.getMainLooper();
            if (mainLooper != null) {
                a = new ei5(fi5.a(mainLooper));
            } else {
                ygf.f(CspinKvYN.MuGYXxMswgXVSBi);
            }
        } catch (Throwable th) {
            throw new ServiceConfigurationError(th.getMessage(), th);
        }
    }
}
