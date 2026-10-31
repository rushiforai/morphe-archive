package com.teslacoilsw.launcher.widget;

import ab.o;
import android.content.Context;
import android.util.AttributeSet;
import android.view.ViewGroup;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/widget/Rotate90ParentView;", "Landroid/view/ViewGroup;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class Rotate90ParentView extends ViewGroup {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f46483a;

    @JvmOverloads
    public Rotate90ParentView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(false, context, 12);
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        if (this.f46483a) {
            getChildAt(0).setRotation(-90.0f);
        } else {
            getChildAt(0).setRotation(90.0f);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int width = getWidth() / 2;
        int height = getHeight() / 2;
        int measuredWidth = getChildAt(0).getMeasuredWidth();
        int measuredHeight = getChildAt(0).getMeasuredHeight();
        int i14 = measuredWidth / 2;
        int i15 = measuredHeight / 2;
        getChildAt(0).layout(width - i14, height - i15, width + (measuredWidth - i14), height + (measuredHeight - i15));
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        getChildAt(0).measure(i11, i5);
        setMeasuredDimension(getChildAt(0).getMeasuredHeight(), getChildAt(0).getMeasuredWidth());
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Rotate90ParentView(boolean z11, Context context, int i5) {
        super(context);
        z11 = (i5 & 4) != 0 ? true : z11;
        this.f46483a = z11;
        setClipChildren(false);
    }

    public Rotate90ParentView(o oVar, boolean z11) {
        this(z11, oVar.getContext(), 10);
        addView(oVar);
        if (z11) {
            oVar.setRotation(-90.0f);
        } else {
            oVar.setRotation(90.0f);
        }
    }
}
