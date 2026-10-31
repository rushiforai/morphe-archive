package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.h;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.j;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.l;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a;
import java.util.List;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: g, reason: collision with root package name */
    public static final int f41635g = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a f41636a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public List<String> f41637b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public List<String> f41638c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public List<String> f41639d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final h f41640e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final l f41641f;

    public d(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService, @Nullable List<String> list, @Nullable List<String> list2, @Nullable List<String> list3, @NotNull h buttonTracker, @NotNull l vastTracker) {
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        Intrinsics.g(buttonTracker, "buttonTracker");
        Intrinsics.g(vastTracker, "vastTracker");
        this.f41636a = customUserEventBuilderService;
        this.f41637b = list;
        this.f41638c = list2;
        this.f41639d = list3;
        this.f41640e = buttonTracker;
        this.f41641f = vastTracker;
    }

    public final void a(@NotNull a.AbstractC0299a.c button) {
        Intrinsics.g(button, "button");
        this.f41640e.a(button);
    }

    public final void b() {
        List<String> list = this.f41639d;
        if (list != null) {
            l.a.a(this.f41641f, list, null, null, null, 14, null);
            this.f41639d = null;
        }
    }

    public final void a(@NotNull a.AbstractC0299a.c.EnumC0301a buttonType) {
        Intrinsics.g(buttonType, "buttonType");
        this.f41640e.a(buttonType);
    }

    public final void a(@NotNull a.AbstractC0299a.f position) {
        Intrinsics.g(position, "position");
        List<String> list = this.f41637b;
        if (list != null) {
            l.a.a(this.f41641f, list, null, null, null, this.f41640e.q(), this.f41636a, position, 14, null);
            this.f41637b = null;
        }
    }

    public /* synthetic */ d(com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a aVar, List list, List list2, List list3, h hVar, l lVar, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(aVar, list, list2, list3, (i5 & 16) != 0 ? j.a() : hVar, (i5 & 32) != 0 ? n.b() : lVar);
    }

    public final void a() {
        List<String> list = this.f41638c;
        if (list != null) {
            l.a.a(this.f41641f, list, null, null, null, 14, null);
            this.f41638c = null;
        }
    }
}
