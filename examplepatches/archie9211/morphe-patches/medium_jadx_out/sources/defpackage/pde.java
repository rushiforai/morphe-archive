package defpackage;

import android.text.TextUtils;
import android.widget.MultiAutoCompleteTextView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pde implements MultiAutoCompleteTextView.Tokenizer {
    public static final pde a = new pde();

    @Override // android.widget.MultiAutoCompleteTextView.Tokenizer
    public final int findTokenEnd(CharSequence charSequence, int i) {
        charSequence.getClass();
        CharSequence charSequenceSubSequence = charSequence.subSequence(i, charSequence.length());
        int length = charSequenceSubSequence.length();
        int i2 = 0;
        while (true) {
            if (i2 >= length) {
                i2 = -1;
                break;
            }
            if (kyd.c0(charSequenceSubSequence.charAt(i2))) {
                break;
            }
            i2++;
        }
        return i2 == -1 ? charSequence.length() : i + i2;
    }

    @Override // android.widget.MultiAutoCompleteTextView.Tokenizer
    public final int findTokenStart(CharSequence charSequence, int i) {
        charSequence.getClass();
        CharSequence charSequenceSubSequence = charSequence.subSequence(0, i);
        int iD0 = muc.d0(charSequenceSubSequence, '@', 0, 6);
        return iD0 > muc.d0(charSequenceSubSequence, ' ', 0, 6) ? iD0 : i;
    }

    @Override // android.widget.MultiAutoCompleteTextView.Tokenizer
    public final CharSequence terminateToken(CharSequence charSequence) {
        charSequence.getClass();
        if (charSequence.length() == 0) {
            return charSequence;
        }
        CharSequence charSequenceConcat = TextUtils.concat(charSequence, " ");
        charSequenceConcat.getClass();
        return charSequenceConcat;
    }
}
