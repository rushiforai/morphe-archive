package gy;

import e10.s2;
import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class q implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58491a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f58492b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b2.t f58493c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f58494d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f58495e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Function2 f58496f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f58497g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f58498h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f58499i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Object f58500j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f58501k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Function f58502l;

    public /* synthetic */ q(String str, b2.t tVar, b2.t tVar2, boolean z11, int i5, Function2 function2, m3.p0 p0Var, boolean z12, Function1 function1, Function1 function12, int i11) {
        this.f58492b = str;
        this.f58493c = tVar;
        this.f58499i = tVar2;
        this.f58494d = z11;
        this.f58497g = i5;
        this.f58496f = function2;
        this.f58500j = p0Var;
        this.f58495e = z12;
        this.f58501k = function1;
        this.f58502l = function12;
        this.f58498h = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f58491a) {
            case 0:
                ((Integer) obj2).getClass();
                ex.i.h(this.f58492b, this.f58493c, (b2.t) this.f58499i, this.f58494d, this.f58497g, this.f58496f, (m3.p0) this.f58500j, this.f58495e, (Function1) this.f58501k, (Function1) this.f58502l, (p1.o) obj, p1.a0.l(this.f58498h | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                bh.g.b(this.f58492b, (s2) this.f58499i, this.f58493c, this.f58494d, this.f58495e, (String) this.f58500j, this.f58496f, (String) this.f58501k, (Function2) this.f58502l, (p1.o) obj, p1.a0.l(this.f58497g | 1), this.f58498h);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ q(String str, s2 s2Var, b2.t tVar, boolean z11, boolean z12, String str2, Function2 function2, String str3, Function2 function22, int i5, int i11) {
        this.f58492b = str;
        this.f58499i = s2Var;
        this.f58493c = tVar;
        this.f58494d = z11;
        this.f58495e = z12;
        this.f58500j = str2;
        this.f58496f = function2;
        this.f58501k = str3;
        this.f58502l = function22;
        this.f58497g = i5;
        this.f58498h = i11;
    }
}
