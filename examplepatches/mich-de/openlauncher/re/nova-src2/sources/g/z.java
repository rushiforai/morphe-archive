package g;

import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class z implements c {

    /* renamed from: a, reason: collision with root package name */
    public final s f56448a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a0 f56449b;

    public z(a0 a0Var, s onBackPressedCallback) {
        Intrinsics.g(onBackPressedCallback, "onBackPressedCallback");
        this.f56449b = a0Var;
        this.f56448a = onBackPressedCallback;
    }

    @Override // g.c
    public final void cancel() {
        a0 a0Var = this.f56449b;
        ArrayDeque arrayDeque = a0Var.f56396b;
        s sVar = this.f56448a;
        arrayDeque.remove(sVar);
        if (Intrinsics.b(a0Var.f56397c, sVar)) {
            sVar.handleOnBackCancelled();
            a0Var.f56397c = null;
        }
        sVar.removeCancellable(this);
        Function0<Unit> enabledChangedCallback$activity_release = sVar.getEnabledChangedCallback$activity_release();
        if (enabledChangedCallback$activity_release != null) {
            enabledChangedCallback$activity_release.invoke();
        }
        sVar.setEnabledChangedCallback$activity_release(null);
    }
}
