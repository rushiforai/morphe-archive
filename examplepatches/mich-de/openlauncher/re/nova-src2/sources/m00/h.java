package m00;

import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class h implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75552a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f75553b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ List f75554c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function2 f75555d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f75556e;

    public /* synthetic */ h(b2.t tVar, List list, Function2 function2, boolean z11, int i5, int i11) {
        this.f75552a = i11;
        this.f75553b = tVar;
        this.f75554c = list;
        this.f75555d = function2;
        this.f75556e = z11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f75552a) {
            case 0:
                ((Integer) obj2).getClass();
                l.a(p1.a0.l(1), this.f75553b, this.f75554c, this.f75555d, (p1.o) obj, this.f75556e);
                break;
            case 1:
                ((Integer) obj2).getClass();
                l0.a(p1.a0.l(1), this.f75553b, this.f75554c, this.f75555d, (p1.o) obj, this.f75556e);
                break;
            default:
                ((Integer) obj2).getClass();
                l0.d(p1.a0.l(1), this.f75553b, this.f75554c, this.f75555d, (p1.o) obj, this.f75556e);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ h(b2.t tVar, Function2 function2, List list, boolean z11, int i5) {
        this.f75552a = 2;
        this.f75553b = tVar;
        this.f75555d = function2;
        this.f75554c = list;
        this.f75556e = z11;
    }
}
