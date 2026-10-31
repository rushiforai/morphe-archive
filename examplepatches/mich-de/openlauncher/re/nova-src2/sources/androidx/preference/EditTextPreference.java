package androidx.preference;

import android.content.Context;
import android.content.res.TypedArray;
import android.text.TextUtils;
import android.util.AttributeSet;
import b6.e;
import fg.a;
import r6.h;

/* loaded from: classes2.dex */
public class EditTextPreference extends DialogPreference {

    /* renamed from: m, reason: collision with root package name */
    public String f14746m;

    /* JADX WARN: Illegal instructions before constructor call */
    public EditTextPreference(Context context, AttributeSet attributeSet) {
        int iO = a.o(context, 2130969139, 16842898);
        super(context, attributeSet, iO);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, h.f85541c, iO, 0);
        if (typedArrayObtainStyledAttributes.getBoolean(0, typedArrayObtainStyledAttributes.getBoolean(0, false))) {
            if (e.f17568c == null) {
                e.f17568c = new e(22);
            }
            this.f14780l = e.f17568c;
            c();
        }
        typedArrayObtainStyledAttributes.recycle();
    }

    @Override // androidx.preference.Preference
    public final Object h(TypedArray typedArray, int i5) {
        return typedArray.getString(i5);
    }

    @Override // androidx.preference.Preference
    public final boolean k() {
        return TextUtils.isEmpty(this.f14746m) || super.k();
    }

    public final void l(String str) {
        boolean zK = k();
        this.f14746m = str;
        boolean zK2 = k();
        if (zK2 != zK) {
            d(zK2);
        }
        c();
    }
}
