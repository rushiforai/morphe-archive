package c3;

import android.graphics.Outline;
import android.view.View;
import android.view.ViewOutlineProvider;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class o3 extends ViewOutlineProvider {
    @Override // android.view.ViewOutlineProvider
    public final void getOutline(View view, Outline outline) {
        Intrinsics.e(view, "null cannot be cast to non-null type androidx.compose.ui.platform.ViewLayer");
        b.c0.y(view);
        throw null;
    }
}
