package androidx.preference;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import fg.a;
import java.util.HashSet;
import r6.h;

/* loaded from: classes2.dex */
public class MultiSelectListPreference extends DialogPreference {

    /* renamed from: m, reason: collision with root package name */
    public final HashSet f14760m;

    /* JADX WARN: Illegal instructions before constructor call */
    public MultiSelectListPreference(Context context, AttributeSet attributeSet) {
        int iO = a.o(context, 2130969095, 16842897);
        super(context, attributeSet, iO);
        this.f14760m = new HashSet();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, h.f85543e, iO, 0);
        if (typedArrayObtainStyledAttributes.getTextArray(2) == null) {
            typedArrayObtainStyledAttributes.getTextArray(0);
        }
        if (typedArrayObtainStyledAttributes.getTextArray(3) == null) {
            typedArrayObtainStyledAttributes.getTextArray(1);
        }
        typedArrayObtainStyledAttributes.recycle();
    }

    @Override // androidx.preference.Preference
    public final Object h(TypedArray typedArray, int i5) {
        CharSequence[] textArray = typedArray.getTextArray(i5);
        HashSet hashSet = new HashSet();
        for (CharSequence charSequence : textArray) {
            hashSet.add(charSequence.toString());
        }
        return hashSet;
    }
}
