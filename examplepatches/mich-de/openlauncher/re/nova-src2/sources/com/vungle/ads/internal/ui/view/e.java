package com.vungle.ads.internal.ui.view;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.vungle.ads.internal.o1;
import com.vungle.ads.nativead.NativeVideoListener;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public class e extends RelativeLayout {

    /* renamed from: a, reason: collision with root package name */
    public final o1 f47619a;

    /* renamed from: b, reason: collision with root package name */
    public ImageView f47620b;

    /* renamed from: c, reason: collision with root package name */
    public NativeVideoListener f47621c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(Context context, o1 internal) {
        super(context);
        Intrinsics.g(context, "context");
        Intrinsics.g(internal, "internal");
        this.f47619a = internal;
        ImageView imageView = new ImageView(context);
        this.f47620b = imageView;
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams.addRule(13);
        imageView.setLayoutParams(layoutParams);
        imageView.setAdjustViewBounds(true);
        addView(imageView);
    }

    public void a(Context context) {
        Intrinsics.g(context, "context");
        ImageView imageView = this.f47620b;
        if (imageView != null) {
            imageView.setVisibility(0);
        }
        this.f47619a.c(this.f47620b);
        requestLayout();
    }

    @Nullable
    public final ImageView getImageView$vungle_ads_release() {
        return this.f47620b;
    }

    @NotNull
    public final o1 getInternal() {
        return this.f47619a;
    }

    @Nullable
    public final NativeVideoListener getNativeVideoListener() {
        return this.f47621c;
    }

    public final void setImageView$vungle_ads_release(@Nullable ImageView imageView) {
        this.f47620b = imageView;
    }

    public final void setNativeVideoListener(@Nullable NativeVideoListener nativeVideoListener) {
        this.f47621c = nativeVideoListener;
    }

    public void a() {
        removeAllViews();
        try {
            int i5 = Result.f71687b;
            ImageView imageView = this.f47620b;
            Drawable drawable = imageView != null ? imageView.getDrawable() : null;
            if (drawable instanceof BitmapDrawable) {
                Bitmap bitmap = ((BitmapDrawable) drawable).getBitmap();
                if (!bitmap.isRecycled()) {
                    bitmap.recycle();
                }
            }
            Unit unit = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            ResultKt.a(th2);
        }
        ImageView imageView2 = this.f47620b;
        if (imageView2 != null) {
            imageView2.setImageDrawable(null);
        }
    }
}
