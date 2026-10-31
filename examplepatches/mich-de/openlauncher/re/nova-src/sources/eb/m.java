package eb;

import android.content.res.ColorStateList;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;

/* loaded from: classes2.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public float f52499a;

    /* renamed from: b, reason: collision with root package name */
    public float f52500b;

    /* renamed from: c, reason: collision with root package name */
    public Object f52501c;

    /* renamed from: d, reason: collision with root package name */
    public Object f52502d;

    public RippleDrawable a() {
        StateListDrawable stateListDrawable = new StateListDrawable();
        int[] iArr = n.f52508g.f52510a;
        float f11 = this.f52499a;
        stateListDrawable.addState(iArr, b(f11, f11));
        stateListDrawable.addState(n.f52504c.f52510a, b(f11, 0.0f));
        int[] iArr2 = n.f52503b.f52510a;
        float f12 = this.f52500b;
        stateListDrawable.addState(iArr2, b(f11, f12));
        stateListDrawable.addState(n.f52506e.f52510a, b(f12, 0.0f));
        stateListDrawable.addState(n.f52505d.f52510a, b(f12, f12));
        stateListDrawable.addState(n.f52507f.f52510a, b(f12, f11));
        return new RippleDrawable((ColorStateList) this.f52502d, stateListDrawable, stateListDrawable);
    }

    public GradientDrawable b(float f11, float f12) {
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor((ColorStateList) this.f52501c);
        gradientDrawable.setShape(0);
        gradientDrawable.setCornerRadii(new float[]{f11, f11, f11, f11, f12, f12, f12, f12});
        return gradientDrawable;
    }
}
