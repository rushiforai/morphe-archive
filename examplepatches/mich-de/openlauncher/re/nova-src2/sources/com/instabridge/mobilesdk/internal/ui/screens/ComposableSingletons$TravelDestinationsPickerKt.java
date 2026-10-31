package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.MobileSdkTheme;
import com.instabridge.mobilesdk.R;
import com.instabridge.mobilesdk.internal.ui.theme.MobileThemeKt;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import l1.b3;
import l1.g9;
import org.jetbrains.annotations.NotNull;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ComposableSingletons$TravelDestinationsPickerKt {

    @NotNull
    public static final ComposableSingletons$TravelDestinationsPickerKt INSTANCE = new ComposableSingletons$TravelDestinationsPickerKt();

    /* renamed from: lambda-1, reason: not valid java name */
    @NotNull
    private static Function3<k0.y1, p1.o, Integer, Unit> f41lambda1 = new x1.e(new Function3<k0.y1, p1.o, Integer, Unit>() { // from class: com.instabridge.mobilesdk.internal.ui.screens.ComposableSingletons$TravelDestinationsPickerKt$lambda-1$1
        @Override // kotlin.jvm.functions.Function3
        public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2, Object obj3) {
            invoke((k0.y1) obj, (p1.o) obj2, ((Number) obj3).intValue());
            return Unit.f71706a;
        }

        public final void invoke(k0.y1 TextButton, p1.o oVar, int i5) {
            Intrinsics.g(TextButton, "$this$TextButton");
            if ((i5 & 17) == 16) {
                p1.t tVar = (p1.t) oVar;
                if (tVar.E()) {
                    tVar.V();
                    return;
                }
            }
            p1.t tVar2 = (p1.t) oVar;
            g9.b(x7.f.Y(oVar, R.string.mobile_sdk_cta_try_again), null, ((MobileSdkTheme) tVar2.j(MobileThemeKt.getLocalMobileSdkTheme())).m179getPrimary0d7_KjU(), 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, tVar2, 0, 0, 131066);
        }
    }, false, -845170910);

    /* renamed from: lambda-2, reason: not valid java name */
    @NotNull
    private static Function2<p1.o, Integer, Unit> f42lambda2 = new x1.e(new Function2<p1.o, Integer, Unit>() { // from class: com.instabridge.mobilesdk.internal.ui.screens.ComposableSingletons$TravelDestinationsPickerKt$lambda-2$1
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
            p1.t tVar2 = (p1.t) oVar;
            b3.a(ul.b.V(R.drawable.mobile_sdk_ic_globe, oVar, 0), null, androidx.compose.foundation.layout.e.o(b2.r.f17024a, 26), ((MobileSdkTheme) tVar2.j(MobileThemeKt.getLocalMobileSdkTheme())).m179getPrimary0d7_KjU(), tVar2, 432, 0);
        }
    }, false, 175947496);

    @NotNull
    /* renamed from: getLambda-1$mobile_sdk_release, reason: not valid java name */
    public final Function3<k0.y1, p1.o, Integer, Unit> m248getLambda1$mobile_sdk_release() {
        return f41lambda1;
    }

    @NotNull
    /* renamed from: getLambda-2$mobile_sdk_release, reason: not valid java name */
    public final Function2<p1.o, Integer, Unit> m249getLambda2$mobile_sdk_release() {
        return f42lambda2;
    }
}
