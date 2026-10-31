package kotlin.internal.jdk7;

import java.util.List;
import k70.a;
import kotlin.Metadata;
import kotlin.internal.PlatformImplementations;
import kotlin.jvm.internal.Intrinsics;
import u90.b;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0010\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lkotlin/internal/jdk7/JDK7PlatformImplementations;", "Lkotlin/internal/PlatformImplementations;", "<init>", "()V", "k70/a", "kotlin-stdlib-jdk7"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public class JDK7PlatformImplementations extends PlatformImplementations {
    @Override // kotlin.internal.PlatformImplementations
    public final void a(Throwable cause, Throwable exception) {
        Intrinsics.g(cause, "cause");
        Intrinsics.g(exception, "exception");
        Integer num = a.f71192a;
        if (num == null || num.intValue() >= 19) {
            cause.addSuppressed(exception);
        } else {
            super.a(cause, exception);
        }
    }

    @Override // kotlin.internal.PlatformImplementations
    public final List b(Throwable exception) {
        Intrinsics.g(exception, "exception");
        Integer num = a.f71192a;
        if (num != null && num.intValue() < 19) {
            return super.b(exception);
        }
        Throwable[] suppressed = exception.getSuppressed();
        Intrinsics.f(suppressed, "getSuppressed(...)");
        return b.f(suppressed);
    }
}
