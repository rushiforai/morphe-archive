package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Space;
import android.widget.TextView;
import com.moloco.sdk.R;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.math.MathKt;
import org.jetbrains.annotations.NotNull;

@SuppressLint({"ViewConstructor"})
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class y extends LinearLayout {

    /* renamed from: a, reason: collision with root package name */
    public static final int f40126a = 0;

    public static final class a extends ImageView {
        public a(Context context) {
            super(context);
        }

        @Override // android.widget.ImageView, android.view.View
        public void onDraw(Canvas canvas) {
            Intrinsics.g(canvas, "canvas");
            canvas.save();
            canvas.clipRect(0.0f, 0.0f, getWidth() / 2.0f, getHeight());
            super.onDraw(canvas);
            canvas.restore();
        }
    }

    public /* synthetic */ y(Context context, float f11, int i5, int i11, int i12, int i13, float f12, int i14, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i14 & 2) != 0 ? 4.8f : f11, (i14 & 4) != 0 ? 5 : i5, (i14 & 8) != 0 ? 12 : i11, (i14 & 16) != 0 ? -1 : i12, (i14 & 32) != 0 ? -7829368 : i13, (i14 & 64) != 0 ? 9.0f : f12);
    }

    public final ImageView a(Context context, int i5, int i11) {
        ImageView imageView = new ImageView(context);
        imageView.setLayoutParams(new LinearLayout.LayoutParams(i5, i5));
        imageView.setImageResource(R.drawable.moloco_star);
        imageView.setImageTintList(ColorStateList.valueOf(i11));
        return imageView;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y(@NotNull Context context, float f11, int i5, int i11, int i12, int i13, float f12) {
        super(context);
        Intrinsics.g(context, "context");
        setOrientation(0);
        setGravity(16);
        int iA = c.a(i11, context);
        int iFloor = (int) Math.floor(f11);
        int iB = MathKt.b(10.0f * f11) - (iFloor * 10);
        if (1 <= i5) {
            int i14 = 1;
            while (true) {
                if (i14 <= iFloor) {
                    addView(a(context, iA, i12));
                } else if (i14 != iFloor + 1 || 1 > iB || iB >= 10) {
                    addView(a(context, iA, i13));
                } else {
                    addView(a(context, iA, i12, i13));
                }
                if (i14 == i5) {
                    break;
                } else {
                    i14++;
                }
            }
        }
        View space = new Space(context);
        space.setLayoutParams(new LinearLayout.LayoutParams(c.a(4, context), 0));
        addView(space);
        TextView textView = new TextView(context);
        textView.setText(String.valueOf(f11));
        textView.setTextColor(-1);
        textView.setTextSize(f12);
        textView.setMaxLines(1);
        addView(textView);
    }

    public final FrameLayout a(Context context, int i5, int i11, int i12) {
        FrameLayout frameLayout = new FrameLayout(context);
        frameLayout.setLayoutParams(new LinearLayout.LayoutParams(i5, i5));
        ImageView imageView = new ImageView(context);
        imageView.setLayoutParams(new FrameLayout.LayoutParams(i5, i5));
        imageView.setImageResource(R.drawable.moloco_star);
        imageView.setImageTintList(ColorStateList.valueOf(i12));
        frameLayout.addView(imageView);
        a aVar = new a(context);
        aVar.setLayoutParams(new FrameLayout.LayoutParams(i5, i5));
        aVar.setImageResource(R.drawable.moloco_star);
        aVar.setImageTintList(ColorStateList.valueOf(i11));
        frameLayout.addView(aVar);
        return frameLayout;
    }
}
