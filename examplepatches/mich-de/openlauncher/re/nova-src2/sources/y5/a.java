package y5;

import b.c0;
import java.util.Map;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class a extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public static final a f96719j = new a(1);

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Map.Entry entry = (Map.Entry) obj;
        Intrinsics.g(entry, "entry");
        Object value = entry.getValue();
        return c0.r(new StringBuilder("  "), ((f) entry.getKey()).f96729a, " = ", value instanceof byte[] ? kotlin.collections.c.M0((byte[]) value, ", ", null, 56) : String.valueOf(entry.getValue()));
    }
}
