package defpackage;

import android.util.FloatProperty;
import com.google.android.material.focus.FocusRingDrawable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wr4 extends FloatProperty {
    public wr4() {
        super("interpolation");
    }

    @Override // android.util.Property
    public final Object get(Object obj) {
        return Float.valueOf(((FocusRingDrawable) obj).k);
    }

    public final void setValue(Object obj, float f) {
        FocusRingDrawable focusRingDrawable = (FocusRingDrawable) obj;
        focusRingDrawable.k = f;
        focusRingDrawable.invalidateSelf();
    }
}
