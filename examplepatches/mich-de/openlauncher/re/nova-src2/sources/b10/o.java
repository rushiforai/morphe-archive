package b10;

import com.teslacoilsw.launcher.onboarding.FirstRunActivityCompose;
import java.util.List;
import java.util.Set;
import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.ranges.IntRange;

/* loaded from: classes4.dex */
public final /* synthetic */ class o implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16811a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f16812b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f16813c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f16814d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f16815e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f16816f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f16817g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f16818h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f16819i;

    public /* synthetic */ o(FirstRunActivityCompose firstRunActivityCompose, p0.b bVar, p0.b bVar2, List list, Set set, boolean z11, List list2, int i5) {
        this.f16811a = 0;
        this.f16814d = firstRunActivityCompose;
        this.f16815e = bVar;
        this.f16816f = bVar2;
        this.f16817g = list;
        this.f16819i = set;
        this.f16812b = z11;
        this.f16818h = list2;
        this.f16813c = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f16811a;
        int i11 = this.f16813c;
        Object obj3 = this.f16819i;
        Object obj4 = this.f16818h;
        Object obj5 = this.f16817g;
        Object obj6 = this.f16816f;
        Object obj7 = this.f16815e;
        Object obj8 = this.f16814d;
        switch (i5) {
            case 0:
                ((Integer) obj2).getClass();
                int i12 = FirstRunActivityCompose.f45937s;
                int iL = p1.a0.l(i11 | 1);
                ((FirstRunActivityCompose) obj8).h0((p0.b) obj7, (p0.b) obj6, (List) obj5, (Set) obj3, this.f16812b, (List) obj4, (p1.o) obj, iL);
                break;
            case 1:
                int iIntValue = ((Integer) obj2).intValue();
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(i11 | 1);
                jk.b.i((String) obj8, (String) obj7, (String) obj6, (String) obj5, this.f16812b, (Function0) obj4, (Function0) obj3, (p1.o) obj, iL2);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iL3 = p1.a0.l(i11 | 1);
                a.a.u((x1.e) obj8, this.f16812b, (Function1) obj7, (b2.t) obj6, (Function2) obj5, (Function3) obj4, (x1.e) obj3, (p1.o) obj, iL3);
                break;
            default:
                ((Integer) obj2).intValue();
                int iL4 = p1.a0.l(i11 | 1);
                p6.f.h((String) obj8, (e10.t0) obj7, (IntRange) obj6, (IntRange) obj5, this.f16812b, (Function0) obj4, (Function1) obj3, (p1.o) obj, iL4);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ o(Object obj, Object obj2, Object obj3, Object obj4, boolean z11, Function0 function0, Function function, int i5, int i11) {
        this.f16811a = i11;
        this.f16814d = obj;
        this.f16815e = obj2;
        this.f16816f = obj3;
        this.f16817g = obj4;
        this.f16812b = z11;
        this.f16818h = function0;
        this.f16819i = function;
        this.f16813c = i5;
    }

    public /* synthetic */ o(x1.e eVar, boolean z11, Function1 function1, b2.t tVar, Function2 function2, Function3 function3, x1.e eVar2, int i5) {
        this.f16811a = 3;
        this.f16814d = eVar;
        this.f16812b = z11;
        this.f16815e = function1;
        this.f16816f = tVar;
        this.f16817g = function2;
        this.f16818h = function3;
        this.f16819i = eVar2;
        this.f16813c = i5;
    }
}
