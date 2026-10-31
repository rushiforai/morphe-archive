package com.instabridge.mobilesdk.internal.ui.screens;

import k0.i2;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import l1.g9;
import org.jetbrains.annotations.NotNull;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ComposableSingletons$DashboardScreenKt {

    @NotNull
    public static final ComposableSingletons$DashboardScreenKt INSTANCE = new ComposableSingletons$DashboardScreenKt();

    /* renamed from: lambda-1, reason: not valid java name */
    @NotNull
    private static Function2<p1.o, Integer, Unit> f18lambda1 = new x1.e(new Function2<p1.o, Integer, Unit>() { // from class: com.instabridge.mobilesdk.internal.ui.screens.ComposableSingletons$DashboardScreenKt$lambda-1$1
        @Override // kotlin.jvm.functions.Function2
        public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
            invoke((p1.o) obj, ((Number) obj2).intValue());
            return Unit.f71706a;
        }

        public final void invoke(p1.o oVar, int i5) {
            if ((i5 & 3) == 2) {
                p1.t tVar = (p1.t) oVar;
                if (tVar.E()) {
                    tVar.V();
                    return;
                }
            }
            b2.r rVar = b2.r.f17024a;
            ShimmerKt.m265ShimmerBoxrAjV9yQ(androidx.compose.foundation.layout.e.g(androidx.compose.foundation.layout.e.e(rVar, 0.7f), 24), 0.0f, oVar, 6, 2);
            i2.b(androidx.compose.foundation.layout.e.g(rVar, 16), oVar);
            p1.t tVar2 = (p1.t) oVar;
            tVar2.b0(-707797960);
            for (int i11 = 0; i11 < 3; i11++) {
                DashboardScreenKt.UsageRowSkeleton(oVar, 0);
                tVar2.b0(-707795986);
                if (i11 < 2) {
                    i2.b(androidx.compose.foundation.layout.e.g(rVar, 12), oVar);
                }
                tVar2.p(false);
            }
            tVar2.p(false);
            i2.b(androidx.compose.foundation.layout.e.g(rVar, 12), oVar);
            ShimmerKt.m265ShimmerBoxrAjV9yQ(androidx.compose.foundation.layout.e.g(androidx.compose.foundation.layout.e.e(rVar, 0.4f), 14), 0.0f, oVar, 6, 2);
        }
    }, false, 1153544764);

    /* renamed from: lambda-2, reason: not valid java name */
    @NotNull
    private static Function3<k0.y1, p1.o, Integer, Unit> f19lambda2 = new x1.e(new Function3<k0.y1, p1.o, Integer, Unit>() { // from class: com.instabridge.mobilesdk.internal.ui.screens.ComposableSingletons$DashboardScreenKt$lambda-2$1
        @Override // kotlin.jvm.functions.Function3
        public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2, Object obj3) {
            invoke((k0.y1) obj, (p1.o) obj2, ((Number) obj3).intValue());
            return Unit.f71706a;
        }

        public final void invoke(k0.y1 Button, p1.o oVar, int i5) {
            Intrinsics.g(Button, "$this$Button");
            if ((i5 & 17) == 16) {
                p1.t tVar = (p1.t) oVar;
                if (tVar.E()) {
                    tVar.V();
                    return;
                }
            }
            g9.b("Pick a plan", null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 6, 0, 131070);
        }
    }, false, -586687671);

    @NotNull
    /* renamed from: getLambda-1$mobile_sdk_release, reason: not valid java name */
    public final Function2<p1.o, Integer, Unit> m225getLambda1$mobile_sdk_release() {
        return f18lambda1;
    }

    @NotNull
    /* renamed from: getLambda-2$mobile_sdk_release, reason: not valid java name */
    public final Function3<k0.y1, p1.o, Integer, Unit> m226getLambda2$mobile_sdk_release() {
        return f19lambda2;
    }
}
