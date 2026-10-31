package com.amplitude;

import android.view.View;
import android.view.ViewStub;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class v4 {
    public static final boolean a(View view) {
        Intrinsics.g(view, "<this>");
        return view.isAttachedToWindow() && view.getVisibility() == 0 && view.getWidth() > 0 && view.getHeight() > 0 && ((double) view.getAlpha()) >= 0.001d && !(view instanceof ViewStub);
    }

    public static final boolean a(View view, String tag) {
        Intrinsics.g(view, "<this>");
        Intrinsics.g(tag, "tag");
        Object tag2 = view.getTag();
        String str = tag2 instanceof String ? (String) tag2 : null;
        if (str != null) {
            return str.equalsIgnoreCase(tag);
        }
        return false;
    }
}
