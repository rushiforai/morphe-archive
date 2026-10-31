package y70;

import android.os.Looper;
import java.util.Arrays;
import java.util.Iterator;
import java.util.ServiceConfigurationError;
import kotlin.sequences.SequencesKt;

/* loaded from: classes.dex */
public abstract class o {

    /* renamed from: a, reason: collision with root package name */
    public static final u70.d f96819a;

    static {
        Object obj;
        int i5 = v.f96828a;
        try {
            System.getProperty("kotlinx.coroutines.fast.service.loader");
        } catch (SecurityException unused) {
        }
        try {
            Iterator it = SequencesKt.A0(q70.d.m0(Arrays.asList(new u70.a()).iterator())).iterator();
            if (it.hasNext()) {
                Object next = it.next();
                if (it.hasNext()) {
                    ((u70.a) next).getClass();
                    do {
                        ((u70.a) it.next()).getClass();
                    } while (it.hasNext());
                }
                obj = next;
            } else {
                obj = null;
            }
            if (((u70.a) obj) == null) {
                throw new IllegalStateException("Module with the Main dispatcher is missing. Add dependency providing the Main dispatcher, e.g. 'kotlinx-coroutines-android' and ensure it has the same version as 'kotlinx-coroutines-core'");
            }
            Looper mainLooper = Looper.getMainLooper();
            if (mainLooper == null) {
                throw new IllegalStateException("The main looper is not available");
            }
            f96819a = new u70.d(u70.e.a(mainLooper));
        } catch (Throwable th2) {
            throw new ServiceConfigurationError(th2.getMessage(), th2);
        }
    }
}
