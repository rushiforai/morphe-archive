package com.teslacoilsw.launcher.search;

import android.content.Context;
import android.graphics.Point;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.LinearLayout;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/search/TouchPositionLinearLayout;", "Landroid/widget/LinearLayout;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class TouchPositionLinearLayout extends LinearLayout {

    /* renamed from: a, reason: collision with root package name */
    public final Point f46234a;

    @JvmOverloads
    public TouchPositionLinearLayout(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.f46234a = new Point();
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int x11 = (int) motionEvent.getX();
        Point point = this.f46234a;
        point.x = x11;
        point.y = (int) motionEvent.getY();
        return super.onInterceptTouchEvent(motionEvent);
    }
}
