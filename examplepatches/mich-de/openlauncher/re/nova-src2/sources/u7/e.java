package u7;

import kotlin.jvm.internal.Intrinsics;
import o7.r;
import x7.q;

/* loaded from: classes.dex */
public final class e extends c {

    /* renamed from: b, reason: collision with root package name */
    public final int f90667b;

    static {
        Intrinsics.f(r.e("NetworkNotRoamingCtrlr"), "tagWithPrefix(\"NetworkNotRoamingCtrlr\")");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(v7.e tracker) {
        super(tracker);
        Intrinsics.g(tracker, "tracker");
        this.f90667b = 7;
    }

    @Override // u7.c
    public final int a() {
        return this.f90667b;
    }

    @Override // u7.c
    public final boolean b(q qVar) {
        return qVar.f95180j.f79653a == 4;
    }

    @Override // u7.c
    public final boolean c(Object obj) {
        t7.e value = (t7.e) obj;
        Intrinsics.g(value, "value");
        return (value.f88763a && value.f88766d) ? false : true;
    }
}
