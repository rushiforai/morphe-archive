package androidx.fragment.app;

import android.animation.AnimatorSet;
import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import java.util.Objects;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class i extends c2 {

    /* renamed from: c, reason: collision with root package name */
    public final g f14593c;

    /* renamed from: d, reason: collision with root package name */
    public AnimatorSet f14594d;

    public i(g gVar) {
        this.f14593c = gVar;
    }

    @Override // androidx.fragment.app.c2
    public final void b(ViewGroup container) {
        Intrinsics.g(container, "container");
        AnimatorSet animatorSet = this.f14594d;
        g gVar = this.f14593c;
        if (animatorSet == null) {
            gVar.f14609a.c(this);
            return;
        }
        d2 d2Var = gVar.f14609a;
        if (d2Var.f14522g) {
            k.f14600a.a(animatorSet);
        } else {
            animatorSet.end();
        }
        if (h1.K(2)) {
            d2Var.toString();
        }
    }

    @Override // androidx.fragment.app.c2
    public final void c(ViewGroup container) {
        Intrinsics.g(container, "container");
        d2 d2Var = this.f14593c.f14609a;
        AnimatorSet animatorSet = this.f14594d;
        if (animatorSet == null) {
            d2Var.c(this);
            return;
        }
        animatorSet.start();
        if (h1.K(2)) {
            Objects.toString(d2Var);
        }
    }

    @Override // androidx.fragment.app.c2
    public final void d(g.b backEvent, ViewGroup container) {
        Intrinsics.g(backEvent, "backEvent");
        Intrinsics.g(container, "container");
        d2 d2Var = this.f14593c.f14609a;
        AnimatorSet animatorSet = this.f14594d;
        if (animatorSet == null) {
            d2Var.c(this);
            return;
        }
        if (Build.VERSION.SDK_INT < 34 || !d2Var.f14518c.mTransitioning) {
            return;
        }
        if (h1.K(2)) {
            d2Var.toString();
        }
        long jA = j.f14597a.a(animatorSet);
        long j11 = (long) (backEvent.f56404c * jA);
        if (j11 == 0) {
            j11 = 1;
        }
        if (j11 == jA) {
            j11 = jA - 1;
        }
        if (h1.K(2)) {
            animatorSet.toString();
            d2Var.toString();
        }
        k.f14600a.b(animatorSet, j11);
    }

    @Override // androidx.fragment.app.c2
    public final void e(ViewGroup container) throws Resources.NotFoundException {
        i iVar;
        Intrinsics.g(container, "container");
        g gVar = this.f14593c;
        if (gVar.a()) {
            return;
        }
        Context context = container.getContext();
        Intrinsics.f(context, "context");
        n0 n0VarB = gVar.b(context);
        this.f14594d = n0VarB != null ? n0VarB.f14629b : null;
        d2 d2Var = gVar.f14609a;
        h0 h0Var = d2Var.f14518c;
        boolean z11 = d2Var.f14516a == 3;
        View view = h0Var.mView;
        container.startViewTransition(view);
        AnimatorSet animatorSet = this.f14594d;
        if (animatorSet != null) {
            iVar = this;
            animatorSet.addListener(new h(container, view, z11, d2Var, iVar));
        } else {
            iVar = this;
        }
        AnimatorSet animatorSet2 = iVar.f14594d;
        if (animatorSet2 != null) {
            animatorSet2.setTarget(view);
        }
    }
}
