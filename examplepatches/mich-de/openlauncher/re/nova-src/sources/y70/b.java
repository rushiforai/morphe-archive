package y70;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final w50.g f96787a = new w50.g("CLOSED", 1);

    public static final Object a(t tVar, long j11, Function2 function2) {
        while (true) {
            if (tVar.f96826c >= j11 && !tVar.d()) {
                return tVar;
            }
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = c.f96788a;
            Object obj = atomicReferenceFieldUpdater.get(tVar);
            w50.g gVar = f96787a;
            if (obj == gVar) {
                return gVar;
            }
            t tVar2 = (t) ((c) obj);
            if (tVar2 == null) {
                tVar2 = (t) function2.invoke(Long.valueOf(tVar.f96826c + 1), tVar);
                while (!atomicReferenceFieldUpdater.compareAndSet(tVar, null, tVar2)) {
                    if (atomicReferenceFieldUpdater.get(tVar) != null) {
                        break;
                    }
                }
                if (tVar.d()) {
                    tVar.e();
                }
            }
            tVar = tVar2;
        }
    }
}
