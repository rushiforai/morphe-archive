package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class i implements h {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Map<a.AbstractC0299a.c.EnumC0301a, a.AbstractC0299a.c> f39811a = new LinkedHashMap();

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.g
    public void a(@NotNull a.AbstractC0299a.c button) {
        Intrinsics.g(button, "button");
        this.f39811a.put(button.d(), button);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.h
    @NotNull
    public List<a.AbstractC0299a.c> q() {
        List listQ0 = MapsKt.q0(this.f39811a);
        ArrayList arrayList = new ArrayList(b70.c.u0(listQ0, 10));
        Iterator it = listQ0.iterator();
        while (it.hasNext()) {
            arrayList.add((a.AbstractC0299a.c) ((Pair) it.next()).f71684b);
        }
        return arrayList;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.g
    public void a(@NotNull a.AbstractC0299a.c.EnumC0301a buttonType) {
        Intrinsics.g(buttonType, "buttonType");
        this.f39811a.remove(buttonType);
    }
}
