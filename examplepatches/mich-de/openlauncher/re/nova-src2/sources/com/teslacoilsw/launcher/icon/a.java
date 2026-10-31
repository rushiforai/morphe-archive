package com.teslacoilsw.launcher.icon;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.BlendMode;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.os.Build;
import android.os.UserHandle;
import android.util.AttributeSet;
import android.util.Xml;
import com.android.launcher3.icons.BitmapInfo;
import com.teslacoilsw.launcher.launcher3.NovaBitmapInfo;
import e10.y2;
import fa.t;
import fz.w;
import java.io.IOException;
import java.lang.reflect.Field;
import jz.h;
import o9.u2;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import wk.n;
import wk.u;

/* loaded from: classes.dex */
public class a extends Drawable implements Drawable.Callback, h {

    /* renamed from: q, reason: collision with root package name */
    public static fz.d f45775q;

    /* renamed from: r, reason: collision with root package name */
    public static final Field f45776r;

    /* renamed from: s, reason: collision with root package name */
    public static final n f45777s;

    /* renamed from: a, reason: collision with root package name */
    public final Path f45778a;

    /* renamed from: b, reason: collision with root package name */
    public final Path f45779b;

    /* renamed from: c, reason: collision with root package name */
    public final Matrix f45780c;

    /* renamed from: d, reason: collision with root package name */
    public final Region f45781d;

    /* renamed from: e, reason: collision with root package name */
    public w f45782e;

    /* renamed from: f, reason: collision with root package name */
    public BitmapShader f45783f;

    /* renamed from: g, reason: collision with root package name */
    public Bitmap f45784g;

    /* renamed from: h, reason: collision with root package name */
    public final Rect f45785h;

    /* renamed from: i, reason: collision with root package name */
    public Rect f45786i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f45787j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f45788k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f45789l;

    /* renamed from: m, reason: collision with root package name */
    public final Canvas f45790m;
    public final Paint n;
    public float o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f45791p;

    static {
        Field field;
        try {
            field = Drawable.class.getField("mSrcDensityOverride");
            field.setAccessible(true);
        } catch (Exception e3) {
            e3.printStackTrace();
            field = null;
        }
        f45776r = field;
        wk.d dVarA = wk.d.a();
        dVarA.b(u.f94572b);
        f45777s = new n(dVarA);
    }

    public a(w wVar, Resources resources, fz.d dVar) {
        w wVarG;
        new Matrix();
        this.f45785h = new Rect();
        this.n = new Paint(7);
        this.o = 1.0f;
        this.f45791p = false;
        if (wVar == null) {
            wVarG = new w();
            wVarG.f56378c = 0;
            wVarG.f56383h = false;
            wVarG.f56377b = l(resources, 0);
            wVarG.f56376a = new t[2];
            wVarG.f56384i = dVar;
            for (int i5 = 0; i5 < 2; i5++) {
                wVarG.f56376a[i5] = new t(wVarG.f56377b, 1);
            }
        } else {
            wVarG = g(wVar, resources);
        }
        this.f45782e = wVarG;
        this.f45778a = new Path();
        this.f45779b = new Path();
        m(dVar);
        this.f45780c = new Matrix();
        this.f45790m = new Canvas();
        this.f45781d = new Region();
    }

    public static a f(Resources resources, int i5, Resources.Theme theme) {
        int next;
        try {
            XmlResourceParser xml = resources.getXml(i5);
            AttributeSet attributeSetAsAttributeSet = Xml.asAttributeSet(xml);
            do {
                next = xml.next();
                if (next == 2) {
                    break;
                }
            } while (next != 1);
            if (next != 2) {
                throw new XmlPullParserException("No start tag found");
            }
            a aVar = new a((w) null, (Resources) null, (fz.d) y2.f51877a.i().l());
            aVar.inflate(resources, xml, attributeSetAsAttributeSet, theme);
            return aVar;
        } catch (IOException | XmlPullParserException unused) {
            return null;
        }
    }

    public static int l(Resources resources, int i5) {
        if (resources != null) {
            i5 = resources.getDisplayMetrics().densityDpi;
        }
        if (i5 == 0) {
            return 160;
        }
        return i5;
    }

    @Override // aa.e
    public BitmapInfo a(Bitmap bitmap, int i5, aa.c cVar, float f11, UserHandle userHandle) {
        return new NovaBitmapInfo(bitmap, i5, this.f45791p, true, false);
    }

    @Override // aa.e
    public void b(Canvas canvas) {
    }

    @Override // jz.h
    public final boolean c() {
        return this.f45791p;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean canApplyTheme() {
        w wVar = this.f45782e;
        return (wVar != null && wVar.canApplyTheme()) || super.canApplyTheme();
    }

    @Override // jz.h
    public final boolean d() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        Drawable drawable;
        Bitmap bitmap = this.f45784g;
        if (bitmap == null) {
            return;
        }
        BitmapShader bitmapShader = this.f45783f;
        Paint paint = this.n;
        if (bitmapShader == null) {
            Canvas canvas2 = this.f45790m;
            canvas2.setBitmap(bitmap);
            canvas2.drawColor(-16777216);
            int height = this.f45784g.getHeight();
            this.f45782e.f56384i.getClass();
            Drawable drawableI = i();
            InsetDrawable insetDrawable = drawableI instanceof InsetDrawable ? (InsetDrawable) drawableI : null;
            int i5 = 0;
            float f11 = (((insetDrawable != null ? insetDrawable.getDrawable() : null) instanceof a ? 0 : r3.f56209f) * height) / 108.0f;
            canvas2.translate(0.0f, f11);
            while (true) {
                w wVar = this.f45782e;
                if (i5 >= 2) {
                    break;
                }
                t tVar = wVar.f56376a[i5];
                if (tVar != null && (drawable = (Drawable) tVar.f54486b) != null) {
                    try {
                        drawable.draw(canvas2);
                    } catch (IllegalArgumentException unused) {
                    }
                }
                i5++;
            }
            Bitmap bitmap2 = this.f45784g;
            Shader.TileMode tileMode = Shader.TileMode.CLAMP;
            BitmapShader bitmapShader2 = new BitmapShader(bitmap2, tileMode, tileMode);
            this.f45783f = bitmapShader2;
            paint.setShader(bitmapShader2);
            canvas2.translate(0.0f, -f11);
        }
        Rect bounds = getBounds();
        canvas.translate(bounds.left, bounds.top);
        float f12 = this.o;
        canvas.scale(f12, f12, bounds.centerX(), bounds.centerY());
        canvas.drawPath(this.f45779b, paint);
        canvas.translate(-bounds.left, -bounds.top);
    }

    @Override // aa.e
    public Drawable e(Context context) {
        return null;
    }

    public final w g(w wVar, Resources resources) {
        Drawable drawableNewDrawable;
        w wVar2 = new w();
        wVar2.f56378c = 0;
        wVar2.f56383h = false;
        wVar2.f56377b = l(resources, wVar.f56377b);
        wVar2.f56376a = new t[2];
        t[] tVarArr = wVar.f56376a;
        wVar2.f56379d = wVar.f56379d;
        wVar2.f56380e = wVar.f56380e;
        for (int i5 = 0; i5 < 2; i5++) {
            t tVar = tVarArr[i5];
            t[] tVarArr2 = wVar2.f56376a;
            t tVar2 = new t();
            tVar2.f54485a = 160;
            Drawable drawable = (Drawable) tVar.f54486b;
            if (drawable != null) {
                Drawable.ConstantState constantState = drawable.getConstantState();
                drawableNewDrawable = constantState == null ? drawable : resources != null ? constantState.newDrawable(resources) : constantState.newDrawable();
                drawableNewDrawable.setCallback(this);
                drawableNewDrawable.setBounds(drawable.getBounds());
                drawableNewDrawable.setLevel(drawable.getLevel());
            } else {
                drawableNewDrawable = null;
            }
            tVar2.f54486b = drawableNewDrawable;
            tVar2.f54485a = l(resources, tVar.f54485a);
            tVarArr2[i5] = tVar2;
        }
        wVar2.f56381f = wVar.f56381f;
        wVar2.f56382g = wVar.f56382g;
        wVar2.f56383h = wVar.f56383h;
        wVar2.f56378c = wVar.f56378c;
        wVar2.f56384i = wVar.f56384i;
        return wVar2;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getAlpha() {
        return this.n.getAlpha();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getChangingConfigurations() {
        return super.getChangingConfigurations() | this.f45782e.getChangingConfigurations();
    }

    @Override // android.graphics.drawable.Drawable
    public Drawable.ConstantState getConstantState() {
        t[] tVarArr = this.f45782e.f56376a;
        for (int i5 = 0; i5 < 2; i5++) {
            Drawable drawable = (Drawable) tVarArr[i5].f54486b;
            if (drawable != null && drawable.getConstantState() == null) {
                return null;
            }
        }
        this.f45782e.f56379d = getChangingConfigurations();
        return this.f45782e;
    }

    @Override // android.graphics.drawable.Drawable
    public final void getHotspotBounds(Rect rect) {
        Rect rect2 = this.f45786i;
        if (rect2 != null) {
            rect.set(rect2);
        } else {
            super.getHotspotBounds(rect);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        int intrinsicHeight;
        int i5 = -1;
        int i11 = 0;
        while (true) {
            w wVar = this.f45782e;
            if (i11 >= 2) {
                return (int) (i5 / wVar.f56384i.f(this));
            }
            Drawable drawable = (Drawable) wVar.f56376a[i11].f54486b;
            if (drawable != null && (intrinsicHeight = drawable.getIntrinsicHeight()) > i5) {
                i5 = intrinsicHeight;
            }
            i11++;
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        int intrinsicWidth;
        int i5 = -1;
        int i11 = 0;
        while (true) {
            w wVar = this.f45782e;
            if (i11 >= 2) {
                return (int) (i5 / wVar.f56384i.f(this));
            }
            Drawable drawable = (Drawable) wVar.f56376a[i11].f54486b;
            if (drawable != null && (intrinsicWidth = drawable.getIntrinsicWidth()) > i5) {
                i5 = intrinsicWidth;
            }
            i11++;
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final void getOutline(Outline outline) {
        Path pathJ = j();
        if (Build.VERSION.SDK_INT >= 29 || pathJ.isConvex()) {
            outline.setConvexPath(pathJ);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final Region getTransparentRegion() {
        Region region = this.f45781d;
        if (region.isEmpty()) {
            Path path = this.f45778a;
            path.toggleInverseFillType();
            region.set(getBounds());
            region.setPath(path, region);
            path.toggleInverseFillType();
        }
        return region;
    }

    public final Drawable h() {
        return (Drawable) this.f45782e.f56376a[0].f54486b;
    }

    public final Drawable i() {
        return (Drawable) this.f45782e.f56376a[1].f54486b;
    }

    @Override // android.graphics.drawable.Drawable
    public final void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Resources.Theme theme) throws XmlPullParserException, IOException {
        char c11;
        int next;
        w wVar = this.f45782e;
        if (wVar == null) {
            return;
        }
        t[] tVarArr = wVar.f56376a;
        int iL = l(resources, 0);
        if (wVar.f56377b != iL) {
            wVar.f56377b = iL;
        }
        Field field = f45776r;
        if (field != null) {
            try {
                wVar.f56378c = field.getInt(this);
            } catch (IllegalAccessException e3) {
                e3.printStackTrace();
                wVar.f56378c = 0;
            }
        }
        for (t tVar : tVarArr) {
            if (tVar.f54485a != iL) {
                tVar.f54485a = iL;
            }
        }
        w wVar2 = this.f45782e;
        int depth = xmlPullParser.getDepth() + 1;
        while (true) {
            int next2 = xmlPullParser.next();
            if (next2 == 1) {
                return;
            }
            int depth2 = xmlPullParser.getDepth();
            if (depth2 < depth && next2 == 3) {
                return;
            }
            if (next2 == 2 && depth2 <= depth) {
                String name = xmlPullParser.getName();
                if (name.equals("background")) {
                    c11 = 0;
                } else if (name.equals("foreground")) {
                    c11 = 1;
                } else {
                    continue;
                }
                t tVar2 = new t(wVar2.f56377b, 1);
                int[] iArr = u2.f80152a;
                TypedArray typedArrayObtainAttributes = theme == null ? resources.obtainAttributes(attributeSet, iArr) : theme.obtainStyledAttributes(attributeSet, iArr, 0, 0);
                w wVar3 = this.f45782e;
                wVar3.f56380e |= typedArrayObtainAttributes.getChangingConfigurations();
                Drawable drawable = typedArrayObtainAttributes.getDrawable(0);
                if (drawable != null) {
                    Drawable drawable2 = (Drawable) tVar2.f54486b;
                    if (drawable2 != null) {
                        drawable2.setCallback(null);
                    }
                    tVar2.f54486b = drawable;
                    drawable.setCallback(this);
                    wVar3.f56380e |= ((Drawable) tVar2.f54486b).getChangingConfigurations();
                }
                typedArrayObtainAttributes.recycle();
                if (((Drawable) tVar2.f54486b) == null) {
                    do {
                        next = xmlPullParser.next();
                    } while (next == 4);
                    if (next != 2) {
                        throw new XmlPullParserException(xmlPullParser.getPositionDescription() + ": <foreground> or <background> tag requires a 'drawable'attribute or child tag defining a drawable");
                    }
                    int i5 = this.f45782e.f56378c;
                    Drawable drawableCreateFromXmlInner = Drawable.createFromXmlInner(resources, xmlPullParser, attributeSet, theme);
                    tVar2.f54486b = drawableCreateFromXmlInner;
                    drawableCreateFromXmlInner.setCallback(this);
                    wVar2.f56380e |= ((Drawable) tVar2.f54486b).getChangingConfigurations();
                }
                w wVar4 = this.f45782e;
                wVar4.f56376a[c11] = tVar2;
                wVar4.f56381f = false;
            }
        }
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void invalidateDrawable(Drawable drawable) {
        if (this.f45788k) {
            this.f45789l = true;
        } else {
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void invalidateSelf() {
        this.f45783f = null;
        super.invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isAutoMirrored() {
        return this.f45782e.f56383h;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isStateful() {
        w wVar = this.f45782e;
        if (wVar.f56381f) {
            return wVar.f56382g;
        }
        t[] tVarArr = wVar.f56376a;
        boolean z11 = false;
        int i5 = 0;
        while (true) {
            if (i5 < 2) {
                Drawable drawable = (Drawable) tVarArr[i5].f54486b;
                if (drawable != null && drawable.isStateful()) {
                    z11 = true;
                    break;
                }
                i5++;
            } else {
                break;
            }
        }
        wVar.f56382g = z11;
        wVar.f56381f = true;
        return z11;
    }

    public Path j() {
        return this.f45778a;
    }

    @Override // android.graphics.drawable.Drawable
    public final void jumpToCurrentState() {
        t[] tVarArr = this.f45782e.f56376a;
        for (int i5 = 0; i5 < 2; i5++) {
            Drawable drawable = (Drawable) tVarArr[i5].f54486b;
            if (drawable != null) {
                drawable.jumpToCurrentState();
            }
        }
    }

    public final fz.d k() {
        if (f45775q == null) {
            f45775q = (fz.d) y2.f51877a.i().l();
        }
        fz.d dVar = this.f45782e.f56384i;
        return dVar != null ? dVar : f45775q;
    }

    public final void m(fz.d dVar) {
        this.f45782e.f56384i = dVar;
        Path pathE = dVar.e();
        Path path = this.f45778a;
        path.set(pathE);
        this.f45779b.set(path);
        Rect bounds = getBounds();
        if (!bounds.isEmpty()) {
            n(new Rect(0, 0, 100, 100));
            n(bounds);
        }
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable mutate() {
        if (!this.f45787j && super.mutate() == this) {
            this.f45782e = g(this.f45782e, null);
            int i5 = 0;
            while (true) {
                w wVar = this.f45782e;
                if (i5 >= 2) {
                    break;
                }
                Drawable drawable = (Drawable) wVar.f56376a[i5].f54486b;
                if (drawable != null) {
                    drawable.mutate();
                }
                i5++;
            }
            this.f45787j = true;
        }
        return this;
    }

    public final void n(Rect rect) {
        if (rect.isEmpty()) {
            return;
        }
        try {
            this.f45788k = true;
            o(rect);
            p(rect);
        } finally {
            this.f45788k = false;
            if (this.f45789l) {
                this.f45789l = false;
                invalidateSelf();
            }
        }
    }

    public final void o(Rect rect) {
        Drawable drawable;
        int iWidth = rect.width() / 2;
        int iHeight = rect.height() / 2;
        for (int i5 = 0; i5 < 2; i5++) {
            w wVar = this.f45782e;
            t tVar = wVar.f56376a[i5];
            if (tVar != null && (drawable = (Drawable) tVar.f54486b) != null) {
                float f11 = (1.0f / wVar.f56384i.f(this)) * 2.0f;
                int iWidth2 = (int) (rect.width() / f11);
                int iHeight2 = (int) (rect.height() / f11);
                Rect rect2 = this.f45785h;
                rect2.set(iWidth - iWidth2, iHeight - iHeight2, iWidth2 + iWidth, iHeight2 + iHeight);
                drawable.setBounds(rect2);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        if (rect.isEmpty()) {
            return;
        }
        n(rect);
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onLevelChange(int i5) {
        t[] tVarArr = this.f45782e.f56376a;
        boolean z11 = false;
        for (int i11 = 0; i11 < 2; i11++) {
            Drawable drawable = (Drawable) tVarArr[i11].f54486b;
            if (drawable != null && drawable.setLevel(i5)) {
                z11 = true;
            }
        }
        if (z11) {
            n(getBounds());
        }
        return z11;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onStateChange(int[] iArr) {
        t[] tVarArr = this.f45782e.f56376a;
        boolean z11 = false;
        for (int i5 = 0; i5 < 2; i5++) {
            Drawable drawable = (Drawable) tVarArr[i5].f54486b;
            if (drawable != null && drawable.isStateful() && drawable.setState(iArr)) {
                z11 = true;
            }
        }
        if (z11) {
            n(getBounds());
        }
        return z11;
    }

    public final void p(Rect rect) {
        Matrix matrix = this.f45780c;
        matrix.setScale(rect.width() / 100.0f, rect.height() / 100.0f);
        Path pathE = k().e();
        pathE.transform(matrix, this.f45779b);
        matrix.postTranslate(rect.left, rect.top);
        pathE.transform(matrix, this.f45778a);
        Bitmap bitmap = this.f45784g;
        if (bitmap == null || bitmap.getWidth() != rect.width() || this.f45784g.getHeight() != rect.height()) {
            this.f45784g = Bitmap.createBitmap(rect.width(), rect.height(), Bitmap.Config.ARGB_8888);
        }
        this.n.setShader(null);
        this.f45781d.setEmpty();
        this.f45783f = null;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void scheduleDrawable(Drawable drawable, Runnable runnable, long j11) {
        scheduleSelf(runnable, j11);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        this.n.setAlpha(i5);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAutoMirrored(boolean z11) {
        w wVar = this.f45782e;
        wVar.f56383h = z11;
        t[] tVarArr = wVar.f56376a;
        for (int i5 = 0; i5 < 2; i5++) {
            Drawable drawable = (Drawable) tVarArr[i5].f54486b;
            if (drawable != null) {
                drawable.setAutoMirrored(z11);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        t[] tVarArr = this.f45782e.f56376a;
        for (int i5 = 0; i5 < 2; i5++) {
            Drawable drawable = (Drawable) tVarArr[i5].f54486b;
            if (drawable != null) {
                drawable.setColorFilter(colorFilter);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setDither(boolean z11) {
        t[] tVarArr = this.f45782e.f56376a;
        for (int i5 = 0; i5 < 2; i5++) {
            Drawable drawable = (Drawable) tVarArr[i5].f54486b;
            if (drawable != null) {
                drawable.setDither(z11);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setHotspot(float f11, float f12) {
        t[] tVarArr = this.f45782e.f56376a;
        for (int i5 = 0; i5 < 2; i5++) {
            Drawable drawable = (Drawable) tVarArr[i5].f54486b;
            if (drawable != null) {
                drawable.setHotspot(f11, f12);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setHotspotBounds(int i5, int i11, int i12, int i13) {
        t[] tVarArr = this.f45782e.f56376a;
        for (int i14 = 0; i14 < 2; i14++) {
            Drawable drawable = (Drawable) tVarArr[i14].f54486b;
            if (drawable != null) {
                drawable.setHotspotBounds(i5, i11, i12, i13);
            }
        }
        Rect rect = this.f45786i;
        if (rect == null) {
            this.f45786i = new Rect(i5, i11, i12, i13);
        } else {
            rect.set(i5, i11, i12, i13);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTintBlendMode(BlendMode blendMode) {
        t[] tVarArr = this.f45782e.f56376a;
        for (int i5 = 0; i5 < 2; i5++) {
            Drawable drawable = (Drawable) tVarArr[i5].f54486b;
            if (drawable != null) {
                drawable.setTintBlendMode(blendMode);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTintList(ColorStateList colorStateList) {
        t[] tVarArr = this.f45782e.f56376a;
        for (int i5 = 0; i5 < 2; i5++) {
            Drawable drawable = (Drawable) tVarArr[i5].f54486b;
            if (drawable != null) {
                drawable.setTintList(colorStateList);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTintMode(PorterDuff.Mode mode) {
        t[] tVarArr = this.f45782e.f56376a;
        for (int i5 = 0; i5 < 2; i5++) {
            Drawable drawable = (Drawable) tVarArr[i5].f54486b;
            if (drawable != null) {
                drawable.setTintMode(mode);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean setVisible(boolean z11, boolean z12) {
        boolean visible = super.setVisible(z11, z12);
        t[] tVarArr = this.f45782e.f56376a;
        for (int i5 = 0; i5 < 2; i5++) {
            Drawable drawable = (Drawable) tVarArr[i5].f54486b;
            if (drawable != null) {
                drawable.setVisible(z11, z12);
            }
        }
        return visible;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void unscheduleDrawable(Drawable drawable, Runnable runnable) {
        unscheduleSelf(runnable);
    }

    public a(Drawable drawable, Drawable drawable2, fz.d dVar) {
        this((w) null, (Resources) null, dVar);
        if (drawable != null) {
            t tVar = new t(this.f45782e.f56377b, 1);
            tVar.f54486b = drawable;
            drawable.setCallback(this);
            this.f45782e.f56380e |= ((Drawable) tVar.f54486b).getChangingConfigurations();
            w wVar = this.f45782e;
            wVar.f56376a[0] = tVar;
            wVar.f56381f = false;
        }
        if (drawable2 != null) {
            t tVar2 = new t(this.f45782e.f56377b, 1);
            tVar2.f54486b = drawable2;
            drawable2.setCallback(this);
            this.f45782e.f56380e |= ((Drawable) tVar2.f54486b).getChangingConfigurations();
            w wVar2 = this.f45782e;
            wVar2.f56376a[1] = tVar2;
            wVar2.f56381f = false;
        }
    }
}
