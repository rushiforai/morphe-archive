package t00;

import java.lang.ref.WeakReference;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public class y {

    /* renamed from: a, reason: collision with root package name */
    public final a0 f88424a;

    /* renamed from: b, reason: collision with root package name */
    public final Function0 f88425b;

    /* renamed from: c, reason: collision with root package name */
    public final WeakReference f88426c;

    public y(p6.t tVar, a0 a0Var, Function0 function0) {
        this.f88424a = a0Var;
        this.f88425b = function0;
        this.f88426c = new WeakReference(tVar);
    }

    public final p6.t a() {
        Object obj = this.f88426c.get();
        Intrinsics.d(obj);
        return (p6.t) obj;
    }
}
