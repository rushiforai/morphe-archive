package z2;

import androidx.compose.ui.Modifier$Node;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class e1 extends Modifier$Node implements b3.c0 {

    /* renamed from: a, reason: collision with root package name */
    public Function1 f98048a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f98049b = true;

    /* renamed from: c, reason: collision with root package name */
    public long f98050c;

    public e1(Function1 function1) {
        this.f98048a = function1;
        long j11 = Integer.MIN_VALUE;
        this.f98050c = (j11 & 4294967295L) | (j11 << 32);
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final boolean getShouldAutoInvalidate() {
        return this.f98049b;
    }

    @Override // b3.c0
    /* renamed from: onRemeasured-ozmzZPI */
    public final void mo27onRemeasuredozmzZPI(long j11) {
        if (y3.m.a(this.f98050c, j11)) {
            return;
        }
        this.f98048a.invoke(new y3.m(j11));
        this.f98050c = j11;
    }
}
