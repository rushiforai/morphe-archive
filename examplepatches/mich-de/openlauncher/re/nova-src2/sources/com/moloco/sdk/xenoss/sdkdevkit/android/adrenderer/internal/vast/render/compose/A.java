package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose;

import android.content.Context;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.j;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import p1.t1;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class A {
    public static final Unit a(j.b bVar, b2.t tVar, int i5, int i11, p1.o oVar, int i12) {
        a(bVar, tVar, oVar, i5 | 1, i11);
        return Unit.f71706a;
    }

    public static final void a(@NotNull j.b imageResource, @Nullable b2.t tVar, @Nullable p1.o oVar, int i5, int i11) {
        int i12;
        Intrinsics.g(imageResource, "imageResource");
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(1666152349);
        if ((i11 & 1) != 0) {
            i12 = i5 | 6;
        } else if ((i5 & 6) == 0) {
            i12 = (tVar2.f(imageResource) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        int i13 = i11 & 2;
        if (i13 != 0) {
            i12 |= 48;
        } else if ((i5 & 48) == 0) {
            i12 |= tVar2.f(tVar) ? 32 : 16;
        }
        if ((i12 & 19) == 18 && tVar2.E()) {
            tVar2.V();
        } else {
            if (i13 != 0) {
                tVar = b2.r.f17024a;
            }
            com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.k.a(imageResource.e(), z2.k.f98095b, androidx.compose.foundation.layout.e.q(tVar, imageResource.f(), imageResource.d()), tVar2, 48);
        }
        b2.t tVar3 = tVar;
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new a0(imageResource, tVar3, i5, i11, 0);
        }
    }

    @NotNull
    public static final ImageView a(@NotNull Context context, @NotNull j.b imageResource) {
        Intrinsics.g(context, "context");
        Intrinsics.g(imageResource, "imageResource");
        ImageView imageView = new ImageView(context);
        imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        float f11 = context.getResources().getDisplayMetrics().density;
        imageView.setLayoutParams(new ViewGroup.LayoutParams((int) (imageResource.f() * f11), (int) (imageResource.d() * f11)));
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.k.a(imageView, imageResource.e());
        return imageView;
    }
}
