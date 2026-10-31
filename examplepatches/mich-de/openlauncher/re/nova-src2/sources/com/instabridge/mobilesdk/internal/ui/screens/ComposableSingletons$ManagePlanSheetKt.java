package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.R;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import l1.g9;
import org.jetbrains.annotations.NotNull;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ComposableSingletons$ManagePlanSheetKt {

    @NotNull
    public static final ComposableSingletons$ManagePlanSheetKt INSTANCE = new ComposableSingletons$ManagePlanSheetKt();

    /* renamed from: lambda-1, reason: not valid java name */
    @NotNull
    private static Function3<k0.y1, p1.o, Integer, Unit> f35lambda1 = new x1.e(new Function3<k0.y1, p1.o, Integer, Unit>() { // from class: com.instabridge.mobilesdk.internal.ui.screens.ComposableSingletons$ManagePlanSheetKt$lambda-1$1
        @Override // kotlin.jvm.functions.Function3
        public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2, Object obj3) {
            invoke((k0.y1) obj, (p1.o) obj2, ((Number) obj3).intValue());
            return Unit.f71706a;
        }

        public final void invoke(k0.y1 OutlinedButton, p1.o oVar, int i5) {
            Intrinsics.g(OutlinedButton, "$this$OutlinedButton");
            if ((i5 & 17) == 16) {
                p1.t tVar = (p1.t) oVar;
                if (tVar.E()) {
                    tVar.V();
                    return;
                }
            }
            g9.b(x7.f.Y(oVar, R.string.mobile_sdk_not_now), null, ((l1.d1) ((p1.t) oVar).j(l1.g1.f73330a)).f73164s, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 0, 0, 131066);
        }
    }, false, 1442682074);

    /* renamed from: lambda-2, reason: not valid java name */
    @NotNull
    private static Function3<k0.y1, p1.o, Integer, Unit> f36lambda2 = new x1.e(new Function3<k0.y1, p1.o, Integer, Unit>() { // from class: com.instabridge.mobilesdk.internal.ui.screens.ComposableSingletons$ManagePlanSheetKt$lambda-2$1
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
            g9.b(x7.f.Y(oVar, R.string.mobile_sdk_cta_close), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 0, 0, 131070);
        }
    }, false, -868237491);

    /* renamed from: lambda-3, reason: not valid java name */
    @NotNull
    private static Function3<k0.y1, p1.o, Integer, Unit> f37lambda3 = new x1.e(new Function3<k0.y1, p1.o, Integer, Unit>() { // from class: com.instabridge.mobilesdk.internal.ui.screens.ComposableSingletons$ManagePlanSheetKt$lambda-3$1
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
            g9.b(x7.f.Y(oVar, R.string.mobile_sdk_cta_close), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 0, 0, 131070);
        }
    }, false, 1816181910);

    @NotNull
    /* renamed from: getLambda-1$mobile_sdk_release, reason: not valid java name */
    public final Function3<k0.y1, p1.o, Integer, Unit> m242getLambda1$mobile_sdk_release() {
        return f35lambda1;
    }

    @NotNull
    /* renamed from: getLambda-2$mobile_sdk_release, reason: not valid java name */
    public final Function3<k0.y1, p1.o, Integer, Unit> m243getLambda2$mobile_sdk_release() {
        return f36lambda2;
    }

    @NotNull
    /* renamed from: getLambda-3$mobile_sdk_release, reason: not valid java name */
    public final Function3<k0.y1, p1.o, Integer, Unit> m244getLambda3$mobile_sdk_release() {
        return f37lambda3;
    }
}
