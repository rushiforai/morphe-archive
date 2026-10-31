package com.android.launcher3.widget.picker.search;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import com.android.launcher3.ExtendedEditText;
import fb.b;
import fb.c;

/* loaded from: classes2.dex */
public class LauncherWidgetsSearchBar extends FrameLayout implements b {

    /* renamed from: a, reason: collision with root package name */
    public c f21375a;

    /* renamed from: b, reason: collision with root package name */
    public ExtendedEditText f21376b;

    /* renamed from: c, reason: collision with root package name */
    public ImageButton f21377c;

    public LauncherWidgetsSearchBar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.f21375a.f54581a.getClass();
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.f21376b = (ExtendedEditText) findViewById(2131429231);
        this.f21377c = (ImageButton) findViewById(2131429232);
    }
}
