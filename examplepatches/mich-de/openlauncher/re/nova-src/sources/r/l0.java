package r;

import android.widget.TextView;

/* loaded from: classes2.dex */
public abstract class l0 {
    public static int a(TextView textView) {
        return textView.getAutoSizeStepGranularity();
    }

    public static void b(TextView textView, int i5, int i11, int i12, int i13) {
        textView.setAutoSizeTextTypeUniformWithConfiguration(i5, i11, i12, i13);
    }

    public static void c(TextView textView, int[] iArr, int i5) {
        textView.setAutoSizeTextTypeUniformWithPresetSizes(iArr, i5);
    }

    public static boolean d(TextView textView, String str) {
        return textView.setFontVariationSettings(str);
    }
}
