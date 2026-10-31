package com.moloco.sdk.internal.ilrd;

import com.moloco.sdk.IlrdRequest;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w70.g2;
import w70.q1;

/* loaded from: classes4.dex */
public interface c {

    public interface a {

        /* renamed from: com.moloco.sdk.internal.ilrd.c$a$a, reason: collision with other inner class name */
        public static final class C0150a implements a {

            /* renamed from: b, reason: collision with root package name */
            public static final int f36512b = 0;

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public final IlrdRequest.LevelPlayImpression f36513a;

            public C0150a(@NotNull IlrdRequest.LevelPlayImpression impression) {
                Intrinsics.g(impression, "impression");
                this.f36513a = impression;
            }

            @NotNull
            public final IlrdRequest.LevelPlayImpression a() {
                return this.f36513a;
            }

            @NotNull
            public final IlrdRequest.LevelPlayImpression b() {
                return this.f36513a;
            }

            public boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof C0150a) && Intrinsics.b(this.f36513a, ((C0150a) obj).f36513a);
            }

            public int hashCode() {
                return this.f36513a.hashCode();
            }

            @NotNull
            public String toString() {
                return "LevelPlay(impression=" + this.f36513a + ')';
            }

            @NotNull
            public final C0150a a(@NotNull IlrdRequest.LevelPlayImpression impression) {
                Intrinsics.g(impression, "impression");
                return new C0150a(impression);
            }

            public static /* synthetic */ C0150a a(C0150a c0150a, IlrdRequest.LevelPlayImpression levelPlayImpression, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    levelPlayImpression = c0150a.f36513a;
                }
                return c0150a.a(levelPlayImpression);
            }
        }

        public static final class b implements a {

            /* renamed from: b, reason: collision with root package name */
            public static final int f36514b = 0;

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public final IlrdRequest.MaxImpression f36515a;

            public b(@NotNull IlrdRequest.MaxImpression impression) {
                Intrinsics.g(impression, "impression");
                this.f36515a = impression;
            }

            @NotNull
            public final IlrdRequest.MaxImpression a() {
                return this.f36515a;
            }

            @NotNull
            public final IlrdRequest.MaxImpression b() {
                return this.f36515a;
            }

            public boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof b) && Intrinsics.b(this.f36515a, ((b) obj).f36515a);
            }

            public int hashCode() {
                return this.f36515a.hashCode();
            }

            @NotNull
            public String toString() {
                return "Max(impression=" + this.f36515a + ')';
            }

            @NotNull
            public final b a(@NotNull IlrdRequest.MaxImpression impression) {
                Intrinsics.g(impression, "impression");
                return new b(impression);
            }

            public static /* synthetic */ b a(b bVar, IlrdRequest.MaxImpression maxImpression, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    maxImpression = bVar.f36515a;
                }
                return bVar.a(maxImpression);
            }
        }
    }

    @NotNull
    com.moloco.sdk.internal.ilrd.model.a a();

    @NotNull
    Object b();

    @NotNull
    q1 c();

    @NotNull
    g2 getState();
}
