package f10;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.widget.Button;
import com.teslacoilsw.launcher.preferences.fancyprefs.RequiresPrimeSwitchCompat;
import e10.a3;

/* loaded from: classes4.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final Button f54211a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f54212b;

    /* renamed from: c, reason: collision with root package name */
    public final Paint f54213c;

    /* renamed from: d, reason: collision with root package name */
    public final Paint f54214d;

    /* renamed from: e, reason: collision with root package name */
    public final float f54215e;

    /* renamed from: f, reason: collision with root package name */
    public final int f54216f;

    /* renamed from: g, reason: collision with root package name */
    public final int f54217g;

    /* renamed from: h, reason: collision with root package name */
    public final ColorStateList f54218h;

    public w(Button button) {
        this.f54211a = button;
        Paint paint = new Paint(1);
        paint.setColor(-11959112);
        this.f54213c = paint;
        Paint paint2 = new Paint(1);
        paint2.setColor(-1);
        paint2.setTextSize(bh.g.M(button.getContext(), 12));
        this.f54214d = paint2;
        this.f54215e = paint2.measureText("Prime");
        this.f54216f = bh.g.M(button.getContext(), 56);
        this.f54217g = bh.g.M(button.getContext(), 16);
        this.f54218h = button.getTextColors();
    }

    public final void a(Canvas canvas, int i5, int i11) {
        if (this.f54212b) {
            return;
        }
        float f11 = i5;
        float f12 = f11 - this.f54216f;
        int i12 = this.f54217g;
        float f13 = (i12 / 2.0f) + (i11 / 2.0f);
        canvas.drawRect(f12, f13 - i12, f11, f13, this.f54213c);
        float f14 = f12 + (r10 / 2);
        float f15 = 2;
        Paint paint = this.f54214d;
        canvas.drawText("Prime", f14 - (this.f54215e / f15), a2.c.z(paint.getFontMetrics().bottom, paint.getFontMetrics().top, f15, f13 - (i12 / 2)) - paint.getFontMetrics().bottom, paint);
    }

    public final void b() {
        boolean z11 = a3.f51435a.f51552h;
        this.f54212b = z11;
        ColorStateList colorStateList = this.f54218h;
        Button button = this.f54211a;
        if (z11) {
            button.setTextColor(colorStateList);
        } else {
            button.setTextColor(colorStateList.getColorForState(new int[0], -65281));
        }
        if (button instanceof RequiresPrimeSwitchCompat) {
            RequiresPrimeSwitchCompat requiresPrimeSwitchCompat = (RequiresPrimeSwitchCompat) button;
            if (this.f54212b) {
                Drawable drawable = requiresPrimeSwitchCompat.R;
                Drawable drawable2 = requiresPrimeSwitchCompat.f74641a;
                if (drawable2 != null) {
                    drawable2.setCallback(null);
                }
                requiresPrimeSwitchCompat.f74641a = drawable;
                if (drawable != null) {
                    drawable.setCallback(requiresPrimeSwitchCompat);
                }
                requiresPrimeSwitchCompat.requestLayout();
                Drawable drawable3 = requiresPrimeSwitchCompat.S;
                Drawable drawable4 = requiresPrimeSwitchCompat.f74646f;
                if (drawable4 != null) {
                    drawable4.setCallback(null);
                }
                requiresPrimeSwitchCompat.f74646f = drawable3;
                if (drawable3 != null) {
                    drawable3.setCallback(requiresPrimeSwitchCompat);
                }
                requiresPrimeSwitchCompat.requestLayout();
                requiresPrimeSwitchCompat.f74642b = requiresPrimeSwitchCompat.f74642b;
                requiresPrimeSwitchCompat.f74644d = true;
                requiresPrimeSwitchCompat.a();
                requiresPrimeSwitchCompat.f74647g = requiresPrimeSwitchCompat.f74647g;
                requiresPrimeSwitchCompat.f74649i = true;
                requiresPrimeSwitchCompat.b();
            } else {
                Drawable drawable5 = requiresPrimeSwitchCompat.f74641a;
                if (drawable5 != null) {
                    drawable5.setCallback(null);
                }
                requiresPrimeSwitchCompat.f74641a = null;
                requiresPrimeSwitchCompat.requestLayout();
                Drawable drawable6 = requiresPrimeSwitchCompat.f74646f;
                if (drawable6 != null) {
                    drawable6.setCallback(null);
                }
                requiresPrimeSwitchCompat.f74646f = null;
                requiresPrimeSwitchCompat.requestLayout();
            }
        }
        button.invalidate();
    }
}
