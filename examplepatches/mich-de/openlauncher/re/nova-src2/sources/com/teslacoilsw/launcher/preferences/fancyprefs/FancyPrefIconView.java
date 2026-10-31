package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import d00.t;
import dy.k;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmOverloads;
import lx.d;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefIconView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefView;", b.f42142b, "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class FancyPrefIconView extends FancyPrefView<Unit> {
    public static final /* synthetic */ int M = 0;
    public final Object K;
    public final ImageView L;

    @JvmOverloads
    public FancyPrefIconView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 4);
    }

    public final void K(Drawable drawable) {
        this.L.setImageDrawable(drawable);
    }

    public final void L(int i5) {
        this.L.setImageResource(i5);
    }

    /* JADX WARN: Type inference failed for: r2v1, types: [java.lang.Object, kotlin.Lazy] */
    @Override // android.view.View
    public final void setEnabled(boolean z11) {
        super.setEnabled(z11);
        this.L.setImageAlpha(z11 ? 255 : ((Number) this.K.getValue()).intValue());
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public FancyPrefIconView(Context context, AttributeSet attributeSet, int i5) {
        attributeSet = (i5 & 2) != 0 ? null : attributeSet;
        super(context, attributeSet, 0);
        t tVar = new t(this, 23);
        k kVar = d.f75158a;
        this.K = LazyKt.b(LazyThreadSafetyMode.f71681c, tVar);
        F(2131624142);
        ImageView imageView = (ImageView) findViewById(2131429202);
        this.L = imageView;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80166q);
        try {
            Drawable drawable = typedArrayObtainStyledAttributes.getDrawable(0);
            if (drawable != null) {
                imageView.setImageDrawable(drawable);
            }
            int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(2, 0);
            if (dimensionPixelSize != 0) {
                ViewGroup.LayoutParams layoutParams = imageView.getLayoutParams();
                layoutParams.width = dimensionPixelSize;
                layoutParams.height = dimensionPixelSize;
            }
            if (typedArrayObtainStyledAttributes.hasValue(3)) {
                imageView.setImageTintList(typedArrayObtainStyledAttributes.getColorStateList(3));
            }
            typedArrayObtainStyledAttributes.recycle();
        } catch (Throwable th2) {
            typedArrayObtainStyledAttributes.recycle();
            throw th2;
        }
    }
}
