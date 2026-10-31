package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class z3 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51207a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f51208b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f51209c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f51210d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f51211e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f51212f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f51213g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f51214h;

    public /* synthetic */ z3(int i5, b2.t tVar, boolean z11, Integer num, Function2 function2, int i11, int i12) {
        this.f51208b = i5;
        this.f51212f = tVar;
        this.f51209c = z11;
        this.f51213g = num;
        this.f51214h = function2;
        this.f51210d = i11;
        this.f51211e = i12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f51207a) {
            case 0:
                ((Integer) obj2).getClass();
                android.support.v4.media.session.b.r((cy.h) this.f51212f, (cy.m0) this.f51213g, this.f51208b, (String) this.f51214h, this.f51209c, (p1.o) obj, p1.a0.l(this.f51210d | 1), this.f51211e);
                break;
            default:
                ((Integer) obj2).getClass();
                ky.l.a(this.f51208b, (b2.t) this.f51212f, this.f51209c, (Integer) this.f51213g, (Function2) this.f51214h, (p1.o) obj, p1.a0.l(this.f51210d | 1), this.f51211e);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ z3(cy.h hVar, cy.m0 m0Var, int i5, String str, boolean z11, int i11, int i12) {
        this.f51212f = hVar;
        this.f51213g = m0Var;
        this.f51208b = i5;
        this.f51214h = str;
        this.f51209c = z11;
        this.f51210d = i11;
        this.f51211e = i12;
    }
}
