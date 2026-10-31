package n00;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import p1.a0;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77543a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p6.t f77544b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f77545c;

    public /* synthetic */ a(p6.t tVar, Function1 function1, int i5, int i11) {
        this.f77543a = i11;
        this.f77544b = tVar;
        this.f77545c = function1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f77543a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                f.a(this.f77544b, this.f77545c, oVar, a0.l(1));
                break;
            case 1:
                r.d(this.f77544b, this.f77545c, oVar, a0.l(1));
                break;
            case 2:
                t.a(this.f77544b, this.f77545c, oVar, a0.l(1));
                break;
            default:
                x.a(this.f77544b, this.f77545c, oVar, a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
