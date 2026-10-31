package com.android.launcher3.graphics;

import android.annotation.TargetApi;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Picture;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import androidx.annotation.Keep;
import io.sentry.k2;
import java.io.IOException;
import o9.u2;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import z9.f;

@TargetApi(26)
/* loaded from: classes2.dex */
public class ShadowDrawable extends Drawable {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f21146c = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Paint f21147a;

    /* renamed from: b, reason: collision with root package name */
    public final f f21148b;

    public /* synthetic */ ShadowDrawable(f fVar, int i5) {
        this(fVar);
    }

    @Override // android.graphics.drawable.Drawable
    public final void applyTheme(Resources.Theme theme) {
        TypedArray typedArrayObtainStyledAttributes = theme.obtainStyledAttributes(new int[]{2130969385});
        boolean z11 = typedArrayObtainStyledAttributes.getBoolean(0, false);
        typedArrayObtainStyledAttributes.recycle();
        f fVar = this.f21148b;
        if (fVar.f98379g != z11) {
            fVar.f98379g = z11;
            fVar.f98380h = null;
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean canApplyTheme() {
        this.f21148b.getClass();
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        Bitmap bitmapCreateBitmap;
        Rect bounds = getBounds();
        if (bounds.isEmpty()) {
            return;
        }
        f fVar = this.f21148b;
        if (fVar.f98380h == null) {
            Drawable drawableMutate = fVar.f98381i.newDrawable().mutate();
            int i5 = fVar.f98377e;
            drawableMutate.setBounds(i5, i5, fVar.f98374b - i5, fVar.f98375c - i5);
            drawableMutate.setTint(fVar.f98379g ? fVar.f98378f : -1);
            if (fVar.f98379g) {
                int i11 = fVar.f98374b;
                int i12 = fVar.f98375c;
                if (aa.f.No) {
                    Picture picture = new Picture();
                    drawableMutate.draw(picture.beginRecording(i11, i12));
                    picture.endRecording();
                    bitmapCreateBitmap = Bitmap.createBitmap(picture);
                } else {
                    bitmapCreateBitmap = Bitmap.createBitmap(i11, i12, Bitmap.Config.ARGB_8888);
                    drawableMutate.draw(new Canvas(bitmapCreateBitmap));
                }
                fVar.f98380h = bitmapCreateBitmap;
            } else {
                Paint paint = new Paint(3);
                paint.setMaskFilter(new BlurMaskFilter(fVar.f98377e, BlurMaskFilter.Blur.NORMAL));
                int[] iArr = new int[2];
                Bitmap bitmapCreateBitmap2 = Bitmap.createBitmap(fVar.f98374b, fVar.f98375c, Bitmap.Config.ARGB_8888);
                drawableMutate.draw(new Canvas(bitmapCreateBitmap2));
                Bitmap bitmapExtractAlpha = bitmapCreateBitmap2.extractAlpha(paint, iArr);
                paint.setMaskFilter(null);
                paint.setColor(fVar.f98376d);
                fVar.f98380h = aa.f.a(fVar.f98374b, fVar.f98375c, new k2(bitmapExtractAlpha, iArr, paint, drawableMutate));
            }
        }
        canvas.drawBitmap(fVar.f98380h, (Rect) null, bounds, this.f21147a);
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        return this.f21148b;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        return this.f21148b.f98375c;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        return this.f21148b.f98374b;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Resources.Theme theme) throws XmlPullParserException, IOException {
        f fVar = this.f21148b;
        super.inflate(resources, xmlPullParser, attributeSet, theme);
        int[] iArr = u2.M;
        TypedArray typedArrayObtainAttributes = theme == null ? resources.obtainAttributes(attributeSet, iArr) : theme.obtainStyledAttributes(attributeSet, iArr, 0, 0);
        try {
            Drawable drawable = typedArrayObtainAttributes.getDrawable(0);
            if (drawable == null) {
                throw new XmlPullParserException("missing src attribute");
            }
            fVar.f98376d = typedArrayObtainAttributes.getColor(1, -16777216);
            fVar.f98377e = typedArrayObtainAttributes.getDimensionPixelSize(2, 0);
            fVar.f98378f = typedArrayObtainAttributes.getColor(3, -16777216);
            fVar.f98375c = (fVar.f98377e * 2) + drawable.getIntrinsicHeight();
            fVar.f98374b = (fVar.f98377e * 2) + drawable.getIntrinsicWidth();
            fVar.f98373a = drawable.getChangingConfigurations();
            fVar.f98381i = drawable.getConstantState();
        } finally {
            typedArrayObtainAttributes.recycle();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        this.f21147a.setAlpha(i5);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        this.f21147a.setColorFilter(colorFilter);
        invalidateSelf();
    }

    @Keep
    public ShadowDrawable() {
        this(new f());
    }

    private ShadowDrawable(f fVar) {
        this.f21147a = new Paint(3);
        this.f21148b = fVar;
    }
}
