package io.sentry.android.core;

import io.sentry.ILogger;
import io.sentry.g3;
import io.sentry.w3;

/* loaded from: classes4.dex */
public final class q0 implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public static final q0 f67062a = new q0();

    public static boolean a(w3 w3Var, String str) {
        return b(str, w3Var != null ? w3Var.getLogger() : null) != null;
    }

    public static Class b(String str, ILogger iLogger) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e3) {
            if (iLogger == null) {
                return null;
            }
            iLogger.e(g3.DEBUG, "Class not available:".concat(str), e3);
            return null;
        } catch (UnsatisfiedLinkError e11) {
            if (iLogger == null) {
                return null;
            }
            iLogger.e(g3.ERROR, "Failed to load (UnsatisfiedLinkError) ".concat(str), e11);
            return null;
        } catch (Throwable th2) {
            if (iLogger == null) {
                return null;
            }
            iLogger.e(g3.ERROR, "Failed to initialize ".concat(str), th2);
            return null;
        }
    }
}
