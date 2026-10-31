package u7;

import kotlin.jvm.internal.Intrinsics;
import o7.r;
import x7.q;

/* loaded from: classes.dex */
public final class d extends c {

    /* renamed from: b, reason: collision with root package name */
    public final int f90666b;

    static {
        Intrinsics.f(r.e("NetworkMeteredCtrlr"), "tagWithPrefix(\"NetworkMeteredCtrlr\")");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(v7.e tracker) {
        super(tracker);
        Intrinsics.g(tracker, "tracker");
        this.f90666b = 7;
    }

    @Override // u7.c
    public final int a() {
        return this.f90666b;
    }

    @Override // u7.c
    public final boolean b(q qVar) {
        return qVar.f95180j.f79653a == 5;
    }

    @Override // u7.c
    public final boolean c(Object obj) {
        t7.e value = (t7.e) obj;
        Intrinsics.g(value, "value");
        return (value.f88763a && value.f88765c) ? false : true;
    }
}
