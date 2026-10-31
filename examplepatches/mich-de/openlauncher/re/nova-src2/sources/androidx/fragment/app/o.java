package androidx.fragment.app;

import android.transition.Transition;

/* loaded from: classes2.dex */
public final class o extends l {

    /* renamed from: b, reason: collision with root package name */
    public final Object f14635b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f14636c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f14637d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(d2 d2Var, boolean z11, boolean z12) {
        super(d2Var);
        h0 h0Var = d2Var.f14518c;
        this.f14635b = d2Var.f14516a == 2 ? z11 ? h0Var.getReenterTransition() : h0Var.getEnterTransition() : z11 ? h0Var.getReturnTransition() : h0Var.getExitTransition();
        this.f14636c = d2Var.f14516a == 2 ? z11 ? h0Var.getAllowReturnTransitionOverlap() : h0Var.getAllowEnterTransitionOverlap() : true;
        this.f14637d = z12 ? z11 ? h0Var.getSharedElementReturnTransition() : h0Var.getSharedElementEnterTransition() : null;
    }

    public final w1 b() {
        Object obj = this.f14635b;
        w1 w1VarC = c(obj);
        Object obj2 = this.f14637d;
        w1 w1VarC2 = c(obj2);
        if (w1VarC == null || w1VarC2 == null || w1VarC == w1VarC2) {
            return w1VarC == null ? w1VarC2 : w1VarC;
        }
        throw new IllegalArgumentException(("Mixing framework transitions and AndroidX transitions is not allowed. Fragment " + this.f14609a.f14518c + " returned Transition " + obj + " which uses a different Transition  type than its shared element transition " + obj2).toString());
    }

    public final w1 c(Object obj) {
        if (obj == null) {
            return null;
        }
        w1 w1Var = r1.f14678a;
        if (obj instanceof Transition) {
            return w1Var;
        }
        w1 w1Var2 = r1.f14679b;
        if (w1Var2 != null) {
            w1Var2.getClass();
            if (obj instanceof Transition) {
                return w1Var2;
            }
        }
        throw new IllegalArgumentException("Transition " + obj + " for fragment " + this.f14609a.f14518c + " is not a valid framework Transition or AndroidX Transition");
    }
}
