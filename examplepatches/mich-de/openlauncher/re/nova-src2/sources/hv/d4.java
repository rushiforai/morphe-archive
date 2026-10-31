package hv;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;

/* loaded from: classes4.dex */
public final class d4 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public static final d4 f60215a = new d4();

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        j3.b0 semantics = (j3.b0) obj;
        Intrinsics.g(semantics, "$this$semantics");
        KProperty[] kPropertyArr = j3.z.f68879a;
        j3.a0 a0Var = j3.x.f68876a;
        KProperty kProperty = j3.z.f68879a[0];
        a0Var.a(semantics, Boolean.TRUE);
        return Unit.f71706a;
    }
}
