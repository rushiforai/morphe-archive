package k6;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final KClass f71151a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f71152b;

    public e(KClass clazz, Function1 function1) {
        Intrinsics.g(clazz, "clazz");
        this.f71151a = clazz;
        this.f71152b = function1;
    }
}
