package com.android.launcher3.graphics;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import com.android.launcher3.InsettableFrameLayout;

/* loaded from: classes2.dex */
public class LauncherPreviewRenderer$LauncherPreviewLayout extends InsettableFrameLayout {
    public LauncherPreviewRenderer$LauncherPreviewLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        return true;
    }
}
