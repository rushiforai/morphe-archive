package com.instabridge.mobilesdk.internal;

import android.util.Log;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0003\n\u0002\b\u0002\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u0005J\u001a\u0010\f\u001a\u00020\r2\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\u000fH\u0086\bø\u0001\u0000J\u001a\u0010\u0010\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u00052\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0012J\u001a\u0010\u0013\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u00052\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0012R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u001a\u0010\u0006\u001a\u00020\u0007X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\b\u0010\t\"\u0004\b\n\u0010\u000b\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u0014"}, d2 = {"Lcom/instabridge/mobilesdk/internal/Logger;", b.f42142b, "<init>", "()V", "TAG", b.f42142b, "debug", b.f42142b, "getDebug", "()Z", "setDebug", "(Z)V", "d", b.f42142b, "msg", "Lkotlin/Function0;", "w", "t", b.f42142b, "e", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class Logger {

    @NotNull
    private static final String TAG = "MobileSdk";
    private static boolean debug;

    @NotNull
    public static final Logger INSTANCE = new Logger();
    public static final int $stable = 8;

    private Logger() {
    }

    public static /* synthetic */ void e$default(Logger logger, String str, Throwable th2, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            th2 = null;
        }
        logger.e(str, th2);
    }

    public static /* synthetic */ void w$default(Logger logger, String str, Throwable th2, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            th2 = null;
        }
        logger.w(str, th2);
    }

    public final void d(@NotNull String msg) {
        Intrinsics.g(msg, "msg");
    }

    public final void e(@NotNull String msg, @Nullable Throwable t6) {
        Intrinsics.g(msg, "msg");
        Log.e(TAG, msg, t6);
    }

    public final boolean getDebug() {
        return debug;
    }

    public final void setDebug(boolean z11) {
        debug = z11;
    }

    public final void w(@NotNull String msg, @Nullable Throwable t6) {
        Intrinsics.g(msg, "msg");
        Log.w(TAG, msg, t6);
    }

    public final void d(@NotNull Function0<String> msg) {
        Intrinsics.g(msg, "msg");
        if (getDebug()) {
        }
    }
}
