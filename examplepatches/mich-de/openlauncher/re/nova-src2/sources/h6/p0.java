package h6;

import java.util.ArrayDeque;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class p0 extends t70.c0 {

    /* renamed from: c, reason: collision with root package name */
    public final l f59413c = new l();

    @Override // t70.c0
    public final void c0(CoroutineContext context, Runnable block) {
        Intrinsics.g(context, "context");
        Intrinsics.g(block, "block");
        l lVar = this.f59413c;
        lVar.getClass();
        a80.e eVar = t70.y0.f88884a;
        u70.d dVar = y70.o.f96819a.f90673f;
        if (dVar.e0(context) || lVar.f59404b || !lVar.f59403a) {
            dVar.c0(context, new fa.l0(6, lVar, block));
        } else {
            if (!((ArrayDeque) lVar.f59406d).offer(block)) {
                throw new IllegalStateException("cannot enqueue any more runnables");
            }
            lVar.b();
        }
    }

    @Override // t70.c0
    public final boolean e0(CoroutineContext context) {
        Intrinsics.g(context, "context");
        a80.e eVar = t70.y0.f88884a;
        if (y70.o.f96819a.f90673f.e0(context)) {
            return true;
        }
        l lVar = this.f59413c;
        return !(lVar.f59404b || !lVar.f59403a);
    }
}
