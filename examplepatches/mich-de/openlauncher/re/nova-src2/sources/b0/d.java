package b0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class d extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Object f16083j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ b2.t f16084k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Function1 f16085l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ b2.f f16086m;
    public final /* synthetic */ String n;
    public final /* synthetic */ Function1 o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ x1.e f16087p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ int f16088q;

    /* renamed from: r, reason: collision with root package name */
    public final /* synthetic */ int f16089r;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(Object obj, b2.t tVar, Function1 function1, b2.f fVar, String str, Function1 function12, x1.e eVar, int i5, int i11) {
        super(2);
        this.f16083j = obj;
        this.f16084k = tVar;
        this.f16085l = function1;
        this.f16086m = fVar;
        this.n = str;
        this.o = function12;
        this.f16087p = eVar;
        this.f16088q = i5;
        this.f16089r = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        androidx.compose.animation.a.b(this.f16083j, this.f16084k, this.f16085l, this.f16086m, this.n, this.o, this.f16087p, (p1.o) obj, p1.a0.l(this.f16088q | 1), this.f16089r);
        return Unit.f71706a;
    }
}
