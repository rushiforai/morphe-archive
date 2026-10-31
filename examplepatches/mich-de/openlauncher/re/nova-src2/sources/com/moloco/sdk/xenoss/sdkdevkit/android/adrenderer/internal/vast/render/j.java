package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render;

import b.u4;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final int f41686a = 0;

    public static final class a extends j {

        /* renamed from: c, reason: collision with root package name */
        public static final int f41687c = 0;

        /* renamed from: b, reason: collision with root package name */
        public final int f41688b;

        public a(int i5) {
            super(null);
            this.f41688b = i5;
        }

        public final int a() {
            return this.f41688b;
        }

        public final int b() {
            return this.f41688b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof a) && this.f41688b == ((a) obj).f41688b;
        }

        public int hashCode() {
            return Integer.hashCode(this.f41688b);
        }

        @NotNull
        public String toString() {
            return a2.c.m(new StringBuilder("Html(webViewId="), this.f41688b, ')');
        }

        @NotNull
        public final a a(int i5) {
            return new a(i5);
        }

        public static /* synthetic */ a a(a aVar, int i5, int i11, Object obj) {
            if ((i11 & 1) != 0) {
                i5 = aVar.f41688b;
            }
            return aVar.a(i5);
        }
    }

    public static final class b extends j {

        /* renamed from: e, reason: collision with root package name */
        public static final int f41689e = 0;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final String f41690b;

        /* renamed from: c, reason: collision with root package name */
        public final int f41691c;

        /* renamed from: d, reason: collision with root package name */
        public final int f41692d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(@NotNull String imageUrl, int i5, int i11) {
            super(null);
            Intrinsics.g(imageUrl, "imageUrl");
            this.f41690b = imageUrl;
            this.f41691c = i5;
            this.f41692d = i11;
        }

        @NotNull
        public final String a() {
            return this.f41690b;
        }

        public final int b() {
            return this.f41691c;
        }

        public final int c() {
            return this.f41692d;
        }

        public final int d() {
            return this.f41692d;
        }

        @NotNull
        public final String e() {
            return this.f41690b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof b)) {
                return false;
            }
            b bVar = (b) obj;
            return Intrinsics.b(this.f41690b, bVar.f41690b) && this.f41691c == bVar.f41691c && this.f41692d == bVar.f41692d;
        }

        public final int f() {
            return this.f41691c;
        }

        public int hashCode() {
            return Integer.hashCode(this.f41692d) + u4.a(this.f41691c, this.f41690b.hashCode() * 31, 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("Image(imageUrl=");
            sb2.append(this.f41690b);
            sb2.append(", w=");
            sb2.append(this.f41691c);
            sb2.append(", h=");
            return a2.c.m(sb2, this.f41692d, ')');
        }

        @NotNull
        public final b a(@NotNull String imageUrl, int i5, int i11) {
            Intrinsics.g(imageUrl, "imageUrl");
            return new b(imageUrl, i5, i11);
        }

        public static /* synthetic */ b a(b bVar, String str, int i5, int i11, int i12, Object obj) {
            if ((i12 & 1) != 0) {
                str = bVar.f41690b;
            }
            if ((i12 & 2) != 0) {
                i5 = bVar.f41691c;
            }
            if ((i12 & 4) != 0) {
                i11 = bVar.f41692d;
            }
            return bVar.a(str, i5, i11);
        }
    }

    public /* synthetic */ j(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public j() {
    }
}
