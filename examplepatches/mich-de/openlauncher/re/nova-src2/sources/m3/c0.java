package m3;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public static final c0 f75846a = new c0();

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        if (Intrinsics.b(obj, Boolean.FALSE)) {
            return new i2.s(i2.s.f61147m);
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Int");
        return new i2.s(i2.r0.b(((Integer) obj).intValue()));
    }
}
