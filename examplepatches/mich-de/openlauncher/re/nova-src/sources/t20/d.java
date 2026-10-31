package t20;

import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;

/* loaded from: classes4.dex */
public final class d extends Drawable {

    /* renamed from: b, reason: collision with root package name */
    public static TypedArray f88494b;

    /* renamed from: c, reason: collision with root package name */
    public static int f88495c;

    /* renamed from: d, reason: collision with root package name */
    public static int f88496d;

    /* renamed from: e, reason: collision with root package name */
    public static float f88497e;

    /* renamed from: f, reason: collision with root package name */
    public static final Paint f88498f = new Paint();

    /* renamed from: g, reason: collision with root package name */
    public static final Rect f88499g = new Rect();

    /* renamed from: h, reason: collision with root package name */
    public static final char[] f88500h = new char[1];

    /* renamed from: a, reason: collision with root package name */
    public final c f88501a;

    public d(c cVar) {
        this.f88501a = cVar;
    }

    public final void a(int i5) {
        this.f88501a.f88492e = i5;
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        int color;
        Rect bounds = getBounds();
        if (!isVisible() || bounds.isEmpty()) {
            return;
        }
        c cVar = this.f88501a;
        String str = cVar.f88490c;
        if (TextUtils.isEmpty(str)) {
            color = f88495c;
        } else {
            color = f88494b.getColor(Math.abs(str.hashCode()) % f88494b.length(), f88495c);
        }
        Paint paint = f88498f;
        paint.setColor(color);
        paint.setAlpha(cVar.f88488a);
        canvas.drawCircle(getBounds().centerX(), getBounds().centerY(), (getBounds().width() * 0.91667f) / 2.0f, paint);
        String str2 = cVar.f88489b;
        if (str2 != null) {
            char upperCase = Character.toUpperCase(str2.charAt(0));
            char[] cArr = f88500h;
            cArr[0] = upperCase;
            paint.setTextSize(cVar.f88491d * f88497e * Math.min(getBounds().width(), getBounds().height()));
            paint.getTextBounds(cArr, 0, 1, f88499g);
            paint.setColor(f88496d);
            Rect bounds2 = getBounds();
            canvas.drawText(cArr, 0, 1, bounds2.centerX(), (0.0f * bounds2.height()) + bounds2.centerY() + (r1.height() / 2), paint);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getAlpha() {
        return this.f88501a.f88488a;
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        return this.f88501a;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        int i5 = this.f88501a.f88492e;
        return i5 != 0 ? i5 : super.getIntrinsicHeight();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        int i5 = this.f88501a.f88492e;
        return i5 != 0 ? i5 : super.getIntrinsicWidth();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -1;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        this.f88501a.f88488a = i5;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
    }

    public d(Resources resources) {
        if (f88494b == null) {
            f88494b = resources.obtainTypedArray(2130903064);
            f88495c = resources.getColor(2131099979);
            f88496d = resources.getColor(2131099980);
            f88497e = resources.getFraction(2131165593, 1, 1);
            Typeface typefaceCreate = Typeface.create(resources.getString(2132018096), 0);
            Paint paint = f88498f;
            paint.setTypeface(typefaceCreate);
            paint.setTextAlign(Paint.Align.CENTER);
            paint.setAntiAlias(true);
        }
        this.f88501a = new c(this, 255, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, 1.0f, 0);
    }
}
