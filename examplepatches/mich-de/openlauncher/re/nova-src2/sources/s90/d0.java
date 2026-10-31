package s90;

import android.content.Context;
import android.net.http.CallbackException;
import android.net.http.HttpException;
import android.os.Build;
import android.util.Log;
import org.chromium.net.CronetException;
import org.chromium.net.InlineExecutionProhibitedException;

/* loaded from: classes5.dex */
public abstract class d0 {

    /* renamed from: a, reason: collision with root package name */
    public static e0 f86898a;

    /* JADX WARN: Removed duplicated region for block: B:23:0x0037 A[Catch: all -> 0x002d, TryCatch #1 {, blocks: (B:4:0x0003, B:6:0x0007, B:8:0x000d, B:10:0x0011, B:15:0x0019, B:17:0x0025, B:22:0x0030, B:23:0x0037, B:25:0x003b, B:26:0x0042, B:27:0x0044), top: B:33:0x0003, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x003b A[Catch: all -> 0x002d, TryCatch #1 {, blocks: (B:4:0x0003, B:6:0x0007, B:8:0x000d, B:10:0x0011, B:15:0x0019, B:17:0x0025, B:22:0x0030, B:23:0x0037, B:25:0x003b, B:26:0x0042, B:27:0x0044), top: B:33:0x0003, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static e0 a(Context context, a0 a0Var) {
        e0 e0Var;
        synchronized (d0.class) {
            if (f86898a != null || Build.VERSION.SDK_INT < 30) {
                if (f86898a == null) {
                    f86898a = new c1();
                }
                e0Var = f86898a;
            } else {
                if (e0.c(context).getBoolean("android.net.http.EnableTelemetry", a0Var == a0.f86850e || a0Var == a0.f86848c)) {
                    try {
                        f86898a = new t90.a();
                    } catch (Exception e3) {
                        Log.e("d0", "Exception creating an instance of CronetLoggerImpl", e3);
                    }
                    if (f86898a == null) {
                    }
                    e0Var = f86898a;
                }
            }
        }
        return e0Var;
    }

    public static Object b(x xVar, Class cls) throws Exception {
        try {
            return xVar.run();
        } catch (Exception e3) {
            if (!i.v(e3)) {
                if (w.o(e3)) {
                    throw d(e3);
                }
                if (cls.isInstance(e3)) {
                    throw e3;
                }
                throw e3;
            }
            if (!i.v(e3)) {
                throw new IllegalArgumentException("Not an Android Cronet exception", e3);
            }
            if (!i.v(e3)) {
                throw new UnsupportedOperationException("Unchecked exception translation discrepancy", e3);
            }
            InlineExecutionProhibitedException inlineExecutionProhibitedException = new InlineExecutionProhibitedException();
            inlineExecutionProhibitedException.initCause(e3);
            throw inlineExecutionProhibitedException;
        }
    }

    public static String c(int i5) {
        switch (i5) {
            case 0:
                return "NOT_STARTED";
            case 1:
                return "STARTED";
            case 2:
                return "REDIRECT_RECEIVED";
            case 3:
                return "AWAITING_FOLLOW_REDIRECT";
            case 4:
                return "AWAITING_READ";
            case 5:
                return "READING";
            case 6:
                return "ERROR";
            case 7:
                return "COMPLETE";
            case 8:
                return "CANCELLED";
            default:
                throw new IllegalArgumentException(b.c0.h(i5, "Unknown state "));
        }
    }

    public static CronetException d(Exception exc) {
        if (!w.o(exc)) {
            throw new IllegalArgumentException("Not an Android Cronet exception", exc);
        }
        if (i.A(exc)) {
            return new l(i.f(exc));
        }
        if (i.D(exc)) {
            return new k(i.e(exc), false);
        }
        if (w.n(exc)) {
            CallbackException callbackExceptionD = w.d(exc);
            return new c(callbackExceptionD.getMessage(), callbackExceptionD.getCause());
        }
        if (!w.o(exc)) {
            throw new UnsupportedOperationException("Checked exception translation discrepancy", exc);
        }
        HttpException httpExceptionF = w.f(exc);
        return new j(httpExceptionF.getMessage(), httpExceptionF);
    }
}
