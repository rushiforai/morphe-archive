package com.fyber.inneractive.sdk.logger;

import android.content.Context;
import android.util.Log;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes.dex */
public final class a extends FMPLogger {
    @Override // com.fyber.inneractive.sdk.logger.FMPLogger
    public final void debug(String str, Object... objArr) {
        int i5 = IAlog.f31163a;
    }

    @Override // com.fyber.inneractive.sdk.logger.FMPLogger
    public final void error(String str, Throwable th2, Object... objArr) {
        if (IAlog.f31163a <= 6) {
            if (th2 == null) {
                Log.e("Inneractive_error", String.format(str, objArr));
            } else {
                Log.e("Inneractive_error", String.format(str, objArr), th2);
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.logger.FMPLogger
    public final void info(String str, Object... objArr) {
        if (IAlog.f31163a <= 4) {
            Log.i("Inneractive_info", String.format(str, objArr));
        }
    }

    @Override // com.fyber.inneractive.sdk.logger.FMPLogger
    public final void initialize(Context context) {
    }

    @Override // com.fyber.inneractive.sdk.logger.FMPLogger
    public final void log(int i5, Exception exc, String str, Object... objArr) {
        int i11 = IAlog.f31163a;
    }

    @Override // com.fyber.inneractive.sdk.logger.FMPLogger
    public final void verbose(String str, Object... objArr) {
        int i5 = IAlog.f31163a;
    }

    @Override // com.fyber.inneractive.sdk.logger.FMPLogger
    public final void warning(String str, Object... objArr) {
        if (IAlog.f31163a <= 4) {
            Log.w("Inneractive_warning", String.format(str, objArr));
        }
    }

    @Override // com.fyber.inneractive.sdk.logger.FMPLogger
    public final void verbose(String str, Throwable th2, Object... objArr) {
        int i5 = IAlog.f31163a;
    }
}
