package com.moloco.sdk.internal.services;

import android.graphics.text.LineBreakConfig;
import android.text.BoringLayout;
import android.text.Layout;
import android.text.TextPaint;
import android.text.TextUtils;

/* loaded from: classes.dex */
public abstract /* synthetic */ class a0 {
    public static /* synthetic */ LineBreakConfig.Builder b() {
        return new LineBreakConfig.Builder();
    }

    public static /* synthetic */ BoringLayout f(CharSequence charSequence, TextPaint textPaint, int i5, Layout.Alignment alignment, BoringLayout.Metrics metrics, boolean z11, TextUtils.TruncateAt truncateAt, int i11) {
        return new BoringLayout(charSequence, textPaint, i5, alignment, 1.0f, 0.0f, metrics, z11, truncateAt, i11, true);
    }
}
