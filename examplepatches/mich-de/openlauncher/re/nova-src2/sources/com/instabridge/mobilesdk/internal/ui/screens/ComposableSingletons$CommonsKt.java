package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ComposableSingletons$CommonsKt {

    @NotNull
    public static final ComposableSingletons$CommonsKt INSTANCE = new ComposableSingletons$CommonsKt();

    /* renamed from: lambda-1, reason: not valid java name */
    @NotNull
    private static Function2<p1.o, Integer, Unit> f16lambda1 = new x1.e(new Function2<p1.o, Integer, Unit>() { // from class: com.instabridge.mobilesdk.internal.ui.screens.ComposableSingletons$CommonsKt$lambda-1$1
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
                }
            }
        }
    }, false, -1954132167);

    @NotNull
    /* renamed from: getLambda-1$mobile_sdk_release, reason: not valid java name */
    public final Function2<p1.o, Integer, Unit> m223getLambda1$mobile_sdk_release() {
        return f16lambda1;
    }
}
