package v70;

import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.FunctionReferenceImpl;

/* loaded from: classes.dex */
public final /* synthetic */ class f extends FunctionReferenceImpl implements Function3 {

    /* renamed from: d, reason: collision with root package name */
    public static final f f92152d = new f(3, i.class, "processResultSelectReceiveCatching", "processResultSelectReceiveCatching(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 0);

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        i iVar = (i) obj;
        AtomicLongFieldUpdater atomicLongFieldUpdater = i.f92159d;
        iVar.getClass();
        if (obj3 == k.f92183l) {
            obj3 = new p(iVar.p());
        }
        return new r(obj3);
    }
}
