package t5;

import java.util.concurrent.CancellationException;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class z extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public static final z f88756j = new z(2);

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        q0 msg = (q0) obj;
        Throwable cancellationException = (Throwable) obj2;
        Intrinsics.g(msg, "msg");
        t70.s sVar = msg.f88672b;
        if (cancellationException == null) {
            cancellationException = new CancellationException("DataStore scope was cancelled before updateData could complete");
        }
        sVar.j0(cancellationException);
        return Unit.f71706a;
    }
}
