package io.branch.search.internal;

import android.content.UriMatcher;
import io.branch.search.internal.A4;
import io.branch.search.internal.AbstractC3464y4;
import io.branch.search.internal.C4;
import io.branch.search.internal.InterfaceC3481z4;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public abstract class J1<T extends InterfaceC3481z4> {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final UriMatcher f62696a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final LinkedHashMap f62697b;

    public static final class a extends J1<AbstractC3464y4> {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull String authority) {
            super(authority, new AbstractC3464y4[]{AbstractC3464y4.a.f66306b}, 0);
            Intrinsics.g(authority, "authority");
        }
    }

    public static final class b extends J1<A4<?, ?>> {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(@NotNull String authority) {
            super(authority, new A4[]{A4.d.f61929a, A4.e.f61932a, A4.b.f61926a, A4.a.f61923a}, 0);
            Intrinsics.g(authority, "authority");
        }
    }

    public static final class c extends J1<C4> {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(@NotNull String authority) {
            super(authority, new C4[]{C4.j.f62251b, C4.d.f62209b, C4.h.f62227b, C4.i.f62228b, C4.g.f62226b, C4.l.f62285b, C4.m.f62287b, C4.a.f62204b, C4.c.f62208b, C4.e.f62220b, C4.n.f62289b, C4.k.f62280b, C4.b.f62205b}, 0);
            Intrinsics.g(authority, "authority");
        }
    }

    public J1(String str, T[] tArr) {
        this.f62696a = new UriMatcher(-1);
        this.f62697b = new LinkedHashMap();
        int i5 = 0;
        for (T t6 : tArr) {
            this.f62697b.put(Integer.valueOf(i5), t6);
            this.f62696a.addURI(str, t6.getPath(), i5);
            i5++;
        }
    }

    public /* synthetic */ J1(String str, InterfaceC3481z4[] interfaceC3481z4Arr, int i5) {
        this(str, interfaceC3481z4Arr);
    }
}
