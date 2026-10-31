package io.sentry.android.core;

import android.util.Log;
import io.sentry.ILogger;
import io.sentry.g3;

/* loaded from: classes4.dex */
public final class j implements ILogger {
    @Override // io.sentry.ILogger
    public final void d(g3 g3Var, Throwable th2, String str, Object... objArr) {
        if (objArr.length == 0) {
            e(g3Var, str, th2);
        } else {
            e(g3Var, String.format(str, objArr), th2);
        }
    }

    @Override // io.sentry.ILogger
    public final void e(g3 g3Var, String str, Throwable th2) {
        int i5 = i.f66898a[g3Var.ordinal()];
        if (i5 == 1) {
            Log.i("Sentry", str, th2);
            return;
        }
        if (i5 == 2) {
            Log.w("Sentry", str, th2);
        } else if (i5 == 3) {
            Log.e("Sentry", str, th2);
        } else {
            if (i5 != 4) {
                return;
            }
            Log.wtf("Sentry", str, th2);
        }
    }

    @Override // io.sentry.ILogger
    public final void g(g3 g3Var, String str, Object... objArr) {
        int i5 = 5;
        if (objArr.length == 0) {
            int i11 = i.f66898a[g3Var.ordinal()];
            if (i11 == 1) {
                i5 = 4;
            } else if (i11 != 2) {
                i5 = i11 != 4 ? 3 : 7;
            }
            Log.println(i5, "Sentry", str);
            return;
        }
        int i12 = i.f66898a[g3Var.ordinal()];
        if (i12 == 1) {
            i5 = 4;
        } else if (i12 != 2) {
            i5 = i12 != 4 ? 3 : 7;
        }
        Log.println(i5, "Sentry", String.format(str, objArr));
    }

    @Override // io.sentry.ILogger
    public final boolean h(g3 g3Var) {
        return true;
    }
}
