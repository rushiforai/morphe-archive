package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.i;
import java.io.File;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final int f39022a = 0;

    public static final class a extends c {

        /* renamed from: c, reason: collision with root package name */
        public static final int f39023c = 8;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final File f39024b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull File file) {
            super(null);
            Intrinsics.g(file, "file");
            this.f39024b = file;
        }

        @NotNull
        public final File a() {
            return this.f39024b;
        }

        @NotNull
        public final File b() {
            return this.f39024b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof a) && Intrinsics.b(this.f39024b, ((a) obj).f39024b);
        }

        public int hashCode() {
            return this.f39024b.hashCode();
        }

        @NotNull
        public String toString() {
            return "Complete(file=" + this.f39024b + ')';
        }

        @NotNull
        public final a a(@NotNull File file) {
            Intrinsics.g(file, "file");
            return new a(file);
        }

        public static /* synthetic */ a a(a aVar, File file, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                file = aVar.f39024b;
            }
            return aVar.a(file);
        }
    }

    public static final class b extends c {

        /* renamed from: c, reason: collision with root package name */
        public static final int f39025c = 0;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final i.a.AbstractC0205a f39026b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(@NotNull i.a.AbstractC0205a failure) {
            super(null);
            Intrinsics.g(failure, "failure");
            this.f39026b = failure;
        }

        @NotNull
        public final i.a.AbstractC0205a a() {
            return this.f39026b;
        }

        @NotNull
        public final i.a.AbstractC0205a b() {
            return this.f39026b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof b) && Intrinsics.b(this.f39026b, ((b) obj).f39026b);
        }

        public int hashCode() {
            return this.f39026b.hashCode();
        }

        @NotNull
        public String toString() {
            return "Failure(failure=" + this.f39026b + ')';
        }

        @NotNull
        public final b a(@NotNull i.a.AbstractC0205a failure) {
            Intrinsics.g(failure, "failure");
            return new b(failure);
        }

        public static /* synthetic */ b a(b bVar, i.a.AbstractC0205a abstractC0205a, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                abstractC0205a = bVar.f39026b;
            }
            return bVar.a(abstractC0205a);
        }
    }

    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.c$c, reason: collision with other inner class name */
    public static final class C0208c extends c {

        /* renamed from: d, reason: collision with root package name */
        public static final int f39027d = 8;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final File f39028b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final d f39029c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C0208c(@NotNull File file, @NotNull d progress) {
            super(null);
            Intrinsics.g(file, "file");
            Intrinsics.g(progress, "progress");
            this.f39028b = file;
            this.f39029c = progress;
        }

        @NotNull
        public final File a() {
            return this.f39028b;
        }

        @NotNull
        public final d b() {
            return this.f39029c;
        }

        @NotNull
        public final File c() {
            return this.f39028b;
        }

        @NotNull
        public final d d() {
            return this.f39029c;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof C0208c)) {
                return false;
            }
            C0208c c0208c = (C0208c) obj;
            return Intrinsics.b(this.f39028b, c0208c.f39028b) && Intrinsics.b(this.f39029c, c0208c.f39029c);
        }

        public int hashCode() {
            return this.f39029c.hashCode() + (this.f39028b.hashCode() * 31);
        }

        @NotNull
        public String toString() {
            return "InProgress(file=" + this.f39028b + ", progress=" + this.f39029c + ')';
        }

        @NotNull
        public final C0208c a(@NotNull File file, @NotNull d progress) {
            Intrinsics.g(file, "file");
            Intrinsics.g(progress, "progress");
            return new C0208c(file, progress);
        }

        public static /* synthetic */ C0208c a(C0208c c0208c, File file, d dVar, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                file = c0208c.f39028b;
            }
            if ((i5 & 2) != 0) {
                dVar = c0208c.f39029c;
            }
            return c0208c.a(file, dVar);
        }
    }

    public static final class d {

        /* renamed from: c, reason: collision with root package name */
        public static final int f39030c = 0;

        /* renamed from: a, reason: collision with root package name */
        public final long f39031a;

        /* renamed from: b, reason: collision with root package name */
        public final long f39032b;

        public d(long j11, long j12) {
            this.f39031a = j11;
            this.f39032b = j12;
        }

        public final long a() {
            return this.f39031a;
        }

        public final long b() {
            return this.f39032b;
        }

        public final long c() {
            return this.f39031a;
        }

        public final long d() {
            return this.f39032b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof d)) {
                return false;
            }
            d dVar = (d) obj;
            return this.f39031a == dVar.f39031a && this.f39032b == dVar.f39032b;
        }

        public int hashCode() {
            return Long.hashCode(this.f39032b) + (Long.hashCode(this.f39031a) * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("Progress(bytesDownloaded=");
            sb2.append(this.f39031a);
            sb2.append(", totalBytes=");
            return a2.c.n(sb2, this.f39032b, ')');
        }

        @NotNull
        public final d a(long j11, long j12) {
            return new d(j11, j12);
        }

        public static /* synthetic */ d a(d dVar, long j11, long j12, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                j11 = dVar.f39031a;
            }
            if ((i5 & 2) != 0) {
                j12 = dVar.f39032b;
            }
            return dVar.a(j11, j12);
        }
    }

    public /* synthetic */ c(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public c() {
    }
}
