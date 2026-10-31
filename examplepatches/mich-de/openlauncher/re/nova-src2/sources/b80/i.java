package b80;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.TypeIntrinsics;

/* loaded from: classes.dex */
public abstract class i {

    /* renamed from: a, reason: collision with root package name */
    public static final w50.g f17631a = new w50.g("STATE_REG", 1);

    /* renamed from: b, reason: collision with root package name */
    public static final w50.g f17632b = new w50.g("STATE_COMPLETED", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final w50.g f17633c = new w50.g("STATE_CANCELLED", 1);

    /* renamed from: d, reason: collision with root package name */
    public static final w50.g f17634d = new w50.g("NO_RESULT", 1);

    /* renamed from: e, reason: collision with root package name */
    public static final w50.g f17635e = new w50.g("PARAM_CLAUSE_0", 1);

    /* JADX WARN: Multi-variable type inference failed */
    public static final void a(f fVar, long j11, Function1 function1) {
        c cVar = new c(j11);
        b bVar = b.f17609d;
        TypeIntrinsics.e(3, bVar);
        d dVar = new d(fVar, cVar, bVar, h.f17630a, f17635e, (SuspendLambda) function1, null);
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f.f17624f;
        fVar.g(dVar, false);
    }
}
