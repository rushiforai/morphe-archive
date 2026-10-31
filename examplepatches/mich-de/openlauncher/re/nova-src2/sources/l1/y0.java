package l1;

import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class y0 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f74281j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ boolean f74282k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ b2.t f74283l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ boolean f74284m;
    public final /* synthetic */ int n;
    public final /* synthetic */ int o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ Function f74285p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ Object f74286q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ y0(boolean z11, Function function, b2.t tVar, boolean z12, Object obj, int i5, int i11, int i12) {
        super(2);
        this.f74281j = i12;
        this.f74282k = z11;
        this.f74285p = function;
        this.f74283l = tVar;
        this.f74284m = z12;
        this.f74286q = obj;
        this.n = i5;
        this.o = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f74281j) {
            case 0:
                ((Number) obj2).intValue();
                Function1 function1 = (Function1) this.f74285p;
                x0 x0Var = (x0) this.f74286q;
                c1.a(this.f74282k, function1, this.f74283l, this.f74284m, x0Var, (p1.o) obj, p1.a0.l(this.n | 1), this.o);
                break;
            case 1:
                ((Number) obj2).intValue();
                Function0 function0 = (Function0) this.f74285p;
                m5 m5Var = (m5) this.f74286q;
                n5.a(this.f74282k, function0, this.f74283l, this.f74284m, m5Var, (p1.o) obj, p1.a0.l(this.n | 1), this.o);
                break;
            default:
                ((Number) obj2).intValue();
                Function1 function12 = (Function1) this.f74285p;
                u7 u7Var = (u7) this.f74286q;
                androidx.compose.material3.a.a(this.f74282k, function12, this.f74283l, this.f74284m, u7Var, (p1.o) obj, p1.a0.l(this.n | 1), this.o);
                break;
        }
        return Unit.f71706a;
    }
}
