package com.amplitude;

import android.view.View;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class I1 {

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f20271a = new LinkedHashMap();

    public final boolean a(View view) {
        Intrinsics.g(view, "view");
        int iHashCode = view.getViewTreeObserver().hashCode();
        LinkedHashMap linkedHashMap = this.f20271a;
        Integer numValueOf = Integer.valueOf(iHashCode);
        Object obj = linkedHashMap.get(numValueOf);
        Object obj2 = obj;
        if (obj == null) {
            F1 f12 = new F1(view);
            if (view.isAttachedToWindow()) {
                view.getViewTreeObserver().addOnPreDrawListener(f12);
            } else {
                view.addOnAttachStateChangeListener(new G1(view, f12));
            }
            if (view.isAttachedToWindow()) {
                view.addOnAttachStateChangeListener(new H1(view, f12, this, iHashCode));
            } else {
                view.getViewTreeObserver().removeOnPreDrawListener(f12);
                this.f20271a.remove(Integer.valueOf(iHashCode));
            }
            linkedHashMap.put(numValueOf, f12);
            obj2 = f12;
        }
        return ((F1) obj2).f20231b.remove(Integer.valueOf(view.hashCode()));
    }
}
