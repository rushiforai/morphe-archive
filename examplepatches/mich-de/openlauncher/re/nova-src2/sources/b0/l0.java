package b0;

import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class l0 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f16172j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ b2.t f16173k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f16174l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f16175m;
    public final /* synthetic */ Object n;
    public final /* synthetic */ Object o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ Object f16176p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ Object f16177q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l0(Object obj, b2.t tVar, Object obj2, Object obj3, Function function, int i5, int i11, int i12) {
        super(2);
        this.f16172j = i12;
        this.n = obj;
        this.f16173k = tVar;
        this.o = obj2;
        this.f16176p = obj3;
        this.f16177q = function;
        this.f16174l = i5;
        this.f16175m = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f16172j) {
            case 0:
                ((Number) obj2).intValue();
                c0.c0 c0Var = (c0.c0) this.o;
                String str = (String) this.f16176p;
                x1.e eVar = (x1.e) this.f16177q;
                a.a.j(this.n, this.f16173k, c0Var, str, eVar, (p1.o) obj, p1.a0.l(this.f16174l | 1), this.f16175m);
                break;
            case 1:
                ((Number) obj2).intValue();
                Function1 function1 = (Function1) this.n;
                Function1 function12 = (Function1) this.o;
                Function1 function13 = (Function1) this.f16176p;
                Function1 function14 = (Function1) this.f16177q;
                androidx.compose.ui.viewinterop.a.a(function1, this.f16173k, function12, function13, function14, (p1.o) obj, p1.a0.l(this.f16174l | 1), this.f16175m);
                break;
            default:
                ((Number) obj2).intValue();
                String str2 = (String) this.f16176p;
                z2.l lVar = (z2.l) this.o;
                i2.t tVar = (i2.t) this.f16177q;
                n8.n.a(this.n, str2, this.f16173k, lVar, tVar, (p1.o) obj, p1.a0.l(this.f16174l | 1), this.f16175m);
                break;
        }
        return Unit.f71706a;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l0(Object obj, String str, b2.t tVar, z2.l lVar, i2.t tVar2, int i5, int i11) {
        super(2);
        this.f16172j = 2;
        this.n = obj;
        this.f16176p = str;
        this.f16173k = tVar;
        this.o = lVar;
        this.f16177q = tVar2;
        this.f16174l = i5;
        this.f16175m = i11;
    }
}
