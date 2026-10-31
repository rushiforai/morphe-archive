package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ComposableSingletons$CarrierLockedScreenKt {

    @NotNull
    public static final ComposableSingletons$CarrierLockedScreenKt INSTANCE = new ComposableSingletons$CarrierLockedScreenKt();

    /* renamed from: lambda-1, reason: not valid java name */
    @NotNull
    private static Function3<k0.y, p1.o, Integer, Unit> f12lambda1 = new x1.e(new Function3<k0.y, p1.o, Integer, Unit>() { // from class: com.instabridge.mobilesdk.internal.ui.screens.ComposableSingletons$CarrierLockedScreenKt$lambda-1$1
        @Override // kotlin.jvm.functions.Function3
        public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2, Object obj3) {
            invoke((k0.y) obj, (p1.o) obj2, ((Number) obj3).intValue());
            return Unit.f71706a;
        }

        public final void invoke(k0.y FlowScaffold, p1.o oVar, int i5) {
            Intrinsics.g(FlowScaffold, "$this$FlowScaffold");
            if ((i5 & 17) == 16) {
                p1.t tVar = (p1.t) oVar;
                if (tVar.E()) {
                    tVar.V();
                }
            }
        }
    }, false, 1798135080);

    @NotNull
    /* renamed from: getLambda-1$mobile_sdk_release, reason: not valid java name */
    public final Function3<k0.y, p1.o, Integer, Unit> m219getLambda1$mobile_sdk_release() {
        return f12lambda1;
    }
}
