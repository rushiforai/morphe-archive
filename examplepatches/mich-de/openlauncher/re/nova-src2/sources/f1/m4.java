package f1;

import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final /* synthetic */ class m4 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53770a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f53771b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function2 f53772c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f53773d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f53774e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ r3.i0 f53775f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ i2.v0 f53776g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ m1 f53777h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ int f53778i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f53779j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f53780k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Object f53781l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Function f53782m;
    public final /* synthetic */ Object n;
    public final /* synthetic */ Object o;

    public /* synthetic */ m4(String str, String str2, b2.t tVar, Function1 function1, Function2 function2, boolean z11, boolean z12, r3.i0 i0Var, t0.w0 w0Var, t0.v0 v0Var, i2.v0 v0Var2, m1 m1Var, int i5, int i11) {
        this.f53771b = str;
        this.f53780k = str2;
        this.f53781l = tVar;
        this.f53782m = function1;
        this.f53772c = function2;
        this.f53773d = z11;
        this.f53774e = z12;
        this.f53775f = i0Var;
        this.n = w0Var;
        this.o = v0Var;
        this.f53776g = v0Var2;
        this.f53777h = m1Var;
        this.f53778i = i5;
        this.f53779j = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f53770a;
        int i11 = this.f53778i;
        Object obj3 = this.o;
        Object obj4 = this.n;
        Function function = this.f53782m;
        Object obj5 = this.f53781l;
        Object obj6 = this.f53780k;
        switch (i5) {
            case 0:
                b5[] b5VarArr = b5.f53404a;
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(i11 | 1);
                int iL2 = p1.a0.l(this.f53779j);
                s4.a(this.f53771b, this.f53772c, this.f53775f, (Function2) obj6, (Function2) obj5, (Function2) function, this.f53773d, this.f53774e, (i0.i) obj4, (k0.o1) obj3, this.f53776g, this.f53777h, (p1.o) obj, iL, iL2);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL3 = p1.a0.l(i11 | 1);
                p7.u.d(this.f53771b, (String) obj6, (b2.t) obj5, (Function1) function, this.f53772c, this.f53773d, this.f53774e, this.f53775f, (t0.w0) obj4, (t0.v0) obj3, this.f53776g, this.f53777h, (p1.o) obj, iL3, this.f53779j);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ m4(String str, Function2 function2, r3.i0 i0Var, Function2 function22, Function2 function23, Function2 function24, boolean z11, boolean z12, i0.i iVar, k0.o1 o1Var, i2.v0 v0Var, m1 m1Var, int i5, int i11) {
        b5[] b5VarArr = b5.f53404a;
        this.f53771b = str;
        this.f53772c = function2;
        this.f53775f = i0Var;
        this.f53780k = function22;
        this.f53781l = function23;
        this.f53782m = function24;
        this.f53773d = z11;
        this.f53774e = z12;
        this.n = iVar;
        this.o = o1Var;
        this.f53776g = v0Var;
        this.f53777h = m1Var;
        this.f53778i = i5;
        this.f53779j = i11;
    }
}
