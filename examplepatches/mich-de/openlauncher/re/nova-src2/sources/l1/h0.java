package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class h0 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.FloatRef f73364j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ o9 f73365k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Ref.FloatRef f73366l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h0(Ref.FloatRef floatRef, o9 o9Var, Ref.FloatRef floatRef2) {
        super(1);
        this.f73364j = floatRef;
        this.f73365k = o9Var;
        this.f73366l = floatRef2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        c0.l lVar = (c0.l) obj;
        float fFloatValue = ((Number) ((p1.s2) lVar.f18861e).getValue()).floatValue();
        Ref.FloatRef floatRef = this.f73364j;
        float f11 = fFloatValue - floatRef.f71860a;
        o9 o9Var = this.f73365k;
        float fB = o9Var.b();
        o9Var.d(fB + f11);
        float fAbs = Math.abs(fB - o9Var.b());
        floatRef.f71860a = ((Number) ((p1.s2) lVar.f18861e).getValue()).floatValue();
        this.f73366l.f71860a = ((Number) lVar.f18857a.f18833b.invoke(lVar.f18862f)).floatValue();
        if (Math.abs(f11 - fAbs) > 0.5f) {
            lVar.a();
        }
        return Unit.f71706a;
    }
}
