package j7;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import java.io.IOException;
import java.util.ArrayDeque;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import ps.e0;

/* loaded from: classes.dex */
public final class o extends f {

    /* renamed from: j, reason: collision with root package name */
    public static final PorterDuff.Mode f69139j = PorterDuff.Mode.SRC_IN;

    /* renamed from: b, reason: collision with root package name */
    public m f69140b;

    /* renamed from: c, reason: collision with root package name */
    public PorterDuffColorFilter f69141c;

    /* renamed from: d, reason: collision with root package name */
    public ColorFilter f69142d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f69143e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f69144f;

    /* renamed from: g, reason: collision with root package name */
    public final float[] f69145g;

    /* renamed from: h, reason: collision with root package name */
    public final Matrix f69146h;

    /* renamed from: i, reason: collision with root package name */
    public final Rect f69147i;

    public o() {
        this.f69144f = true;
        this.f69145g = new float[9];
        this.f69146h = new Matrix();
        this.f69147i = new Rect();
        this.f69140b = new m();
    }

    public final PorterDuffColorFilter a(ColorStateList colorStateList, PorterDuff.Mode mode) {
        if (colorStateList == null || mode == null) {
            return null;
        }
        return new PorterDuffColorFilter(colorStateList.getColorForState(getState(), 0), mode);
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean canApplyTheme() {
        Drawable drawable = this.f69087a;
        if (drawable == null) {
            return false;
        }
        e0.i(drawable);
        return false;
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            drawable.draw(canvas);
            return;
        }
        Rect rect = this.f69147i;
        copyBounds(rect);
        if (rect.width() <= 0 || rect.height() <= 0) {
            return;
        }
        ColorFilter colorFilter = this.f69142d;
        if (colorFilter == null) {
            colorFilter = this.f69141c;
        }
        Matrix matrix = this.f69146h;
        canvas.getMatrix(matrix);
        float[] fArr = this.f69145g;
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
        int iMin = Math.min(2048, iWidth);
        int iMin2 = Math.min(2048, (int) (rect.height() * fAbs2));
        if (iMin <= 0 || iMin2 <= 0) {
            return;
        }
        int iSave = canvas.save();
        canvas.translate(rect.left, rect.top);
        if (isAutoMirrored() && e0.p(this) == 1) {
            canvas.translate(rect.width(), 0.0f);
            canvas.scale(-1.0f, 1.0f);
        }
        rect.offsetTo(0, 0);
        this.f69140b.b(iMin, iMin2);
        if (!this.f69144f) {
            this.f69140b.g(iMin, iMin2);
        } else if (!this.f69140b.a()) {
            this.f69140b.g(iMin, iMin2);
            this.f69140b.f();
        }
        this.f69140b.c(canvas, colorFilter, rect);
        canvas.restoreToCount(iSave);
    }

    @Override // android.graphics.drawable.Drawable
    public final int getAlpha() {
        Drawable drawable = this.f69087a;
        return drawable != null ? e0.m(drawable) : this.f69140b.f69127b.getRootAlpha();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getChangingConfigurations() {
        Drawable drawable = this.f69087a;
        return drawable != null ? drawable.getChangingConfigurations() : super.getChangingConfigurations() | this.f69140b.getChangingConfigurations();
    }

    @Override // android.graphics.drawable.Drawable
    public final ColorFilter getColorFilter() {
        Drawable drawable = this.f69087a;
        return drawable != null ? e0.n(drawable) : this.f69142d;
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        if (this.f69087a != null) {
            return new n(this.f69087a.getConstantState());
        }
        this.f69140b.f69126a = getChangingConfigurations();
        return this.f69140b;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        Drawable drawable = this.f69087a;
        return drawable != null ? drawable.getIntrinsicHeight() : (int) this.f69140b.f69127b.f69121i;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        Drawable drawable = this.f69087a;
        return drawable != null ? drawable.getIntrinsicWidth() : (int) this.f69140b.f69127b.f69120h;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            return drawable.getOpacity();
        }
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet) throws XmlPullParserException, IOException {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            drawable.inflate(resources, xmlPullParser, attributeSet);
        } else {
            inflate(resources, xmlPullParser, attributeSet, null);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void invalidateSelf() {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            drawable.invalidateSelf();
        } else {
            super.invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isAutoMirrored() {
        Drawable drawable = this.f69087a;
        return drawable != null ? e0.r(drawable) : this.f69140b.f69130e;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isStateful() {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            return drawable.isStateful();
        }
        if (super.isStateful()) {
            return true;
        }
        m mVar = this.f69140b;
        if (mVar == null) {
            return false;
        }
        if (mVar.d()) {
            return true;
        }
        ColorStateList colorStateList = this.f69140b.f69128c;
        return colorStateList != null && colorStateList.isStateful();
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable mutate() {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            drawable.mutate();
            return this;
        }
        if (!this.f69143e && super.mutate() == this) {
            this.f69140b = new m(this.f69140b);
            this.f69143e = true;
        }
        return this;
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            drawable.setBounds(rect);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onStateChange(int[] iArr) {
        boolean z11;
        PorterDuff.Mode mode;
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            return drawable.setState(iArr);
        }
        m mVar = this.f69140b;
        ColorStateList colorStateList = mVar.f69128c;
        if (colorStateList == null || (mode = mVar.f69129d) == null) {
            z11 = false;
        } else {
            this.f69141c = a(colorStateList, mode);
            invalidateSelf();
            z11 = true;
        }
        if (!mVar.d() || !mVar.e(iArr)) {
            return z11;
        }
        invalidateSelf();
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public final void scheduleSelf(Runnable runnable, long j11) {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            drawable.scheduleSelf(runnable, j11);
        } else {
            super.scheduleSelf(runnable, j11);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            drawable.setAlpha(i5);
        } else if (this.f69140b.f69127b.getRootAlpha() != i5) {
            this.f69140b.f69127b.setRootAlpha(i5);
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAutoMirrored(boolean z11) {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            e0.x(drawable, z11);
        } else {
            this.f69140b.f69130e = z11;
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            drawable.setColorFilter(colorFilter);
        } else {
            this.f69142d = colorFilter;
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTint(int i5) {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            e0.A(drawable, i5);
        } else {
            setTintList(ColorStateList.valueOf(i5));
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTintList(ColorStateList colorStateList) {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            e0.B(drawable, colorStateList);
            return;
        }
        m mVar = this.f69140b;
        if (mVar.f69128c != colorStateList) {
            mVar.f69128c = colorStateList;
            this.f69141c = a(colorStateList, mVar.f69129d);
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTintMode(PorterDuff.Mode mode) {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            e0.C(drawable, mode);
            return;
        }
        m mVar = this.f69140b;
        if (mVar.f69129d != mode) {
            mVar.f69129d = mode;
            this.f69141c = a(mVar.f69128c, mode);
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean setVisible(boolean z11, boolean z12) {
        Drawable drawable = this.f69087a;
        return drawable != null ? drawable.setVisible(z11, z12) : super.setVisible(z11, z12);
    }

    @Override // android.graphics.drawable.Drawable
    public final void unscheduleSelf(Runnable runnable) {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            drawable.unscheduleSelf(runnable);
        } else {
            super.unscheduleSelf(runnable);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Resources.Theme theme) throws XmlPullParserException, IOException {
        Drawable drawable = this.f69087a;
        if (drawable != null) {
            e0.q(drawable, resources, xmlPullParser, attributeSet, theme);
            return;
        }
        m mVar = this.f69140b;
        mVar.f69127b = new l();
        TypedArray typedArrayK = fg.a.K(resources, theme, attributeSet, a.f69068a);
        m mVar2 = this.f69140b;
        l lVar = mVar2.f69127b;
        int i5 = fg.a.B(xmlPullParser, "tintMode") ? typedArrayK.getInt(6, -1) : -1;
        PorterDuff.Mode mode = PorterDuff.Mode.SRC_IN;
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
        mVar2.f69129d = mode;
        ColorStateList colorStateListV = fg.a.v(typedArrayK, xmlPullParser, theme);
        if (colorStateListV != null) {
            mVar2.f69128c = colorStateListV;
        }
        boolean z11 = mVar2.f69130e;
        if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "autoMirrored") != null) {
            z11 = typedArrayK.getBoolean(5, z11);
        }
        mVar2.f69130e = z11;
        float f11 = lVar.f69122j;
        if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "viewportWidth") != null) {
            f11 = typedArrayK.getFloat(7, f11);
        }
        lVar.f69122j = f11;
        float f12 = lVar.f69123k;
        if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "viewportHeight") != null) {
            f12 = typedArrayK.getFloat(8, f12);
        }
        lVar.f69123k = f12;
        if (lVar.f69122j <= 0.0f) {
            throw new XmlPullParserException(typedArrayK.getPositionDescription() + "<vector> tag requires viewportWidth > 0");
        }
        if (f12 > 0.0f) {
            lVar.f69120h = typedArrayK.getDimension(3, lVar.f69120h);
            int i11 = 2;
            float dimension = typedArrayK.getDimension(2, lVar.f69121i);
            lVar.f69121i = dimension;
            if (lVar.f69120h <= 0.0f) {
                throw new XmlPullParserException(typedArrayK.getPositionDescription() + "<vector> tag requires width > 0");
            }
            if (dimension > 0.0f) {
                float alpha = lVar.getAlpha();
                if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "alpha") != null) {
                    alpha = typedArrayK.getFloat(4, alpha);
                }
                lVar.setAlpha(alpha);
                String string = typedArrayK.getString(0);
                if (string != null) {
                    lVar.f69125m = string;
                    lVar.o.put(string, lVar);
                }
                typedArrayK.recycle();
                mVar.f69126a = getChangingConfigurations();
                int i12 = 1;
                mVar.f69136k = true;
                m mVar3 = this.f69140b;
                l lVar2 = mVar3.f69127b;
                ArrayDeque arrayDeque = new ArrayDeque();
                i iVar = lVar2.f69119g;
                z.e eVar = lVar2.o;
                arrayDeque.push(iVar);
                int eventType = xmlPullParser.getEventType();
                int depth = xmlPullParser.getDepth() + 1;
                boolean z12 = true;
                while (eventType != i12 && (xmlPullParser.getDepth() >= depth || eventType != 3)) {
                    if (eventType == i11) {
                        String name = xmlPullParser.getName();
                        i iVar2 = (i) arrayDeque.peek();
                        if ("path".equals(name)) {
                            h hVar = new h();
                            hVar.c(resources, xmlPullParser, attributeSet, theme);
                            iVar2.f69099b.add(hVar);
                            if (hVar.getPathName() != null) {
                                eVar.put(hVar.getPathName(), hVar);
                            }
                            mVar3.f69126a = mVar3.f69126a;
                            z12 = false;
                        } else if ("clip-path".equals(name)) {
                            g gVar = new g();
                            gVar.c(resources, xmlPullParser, attributeSet, theme);
                            iVar2.f69099b.add(gVar);
                            if (gVar.getPathName() != null) {
                                eVar.put(gVar.getPathName(), gVar);
                            }
                            mVar3.f69126a = mVar3.f69126a;
                        } else if ("group".equals(name)) {
                            i iVar3 = new i();
                            iVar3.c(resources, xmlPullParser, attributeSet, theme);
                            iVar2.f69099b.add(iVar3);
                            arrayDeque.push(iVar3);
                            if (iVar3.getGroupName() != null) {
                                eVar.put(iVar3.getGroupName(), iVar3);
                            }
                            mVar3.f69126a = mVar3.f69126a;
                        }
                    } else if (eventType == 3 && "group".equals(xmlPullParser.getName())) {
                        arrayDeque.pop();
                    }
                    eventType = xmlPullParser.next();
                    i12 = 1;
                    i11 = 2;
                }
                if (!z12) {
                    this.f69141c = a(mVar.f69128c, mVar.f69129d);
                    return;
                }
                throw new XmlPullParserException("no path defined");
            }
            throw new XmlPullParserException(typedArrayK.getPositionDescription() + "<vector> tag requires height > 0");
        }
        throw new XmlPullParserException(typedArrayK.getPositionDescription() + "<vector> tag requires viewportHeight > 0");
    }

    public o(m mVar) {
        this.f69144f = true;
        this.f69145g = new float[9];
        this.f69146h = new Matrix();
        this.f69147i = new Rect();
        this.f69140b = mVar;
        this.f69141c = a(mVar.f69128c, mVar.f69129d);
    }
}
