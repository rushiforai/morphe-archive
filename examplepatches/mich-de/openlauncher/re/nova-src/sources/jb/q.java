package jb;

import android.util.Log;
import b.c0;
import com.google.android.gms.internal.measurement.k2;
import java.util.Locale;

/* loaded from: classes2.dex */
public abstract class q {

    /* renamed from: a, reason: collision with root package name */
    public static final boolean f69424a = Log.isLoggable("Volley", 2);

    /* renamed from: b, reason: collision with root package name */
    public static final String f69425b = q.class.getName();

    public static String a(String str, Object... objArr) {
        String string;
        String str2 = String.format(Locale.US, str, objArr);
        StackTraceElement[] stackTrace = new Throwable().fillInStackTrace().getStackTrace();
        int i5 = 2;
        while (true) {
            if (i5 >= stackTrace.length) {
                string = "<unknown>";
                break;
            }
            if (!stackTrace[i5].getClassName().equals(f69425b)) {
                String className = stackTrace[i5].getClassName();
                String strSubstring = className.substring(className.lastIndexOf(46) + 1);
                StringBuilder sbK = k2.k(strSubstring.substring(strSubstring.lastIndexOf(36) + 1), ".");
                sbK.append(stackTrace[i5].getMethodName());
                string = sbK.toString();
                break;
            }
            i5++;
        }
        Locale locale = Locale.US;
        return c0.q(a80.m.l(Thread.currentThread().getId(), "[", "] ", string), ": ", str2);
    }

    public static void b(String str, Object... objArr) {
        Log.e("Volley", a(str, objArr));
    }

    public static void c(String str, Object... objArr) {
        if (f69424a) {
            a(str, objArr);
        }
    }
}
