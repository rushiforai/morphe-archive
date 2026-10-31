package v5;

import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import m90.m;
import m90.z;
import t5.h1;

/* loaded from: classes2.dex */
public final class c extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public static final c f92067j = new c(2);

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        z path = (z) obj;
        Intrinsics.g(path, "path");
        Intrinsics.g((m) obj2, "<anonymous parameter 1>");
        return new h1(br.a.u(path.f76177a.r(), true).f76177a.r());
    }
}
