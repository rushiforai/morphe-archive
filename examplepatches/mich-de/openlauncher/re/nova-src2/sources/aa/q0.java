package aa;

import android.R;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import com.android.launcher3.icons.ThemedIconDrawable$ThemedBitmapInfo;

/* loaded from: classes2.dex */
public final class q0 extends n {
    public final ThemedIconDrawable$ThemedBitmapInfo o;

    /* renamed from: p, reason: collision with root package name */
    public final int f646p;

    /* renamed from: q, reason: collision with root package name */
    public final int f647q;

    /* renamed from: r, reason: collision with root package name */
    public final InsetDrawable f648r;

    /* renamed from: s, reason: collision with root package name */
    public final AdaptiveIconDrawable f649s;

    /* renamed from: t, reason: collision with root package name */
    public final Rect f650t;

    /* JADX WARN: Illegal instructions before constructor call */
    public q0(p0 p0Var) {
        Bitmap bitmap = p0Var.f615a;
        int i5 = p0Var.f641e;
        super(bitmap, i5, p0Var.f617c);
        ThemedIconDrawable$ThemedBitmapInfo themedIconDrawable$ThemedBitmapInfo = p0Var.f640d;
        this.o = themedIconDrawable$ThemedBitmapInfo;
        int i11 = p0Var.f642f;
        this.f647q = i11;
        this.f646p = i5;
        n0 n0Var = themedIconDrawable$ThemedBitmapInfo.f21155e;
        Drawable drawableMutate = n0Var.f636a.getDrawable(n0Var.f637b).mutate();
        drawableMutate.setTint(i5);
        this.f648r = new InsetDrawable(drawableMutate, 0.2f);
        this.f649s = new AdaptiveIconDrawable(new ColorDrawable(i11), null);
        Bitmap bitmap2 = themedIconDrawable$ThemedBitmapInfo.f21157g;
        this.f650t = bitmap2 != null ? new Rect(0, 0, bitmap2.getWidth(), bitmap2.getHeight()) : null;
    }

    public static int[] l(Context context) {
        Resources resources = context.getResources();
        int[] iArr = new int[2];
        if ((resources.getConfiguration().uiMode & 48) == 32) {
            iArr[0] = resources.getColor(R.color.system_accent1_800);
            iArr[1] = resources.getColor(R.color.system_accent3_100);
            return iArr;
        }
        iArr[0] = resources.getColor(R.color.system_accent3_100);
        iArr[1] = resources.getColor(R.color.system_accent2_700);
        return iArr;
    }

    @Override // aa.n
    public final void f(Canvas canvas, Rect rect) {
        int iSave = canvas.save();
        ThemedIconDrawable$ThemedBitmapInfo themedIconDrawable$ThemedBitmapInfo = this.o;
        float f11 = themedIconDrawable$ThemedBitmapInfo.f21156f;
        canvas.scale(f11, f11, rect.exactCenterX(), rect.exactCenterY());
        int i5 = this.f647q;
        Paint paint = this.f626a;
        paint.setColor(i5);
        canvas.drawPath(this.f649s.getIconMask(), paint);
        this.f648r.draw(canvas);
        canvas.restoreToCount(iSave);
        Rect rect2 = this.f650t;
        if (rect2 != null) {
            canvas.drawBitmap(themedIconDrawable$ThemedBitmapInfo.f21157g, rect2, getBounds(), paint);
        }
    }

    @Override // aa.n, android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        return new p0(this.o, this.f647q, this.f646p, this.f631f);
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        this.f649s.setBounds(rect);
        this.f648r.setBounds(rect);
    }
}
