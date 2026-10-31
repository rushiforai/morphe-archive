package f2;

import androidx.compose.ui.Modifier$Node;
import b3.b1;
import b3.o;
import b3.q;
import b3.z1;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import y3.n;

/* loaded from: classes.dex */
public final class b extends Modifier$Node implements z1, a, q {

    /* renamed from: a, reason: collision with root package name */
    public final c f54227a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f54228b;

    /* renamed from: c, reason: collision with root package name */
    public Function1 f54229c;

    public b(c cVar, Function1 function1) {
        this.f54227a = cVar;
        this.f54229c = function1;
        cVar.f54230a = this;
    }

    public final void B() {
        this.f54228b = false;
        this.f54227a.f54231b = null;
        b3.g.d(this);
    }

    @Override // b3.q
    public final void draw(k2.c cVar) {
        boolean z11 = this.f54228b;
        c cVar2 = this.f54227a;
        if (!z11) {
            cVar2.f54231b = null;
            b3.g.f(this, new b1(10, this, cVar2));
            if (cVar2.f54231b == null) {
                throw a2.c.r("DrawResult not defined, did you forget to call onDraw?");
            }
            this.f54228b = true;
        }
        cm.f fVar = cVar2.f54231b;
        Intrinsics.d(fVar);
        fVar.z().invoke(cVar);
    }

    @Override // f2.a
    public final y3.c getDensity() {
        return o.f(this).getDensity();
    }

    @Override // f2.a
    public final n getLayoutDirection() {
        return o.f(this).getLayoutDirection();
    }

    @Override // f2.a
    /* renamed from: getSize-NH-jbRc */
    public final long mo23getSizeNHjbRc() {
        return w20.e.t(o.d(this, 128).f98083c);
    }

    @Override // b3.z1
    public final void k() {
        B();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDensityChange() {
        B();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        super.onDetach();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onLayoutDirectionChange() {
        B();
    }

    @Override // b3.q
    public final void onMeasureResultChanged() {
        B();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onReset() {
        super.onReset();
        B();
    }
}
