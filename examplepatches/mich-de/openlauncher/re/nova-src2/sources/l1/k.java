package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class k extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73514j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Function0 f73515k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ x1.e f73516l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f73517m;
    public final /* synthetic */ Object n;
    public final /* synthetic */ Object o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ k(Function0 function0, Object obj, Object obj2, x1.e eVar, int i5, int i11) {
        super(2);
        this.f73514j = i11;
        this.f73515k = function0;
        this.n = obj;
        this.o = obj2;
        this.f73516l = eVar;
        this.f73517m = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f73514j) {
            case 0:
                ((Number) obj2).intValue();
                b2.t tVar = (b2.t) this.n;
                c4.y yVar = (c4.y) this.o;
                l.d(this.f73515k, tVar, yVar, this.f73516l, (p1.o) obj, p1.a0.l(this.f73517m | 1));
                break;
            default:
                ((Number) obj2).intValue();
                i4 i4Var = (i4) this.n;
                c0.e eVar = (c0.e) this.o;
                p5.f(this.f73515k, i4Var, eVar, this.f73516l, (p1.o) obj, p1.a0.l(this.f73517m | 1));
                break;
        }
        return Unit.f71706a;
    }
}
