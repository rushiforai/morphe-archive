package e0;

import androidx.compose.ui.node.LayoutNode;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import p1.o2;

/* loaded from: classes2.dex */
public final class a2 implements g0.b2 {

    /* renamed from: i, reason: collision with root package name */
    public static final ab.c0 f49896i = new ab.c0(7, new b10.o1(22), new z1(0));

    /* renamed from: a, reason: collision with root package name */
    public final o2 f49897a;

    /* renamed from: e, reason: collision with root package name */
    public float f49901e;

    /* renamed from: b, reason: collision with root package name */
    public final o2 f49898b = androidx.compose.runtime.d.g(0);

    /* renamed from: c, reason: collision with root package name */
    public final i0.i f49899c = new i0.i();

    /* renamed from: d, reason: collision with root package name */
    public final o2 f49900d = androidx.compose.runtime.d.g(LayoutNode.NotPlacedPlaceOrder);

    /* renamed from: f, reason: collision with root package name */
    public final g0.l f49902f = new g0.l(new cw.c0(this, 8));

    /* renamed from: g, reason: collision with root package name */
    public final p1.i0 f49903g = androidx.compose.runtime.d.d(new y1(this, 0));

    /* renamed from: h, reason: collision with root package name */
    public final p1.i0 f49904h = androidx.compose.runtime.d.d(new y1(this, 1));

    public a2(int i5) {
        this.f49897a = androidx.compose.runtime.d.g(i5);
    }

    @Override // g0.b2
    public final float a(float f11) {
        return this.f49902f.a(f11);
    }

    @Override // g0.b2
    public final boolean b() {
        return this.f49902f.b();
    }

    @Override // g0.b2
    public final boolean c() {
        return ((Boolean) this.f49904h.getValue()).booleanValue();
    }

    @Override // g0.b2
    public final Object d(f1 f1Var, Function2 function2, ContinuationImpl continuationImpl) {
        Object objD = this.f49902f.d(f1Var, function2, continuationImpl);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }

    @Override // g0.b2
    public final boolean e() {
        return ((Boolean) this.f49903g.getValue()).booleanValue();
    }

    public final Object f(int i5, c0.m mVar, ContinuationImpl continuationImpl) {
        Object objA = g0.m1.a(this, i5 - h(), mVar, continuationImpl);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    public final int g() {
        return this.f49900d.m();
    }

    public final int h() {
        return this.f49897a.m();
    }
}
