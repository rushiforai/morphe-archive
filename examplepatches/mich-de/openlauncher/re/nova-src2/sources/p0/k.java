package p0;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function4;

/* loaded from: classes2.dex */
public final class k implements n0.q {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f81169a;

    /* renamed from: b, reason: collision with root package name */
    public final Function4 f81170b;

    public k(Function1 function1, Function4 function4) {
        this.f81169a = function1;
        this.f81170b = function4;
    }

    @Override // n0.q
    public final Function1 getKey() {
        return this.f81169a;
    }
}
