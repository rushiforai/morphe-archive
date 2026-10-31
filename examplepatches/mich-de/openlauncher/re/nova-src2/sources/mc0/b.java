package mc0;

import java.util.ArrayList;
import java.util.Arrays;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b extends c {
    @Override // mc0.c
    public final void a(IllegalStateException illegalStateException) {
        for (c cVar : d.f76208c) {
            cVar.a(illegalStateException);
        }
    }

    @Override // mc0.c
    public final void b(String str, Object... args) {
        Intrinsics.g(args, "args");
        for (c cVar : d.f76208c) {
            cVar.b(str, Arrays.copyOf(args, args.length));
        }
    }

    @Override // mc0.c
    public final void c(Throwable th2, String str, Object... args) {
        Intrinsics.g(args, "args");
        for (c cVar : d.f76208c) {
            cVar.c(th2, str, Arrays.copyOf(args, args.length));
        }
    }

    @Override // mc0.c
    public final void d(String str, Object... args) {
        Intrinsics.g(args, "args");
        for (c cVar : d.f76208c) {
            cVar.d(str, Arrays.copyOf(args, args.length));
        }
    }

    @Override // mc0.c
    public final void e(Throwable th2) {
        for (c cVar : d.f76208c) {
            cVar.e(th2);
        }
    }

    @Override // mc0.c
    public final void f(Throwable th2, String str, Object... args) {
        Intrinsics.g(args, "args");
        for (c cVar : d.f76208c) {
            cVar.f(th2, str, Arrays.copyOf(args, args.length));
        }
    }

    @Override // mc0.c
    public final void h(String str, Object... args) {
        Intrinsics.g(args, "args");
        for (c cVar : d.f76208c) {
            cVar.h(str, Arrays.copyOf(args, args.length));
        }
    }

    @Override // mc0.c
    public final void i(Throwable th2, String str, Object... args) {
        Intrinsics.g(args, "args");
        for (c cVar : d.f76208c) {
            cVar.i(th2, str, Arrays.copyOf(args, args.length));
        }
    }

    @Override // mc0.c
    public final void k(Throwable th2, int i5, String str, String message) {
        Intrinsics.g(message, "message");
        throw new AssertionError();
    }

    @Override // mc0.c
    public final void m(String str, Object... args) {
        Intrinsics.g(args, "args");
        for (c cVar : d.f76208c) {
            cVar.m(str, Arrays.copyOf(args, args.length));
        }
    }

    @Override // mc0.c
    public final void n(String str, Object... args) {
        Intrinsics.g(args, "args");
        for (c cVar : d.f76208c) {
            cVar.n(str, Arrays.copyOf(args, args.length));
        }
    }

    @Override // mc0.c
    public final void o(Throwable th2) {
        for (c cVar : d.f76208c) {
            cVar.o(th2);
        }
    }

    @Override // mc0.c
    public final void p(Throwable th2, String str, Object... args) {
        Intrinsics.g(args, "args");
        for (c cVar : d.f76208c) {
            cVar.p(th2, str, Arrays.copyOf(args, args.length));
        }
    }

    public final void q(c cVar) {
        if (cVar == this) {
            throw new IllegalArgumentException("Cannot plant Timber into itself.");
        }
        ArrayList arrayList = d.f76207b;
        synchronized (arrayList) {
            arrayList.add(cVar);
            Object[] array = arrayList.toArray(new c[0]);
            if (array == null) {
                throw new NullPointerException("null cannot be cast to non-null type kotlin.Array<T>");
            }
            d.f76208c = (c[]) array;
            Unit unit = Unit.f71706a;
        }
    }

    public final void r(String tag) {
        Intrinsics.g(tag, "tag");
        c[] cVarArr = d.f76208c;
        int length = cVarArr.length;
        int i5 = 0;
        while (i5 < length) {
            c cVar = cVarArr[i5];
            i5++;
            cVar.f76205a.set(tag);
        }
    }
}
