package l1;

import h6.a0;
import java.util.List;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class e6 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73254j = 1;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ boolean f73255k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Object f73256l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Object f73257m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e6(List list, p6.n nVar, boolean z11) {
        super(1);
        this.f73256l = nVar;
        this.f73255k = z11;
        this.f73257m = list;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f73254j) {
            case 0:
                y3.c cVar = (y3.c) this.f73256l;
                Function1 function1 = (Function1) this.f73257m;
                return new f6(this.f73255k, cVar, (g6) obj, function1);
            default:
                final List list = (List) this.f73257m;
                final p6.n nVar = (p6.n) this.f73256l;
                final boolean z11 = this.f73255k;
                h6.y yVar = new h6.y() { // from class: q6.m
                    @Override // h6.y
                    public final void d(a0 a0Var, h6.s sVar) {
                        boolean z12 = z11;
                        List list2 = list;
                        p6.n nVar2 = nVar;
                        if (z12 && !list2.contains(nVar2)) {
                            list2.add(nVar2);
                        }
                        if (sVar == h6.s.ON_START && !list2.contains(nVar2)) {
                            list2.add(nVar2);
                        }
                        if (sVar == h6.s.ON_STOP) {
                            list2.remove(nVar2);
                        }
                    }
                };
                nVar.f82198h.a(yVar);
                return new b00.g0(13, nVar, yVar);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e6(boolean z11, y3.c cVar, Function1 function1) {
        super(1);
        this.f73255k = z11;
        this.f73256l = cVar;
        this.f73257m = function1;
    }
}
