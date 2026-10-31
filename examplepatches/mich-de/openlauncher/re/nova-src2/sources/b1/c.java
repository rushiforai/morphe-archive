package b1;

import androidx.compose.ui.node.DelegatingNode;
import b3.l2;
import b3.o;
import g2.e;
import g2.t;
import g2.v;
import g2.w;
import kotlin.jvm.functions.Function0;
import v2.f0;
import v2.l0;
import v2.m;
import v2.n;

/* loaded from: classes.dex */
public final class c extends DelegatingNode implements l2, e, t {

    /* renamed from: a, reason: collision with root package name */
    public Function0 f16522a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f16523b;

    /* renamed from: c, reason: collision with root package name */
    public final l0 f16524c;

    public c(Function0 function0) {
        this.f16522a = function0;
        b bVar = new b(this, 0);
        m mVar = f0.f91929a;
        this.f16524c = (l0) delegate(new l0(null, null, bVar));
    }

    @Override // b3.l2
    /* renamed from: getTouchBoundsExpansion-RZrCHBk */
    public final long mo24getTouchBoundsExpansionRZrCHBk() {
        return androidx.compose.foundation.text.handwriting.a.f14048a.a(o.f(this).getDensity());
    }

    @Override // b3.l2
    public final void onCancelPointerInput() {
        this.f16524c.onCancelPointerInput();
    }

    @Override // g2.e
    public final void onFocusEvent(v vVar) {
        this.f16523b = ((w) vVar).b();
    }

    @Override // b3.l2
    /* renamed from: onPointerEvent-H0pRuoY */
    public final void mo26onPointerEventH0pRuoY(m mVar, n nVar, long j11) {
        this.f16524c.mo26onPointerEventH0pRuoY(mVar, nVar, j11);
    }
}
