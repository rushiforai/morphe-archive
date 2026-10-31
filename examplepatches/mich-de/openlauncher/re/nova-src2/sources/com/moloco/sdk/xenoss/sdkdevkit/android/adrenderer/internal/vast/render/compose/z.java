package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose;

import android.content.Context;
import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.C2977d;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.V;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.j;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import p1.t1;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class z {
    public static final Unit a(j.a aVar, b2.t tVar, int i5, int i11, p1.o oVar, int i12) {
        a(aVar, tVar, oVar, i5 | 1, i11);
        return Unit.f71706a;
    }

    public static final Unit b(j.a aVar, b2.t tVar, int i5, int i11, p1.o oVar, int i12) {
        a(aVar, tVar, oVar, i5 | 1, i11);
        return Unit.f71706a;
    }

    public static final void a(@NotNull final j.a htmlResource, @Nullable b2.t tVar, @Nullable p1.o oVar, final int i5, final int i11) {
        int i12;
        final b2.t tVar2;
        Intrinsics.g(htmlResource, "htmlResource");
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-1230364815);
        if ((i11 & 1) != 0) {
            i12 = i5 | 6;
        } else if ((i5 & 6) == 0) {
            i12 = (tVar3.f(htmlResource) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        int i13 = i11 & 2;
        if (i13 != 0) {
            i12 |= 48;
        } else if ((i5 & 48) == 0) {
            i12 |= tVar3.f(tVar) ? 32 : 16;
        }
        if ((i12 & 19) == 18 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar;
        } else {
            tVar2 = i13 != 0 ? b2.r.f17024a : tVar;
            tVar3.c0(-1944708127);
            Object objP = tVar3.P();
            if (objP == p1.n.f81514a) {
                V v11 = V.f38623a;
                Object obj = V.f38624b.get(Integer.valueOf(htmlResource.b()));
                if (!(obj instanceof C2977d)) {
                    obj = null;
                }
                objP = (C2977d) obj;
                tVar3.m0(objP);
            }
            C2977d c2977d = (C2977d) objP;
            tVar3.p(false);
            if (c2977d == null) {
                t1 t1VarU = tVar3.u();
                if (t1VarU != null) {
                    final int i14 = 0;
                    t1VarU.f81583d = new Function2() { // from class: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.t0
                        @Override // kotlin.jvm.functions.Function2
                        public final Object invoke(Object obj2, Object obj3) {
                            switch (i14) {
                                case 0:
                                    int iIntValue = ((Integer) obj3).intValue();
                                    return z.a(htmlResource, tVar2, i5, i11, (p1.o) obj2, iIntValue);
                                default:
                                    int iIntValue2 = ((Integer) obj3).intValue();
                                    return z.b(htmlResource, tVar2, i5, i11, (p1.o) obj2, iIntValue2);
                            }
                        }
                    };
                    return;
                }
                return;
            }
            com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview.a.a(c2977d, tVar2, null, tVar3, (i12 & 112) | 384, 0);
        }
        t1 t1VarU2 = tVar3.u();
        if (t1VarU2 != null) {
            final int i15 = 1;
            t1VarU2.f81583d = new Function2() { // from class: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.t0
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj2, Object obj3) {
                    switch (i15) {
                        case 0:
                            int iIntValue = ((Integer) obj3).intValue();
                            return z.a(htmlResource, tVar2, i5, i11, (p1.o) obj2, iIntValue);
                        default:
                            int iIntValue2 = ((Integer) obj3).intValue();
                            return z.b(htmlResource, tVar2, i5, i11, (p1.o) obj2, iIntValue2);
                    }
                }
            };
        }
    }

    @Nullable
    public static final View a(@NotNull Context context, @NotNull j.a htmlResource) {
        Intrinsics.g(context, "context");
        Intrinsics.g(htmlResource, "htmlResource");
        V v11 = V.f38623a;
        Object obj = V.f38624b.get(Integer.valueOf(htmlResource.b()));
        if (!(obj instanceof C2977d)) {
            obj = null;
        }
        C2977d c2977d = (C2977d) obj;
        if (c2977d == null) {
            return null;
        }
        return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview.a.a(context, c2977d, null);
    }
}
