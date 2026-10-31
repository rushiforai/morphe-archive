package p10;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class u1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81931a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f81932b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f81933c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f81934d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f81935e;

    public /* synthetic */ u1(u0 u0Var, long j11, z1 z1Var, Function0 function0, int i5) {
        this.f81933c = u0Var;
        this.f81932b = j11;
        this.f81934d = z1Var;
        this.f81935e = function0;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f81931a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(1);
                y1.l((u0) this.f81933c, this.f81932b, (z1) this.f81934d, (Function0) this.f81935e, (p1.o) obj, iL);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(1);
                y1.c((v10.b) this.f81933c, (b20.e) this.f81934d, (wa0.b) this.f81935e, this.f81932b, (p1.o) obj, iL2);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ u1(v10.b bVar, b20.e eVar, wa0.b bVar2, long j11, int i5) {
        this.f81933c = bVar;
        this.f81934d = eVar;
        this.f81935e = bVar2;
        this.f81932b = j11;
    }
}
