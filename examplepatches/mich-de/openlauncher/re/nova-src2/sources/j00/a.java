package j00;

import java.util.List;
import jr.q0;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68440a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f68441b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f68442c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f68443d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f68444e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f68445f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f68446g;

    public /* synthetic */ a(Object obj, boolean z11, Object obj2, Object obj3, Function2 function2, Function1 function1, int i5, int i11) {
        this.f68440a = i11;
        this.f68446g = obj;
        this.f68441b = z11;
        this.f68442c = obj2;
        this.f68443d = obj3;
        this.f68444e = function2;
        this.f68445f = function1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f68440a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(1);
                i30.j.a((u10.c) this.f68446g, this.f68441b, (List) this.f68442c, (p6.t) this.f68443d, (Function2) this.f68444e, (Function1) this.f68445f, (p1.o) obj, iL);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(1);
                ic.b.f((u10.e0) this.f68446g, this.f68441b, (List) this.f68442c, (p6.t) this.f68443d, (Function2) this.f68444e, (Function1) this.f68445f, (p1.o) obj, iL2);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iL3 = p1.a0.l(24577);
                x7.f.e((String) this.f68446g, this.f68441b, (b2.t) this.f68442c, (String) this.f68443d, (Function2) this.f68444e, (Function1) this.f68445f, (p1.o) obj, iL3);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iL4 = p1.a0.l(7);
                io.sentry.config.a.k((List) this.f68442c, (List) this.f68446g, (List) this.f68443d, (List) this.f68445f, (Function2) this.f68444e, this.f68441b, (p1.o) obj, iL4);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL5 = p1.a0.l(1);
                p7.u.f((q0) this.f68446g, this.f68441b, (b2.t) this.f68442c, (Function1) this.f68445f, (Function1) this.f68443d, (ir.i) this.f68444e, (p1.o) obj, iL5);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ a(List list, List list2, List list3, List list4, Function2 function2, boolean z11, int i5) {
        this.f68440a = 3;
        this.f68442c = list;
        this.f68446g = list2;
        this.f68443d = list3;
        this.f68445f = list4;
        this.f68444e = function2;
        this.f68441b = z11;
    }

    public /* synthetic */ a(q0 q0Var, boolean z11, b2.t tVar, Function1 function1, Function1 function12, ir.i iVar, int i5) {
        this.f68440a = 4;
        this.f68446g = q0Var;
        this.f68441b = z11;
        this.f68442c = tVar;
        this.f68445f = function1;
        this.f68443d = function12;
        this.f68444e = iVar;
    }
}
