package com.vungle.ads.internal;

import android.content.Context;
import com.vungle.ads.internal.model.j3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d1 extends y0 {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d1(Context context) {
        super(context);
        Intrinsics.g(context, "context");
    }

    @Override // com.vungle.ads.internal.s
    public final boolean a(j3 placement) {
        Intrinsics.g(placement, "placement");
        return placement.g() || placement.d();
    }
}
