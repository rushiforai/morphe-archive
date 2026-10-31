package l30;

import android.text.Spanned;
import android.text.method.NumberKeyListener;
import com.teslacoilsw.launcher.widget.NumberPicker;
import java.lang.ref.WeakReference;

/* loaded from: classes4.dex */
public final class n extends NumberKeyListener {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f74670a;

    public n(NumberPicker numberPicker) {
        this.f74670a = new WeakReference(numberPicker);
    }

    @Override // android.text.method.NumberKeyListener, android.text.InputFilter
    public final CharSequence filter(CharSequence charSequence, int i5, int i11, Spanned spanned, int i12, int i13) throws NumberFormatException {
        int i14;
        NumberPicker numberPicker = (NumberPicker) this.f74670a.get();
        if (numberPicker != null) {
            char[] cArr = NumberPicker.f46425f0;
            CharSequence charSequenceFilter = super.filter(charSequence, i5, i11, spanned, i12, i13);
            if (charSequenceFilter == null) {
                charSequenceFilter = charSequence.subSequence(i5, i11);
            }
            String str = String.valueOf(spanned.subSequence(0, i12)) + ((Object) charSequenceFilter) + ((Object) spanned.subSequence(i13, spanned.length()));
            if (com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b.equals(str)) {
                return str;
            }
            try {
                i14 = Integer.parseInt(str);
            } catch (NumberFormatException unused) {
                i14 = numberPicker.f46440j;
            }
            if (i14 <= numberPicker.f46441k && str.length() <= String.valueOf(numberPicker.f46441k).length()) {
                return charSequenceFilter;
            }
        }
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    @Override // android.text.method.NumberKeyListener
    public final char[] getAcceptedChars() {
        return NumberPicker.f46425f0;
    }

    @Override // android.text.method.KeyListener
    public final int getInputType() {
        return 1;
    }
}
