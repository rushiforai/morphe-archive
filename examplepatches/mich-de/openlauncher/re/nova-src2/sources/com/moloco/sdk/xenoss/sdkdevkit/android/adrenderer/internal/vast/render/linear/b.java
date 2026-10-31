package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.n;
import java.util.List;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: d, reason: collision with root package name */
    public static final int f41723d = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public List<String> f41724a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public List<String> f41725b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.l f41726c;

    public b(@Nullable List<String> list, @Nullable List<String> list2, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.l vastTracker) {
        Intrinsics.g(vastTracker, "vastTracker");
        this.f41724a = list;
        this.f41725b = list2;
        this.f41726c = vastTracker;
    }

    public static /* synthetic */ void a(b bVar, Integer num, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            num = null;
        }
        if ((i5 & 2) != 0) {
            str = null;
        }
        bVar.a(num, str);
    }

    public static /* synthetic */ void b(b bVar, Integer num, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            num = null;
        }
        if ((i5 & 2) != 0) {
            str = null;
        }
        bVar.b(num, str);
    }

    public final void a(@Nullable Integer num, @Nullable String str) {
        List<String> list = this.f41724a;
        if (list != null) {
            this.f41726c.a(list, null, num, str);
            this.f41724a = null;
        }
    }

    public final void b(@Nullable Integer num, @Nullable String str) {
        List<String> list = this.f41725b;
        if (list != null) {
            this.f41726c.a(list, null, num, str);
            this.f41725b = null;
        }
    }

    public /* synthetic */ b(List list, List list2, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.l lVar, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(list, list2, (i5 & 4) != 0 ? n.b() : lVar);
    }
}
