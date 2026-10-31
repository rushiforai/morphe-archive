package com.amplitude;

import androidx.compose.ui.Modifier$Node;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class W0 extends b3.j1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f20418a;

    public W0(String mode) {
        Intrinsics.g(mode, "mode");
        this.f20418a = mode;
    }

    @Override // b2.s, b2.t
    public /* bridge */ /* synthetic */ boolean all(@NotNull Function1 function1) {
        return super.all(function1);
    }

    public boolean any(@NotNull Function1 function1) {
        return ((Boolean) function1.invoke(this)).booleanValue();
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new X0(this.f20418a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof W0) && Intrinsics.b(this.f20418a, ((W0) obj).f20418a);
    }

    @Override // b2.s, b2.t
    public Object foldIn(Object obj, @NotNull Function2 function2) {
        return function2.invoke(obj, this);
    }

    public Object foldOut(Object obj, @NotNull Function2 function2) {
        return function2.invoke(this, obj);
    }

    public final int hashCode() {
        return this.f20418a.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(c3.q2 q2Var) {
        Intrinsics.g(q2Var, "<this>");
        q2Var.d("ampMask");
        q2Var.e(this.f20418a);
    }

    @Override // b2.t
    @NotNull
    public /* bridge */ /* synthetic */ b2.t then(@NotNull b2.t tVar) {
        return super.then(tVar);
    }

    public final String toString() {
        return b.c0.l("MaskElement(mode=", this.f20418a, ")");
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        X0 node = (X0) modifier$Node;
        Intrinsics.g(node, "node");
        Intrinsics.g(this.f20418a, "<set-?>");
    }
}
