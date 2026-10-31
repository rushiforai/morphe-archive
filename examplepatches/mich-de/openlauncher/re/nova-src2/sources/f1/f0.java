package f1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final /* synthetic */ class f0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53513a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f53514b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f53515c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f53516d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ float f53517e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ x1.e f53518f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f53519g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f53520h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f53521i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Object f53522j;

    public /* synthetic */ f0(float f11, int i5, int i11, long j11, long j12, b2.t tVar, Function2 function2, Function3 function3, x1.e eVar) {
        this.f53518f = eVar;
        this.f53514b = tVar;
        this.f53521i = function2;
        this.f53522j = function3;
        this.f53515c = j11;
        this.f53516d = j12;
        this.f53517e = f11;
        this.f53519g = i5;
        this.f53520h = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f53513a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(this.f53519g | 1);
                k0.d(this.f53517e, iL, this.f53520h, this.f53515c, this.f53516d, this.f53514b, (Function2) this.f53521i, (Function3) this.f53522j, (p1.o) obj, this.f53518f);
                break;
            default:
                ((Integer) obj2).getClass();
                cw.l2.j(this.f53514b, (i2.v0) this.f53521i, this.f53515c, this.f53516d, (e0.u) this.f53522j, this.f53517e, this.f53518f, (p1.o) obj, p1.a0.l(this.f53519g | 1), this.f53520h);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ f0(b2.t tVar, i2.v0 v0Var, long j11, long j12, e0.u uVar, float f11, x1.e eVar, int i5, int i11) {
        this.f53514b = tVar;
        this.f53521i = v0Var;
        this.f53515c = j11;
        this.f53516d = j12;
        this.f53522j = uVar;
        this.f53517e = f11;
        this.f53518f = eVar;
        this.f53519g = i5;
        this.f53520h = i11;
    }
}
