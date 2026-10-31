package g;

import android.window.OnBackInvokedCallback;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class x {

    /* renamed from: a, reason: collision with root package name */
    public static final x f56443a = new x();

    @NotNull
    public final OnBackInvokedCallback a(@NotNull Function1<? super b, Unit> onBackStarted, @NotNull Function1<? super b, Unit> onBackProgressed, @NotNull Function0<Unit> onBackInvoked, @NotNull Function0<Unit> onBackCancelled) {
        Intrinsics.g(onBackStarted, "onBackStarted");
        Intrinsics.g(onBackProgressed, "onBackProgressed");
        Intrinsics.g(onBackInvoked, "onBackInvoked");
        Intrinsics.g(onBackCancelled, "onBackCancelled");
        return new w(onBackStarted, onBackProgressed, onBackInvoked, onBackCancelled);
    }
}
