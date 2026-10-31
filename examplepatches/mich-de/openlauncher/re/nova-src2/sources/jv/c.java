package jv;

import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final class c implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69995a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ bo.c f69996b;

    public /* synthetic */ c(bo.c cVar, int i5) {
        this.f69995a = i5;
        this.f69996b = cVar;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        switch (this.f69995a) {
            case 0:
                u uVar = (u) obj;
                boolean z11 = uVar.f70173c;
                List list = uVar.f70171a;
                if (!z11 && !uVar.f70174d && list.size() == 1) {
                    ou.j jVar = (ou.j) b70.g.W0(list);
                    bo.c cVar = this.f69996b;
                    ((Function1) cVar.f18340g).invoke(jVar);
                    if (!((AtomicBoolean) cVar.f18341h).getAndSet(true)) {
                        ((Function1) cVar.f18338e).invoke(Boolean.TRUE);
                    }
                }
                break;
            default:
                if (((List) obj).isEmpty()) {
                    bo.c cVar2 = this.f69996b;
                    if (!((AtomicBoolean) cVar2.f18341h).getAndSet(true)) {
                        ((Function1) cVar2.f18338e).invoke(Boolean.FALSE);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
