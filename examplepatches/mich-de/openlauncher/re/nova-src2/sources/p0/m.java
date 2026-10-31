package p0;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function4;

/* loaded from: classes2.dex */
public final class m extends androidx.compose.foundation.lazy.layout.b {

    /* renamed from: a, reason: collision with root package name */
    public final Function4 f81174a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f81175b;

    /* renamed from: c, reason: collision with root package name */
    public final c30.c f81176c;

    public m(Function4 function4, Function1 function1, int i5) {
        this.f81174a = function4;
        this.f81175b = function1;
        c30.c cVar = new c30.c(4, (byte) 0);
        cVar.a(i5, new k(function1, function4));
        this.f81176c = cVar;
    }

    @Override // androidx.compose.foundation.lazy.layout.b
    public final c30.c c() {
        return this.f81176c;
    }
}
