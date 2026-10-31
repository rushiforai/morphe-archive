package m0;

import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class f implements n0.q {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f75420a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f75421b;

    /* renamed from: c, reason: collision with root package name */
    public final x1.e f75422c;

    public f(Function1 function1, Function1 function12, x1.e eVar) {
        this.f75420a = function1;
        this.f75421b = function12;
        this.f75422c = eVar;
    }

    @Override // n0.q
    public final Function1 getKey() {
        return this.f75420a;
    }

    @Override // n0.q
    public final Function1 getType() {
        return this.f75421b;
    }
}
