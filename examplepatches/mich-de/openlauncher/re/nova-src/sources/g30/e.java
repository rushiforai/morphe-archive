package g30;

import android.util.FloatProperty;
import android.view.View;

/* loaded from: classes.dex */
public final class e extends FloatProperty {

    /* renamed from: a, reason: collision with root package name */
    public y70.d f57031a;

    /* renamed from: b, reason: collision with root package name */
    public f f57032b;

    @Override // android.util.Property
    public final Float get(Object obj) {
        return Float.valueOf(this.f57032b.d());
    }

    @Override // android.util.FloatProperty
    public final void setValue(Object obj, float f11) {
        this.f57032b.f(((View) obj).getWindowToken(), this.f57031a, f11);
    }
}
