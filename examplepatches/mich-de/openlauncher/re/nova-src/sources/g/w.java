package g;

import android.window.BackEvent;
import android.window.OnBackAnimationCallback;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class w implements OnBackAnimationCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function1 f56439a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f56440b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f56441c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function0 f56442d;

    public w(Function1 function1, Function1 function12, Function0 function0, Function0 function02) {
        this.f56439a = function1;
        this.f56440b = function12;
        this.f56441c = function0;
        this.f56442d = function02;
    }

    public final void onBackCancelled() {
        this.f56442d.invoke();
    }

    public final void onBackInvoked() {
        this.f56441c.invoke();
    }

    public final void onBackProgressed(BackEvent backEvent) {
        Intrinsics.g(backEvent, "backEvent");
        this.f56440b.invoke(new b(backEvent));
    }

    public final void onBackStarted(BackEvent backEvent) {
        Intrinsics.g(backEvent, "backEvent");
        this.f56439a.invoke(new b(backEvent));
    }
}
