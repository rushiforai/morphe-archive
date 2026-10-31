package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class r {

    /* renamed from: a, reason: collision with root package name */
    public static final int f40809a = 0;

    public static final class a extends r {

        /* renamed from: c, reason: collision with root package name */
        public static final int f40810c = 0;

        /* renamed from: b, reason: collision with root package name */
        public final int f40811b;

        public a(int i5) {
            super(null);
            this.f40811b = i5;
        }

        public final int a() {
            return this.f40811b;
        }

        public final int b() {
            return this.f40811b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof a) && this.f40811b == ((a) obj).f40811b;
        }

        public int hashCode() {
            return Integer.hashCode(this.f40811b);
        }

        @NotNull
        public String toString() {
            return a2.c.m(new StringBuilder("Percents(percents="), this.f40811b, ')');
        }

        @NotNull
        public final a a(int i5) {
            return new a(i5);
        }

        public static /* synthetic */ a a(a aVar, int i5, int i11, Object obj) {
            if ((i11 & 1) != 0) {
                i5 = aVar.f40811b;
            }
            return aVar.a(i5);
        }
    }

    public static final class b extends r {

        /* renamed from: c, reason: collision with root package name */
        public static final int f40812c = 0;

        /* renamed from: b, reason: collision with root package name */
        public final long f40813b;

        public b(long j11) {
            super(null);
            this.f40813b = j11;
        }

        public final long a() {
            return this.f40813b;
        }

        public final long b() {
            return this.f40813b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof b) && this.f40813b == ((b) obj).f40813b;
        }

        public int hashCode() {
            return Long.hashCode(this.f40813b);
        }

        @NotNull
        public String toString() {
            return a2.c.n(new StringBuilder("Time(millis="), this.f40813b, ')');
        }

        @NotNull
        public final b a(long j11) {
            return new b(j11);
        }

        public static /* synthetic */ b a(b bVar, long j11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                j11 = bVar.f40813b;
            }
            return bVar.a(j11);
        }
    }

    public /* synthetic */ r(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public r() {
    }
}
