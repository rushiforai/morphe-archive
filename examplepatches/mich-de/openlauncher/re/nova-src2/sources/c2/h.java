package c2;

import android.view.ViewStructure;
import android.view.autofill.AutofillValue;

/* loaded from: classes2.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public static final e f19168a = new e();

    public static int a(ViewStructure viewStructure) {
        return viewStructure.addChildCount(1);
    }

    public static AutofillValue b(String str) {
        return AutofillValue.forText(str);
    }

    public static boolean c(AutofillValue autofillValue) {
        return autofillValue.isDate();
    }

    public static boolean d(AutofillValue autofillValue) {
        return autofillValue.isList();
    }

    public static boolean e(AutofillValue autofillValue) {
        return autofillValue.isText();
    }

    public static boolean f(AutofillValue autofillValue) {
        return autofillValue.isToggle();
    }

    public static ViewStructure g(ViewStructure viewStructure, int i5) {
        return viewStructure.newChild(i5);
    }

    public static CharSequence h(AutofillValue autofillValue) {
        return autofillValue.getTextValue();
    }
}
