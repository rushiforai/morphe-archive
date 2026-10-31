package ads_mobile_sdk;

import java.lang.Thread;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class xh3 implements Thread.UncaughtExceptionHandler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ci3 f11726a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Thread.UncaughtExceptionHandler f11727b;

    public xh3(ci3 ci3Var, Thread.UncaughtExceptionHandler uncaughtExceptionHandler) {
        this.f11726a = ci3Var;
        this.f11727b = uncaughtExceptionHandler;
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public final void uncaughtException(Thread thread, Throwable throwable) {
        Thread.UncaughtExceptionHandler uncaughtExceptionHandler = this.f11727b;
        Intrinsics.g(thread, "thread");
        Intrinsics.g(throwable, "throwable");
        try {
            this.f11726a.a(throwable);
            if (uncaughtExceptionHandler == null) {
                return;
            }
        } catch (Throwable unused) {
            if (uncaughtExceptionHandler == null) {
                return;
            }
        }
        uncaughtExceptionHandler.uncaughtException(thread, throwable);
    }
}
