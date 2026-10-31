package e00;

import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;

/* loaded from: classes4.dex */
public final /* synthetic */ class m6 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50737a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f50738b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f50739c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f50740d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ b2.t f50741e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f50742f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f50743g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f50744h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f50745i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Function f50746j;

    public /* synthetic */ m6(Object obj, boolean z11, boolean z12, b2.t tVar, Object obj2, Function0 function0, Function function, int i5, int i11, int i12) {
        this.f50737a = i12;
        this.f50738b = obj;
        this.f50739c = z11;
        this.f50740d = z12;
        this.f50741e = tVar;
        this.f50744h = obj2;
        this.f50745i = function0;
        this.f50746j = function;
        this.f50742f = i5;
        this.f50743g = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f50737a) {
            case 0:
                ((Integer) obj2).getClass();
                g90.k.A((String) this.f50738b, (String) this.f50744h, this.f50739c, this.f50741e, this.f50740d, (m3.p0) this.f50745i, (Function4) this.f50746j, (p1.o) obj, p1.a0.l(this.f50742f | 1), this.f50743g);
                break;
            case 1:
                ((Integer) obj2).getClass();
                hv.a3.d((String) this.f50738b, this.f50739c, this.f50740d, this.f50741e, (hv.e3) this.f50744h, (Function0) this.f50745i, (Function0) this.f50746j, (p1.o) obj, p1.a0.l(this.f50742f | 1), this.f50743g);
                break;
            default:
                ((Integer) obj2).getClass();
                jv.i1.a((ou.j) this.f50738b, this.f50739c, this.f50740d, this.f50741e, (PaymentSheet$Appearance.Embedded) this.f50744h, (Function0) this.f50745i, (Function3) this.f50746j, (p1.o) obj, p1.a0.l(this.f50742f | 1), this.f50743g);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ m6(String str, String str2, boolean z11, b2.t tVar, boolean z12, m3.p0 p0Var, Function4 function4, int i5, int i11) {
        this.f50737a = 0;
        this.f50738b = str;
        this.f50744h = str2;
        this.f50739c = z11;
        this.f50741e = tVar;
        this.f50740d = z12;
        this.f50745i = p0Var;
        this.f50746j = function4;
        this.f50742f = i5;
        this.f50743g = i11;
    }
}
