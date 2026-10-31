package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class b0 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ a2 f73037j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Ref.FloatRef f73038k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Ref.FloatRef f73039l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(a2 a2Var, Ref.FloatRef floatRef, Ref.FloatRef floatRef2) {
        super(0);
        this.f73037j = a2Var;
        this.f73038k = floatRef;
        this.f73039l = floatRef2;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        o9 o9Var;
        a2 a2Var = this.f73037j;
        Float fValueOf = (a2Var == null || (o9Var = (o9) a2Var.f73007a) == null) ? null : Float.valueOf(o9Var.c());
        Ref.FloatRef floatRef = this.f73038k;
        float f11 = floatRef.f71860a;
        Ref.FloatRef floatRef2 = this.f73039l;
        if (!Intrinsics.a(fValueOf, f11 - floatRef2.f71860a)) {
            o9 o9Var2 = a2Var != null ? (o9) a2Var.f73007a : null;
            if (o9Var2 != null) {
                o9Var2.f73759a.p(floatRef.f71860a - floatRef2.f71860a);
            }
        }
        return Unit.f71706a;
    }
}
