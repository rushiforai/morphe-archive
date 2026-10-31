package com.amplitude.android.internal.compose;

import a2.c;
import b2.t;
import b3.j1;
import c3.q2;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0007\b\u0080\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u000f\u0010\b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\b\u0010\tJ\u0017\u0010\f\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u0013\u0010\u000f\u001a\u00020\u000b*\u00020\u000eH\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0012J$\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0017\u001a\u00020\u0016HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u001a\u001a\u00020\u0019HÖ\u0001¢\u0006\u0004\b\u001a\u0010\u001bJ\u001a\u0010\u001e\u001a\u00020\u00032\b\u0010\u001d\u001a\u0004\u0018\u00010\u001cHÖ\u0003¢\u0006\u0004\b\u001e\u0010\u001fR\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010 \u001a\u0004\b!\u0010\u0012R\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010 \u001a\u0004\b\"\u0010\u0012¨\u0006#"}, d2 = {"Lcom/amplitude/android/internal/compose/AmpFrustrationIgnoreElement;", "Lb3/j1;", "Lcom/amplitude/android/internal/compose/AmpFrustrationIgnoreNode;", b.f42142b, "ignoreRageClick", "ignoreDeadClick", "<init>", "(ZZ)V", "create", "()Lcom/amplitude/android/internal/compose/AmpFrustrationIgnoreNode;", "node", b.f42142b, "update", "(Lcom/amplitude/android/internal/compose/AmpFrustrationIgnoreNode;)V", "Lc3/q2;", "inspectableProperties", "(Lc3/q2;)V", "component1", "()Z", "component2", "copy", "(ZZ)Lcom/amplitude/android/internal/compose/AmpFrustrationIgnoreElement;", b.f42142b, "toString", "()Ljava/lang/String;", b.f42142b, "hashCode", "()I", b.f42142b, InneractiveMediationNameConsts.OTHER, "equals", "(Ljava/lang/Object;)Z", "Z", "getIgnoreRageClick", "getIgnoreDeadClick", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final /* data */ class AmpFrustrationIgnoreElement extends j1 {
    private final boolean ignoreDeadClick;
    private final boolean ignoreRageClick;

    public AmpFrustrationIgnoreElement(boolean z11, boolean z12) {
        this.ignoreRageClick = z11;
        this.ignoreDeadClick = z12;
    }

    public static /* synthetic */ AmpFrustrationIgnoreElement copy$default(AmpFrustrationIgnoreElement ampFrustrationIgnoreElement, boolean z11, boolean z12, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = ampFrustrationIgnoreElement.ignoreRageClick;
        }
        if ((i5 & 2) != 0) {
            z12 = ampFrustrationIgnoreElement.ignoreDeadClick;
        }
        return ampFrustrationIgnoreElement.copy(z11, z12);
    }

    @Override // b2.s, b2.t
    public /* bridge */ /* synthetic */ boolean all(@NotNull Function1 function1) {
        return super.all(function1);
    }

    public boolean any(@NotNull Function1 function1) {
        return ((Boolean) function1.invoke(this)).booleanValue();
    }

    /* renamed from: component1, reason: from getter */
    public final boolean getIgnoreRageClick() {
        return this.ignoreRageClick;
    }

    /* renamed from: component2, reason: from getter */
    public final boolean getIgnoreDeadClick() {
        return this.ignoreDeadClick;
    }

    @NotNull
    public final AmpFrustrationIgnoreElement copy(boolean ignoreRageClick, boolean ignoreDeadClick) {
        return new AmpFrustrationIgnoreElement(ignoreRageClick, ignoreDeadClick);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AmpFrustrationIgnoreElement)) {
            return false;
        }
        AmpFrustrationIgnoreElement ampFrustrationIgnoreElement = (AmpFrustrationIgnoreElement) other;
        return this.ignoreRageClick == ampFrustrationIgnoreElement.ignoreRageClick && this.ignoreDeadClick == ampFrustrationIgnoreElement.ignoreDeadClick;
    }

    @Override // b2.s, b2.t
    public Object foldIn(Object obj, @NotNull Function2 function2) {
        return function2.invoke(obj, this);
    }

    public Object foldOut(Object obj, @NotNull Function2 function2) {
        return function2.invoke(this, obj);
    }

    public final boolean getIgnoreDeadClick() {
        return this.ignoreDeadClick;
    }

    public final boolean getIgnoreRageClick() {
        return this.ignoreRageClick;
    }

    public int hashCode() {
        return Boolean.hashCode(this.ignoreDeadClick) + (Boolean.hashCode(this.ignoreRageClick) * 31);
    }

    @Override // b3.j1
    public void inspectableProperties(@NotNull q2 q2Var) {
        Intrinsics.g(q2Var, "<this>");
        q2Var.d("ampIgnoreFrustrationAnalytics");
        q2Var.b().b("ignoreRageClick", Boolean.valueOf(this.ignoreRageClick));
        q2Var.b().b("ignoreDeadClick", Boolean.valueOf(this.ignoreDeadClick));
    }

    @Override // b2.t
    @NotNull
    public /* bridge */ /* synthetic */ t then(@NotNull t tVar) {
        return super.then(tVar);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AmpFrustrationIgnoreElement(ignoreRageClick=");
        sb2.append(this.ignoreRageClick);
        sb2.append(", ignoreDeadClick=");
        return c.p(sb2, this.ignoreDeadClick, ')');
    }

    @Override // b3.j1
    @NotNull
    public AmpFrustrationIgnoreNode create() {
        return new AmpFrustrationIgnoreNode(this.ignoreRageClick, this.ignoreDeadClick);
    }

    @Override // b3.j1
    public void update(@NotNull AmpFrustrationIgnoreNode node) {
        Intrinsics.g(node, "node");
        node.setIgnoreRageClick(this.ignoreRageClick);
        node.setIgnoreDeadClick(this.ignoreDeadClick);
    }
}
