package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render;

import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class i {

    /* renamed from: a, reason: collision with root package name */
    public static final int f41676a = 0;

    public static final class a extends i {

        /* renamed from: c, reason: collision with root package name */
        public static final int f41677c = 0;

        /* renamed from: b, reason: collision with root package name */
        public final long f41678b;

        public a(long j11) {
            super(null);
            this.f41678b = j11;
        }

        public final long a() {
            return this.f41678b;
        }
    }

    public static final class b extends i {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final b f41679b = new b();

        /* renamed from: c, reason: collision with root package name */
        public static final int f41680c = 0;

        public b() {
            super(null);
        }
    }

    public static final class c extends i {

        /* renamed from: d, reason: collision with root package name */
        public static final int f41681d = 0;

        /* renamed from: b, reason: collision with root package name */
        public final long f41682b;

        /* renamed from: c, reason: collision with root package name */
        public final long f41683c;

        public c(long j11, long j12) {
            super(null);
            this.f41682b = j11;
            this.f41683c = j12;
        }

        public final long a() {
            return this.f41682b;
        }

        public final long b() {
            return this.f41683c;
        }

        public final long c() {
            return this.f41682b;
        }

        public final long d() {
            return this.f41683c;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof c)) {
                return false;
            }
            c cVar = (c) obj;
            return this.f41682b == cVar.f41682b && this.f41683c == cVar.f41683c;
        }

        public int hashCode() {
            return Long.hashCode(this.f41683c) + (Long.hashCode(this.f41682b) * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("Position(currentPositionMillis=");
            sb2.append(this.f41682b);
            sb2.append(", totalDurationMillis=");
            return a2.c.n(sb2, this.f41683c, ')');
        }

        @NotNull
        public final c a(long j11, long j12) {
            return new c(j11, j12);
        }

        public static /* synthetic */ c a(c cVar, long j11, long j12, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                j11 = cVar.f41682b;
            }
            if ((i5 & 2) != 0) {
                j12 = cVar.f41683c;
            }
            return cVar.a(j11, j12);
        }
    }

    public static final class d extends i {

        /* renamed from: c, reason: collision with root package name */
        public static final int f41684c = 0;

        /* renamed from: b, reason: collision with root package name */
        public final long f41685b;

        public d(long j11) {
            super(null);
            this.f41685b = j11;
        }

        public final long a() {
            return this.f41685b;
        }

        public final long b() {
            return this.f41685b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof d) && this.f41685b == ((d) obj).f41685b;
        }

        public int hashCode() {
            return Long.hashCode(this.f41685b);
        }

        @NotNull
        public String toString() {
            return a2.c.n(new StringBuilder("Preparing(totalDurationMillis="), this.f41685b, ')');
        }

        @NotNull
        public final d a(long j11) {
            return new d(j11);
        }

        public static /* synthetic */ d a(d dVar, long j11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                j11 = dVar.f41685b;
            }
            return dVar.a(j11);
        }
    }

    public /* synthetic */ i(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public i() {
    }
}
