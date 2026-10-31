package k1;

import android.content.res.ColorStateList;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import i2.r0;
import i2.s;
import kotlin.ULong;

/* loaded from: classes2.dex */
public final class p extends RippleDrawable {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f70847a;

    /* renamed from: b, reason: collision with root package name */
    public s f70848b;

    /* renamed from: c, reason: collision with root package name */
    public Integer f70849c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f70850d;

    public p(boolean z11) {
        super(ColorStateList.valueOf(-16777216), null, z11 ? new ColorDrawable(-1) : null);
        this.f70847a = z11;
    }

    public final void a(float f11, long j11) {
        if (Build.VERSION.SDK_INT < 28) {
            f11 *= 2;
        }
        if (f11 > 1.0f) {
            f11 = 1.0f;
        }
        long jB = s.b(f11, j11);
        s sVar = this.f70848b;
        if (sVar == null ? false : ULong.a(sVar.f61148a, jB)) {
            return;
        }
        this.f70848b = new s(jB);
        setColor(ColorStateList.valueOf(r0.r(jB)));
    }

    public final void b(int i5) {
        Integer num = this.f70849c;
        if (num != null && num.intValue() == i5) {
            return;
        }
        this.f70849c = Integer.valueOf(i5);
        setRadius(i5);
    }

    @Override // android.graphics.drawable.RippleDrawable, android.graphics.drawable.Drawable
    public final Rect getDirtyBounds() {
        if (!this.f70847a) {
            this.f70850d = true;
        }
        Rect dirtyBounds = super.getDirtyBounds();
        this.f70850d = false;
        return dirtyBounds;
    }

    @Override // android.graphics.drawable.RippleDrawable, android.graphics.drawable.LayerDrawable, android.graphics.drawable.Drawable
    public final boolean isProjected() {
        return this.f70850d;
    }
}
