package p7;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class w extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public static final w f82392j = new w(1);

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        x7.q spec = (x7.q) obj;
        Intrinsics.g(spec, "spec");
        return spec.d() ? "Periodic" : "OneTime";
    }
}
