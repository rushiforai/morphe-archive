package l1;

import android.window.BackEvent;
import android.window.OnBackAnimationCallback;
import kotlin.jvm.functions.Function0;

/* loaded from: classes2.dex */
public final class r3 implements OnBackAnimationCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f73900a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c0.e f73901b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f73902c;

    public r3(Function0 function0, c0.e eVar, t70.j0 j0Var) {
        this.f73900a = j0Var;
        this.f73901b = eVar;
        this.f73902c = function0;
    }

    public final void onBackCancelled() {
        t70.m0.t(this.f73900a, null, null, new p3(this.f73901b, null, 0), 3);
    }

    public final void onBackInvoked() {
        this.f73902c.invoke();
    }

    public final void onBackProgressed(BackEvent backEvent) {
        t70.m0.t(this.f73900a, null, null, new q3(this.f73901b, backEvent, null, 0), 3);
    }

    public final void onBackStarted(BackEvent backEvent) {
        t70.m0.t(this.f73900a, null, null, new q3(this.f73901b, backEvent, null, 1), 3);
    }
}
