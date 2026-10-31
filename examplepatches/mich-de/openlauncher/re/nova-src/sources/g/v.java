package g;

import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public static final v f56438a = new v();

    @NotNull
    public final OnBackInvokedCallback a(@NotNull Function0<Unit> onBackInvoked) {
        Intrinsics.g(onBackInvoked, "onBackInvoked");
        return new c4.s(onBackInvoked, 1);
    }

    public final void b(@NotNull Object dispatcher, int i5, @NotNull Object callback) {
        Intrinsics.g(dispatcher, "dispatcher");
        Intrinsics.g(callback, "callback");
        ((OnBackInvokedDispatcher) dispatcher).registerOnBackInvokedCallback(i5, (OnBackInvokedCallback) callback);
    }

    public final void c(@NotNull Object dispatcher, @NotNull Object callback) {
        Intrinsics.g(dispatcher, "dispatcher");
        Intrinsics.g(callback, "callback");
        ((OnBackInvokedDispatcher) dispatcher).unregisterOnBackInvokedCallback((OnBackInvokedCallback) callback);
    }
}
