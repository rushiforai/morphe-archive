package com.fyber.inneractive.sdk.util;

import android.graphics.Insets;
import android.view.View;
import android.view.WindowInsets;

/* loaded from: classes3.dex */
public final class m implements View.OnApplyWindowInsetsListener {
    @Override // android.view.View.OnApplyWindowInsetsListener
    public final WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
        Insets insets = windowInsets.getInsets(WindowInsets.Type.displayCutout());
        int iA = o.a();
        if (iA == 1) {
            view.setPadding(insets.left, 0, 0, 0);
            return windowInsets;
        }
        if (iA == 2) {
            view.setPadding(0, 0, 0, insets.bottom);
            return windowInsets;
        }
        if (iA != 3) {
            view.setPadding(0, insets.top, 0, 0);
            return windowInsets;
        }
        view.setPadding(0, 0, insets.right, 0);
        return windowInsets;
    }
}
