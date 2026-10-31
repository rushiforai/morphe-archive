package k0;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final /* synthetic */ class u implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70747a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f70748b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f70749c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f70750d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f70751e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f70752f;

    public /* synthetic */ u(b2.t tVar, b2.f fVar, x1.e eVar, int i5, int i11) {
        this.f70749c = tVar;
        this.f70752f = fVar;
        this.f70748b = eVar;
        this.f70750d = i5;
        this.f70751e = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f70747a) {
            case 0:
                ((Integer) obj2).getClass();
                i2.a((b2.t) this.f70749c, (b2.f) this.f70752f, (x1.e) this.f70748b, (p1.o) obj, p1.a0.l(this.f70750d | 1), this.f70751e);
                break;
            case 1:
                ((Integer) obj2).getClass();
                ky.l.k((x1.e) this.f70748b, (Function2) this.f70752f, (b2.t) this.f70749c, (p1.o) obj, p1.a0.l(this.f70750d | 1), this.f70751e);
                break;
            case 2:
                String str = (String) this.f70752f;
                String str2 = (String) this.f70748b;
                ((Integer) obj2).getClass();
                ky.l.i(p1.a0.l(this.f70750d | 1), this.f70751e, (b2.t) this.f70749c, str, str2, (p1.o) obj);
                break;
            default:
                ((Integer) obj2).getClass();
                n0.z.b(this.f70749c, this.f70750d, (n0.k0) this.f70752f, (x1.e) this.f70748b, (p1.o) obj, p1.a0.l(this.f70751e | 1));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ u(Object obj, int i5, n0.k0 k0Var, x1.e eVar, int i11) {
        this.f70749c = obj;
        this.f70750d = i5;
        this.f70752f = k0Var;
        this.f70748b = eVar;
        this.f70751e = i11;
    }

    public /* synthetic */ u(String str, String str2, b2.t tVar, int i5, int i11) {
        this.f70752f = str;
        this.f70748b = str2;
        this.f70749c = tVar;
        this.f70750d = i5;
        this.f70751e = i11;
    }

    public /* synthetic */ u(x1.e eVar, Function2 function2, b2.t tVar, int i5, int i11) {
        this.f70748b = eVar;
        this.f70752f = function2;
        this.f70749c = tVar;
        this.f70750d = i5;
        this.f70751e = i11;
    }
}
