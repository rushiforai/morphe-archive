package androidx.preference;

import android.content.Context;
import android.content.res.TypedArray;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import br.a;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import r6.c;
import r6.h;

/* loaded from: classes2.dex */
public class ListPreference extends DialogPreference {

    /* renamed from: m, reason: collision with root package name */
    public final CharSequence[] f14751m;
    public final CharSequence[] n;
    public String o;

    /* renamed from: p, reason: collision with root package name */
    public final String f14752p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f14753q;

    public ListPreference(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, h.f85542d, i5, 0);
        CharSequence[] textArray = typedArrayObtainStyledAttributes.getTextArray(2);
        this.f14751m = textArray == null ? typedArrayObtainStyledAttributes.getTextArray(0) : textArray;
        CharSequence[] textArray2 = typedArrayObtainStyledAttributes.getTextArray(3);
        this.n = textArray2 == null ? typedArrayObtainStyledAttributes.getTextArray(1) : textArray2;
        if (typedArrayObtainStyledAttributes.getBoolean(4, typedArrayObtainStyledAttributes.getBoolean(4, false))) {
            if (a.f18425b == null) {
                a.f18425b = new a(22);
            }
            this.f14780l = a.f18425b;
            c();
        }
        typedArrayObtainStyledAttributes.recycle();
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, h.f85544f, i5, 0);
        String string = typedArrayObtainStyledAttributes2.getString(33);
        this.f14752p = string == null ? typedArrayObtainStyledAttributes2.getString(7) : string;
        typedArrayObtainStyledAttributes2.recycle();
    }

    @Override // androidx.preference.Preference
    public final CharSequence a() {
        CharSequence[] charSequenceArr;
        c cVar = this.f14780l;
        if (cVar != null) {
            return cVar.f(this);
        }
        int iL = l(this.o);
        CharSequence charSequence = (iL < 0 || (charSequenceArr = this.f14751m) == null) ? null : charSequenceArr[iL];
        CharSequence charSequenceA = super.a();
        String str = this.f14752p;
        if (str != null) {
            if (charSequence == null) {
                charSequence = b.f42142b;
            }
            String str2 = String.format(str, charSequence);
            if (!TextUtils.equals(str2, charSequenceA)) {
                Log.w("ListPreference", "Setting a summary with a String formatting marker is no longer supported. You should use a SummaryProvider instead.");
                return str2;
            }
        }
        return charSequenceA;
    }

    @Override // androidx.preference.Preference
    public final Object h(TypedArray typedArray, int i5) {
        return typedArray.getString(i5);
    }

    public final int l(String str) {
        CharSequence[] charSequenceArr;
        if (str == null || (charSequenceArr = this.n) == null) {
            return -1;
        }
        for (int length = charSequenceArr.length - 1; length >= 0; length--) {
            if (charSequenceArr[length].equals(str)) {
                return length;
            }
        }
        return -1;
    }

    public final void m(String str) {
        boolean zEquals = TextUtils.equals(this.o, str);
        if (zEquals && this.f14753q) {
            return;
        }
        this.o = str;
        this.f14753q = true;
        if (zEquals) {
            return;
        }
        c();
    }

    public ListPreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, fg.a.o(context, 2130969095, 16842897));
    }
}
