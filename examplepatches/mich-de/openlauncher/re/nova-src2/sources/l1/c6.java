package l1;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class c6 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ boolean f73111j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ y3.c f73112k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ g6 f73113l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Function1 f73114m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c6(boolean z11, y3.c cVar, g6 g6Var, Function1 function1) {
        super(0);
        this.f73111j = z11;
        this.f73112k = cVar;
        this.f73113l = g6Var;
        this.f73114m = function1;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return new f6(this.f73111j, this.f73112k, this.f73113l, this.f73114m);
    }
}
