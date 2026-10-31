package rs;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class p implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86245a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.link.ui.inline.a f86246b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f86247c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function1 f86248d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ b2.t f86249e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f86250f;

    public /* synthetic */ p(com.stripe.android.link.ui.inline.a aVar, boolean z11, Function1 function1, b2.t tVar, int i5, int i11) {
        this.f86245a = i11;
        this.f86246b = aVar;
        this.f86247c = z11;
        this.f86248d = function1;
        this.f86249e = tVar;
        this.f86250f = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f86245a) {
            case 0:
                ((Integer) obj2).getClass();
                ph.a.e(this.f86246b, this.f86247c, this.f86248d, this.f86249e, (p1.o) obj, p1.a0.l(this.f86250f | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                ps.c.e(this.f86246b, this.f86247c, this.f86248d, this.f86249e, (p1.o) obj, p1.a0.l(this.f86250f | 1));
                break;
        }
        return Unit.f71706a;
    }
}
