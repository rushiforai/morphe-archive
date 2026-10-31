package v70;

import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.FunctionReferenceImpl;

/* loaded from: classes.dex */
public final /* synthetic */ class d extends FunctionReferenceImpl implements Function3 {

    /* renamed from: d, reason: collision with root package name */
    public static final d f92150d = new d(3, i.class, "processResultSelectReceive", "processResultSelectReceive(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 0);

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) throws Throwable {
        i iVar = (i) obj;
        AtomicLongFieldUpdater atomicLongFieldUpdater = i.f92159d;
        iVar.getClass();
        if (obj3 != k.f92183l) {
            return obj3;
        }
        throw iVar.u();
    }
}
