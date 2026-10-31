package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion;

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
public final class g {

    /* renamed from: f, reason: collision with root package name */
    public static final int f41038f = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a f41039a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public List<String> f41040b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public List<String> f41041c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.h f41042d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final l f41043e;

    public g(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService, @Nullable List<String> list, @Nullable List<String> list2, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.h buttonTracker, @NotNull l vastTracker) {
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        Intrinsics.g(buttonTracker, "buttonTracker");
        Intrinsics.g(vastTracker, "vastTracker");
        this.f41039a = customUserEventBuilderService;
        this.f41040b = list;
        this.f41041c = list2;
        this.f41042d = buttonTracker;
        this.f41043e = vastTracker;
    }

    public final void a(@NotNull a.AbstractC0299a.c button) {
        Intrinsics.g(button, "button");
        this.f41042d.a(button);
    }

    public final void a(@NotNull a.AbstractC0299a.c.EnumC0301a buttonType) {
        Intrinsics.g(buttonType, "buttonType");
        this.f41042d.a(buttonType);
    }

    public final void a(@NotNull a.AbstractC0299a.f lastClickPosition) {
        Intrinsics.g(lastClickPosition, "lastClickPosition");
        List<String> list = this.f41040b;
        if (list != null) {
            l.a.a(this.f41043e, list, null, null, null, this.f41042d.q(), this.f41039a, lastClickPosition, 14, null);
            this.f41040b = null;
        }
    }

    public /* synthetic */ g(com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a aVar, List list, List list2, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.h hVar, l lVar, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(aVar, list, list2, (i5 & 8) != 0 ? j.a() : hVar, (i5 & 16) != 0 ? n.b() : lVar);
    }

    public final void a() {
        List<String> list = this.f41041c;
        if (list != null) {
            l.a.a(this.f41043e, list, null, null, null, 14, null);
            this.f41041c = null;
        }
    }
}
