package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.x;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.a;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.b;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.c;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.d;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.e;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.f;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.i;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.j;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.k;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes4.dex */
public abstract class g {

    /* renamed from: f, reason: collision with root package name */
    public static final int f39572f = 0;

    /* renamed from: a, reason: collision with root package name */
    public final int f39574a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f39575b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f39576c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f39577d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final a f39571e = new a(null);

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public static final Lazy<Map<String, g>> f39573g = LazyKt.a(new x(2));

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public static /* synthetic */ void b() {
        }

        @NotNull
        public final Map<String, g> a() {
            return (Map) g.f39573g.getValue();
        }

        public a() {
        }

        @NotNull
        public final g a(@NotNull String description) {
            Intrinsics.g(description, "description");
            g gVar = a().get(description);
            return gVar == null ? b.f39578h : gVar;
        }
    }

    public static final class b extends g {

        /* renamed from: h, reason: collision with root package name */
        @NotNull
        public static final b f39578h = new b();

        /* renamed from: i, reason: collision with root package name */
        public static final int f39579i = 0;

        public b() {
            super(Integer.MIN_VALUE, "UNKNOWN", false, true, null);
        }

        public boolean equals(@Nullable Object obj) {
            return this == obj || (obj instanceof b);
        }

        public int hashCode() {
            return -2068672870;
        }

        @NotNull
        public String toString() {
            return "UndocumentedTemplateError";
        }
    }

    public /* synthetic */ g(int i5, String str, boolean z11, boolean z12, DefaultConstructorMarker defaultConstructorMarker) {
        this(i5, str, z11, z12);
    }

    public static final Map b() {
        List listQ = ul.b.Q(a.C0232a.f39533j, k.c.f39596j, k.a.f39592j, k.b.f39594j, k.d.f39598j, k.e.f39600j, k.f.f39602j, k.g.f39604j, c.C0234c.f39553j, c.b.f39551j, c.a.f39549j, d.a.f39557j, b.a.f39537j, b.c.f39541j, b.d.f39543j, b.C0233b.f39539j, b.e.f39545j, i.a.f39582j, i.b.f39584j, e.a.f39561j, j.a.f39588j, f.a.f39565j, f.b.f39567j, f.c.f39569j);
        int iD0 = b70.k.d0(b70.c.u0(listQ, 10));
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0 >= 16 ? iD0 : 16);
        for (Object obj : listQ) {
            linkedHashMap.put(((g) obj).c(), obj);
        }
        return linkedHashMap;
    }

    @NotNull
    public String c() {
        return this.f39575b;
    }

    public final int d() {
        return this.f39574a;
    }

    public boolean e() {
        return this.f39576c;
    }

    public boolean f() {
        return this.f39577d;
    }

    public g(int i5, String str, boolean z11, boolean z12) {
        this.f39574a = i5;
        this.f39575b = str;
        this.f39576c = z11;
        this.f39577d = z12;
    }
}
