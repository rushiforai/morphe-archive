package io.branch.search.internal;

import java.io.Closeable;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Ne<T> implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final t70.j0 f62993a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final w70.m1 f62994b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final ArrayList f62995c;

    public static abstract class a<T> {

        /* renamed from: io.branch.search.internal.Ne$a$a, reason: collision with other inner class name */
        public static final class C0324a<T> extends a<T> {
            public C0324a() {
                super(0);
            }
        }

        public static final class b<T> extends a<T> {

            /* renamed from: a, reason: collision with root package name */
            public final T f62996a;

            public b(T t6) {
                super(0);
                this.f62996a = t6;
            }

            public final boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof b) && Intrinsics.b(this.f62996a, ((b) obj).f62996a);
            }

            public final int hashCode() {
                T t6 = this.f62996a;
                if (t6 == null) {
                    return 0;
                }
                return t6.hashCode();
            }

            @NotNull
            public final String toString() {
                return com.google.android.gms.internal.measurement.k2.j(new StringBuilder("Update(status="), this.f62996a, ')');
            }
        }

        public a() {
        }

        public /* synthetic */ a(int i5) {
            this();
        }
    }

    public Ne(@NotNull t70.j0 scope) {
        Intrinsics.g(scope, "scope");
        this.f62993a = scope;
        this.f62994b = w70.u1.c(new a.C0324a());
        this.f62995c = new ArrayList();
    }

    @Nullable
    public final T a() {
        a aVar = (a) ((w70.i2) this.f62994b).getValue();
        if (aVar instanceof a.C0324a) {
            return null;
        }
        if (aVar instanceof a.b) {
            return ((a.b) aVar).f62996a;
        }
        throw new NoWhenBranchMatchedException();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        Iterator it = this.f62995c.iterator();
        while (it.hasNext()) {
            ((t70.r1) it.next()).c(null);
        }
    }

    @NotNull
    public final void a(@NotNull Ve block) {
        Intrinsics.g(block, "block");
        this.f62995c.add(w70.u1.u(new cw.u0(10, this.f62994b, new Oe(block, null)), this.f62993a));
    }
}
