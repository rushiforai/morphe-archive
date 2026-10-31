package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w70.g2;

/* loaded from: classes4.dex */
public interface i extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.d, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.g {

    public static abstract class a {

        /* renamed from: b, reason: collision with root package name */
        public static final int f40969b = 0;

        /* renamed from: a, reason: collision with root package name */
        public final boolean f40970a;

        /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.i$a$a, reason: collision with other inner class name */
        public static final class C0265a extends a {

            /* renamed from: e, reason: collision with root package name */
            public static final int f40971e = 8;

            /* renamed from: c, reason: collision with root package name */
            @NotNull
            public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.h f40972c;

            /* renamed from: d, reason: collision with root package name */
            public final boolean f40973d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0265a(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.h viewModel, boolean z11) {
                super(z11, null);
                Intrinsics.g(viewModel, "viewModel");
                this.f40972c = viewModel;
                this.f40973d = z11;
            }

            @NotNull
            public final C0265a a(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.h viewModel, boolean z11) {
                Intrinsics.g(viewModel, "viewModel");
                return new C0265a(viewModel, z11);
            }

            @NotNull
            public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.h b() {
                return this.f40972c;
            }

            public final boolean c() {
                return this.f40973d;
            }

            @NotNull
            public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.h d() {
                return this.f40972c;
            }

            public boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof C0265a)) {
                    return false;
                }
                C0265a c0265a = (C0265a) obj;
                return Intrinsics.b(this.f40972c, c0265a.f40972c) && this.f40973d == c0265a.f40973d;
            }

            public int hashCode() {
                return Boolean.hashCode(this.f40973d) + (this.f40972c.hashCode() * 31);
            }

            @NotNull
            public String toString() {
                StringBuilder sb2 = new StringBuilder("Companion(viewModel=");
                sb2.append(this.f40972c);
                sb2.append(", isLastAdPart=");
                return a2.c.p(sb2, this.f40973d, ')');
            }

            public static /* synthetic */ C0265a a(C0265a c0265a, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.h hVar, boolean z11, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    hVar = c0265a.f40972c;
                }
                if ((i5 & 2) != 0) {
                    z11 = c0265a.f40973d;
                }
                return c0265a.a(hVar, z11);
            }

            @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.i.a
            public boolean a() {
                return this.f40973d;
            }
        }

        public static final class b extends a {

            /* renamed from: e, reason: collision with root package name */
            public static final int f40974e = 8;

            /* renamed from: c, reason: collision with root package name */
            @NotNull
            public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.e f40975c;

            /* renamed from: d, reason: collision with root package name */
            public final boolean f40976d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public b(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.e viewModel, boolean z11) {
                super(z11, null);
                Intrinsics.g(viewModel, "viewModel");
                this.f40975c = viewModel;
                this.f40976d = z11;
            }

            @NotNull
            public final b a(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.e viewModel, boolean z11) {
                Intrinsics.g(viewModel, "viewModel");
                return new b(viewModel, z11);
            }

            @NotNull
            public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.e b() {
                return this.f40975c;
            }

            public final boolean c() {
                return this.f40976d;
            }

            @NotNull
            public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.e d() {
                return this.f40975c;
            }

            public boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof b)) {
                    return false;
                }
                b bVar = (b) obj;
                return Intrinsics.b(this.f40975c, bVar.f40975c) && this.f40976d == bVar.f40976d;
            }

            public int hashCode() {
                return Boolean.hashCode(this.f40976d) + (this.f40975c.hashCode() * 31);
            }

            @NotNull
            public String toString() {
                StringBuilder sb2 = new StringBuilder("DEC(viewModel=");
                sb2.append(this.f40975c);
                sb2.append(", isLastAdPart=");
                return a2.c.p(sb2, this.f40976d, ')');
            }

            public static /* synthetic */ b a(b bVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.e eVar, boolean z11, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    eVar = bVar.f40975c;
                }
                if ((i5 & 2) != 0) {
                    z11 = bVar.f40976d;
                }
                return bVar.a(eVar, z11);
            }

            @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.i.a
            public boolean a() {
                return this.f40976d;
            }
        }

        public static final class c extends a {

            /* renamed from: e, reason: collision with root package name */
            public static final int f40977e = 8;

            /* renamed from: c, reason: collision with root package name */
            @NotNull
            public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.k f40978c;

            /* renamed from: d, reason: collision with root package name */
            public final boolean f40979d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public c(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.k viewModel, boolean z11) {
                super(z11, null);
                Intrinsics.g(viewModel, "viewModel");
                this.f40978c = viewModel;
                this.f40979d = z11;
            }

            @NotNull
            public final c a(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.k viewModel, boolean z11) {
                Intrinsics.g(viewModel, "viewModel");
                return new c(viewModel, z11);
            }

            @NotNull
            public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.k b() {
                return this.f40978c;
            }

            public final boolean c() {
                return this.f40979d;
            }

            @NotNull
            public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.k d() {
                return this.f40978c;
            }

            public boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof c)) {
                    return false;
                }
                c cVar = (c) obj;
                return Intrinsics.b(this.f40978c, cVar.f40978c) && this.f40979d == cVar.f40979d;
            }

            public int hashCode() {
                return Boolean.hashCode(this.f40979d) + (this.f40978c.hashCode() * 31);
            }

            @NotNull
            public String toString() {
                StringBuilder sb2 = new StringBuilder("Linear(viewModel=");
                sb2.append(this.f40978c);
                sb2.append(", isLastAdPart=");
                return a2.c.p(sb2, this.f40979d, ')');
            }

            public static /* synthetic */ c a(c cVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.k kVar, boolean z11, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    kVar = cVar.f40978c;
                }
                if ((i5 & 2) != 0) {
                    z11 = cVar.f40979d;
                }
                return cVar.a(kVar, z11);
            }

            @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.i.a
            public boolean a() {
                return this.f40979d;
            }
        }

        public static final class d extends a {

            /* renamed from: e, reason: collision with root package name */
            public static final int f40980e = 8;

            /* renamed from: c, reason: collision with root package name */
            @NotNull
            public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.i f40981c;

            /* renamed from: d, reason: collision with root package name */
            public final boolean f40982d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public d(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.i viewModel, boolean z11) {
                super(z11, null);
                Intrinsics.g(viewModel, "viewModel");
                this.f40981c = viewModel;
                this.f40982d = z11;
            }

            @NotNull
            public final d a(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.i viewModel, boolean z11) {
                Intrinsics.g(viewModel, "viewModel");
                return new d(viewModel, z11);
            }

            @NotNull
            public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.i b() {
                return this.f40981c;
            }

            public final boolean c() {
                return this.f40982d;
            }

            @NotNull
            public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.i d() {
                return this.f40981c;
            }

            public boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof d)) {
                    return false;
                }
                d dVar = (d) obj;
                return Intrinsics.b(this.f40981c, dVar.f40981c) && this.f40982d == dVar.f40982d;
            }

            public int hashCode() {
                return Boolean.hashCode(this.f40982d) + (this.f40981c.hashCode() * 31);
            }

            @NotNull
            public String toString() {
                StringBuilder sb2 = new StringBuilder("Mraid(viewModel=");
                sb2.append(this.f40981c);
                sb2.append(", isLastAdPart=");
                return a2.c.p(sb2, this.f40982d, ')');
            }

            public static /* synthetic */ d a(d dVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.i iVar, boolean z11, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    iVar = dVar.f40981c;
                }
                if ((i5 & 2) != 0) {
                    z11 = dVar.f40982d;
                }
                return dVar.a(iVar, z11);
            }

            @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.i.a
            public boolean a() {
                return this.f40982d;
            }
        }

        public /* synthetic */ a(boolean z11, DefaultConstructorMarker defaultConstructorMarker) {
            this(z11);
        }

        public boolean a() {
            return this.f40970a;
        }

        public a(boolean z11) {
            this.f40970a = z11;
        }
    }

    void A();

    void C();

    void E();

    @NotNull
    g2 T();

    @NotNull
    g2 k();

    @NotNull
    g2 o();
}
