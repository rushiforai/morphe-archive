package b3;

import java.util.Iterator;
import java.util.Map;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class a extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ b f17140j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(b bVar) {
        super(1);
        this.f17140j = bVar;
    }

    /* JADX WARN: Type inference failed for: r0v7, types: [b3.c, z2.i1] */
    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        b bVar;
        c cVar = (c) obj;
        if (cVar.isPlaced()) {
            if (cVar.a().f17152b) {
                cVar.q();
            }
            Iterator it = cVar.a().f17159i.entrySet().iterator();
            while (true) {
                boolean zHasNext = it.hasNext();
                bVar = this.f17140j;
                if (!zHasNext) {
                    break;
                }
                Map.Entry entry = (Map.Entry) it.next();
                b.a(bVar, (z2.n) entry.getKey(), ((Number) entry.getValue()).intValue(), cVar.B());
            }
            t1 t1Var = cVar.B().f17360q;
            Intrinsics.d(t1Var);
            while (!t1Var.equals(bVar.f17151a.B())) {
                for (z2.n nVar : bVar.c(t1Var).keySet()) {
                    b.a(bVar, nVar, bVar.d(t1Var, nVar), t1Var);
                }
                t1Var = t1Var.f17360q;
                Intrinsics.d(t1Var);
            }
        }
        return Unit.f71706a;
    }
}
