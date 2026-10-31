package io.branch.search.internal;

import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.mf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3272mf {

    @NotNull
    public static final b Companion = b.f65209a;

    /* renamed from: io.branch.search.internal.mf$c */
    public enum c {
        REAL,
        DISK,
        PROXY,
        MEMORY,
        STATIC
    }

    void a();

    @NotNull
    Pair<String, c> b();

    @Nullable
    String get();

    /* renamed from: io.branch.search.internal.mf$b */
    public static final class b {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ b f65209a = new b();

        @JvmStatic
        public static boolean a(@NotNull C3482z5 processHandler) {
            Intrinsics.g(processHandler, "processHandler");
            return processHandler.h();
        }

        @JvmStatic
        @NotNull
        public static a a(@NotNull F4 context, @NotNull C3482z5 processHandler) {
            Intrinsics.g(context, "context");
            Intrinsics.g(processHandler, "processHandler");
            return new a(context, processHandler, true);
        }

        @NotNull
        public static a a(@NotNull F4 context, @NotNull C3482z5 processHandler, @NotNull String userAgent) {
            Intrinsics.g(context, "context");
            Intrinsics.g(processHandler, "processHandler");
            Intrinsics.g(userAgent, "userAgent");
            return new a(context, processHandler, 3, userAgent);
        }
    }

    /* renamed from: io.branch.search.internal.mf$a */
    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final F4 f65203a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final InterfaceC3133eb f65204b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final int f65205c;

        /* renamed from: d, reason: collision with root package name */
        @Nullable
        public final String f65206d;

        /* renamed from: e, reason: collision with root package name */
        public boolean f65207e;

        /* renamed from: f, reason: collision with root package name */
        public boolean f65208f;

        public a(F4 f42, C3482z5 c3482z5, int i5, String str) {
            this.f65203a = f42;
            this.f65204b = c3482z5;
            this.f65205c = i5;
            this.f65206d = str;
        }

        @NotNull
        public final InterfaceC3272mf a() {
            InterfaceC3272mf cb2;
            int iA = R1.a(this.f65205c);
            if (iA == 0) {
                cb2 = new Cb(this.f65203a, this.f65204b);
            } else if (iA == 1) {
                cb2 = new D4(this.f65203a, this.f65204b);
            } else {
                if (iA != 2) {
                    throw new NoWhenBranchMatchedException();
                }
                String str = this.f65206d;
                cb2 = str != null ? new C3474ye(str) : new D4(this.f65203a, this.f65204b);
            }
            if (this.f65208f) {
                cb2 = new C3179h6(this.f65203a, cb2, 2592000000L);
            }
            return this.f65207e ? new C3215j9(cb2) : cb2;
        }

        @NotNull
        public final a b() {
            this.f65208f = true;
            return this;
        }

        @NotNull
        public final a c() {
            this.f65207e = true;
            return this;
        }

        /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
        public a(@NotNull F4 context, @NotNull C3482z5 processHandler, boolean z11) {
            this(context, processHandler, z11 ? 2 : 1, null);
            Intrinsics.g(context, "context");
            Intrinsics.g(processHandler, "processHandler");
        }
    }
}
