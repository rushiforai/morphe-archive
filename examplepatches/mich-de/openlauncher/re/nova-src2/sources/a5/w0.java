package a5;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;

/* loaded from: classes.dex */
public abstract class w0 {
    public static View.AccessibilityDelegate a(View view) {
        return view.getAccessibilityDelegate();
    }

    public static void b(View view, Context context, int[] iArr, AttributeSet attributeSet, TypedArray typedArray, int i5, int i11) {
        view.saveAttributeDataForStyleable(context, iArr, attributeSet, typedArray, i5, i11);
    }
}
