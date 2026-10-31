package b80;

import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.t0;

/* loaded from: classes.dex */
public final /* synthetic */ class b extends FunctionReferenceImpl implements Function3 {

    /* renamed from: d, reason: collision with root package name */
    public static final b f17609d = new b(3, c.class, "register", "register(Lkotlinx/coroutines/selects/SelectInstance;Ljava/lang/Object;)V", 0);

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        c cVar = (c) obj;
        g gVar = (g) obj2;
        long j11 = cVar.f17610a;
        if (j11 <= 0) {
            ((f) gVar).f17629e = Unit.f71706a;
        } else {
            a aVar = new a(0, gVar, cVar);
            Intrinsics.e(gVar, "null cannot be cast to non-null type kotlinx.coroutines.selects.SelectImplementation<*>");
            f fVar = (f) gVar;
            CoroutineContext coroutineContext = fVar.f17625a;
            fVar.f17627c = t0.d(coroutineContext).a(j11, aVar, coroutineContext);
        }
        return Unit.f71706a;
    }
}
