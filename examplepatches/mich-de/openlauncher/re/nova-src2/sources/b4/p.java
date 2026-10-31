package b4;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;
import p1.a0;

/* loaded from: classes2.dex */
public final class p extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Function1 f17505j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ b2.t f17506k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Function1 f17507l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f17508m;
    public final /* synthetic */ int n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(Function1 function1, b2.t tVar, Function1 function12, int i5, int i11) {
        super(2);
        this.f17505j = function1;
        this.f17506k = tVar;
        this.f17507l = function12;
        this.f17508m = i5;
        this.n = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        androidx.compose.ui.viewinterop.a.b(this.f17505j, this.f17506k, this.f17507l, (p1.o) obj, a0.l(this.f17508m | 1), this.n);
        return Unit.f71706a;
    }
}
