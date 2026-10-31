package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.l;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.x;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.n;
import java.util.List;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class h {

    /* renamed from: e, reason: collision with root package name */
    public static final int f40964e = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public List<String> f40965a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public List<String> f40966b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final List<String> f40967c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final l f40968d;

    public h(@Nullable List<String> list, @Nullable List<String> list2, @Nullable List<String> list3, @NotNull l vastTracker) {
        Intrinsics.g(vastTracker, "vastTracker");
        this.f40965a = list;
        this.f40966b = list2;
        this.f40967c = list3;
        this.f40968d = vastTracker;
    }

    public final void a() {
        List<String> list = this.f40966b;
        if (list != null) {
            l.a.a(this.f40968d, list, null, null, null, 14, null);
            this.f40966b = null;
        }
    }

    public final boolean b() {
        List<String> list = this.f40965a;
        if (list == null) {
            return false;
        }
        l.a.a(this.f40968d, list, null, null, null, 14, null);
        this.f40965a = null;
        return true;
    }

    public static /* synthetic */ void a(h hVar, x xVar, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            xVar = null;
        }
        hVar.a(xVar);
    }

    public final void a(@Nullable x xVar) {
        List<String> list = this.f40967c;
        if (list != null) {
            l.a.a(this.f40968d, list, xVar, null, null, 12, null);
        }
    }

    public /* synthetic */ h(List list, List list2, List list3, l lVar, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(list, list2, list3, (i5 & 8) != 0 ? n.b() : lVar);
    }
}
