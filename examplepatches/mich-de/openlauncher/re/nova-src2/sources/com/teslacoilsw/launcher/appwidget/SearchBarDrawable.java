package com.teslacoilsw.launcher.appwidget;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.drawable.Drawable;
import androidx.annotation.Keep;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import s9.k;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0002\b\t\b\u0002\u0018\u00002\u00020\u0001R*\u0010\n\u001a\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00028G@GX\u0086\u000e¢\u0006\u0012\n\u0004\b\u0004\u0010\u0005\u001a\u0004\b\u0006\u0010\u0007\"\u0004\b\b\u0010\t¨\u0006\u000b"}, d2 = {"Lcom/teslacoilsw/launcher/appwidget/SearchBarDrawable;", "Landroid/graphics/drawable/Drawable;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "x", "b", "F", "getProgress", "()F", "setProgress", "(F)V", "progress", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
final class SearchBarDrawable extends Drawable {

    /* renamed from: a, reason: collision with root package name */
    public float f45703a;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    public float progress;

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        float f11 = this.f45703a;
        canvas.drawRoundRect(null, f11, f11, null);
    }

    @Override // android.graphics.drawable.Drawable
    public final int getAlpha() {
        throw null;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final void getOutline(Outline outline) {
        throw null;
    }

    @Keep
    public final float getProgress() {
        return this.progress;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        throw null;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setBounds(int i5, int i11, int i12, int i13) {
        super.setBounds(i5, i11, i12, i13);
        setProgress(this.progress);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        throw null;
    }

    @Keep
    public final void setProgress(float f11) {
        float fD0 = kotlin.ranges.a.d0(f11, 0.0f, 1.0f);
        this.progress = fD0;
        float f12 = 1.0f - fD0;
        float f13 = 0;
        this.f45703a = (fD0 * f13) + (f12 * f13);
        Object objEvaluate = k.f86807v.evaluate(k.f86796i.getInterpolation(f12), 0, 0);
        Intrinsics.e(objEvaluate, "null cannot be cast to non-null type kotlin.Int");
        throw null;
    }
}
