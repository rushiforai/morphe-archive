package cj;

import android.util.Property;
import android.view.ViewGroup;

/* loaded from: classes3.dex */
public final class c extends Property {

    /* renamed from: a, reason: collision with root package name */
    public static final c f19957a = new c(Float.class, "childrenAlpha");

    @Override // android.util.Property
    public final Object get(Object obj) {
        Float f11 = (Float) ((ViewGroup) obj).getTag(2131428393);
        return f11 != null ? f11 : Float.valueOf(1.0f);
    }

    @Override // android.util.Property
    public final void set(Object obj, Object obj2) {
        ViewGroup viewGroup = (ViewGroup) obj;
        Float f11 = (Float) obj2;
        float fFloatValue = f11.floatValue();
        viewGroup.setTag(2131428393, f11);
        int childCount = viewGroup.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            viewGroup.getChildAt(i5).setAlpha(fFloatValue);
        }
    }
}
