package com.moloco.sdk.xenoss.sdkdevkit.android.core.services;

import b.c9;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface a {

    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a$a, reason: collision with other inner class name */
    /* loaded from: classes4.dex */
    public static abstract class AbstractC0299a {

        /* renamed from: a, reason: collision with root package name */
        public static final int f42146a = 0;

        /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a$a$a, reason: collision with other inner class name */
        public static final class C0300a extends AbstractC0299a {

            /* renamed from: b, reason: collision with root package name */
            @NotNull
            public static final C0300a f42147b = new C0300a();

            /* renamed from: c, reason: collision with root package name */
            public static final int f42148c = 0;

            public C0300a() {
                super(null);
            }
        }

        /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a$a$b */
        public static final class b extends AbstractC0299a {

            /* renamed from: c, reason: collision with root package name */
            public static final int f42149c = 0;

            /* renamed from: b, reason: collision with root package name */
            public final long f42150b;

            public b(long j11) {
                super(null);
                this.f42150b = j11;
            }

            public final long a() {
                return this.f42150b;
            }

            public final long b() {
                return this.f42150b;
            }

            public boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof b) && this.f42150b == ((b) obj).f42150b;
            }

            public int hashCode() {
                return Long.hashCode(this.f42150b);
            }

            @NotNull
            public String toString() {
                return a2.c.n(new StringBuilder("AppForeground(lastBgTimestamp="), this.f42150b, ')');
            }

            @NotNull
            public final b a(long j11) {
                return new b(j11);
            }

            public static /* synthetic */ b a(b bVar, long j11, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    j11 = bVar.f42150b;
                }
                return bVar.a(j11);
            }
        }

        /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a$a$c */
        public static final class c {

            /* renamed from: d, reason: collision with root package name */
            public static final int f42151d = 0;

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public final EnumC0301a f42152a;

            /* renamed from: b, reason: collision with root package name */
            @NotNull
            public final f f42153b;

            /* renamed from: c, reason: collision with root package name */
            @NotNull
            public final g f42154c;

            /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
            /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
            /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a$a$c$a, reason: collision with other inner class name */
            public static final class EnumC0301a {

                /* renamed from: a, reason: collision with root package name */
                public static final EnumC0301a f42155a = new EnumC0301a("NONE", 0);

                /* renamed from: b, reason: collision with root package name */
                public static final EnumC0301a f42156b = new EnumC0301a("CLOSE", 1);

                /* renamed from: c, reason: collision with root package name */
                public static final EnumC0301a f42157c = new EnumC0301a("SKIP", 2);

                /* renamed from: d, reason: collision with root package name */
                public static final EnumC0301a f42158d = new EnumC0301a("SKIP_DEC", 3);

                /* renamed from: e, reason: collision with root package name */
                public static final EnumC0301a f42159e = new EnumC0301a("MUTE", 4);

                /* renamed from: f, reason: collision with root package name */
                public static final EnumC0301a f42160f = new EnumC0301a("UNMUTE", 5);

                /* renamed from: g, reason: collision with root package name */
                public static final EnumC0301a f42161g = new EnumC0301a(NativeAdContent.ViewTag.CTA, 6);

                /* renamed from: h, reason: collision with root package name */
                public static final EnumC0301a f42162h = new EnumC0301a("REPLAY", 7);

                /* renamed from: i, reason: collision with root package name */
                public static final EnumC0301a f42163i = new EnumC0301a("AD_BADGE", 8);

                /* renamed from: j, reason: collision with root package name */
                public static final /* synthetic */ EnumC0301a[] f42164j;

                /* renamed from: k, reason: collision with root package name */
                public static final /* synthetic */ EnumEntries f42165k;

                static {
                    EnumC0301a[] enumC0301aArrA = a();
                    f42164j = enumC0301aArrA;
                    f42165k = EnumEntriesKt.a(enumC0301aArrA);
                }

                public EnumC0301a(String str, int i5) {
                }

                public static final /* synthetic */ EnumC0301a[] a() {
                    return new EnumC0301a[]{f42155a, f42156b, f42157c, f42158d, f42159e, f42160f, f42161g, f42162h, f42163i};
                }

                @NotNull
                public static EnumEntries<EnumC0301a> b() {
                    return f42165k;
                }

                public static EnumC0301a valueOf(String str) {
                    return (EnumC0301a) Enum.valueOf(EnumC0301a.class, str);
                }

                public static EnumC0301a[] values() {
                    return (EnumC0301a[]) f42164j.clone();
                }
            }

            public c(@NotNull EnumC0301a buttonType, @NotNull f position, @NotNull g size) {
                Intrinsics.g(buttonType, "buttonType");
                Intrinsics.g(position, "position");
                Intrinsics.g(size, "size");
                this.f42152a = buttonType;
                this.f42153b = position;
                this.f42154c = size;
            }

            @NotNull
            public final EnumC0301a a() {
                return this.f42152a;
            }

            @NotNull
            public final f b() {
                return this.f42153b;
            }

            @NotNull
            public final g c() {
                return this.f42154c;
            }

            @NotNull
            public final EnumC0301a d() {
                return this.f42152a;
            }

            @NotNull
            public final f e() {
                return this.f42153b;
            }

            public boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof c)) {
                    return false;
                }
                c cVar = (c) obj;
                return this.f42152a == cVar.f42152a && Intrinsics.b(this.f42153b, cVar.f42153b) && Intrinsics.b(this.f42154c, cVar.f42154c);
            }

            @NotNull
            public final g f() {
                return this.f42154c;
            }

            public int hashCode() {
                return this.f42154c.hashCode() + ((this.f42153b.hashCode() + (this.f42152a.hashCode() * 31)) * 31);
            }

            @NotNull
            public String toString() {
                return "Button(buttonType=" + this.f42152a + ", position=" + this.f42153b + ", size=" + this.f42154c + ')';
            }

            @NotNull
            public final c a(@NotNull EnumC0301a buttonType, @NotNull f position, @NotNull g size) {
                Intrinsics.g(buttonType, "buttonType");
                Intrinsics.g(position, "position");
                Intrinsics.g(size, "size");
                return new c(buttonType, position, size);
            }

            public static /* synthetic */ c a(c cVar, EnumC0301a enumC0301a, f fVar, g gVar, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    enumC0301a = cVar.f42152a;
                }
                if ((i5 & 2) != 0) {
                    fVar = cVar.f42153b;
                }
                if ((i5 & 4) != 0) {
                    gVar = cVar.f42154c;
                }
                return cVar.a(enumC0301a, fVar, gVar);
            }
        }

        /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a$a$e */
        public static final class e extends AbstractC0299a {

            /* renamed from: b, reason: collision with root package name */
            @NotNull
            public static final e f42171b = new e();

            /* renamed from: c, reason: collision with root package name */
            public static final int f42172c = 0;

            public e() {
                super(null);
            }
        }

        /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a$a$f */
        public static final class f {

            /* renamed from: c, reason: collision with root package name */
            public static final int f42173c = 0;

            /* renamed from: a, reason: collision with root package name */
            public final float f42174a;

            /* renamed from: b, reason: collision with root package name */
            public final float f42175b;

            public f(float f11, float f12) {
                this.f42174a = f11;
                this.f42175b = f12;
            }

            public final float a() {
                return this.f42174a;
            }

            public final float b() {
                return this.f42175b;
            }

            public final float c() {
                return this.f42174a;
            }

            public final float d() {
                return this.f42175b;
            }

            public boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof f)) {
                    return false;
                }
                f fVar = (f) obj;
                return Float.compare(this.f42174a, fVar.f42174a) == 0 && Float.compare(this.f42175b, fVar.f42175b) == 0;
            }

            public int hashCode() {
                return Float.hashCode(this.f42175b) + (Float.hashCode(this.f42174a) * 31);
            }

            @NotNull
            public String toString() {
                StringBuilder sb2 = new StringBuilder("Position(topLeftXDp=");
                sb2.append(this.f42174a);
                sb2.append(", topLeftYDp=");
                return c9.k(sb2, this.f42175b, ')');
            }

            @NotNull
            public final f a(float f11, float f12) {
                return new f(f11, f12);
            }

            public static /* synthetic */ f a(f fVar, float f11, float f12, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    f11 = fVar.f42174a;
                }
                if ((i5 & 2) != 0) {
                    f12 = fVar.f42175b;
                }
                return fVar.a(f11, f12);
            }
        }

        /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a$a$g */
        public static final class g {

            /* renamed from: c, reason: collision with root package name */
            public static final int f42176c = 0;

            /* renamed from: a, reason: collision with root package name */
            public final float f42177a;

            /* renamed from: b, reason: collision with root package name */
            public final float f42178b;

            public g(float f11, float f12) {
                this.f42177a = f11;
                this.f42178b = f12;
            }

            public final float a() {
                return this.f42177a;
            }

            public final float b() {
                return this.f42178b;
            }

            public final float c() {
                return this.f42178b;
            }

            public final float d() {
                return this.f42177a;
            }

            public boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof g)) {
                    return false;
                }
                g gVar = (g) obj;
                return Float.compare(this.f42177a, gVar.f42177a) == 0 && Float.compare(this.f42178b, gVar.f42178b) == 0;
            }

            public int hashCode() {
                return Float.hashCode(this.f42178b) + (Float.hashCode(this.f42177a) * 31);
            }

            @NotNull
            public String toString() {
                StringBuilder sb2 = new StringBuilder("Size(widthDp=");
                sb2.append(this.f42177a);
                sb2.append(", heightDp=");
                return c9.k(sb2, this.f42178b, ')');
            }

            @NotNull
            public final g a(float f11, float f12) {
                return new g(f11, f12);
            }

            public static /* synthetic */ g a(g gVar, float f11, float f12, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    f11 = gVar.f42177a;
                }
                if ((i5 & 2) != 0) {
                    f12 = gVar.f42178b;
                }
                return gVar.a(f11, f12);
            }
        }

        public /* synthetic */ AbstractC0299a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public AbstractC0299a() {
        }

        /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a$a$d */
        public static final class d extends AbstractC0299a {

            /* renamed from: f, reason: collision with root package name */
            public static final int f42166f = 8;

            /* renamed from: b, reason: collision with root package name */
            @NotNull
            public final f f42167b;

            /* renamed from: c, reason: collision with root package name */
            @Nullable
            public final f f42168c;

            /* renamed from: d, reason: collision with root package name */
            @Nullable
            public final g f42169d;

            /* renamed from: e, reason: collision with root package name */
            @NotNull
            public final List<c> f42170e;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public d(@NotNull f clickPosition, @Nullable f fVar, @Nullable g gVar, @NotNull List<c> buttonLayout) {
                super(null);
                Intrinsics.g(clickPosition, "clickPosition");
                Intrinsics.g(buttonLayout, "buttonLayout");
                this.f42167b = clickPosition;
                this.f42168c = fVar;
                this.f42169d = gVar;
                this.f42170e = buttonLayout;
            }

            @NotNull
            public final List<c> a() {
                return this.f42170e;
            }

            @NotNull
            public final f b() {
                return this.f42167b;
            }

            @Nullable
            public final f c() {
                return this.f42168c;
            }

            @Nullable
            public final g d() {
                return this.f42169d;
            }

            public d(f fVar, f fVar2, g gVar, List list, int i5, DefaultConstructorMarker defaultConstructorMarker) {
                this(fVar, (i5 & 2) != 0 ? null : fVar2, (i5 & 4) != 0 ? null : gVar, (i5 & 8) != 0 ? EmptyList.f71733a : list);
            }
        }
    }

    @Nullable
    Object a(long j11, @NotNull AbstractC0299a abstractC0299a, @NotNull String str, @NotNull Continuation<? super String> continuation);
}
