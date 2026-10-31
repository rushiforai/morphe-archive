package t7;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class g extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public static final g f88767j = new g(1);

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        u7.c it = (u7.c) obj;
        Intrinsics.g(it, "it");
        return it.getClass().getSimpleName();
    }
}
