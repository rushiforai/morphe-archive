package defpackage;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import com.drew.lang.RandomAccessStreamReader;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import java.io.IOException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class cre extends tqe {
    public static final PorterDuff.Mode j = PorterDuff.Mode.SRC_IN;
    public are b;
    public PorterDuffColorFilter c;
    public ColorFilter d;
    public boolean e;
    public boolean f;
    public final float[] g;
    public final Matrix h;
    public final Rect i;

    public cre() {
        this.f = true;
        this.g = new float[9];
        this.h = new Matrix();
        this.i = new Rect();
        are areVar = new are();
        areVar.c = null;
        areVar.d = j;
        areVar.b = new zqe();
        this.b = areVar;
    }

    public final PorterDuffColorFilter a(ColorStateList colorStateList, PorterDuff.Mode mode) {
        if (colorStateList == null || mode == null) {
            return null;
        }
        return new PorterDuffColorFilter(colorStateList.getColorForState(getState(), 0), mode);
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean canApplyTheme() {
        Drawable drawable = this.a;
        if (drawable == null) {
            return false;
        }
        drawable.canApplyTheme();
        return false;
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        Paint paint;
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.draw(canvas);
            return;
        }
        Rect rect = this.i;
        copyBounds(rect);
        if (rect.width() <= 0 || rect.height() <= 0) {
            return;
        }
        ColorFilter colorFilter = this.d;
        if (colorFilter == null) {
            colorFilter = this.c;
        }
        Matrix matrix = this.h;
        canvas.getMatrix(matrix);
        float[] fArr = this.g;
        matrix.getValues(fArr);
        float fAbs = Math.abs(fArr[0]);
        float fAbs2 = Math.abs(fArr[4]);
        float fAbs3 = Math.abs(fArr[1]);
        float fAbs4 = Math.abs(fArr[3]);
        if (fAbs3 != 0.0f || fAbs4 != 0.0f) {
            fAbs = 1.0f;
            fAbs2 = 1.0f;
        }
        int iWidth = (int) (rect.width() * fAbs);
        int iMin = Math.min(RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH, iWidth);
        int iMin2 = Math.min(RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH, (int) (rect.height() * fAbs2));
        if (iMin <= 0 || iMin2 <= 0) {
            return;
        }
        int iSave = canvas.save();
        canvas.translate(rect.left, rect.top);
        if (isAutoMirrored() && getLayoutDirection() == 1) {
            canvas.translate(rect.width(), 0.0f);
            canvas.scale(-1.0f, 1.0f);
        }
        rect.offsetTo(0, 0);
        are areVar = this.b;
        Bitmap bitmap = areVar.f;
        if (bitmap == null || iMin != bitmap.getWidth() || iMin2 != areVar.f.getHeight()) {
            areVar.f = Bitmap.createBitmap(iMin, iMin2, Bitmap.Config.ARGB_8888);
            areVar.k = true;
        }
        boolean z = this.f;
        are areVar2 = this.b;
        if (!z) {
            areVar2.f.eraseColor(0);
            Canvas canvas2 = new Canvas(areVar2.f);
            zqe zqeVar = areVar2.b;
            zqeVar.a(zqeVar.g, zqe.p, canvas2, iMin, iMin2);
        } else if (areVar2.k || areVar2.g != areVar2.c || areVar2.h != areVar2.d || areVar2.j != areVar2.e || areVar2.i != areVar2.b.getRootAlpha()) {
            are areVar3 = this.b;
            areVar3.f.eraseColor(0);
            Canvas canvas3 = new Canvas(areVar3.f);
            zqe zqeVar2 = areVar3.b;
            zqeVar2.a(zqeVar2.g, zqe.p, canvas3, iMin, iMin2);
            are areVar4 = this.b;
            areVar4.g = areVar4.c;
            areVar4.h = areVar4.d;
            areVar4.i = areVar4.b.getRootAlpha();
            areVar4.j = areVar4.e;
            areVar4.k = false;
        }
        are areVar5 = this.b;
        if (areVar5.b.getRootAlpha() >= 255 && colorFilter == null) {
            paint = null;
        } else {
            if (areVar5.l == null) {
                Paint paint2 = new Paint();
                areVar5.l = paint2;
                paint2.setFilterBitmap(true);
            }
            areVar5.l.setAlpha(areVar5.b.getRootAlpha());
            areVar5.l.setColorFilter(colorFilter);
            paint = areVar5.l;
        }
        canvas.drawBitmap(areVar5.f, (Rect) null, rect, paint);
        canvas.restoreToCount(iSave);
    }

    @Override // android.graphics.drawable.Drawable
    public final int getAlpha() {
        Drawable drawable = this.a;
        return drawable != null ? drawable.getAlpha() : this.b.b.getRootAlpha();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getChangingConfigurations() {
        Drawable drawable = this.a;
        if (drawable != null) {
            return drawable.getChangingConfigurations();
        }
        return this.b.getChangingConfigurations() | super.getChangingConfigurations();
    }

    @Override // android.graphics.drawable.Drawable
    public final ColorFilter getColorFilter() {
        Drawable drawable = this.a;
        return drawable != null ? drawable.getColorFilter() : this.d;
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        if (this.a != null && Build.VERSION.SDK_INT >= 24) {
            return new bre(this.a.getConstantState());
        }
        this.b.a = getChangingConfigurations();
        return this.b;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        Drawable drawable = this.a;
        return drawable != null ? drawable.getIntrinsicHeight() : (int) this.b.b.i;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        Drawable drawable = this.a;
        return drawable != null ? drawable.getIntrinsicWidth() : (int) this.b.b.h;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        Drawable drawable = this.a;
        if (drawable != null) {
            return drawable.getOpacity();
        }
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final void invalidateSelf() {
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.invalidateSelf();
        } else {
            super.invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isAutoMirrored() {
        Drawable drawable = this.a;
        return drawable != null ? drawable.isAutoMirrored() : this.b.e;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isStateful() {
        Drawable drawable = this.a;
        if (drawable != null) {
            return drawable.isStateful();
        }
        if (super.isStateful()) {
            return true;
        }
        are areVar = this.b;
        if (areVar == null) {
            return false;
        }
        zqe zqeVar = areVar.b;
        Boolean boolValueOf = zqeVar.n;
        if (boolValueOf == null) {
            boolValueOf = Boolean.valueOf(zqeVar.g.a());
            zqeVar.n = boolValueOf;
        }
        if (boolValueOf.booleanValue()) {
            return true;
        }
        ColorStateList colorStateList = this.b.c;
        return colorStateList != null && colorStateList.isStateful();
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable mutate() {
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.mutate();
            return this;
        }
        if (!this.e && super.mutate() == this) {
            are areVar = this.b;
            are areVar2 = new are();
            areVar2.c = null;
            areVar2.d = j;
            if (areVar != null) {
                areVar2.a = areVar.a;
                zqe zqeVar = new zqe(areVar.b);
                areVar2.b = zqeVar;
                if (areVar.b.e != null) {
                    zqeVar.e = new Paint(areVar.b.e);
                }
                if (areVar.b.d != null) {
                    areVar2.b.d = new Paint(areVar.b.d);
                }
                areVar2.c = areVar.c;
                areVar2.d = areVar.d;
                areVar2.e = areVar.e;
            }
            this.b = areVar2;
            this.e = true;
        }
        return this;
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.setBounds(rect);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onStateChange(int[] iArr) {
        boolean z;
        PorterDuff.Mode mode;
        Drawable drawable = this.a;
        if (drawable != null) {
            return drawable.setState(iArr);
        }
        are areVar = this.b;
        ColorStateList colorStateList = areVar.c;
        if (colorStateList == null || (mode = areVar.d) == null) {
            z = false;
        } else {
            this.c = a(colorStateList, mode);
            invalidateSelf();
            z = true;
        }
        zqe zqeVar = areVar.b;
        Boolean boolValueOf = zqeVar.n;
        if (boolValueOf == null) {
            boolValueOf = Boolean.valueOf(zqeVar.g.a());
            zqeVar.n = boolValueOf;
        }
        if (boolValueOf.booleanValue()) {
            boolean zB = areVar.b.g.b(iArr);
            areVar.k |= zB;
            if (zB) {
                invalidateSelf();
                return true;
            }
        }
        return z;
    }

    @Override // android.graphics.drawable.Drawable
    public final void scheduleSelf(Runnable runnable, long j2) {
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.scheduleSelf(runnable, j2);
        } else {
            super.scheduleSelf(runnable, j2);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i) {
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.setAlpha(i);
        } else if (this.b.b.getRootAlpha() != i) {
            this.b.b.setRootAlpha(i);
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAutoMirrored(boolean z) {
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.setAutoMirrored(z);
        } else {
            this.b.e = z;
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.setColorFilter(colorFilter);
        } else {
            this.d = colorFilter;
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTint(int i) {
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.setTint(i);
        } else {
            setTintList(ColorStateList.valueOf(i));
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTintList(ColorStateList colorStateList) {
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.setTintList(colorStateList);
            return;
        }
        are areVar = this.b;
        if (areVar.c != colorStateList) {
            areVar.c = colorStateList;
            this.c = a(colorStateList, areVar.d);
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTintMode(PorterDuff.Mode mode) {
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.setTintMode(mode);
            return;
        }
        are areVar = this.b;
        if (areVar.d != mode) {
            areVar.d = mode;
            this.c = a(areVar.c, mode);
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean setVisible(boolean z, boolean z2) {
        Drawable drawable = this.a;
        return drawable != null ? drawable.setVisible(z, z2) : super.setVisible(z, z2);
    }

    @Override // android.graphics.drawable.Drawable
    public final void unscheduleSelf(Runnable runnable) {
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.unscheduleSelf(runnable);
        } else {
            super.unscheduleSelf(runnable);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Resources.Theme theme) {
        int i;
        int i2;
        int i3;
        int i4;
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.inflate(resources, xmlPullParser, attributeSet, theme);
            return;
        }
        are areVar = this.b;
        areVar.b = new zqe();
        TypedArray typedArrayW = dl7.w(resources, theme, attributeSet, g01.a);
        are areVar2 = this.b;
        zqe zqeVar = areVar2.b;
        int i5 = !dl7.t(xmlPullParser, "tintMode") ? -1 : typedArrayW.getInt(6, -1);
        PorterDuff.Mode mode = PorterDuff.Mode.SRC_IN;
        int i6 = 3;
        if (i5 == 3) {
            mode = PorterDuff.Mode.SRC_OVER;
        } else if (i5 != 5) {
            if (i5 != 9) {
                switch (i5) {
                    case 14:
                        mode = PorterDuff.Mode.MULTIPLY;
                        break;
                    case 15:
                        mode = PorterDuff.Mode.SCREEN;
                        break;
                    case 16:
                        mode = PorterDuff.Mode.ADD;
                        break;
                }
            } else {
                mode = PorterDuff.Mode.SRC_ATOP;
            }
        }
        areVar2.d = mode;
        ColorStateList colorStateListO = dl7.o(typedArrayW, xmlPullParser, theme);
        if (colorStateListO != null) {
            areVar2.c = colorStateListO;
        }
        boolean z = areVar2.e;
        if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "autoMirrored") != null) {
            z = typedArrayW.getBoolean(5, z);
        }
        areVar2.e = z;
        float f = zqeVar.j;
        if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "viewportWidth") != null) {
            f = typedArrayW.getFloat(7, f);
        }
        zqeVar.j = f;
        float f2 = zqeVar.k;
        if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "viewportHeight") != null) {
            f2 = typedArrayW.getFloat(8, f2);
        }
        zqeVar.k = f2;
        if (zqeVar.j <= 0.0f) {
            throw new XmlPullParserException(typedArrayW.getPositionDescription() + "<vector> tag requires viewportWidth > 0");
        }
        if (f2 <= 0.0f) {
            throw new XmlPullParserException(typedArrayW.getPositionDescription() + "<vector> tag requires viewportHeight > 0");
        }
        zqeVar.h = typedArrayW.getDimension(3, zqeVar.h);
        int i7 = 2;
        float dimension = typedArrayW.getDimension(2, zqeVar.i);
        zqeVar.i = dimension;
        if (zqeVar.h <= 0.0f) {
            throw new XmlPullParserException(typedArrayW.getPositionDescription() + MaAxRJinch.fdvtXqFJmSCXbXe);
        }
        if (dimension <= 0.0f) {
            throw new XmlPullParserException(typedArrayW.getPositionDescription() + "<vector> tag requires height > 0");
        }
        float alpha = zqeVar.getAlpha();
        if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "alpha") != null) {
            alpha = typedArrayW.getFloat(4, alpha);
        }
        zqeVar.setAlpha(alpha);
        String string = typedArrayW.getString(0);
        if (string != null) {
            zqeVar.m = string;
            zqeVar.o.put(string, zqeVar);
        }
        typedArrayW.recycle();
        areVar.a = getChangingConfigurations();
        int i8 = 1;
        areVar.k = true;
        are areVar3 = this.b;
        zqe zqeVar2 = areVar3.b;
        ArrayDeque arrayDeque = new ArrayDeque();
        wqe wqeVar = zqeVar2.g;
        y70 y70Var = zqeVar2.o;
        arrayDeque.push(wqeVar);
        int eventType = xmlPullParser.getEventType();
        int depth = xmlPullParser.getDepth() + 1;
        boolean z2 = true;
        while (eventType != i8 && (xmlPullParser.getDepth() >= depth || eventType != i6)) {
            if (eventType == i7) {
                String name = xmlPullParser.getName();
                wqe wqeVar2 = (wqe) arrayDeque.peek();
                if (wqeVar2 != null) {
                    ArrayList arrayList = wqeVar2.b;
                    i = depth;
                    if ("path".equals(name)) {
                        vqe vqeVar = new vqe();
                        vqeVar.e = 0.0f;
                        vqeVar.g = 1.0f;
                        vqeVar.h = 1.0f;
                        vqeVar.i = 0.0f;
                        vqeVar.j = 1.0f;
                        vqeVar.k = 0.0f;
                        Paint.Cap cap = Paint.Cap.BUTT;
                        vqeVar.l = cap;
                        Paint.Join join = Paint.Join.MITER;
                        vqeVar.m = join;
                        vqeVar.n = 4.0f;
                        TypedArray typedArrayW2 = dl7.w(resources, theme, attributeSet, g01.c);
                        if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "pathData") != null) {
                            String string2 = typedArrayW2.getString(0);
                            if (string2 != null) {
                                vqeVar.b = string2;
                            }
                            String string3 = typedArrayW2.getString(2);
                            if (string3 != null) {
                                vqeVar.a = wo7.m(string3);
                            }
                            vqeVar.f = dl7.p(typedArrayW2, xmlPullParser, theme, "fillColor", 1);
                            float f3 = vqeVar.h;
                            if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "fillAlpha") != null) {
                                f3 = typedArrayW2.getFloat(12, f3);
                            }
                            vqeVar.h = f3;
                            int i9 = xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "strokeLineCap") != null ? typedArrayW2.getInt(8, -1) : -1;
                            vqeVar.l = i9 != 0 ? i9 != 1 ? i9 != 2 ? vqeVar.l : Paint.Cap.SQUARE : Paint.Cap.ROUND : cap;
                            int i10 = xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "strokeLineJoin") != null ? typedArrayW2.getInt(9, -1) : -1;
                            vqeVar.m = i10 != 0 ? i10 != 1 ? i10 != 2 ? vqeVar.m : Paint.Join.BEVEL : Paint.Join.ROUND : join;
                            float f4 = vqeVar.n;
                            if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "strokeMiterLimit") != null) {
                                f4 = typedArrayW2.getFloat(10, f4);
                            }
                            vqeVar.n = f4;
                            vqeVar.d = dl7.p(typedArrayW2, xmlPullParser, theme, "strokeColor", 3);
                            float f5 = vqeVar.g;
                            if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "strokeAlpha") != null) {
                                f5 = typedArrayW2.getFloat(11, f5);
                            }
                            vqeVar.g = f5;
                            float f6 = vqeVar.e;
                            if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "strokeWidth") != null) {
                                f6 = typedArrayW2.getFloat(4, f6);
                            }
                            vqeVar.e = f6;
                            float f7 = vqeVar.j;
                            if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "trimPathEnd") != null) {
                                f7 = typedArrayW2.getFloat(6, f7);
                            }
                            vqeVar.j = f7;
                            float f8 = vqeVar.k;
                            if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "trimPathOffset") != null) {
                                f8 = typedArrayW2.getFloat(7, f8);
                            }
                            vqeVar.k = f8;
                            float f9 = vqeVar.i;
                            if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "trimPathStart") != null) {
                                f9 = typedArrayW2.getFloat(5, f9);
                            }
                            vqeVar.i = f9;
                            int i11 = vqeVar.c;
                            if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "fillType") != null) {
                                i11 = typedArrayW2.getInt(13, i11);
                            }
                            vqeVar.c = i11;
                        }
                        typedArrayW2.recycle();
                        arrayList.add(vqeVar);
                        if (vqeVar.getPathName() != null) {
                            y70Var.put(vqeVar.getPathName(), vqeVar);
                        }
                        areVar3.a = areVar3.a;
                        i4 = 1;
                        z2 = false;
                    } else {
                        if ("clip-path".equals(name)) {
                            uqe uqeVar = new uqe();
                            if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "pathData") != null) {
                                TypedArray typedArrayW3 = dl7.w(resources, theme, attributeSet, g01.d);
                                String string4 = typedArrayW3.getString(0);
                                if (string4 != null) {
                                    uqeVar.b = string4;
                                }
                                String string5 = typedArrayW3.getString(1);
                                if (string5 != null) {
                                    uqeVar.a = wo7.m(string5);
                                }
                                uqeVar.c = !dl7.t(xmlPullParser, "fillType") ? 0 : typedArrayW3.getInt(2, 0);
                                typedArrayW3.recycle();
                            }
                            arrayList.add(uqeVar);
                            if (uqeVar.getPathName() != null) {
                                y70Var.put(uqeVar.getPathName(), uqeVar);
                            }
                            areVar3.a = areVar3.a;
                        } else if ("group".equals(name)) {
                            wqe wqeVar3 = new wqe();
                            TypedArray typedArrayW4 = dl7.w(resources, theme, attributeSet, g01.b);
                            float f10 = wqeVar3.c;
                            if (dl7.t(xmlPullParser, "rotation")) {
                                f10 = typedArrayW4.getFloat(5, f10);
                            }
                            wqeVar3.c = f10;
                            i4 = 1;
                            wqeVar3.d = typedArrayW4.getFloat(1, wqeVar3.d);
                            wqeVar3.e = typedArrayW4.getFloat(2, wqeVar3.e);
                            float f11 = wqeVar3.f;
                            if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "scaleX") != null) {
                                f11 = typedArrayW4.getFloat(3, f11);
                            }
                            wqeVar3.f = f11;
                            float f12 = wqeVar3.g;
                            if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "scaleY") != null) {
                                f12 = typedArrayW4.getFloat(4, f12);
                            }
                            wqeVar3.g = f12;
                            float f13 = wqeVar3.h;
                            if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "translateX") != null) {
                                f13 = typedArrayW4.getFloat(6, f13);
                            }
                            wqeVar3.h = f13;
                            float f14 = wqeVar3.i;
                            if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "translateY") != null) {
                                f14 = typedArrayW4.getFloat(7, f14);
                            }
                            wqeVar3.i = f14;
                            String string6 = typedArrayW4.getString(0);
                            if (string6 != null) {
                                wqeVar3.k = string6;
                            }
                            wqeVar3.c();
                            typedArrayW4.recycle();
                            arrayList.add(wqeVar3);
                            arrayDeque.push(wqeVar3);
                            if (wqeVar3.getGroupName() != null) {
                                y70Var.put(wqeVar3.getGroupName(), wqeVar3);
                            }
                            areVar3.a = areVar3.a;
                        }
                        i4 = 1;
                    }
                } else {
                    i = depth;
                    i4 = 1;
                }
                i3 = i4;
                i2 = 3;
            } else {
                i = depth;
                i2 = i6;
                i3 = 1;
                if (eventType == i2 && "group".equals(xmlPullParser.getName())) {
                    arrayDeque.pop();
                }
            }
            eventType = xmlPullParser.next();
            i6 = i2;
            i8 = i3;
            depth = i;
            i7 = 2;
        }
        if (z2) {
            throw new XmlPullParserException("no path defined");
        }
        this.c = a(areVar.c, areVar.d);
    }

    public cre(are areVar) {
        this.f = true;
        this.g = new float[9];
        this.h = new Matrix();
        this.i = new Rect();
        this.b = areVar;
        this.c = a(areVar.c, areVar.d);
    }

    @Override // android.graphics.drawable.Drawable
    public final void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet) throws XmlPullParserException, IOException {
        Drawable drawable = this.a;
        if (drawable != null) {
            drawable.inflate(resources, xmlPullParser, attributeSet);
        } else {
            inflate(resources, xmlPullParser, attributeSet, null);
        }
    }
}
