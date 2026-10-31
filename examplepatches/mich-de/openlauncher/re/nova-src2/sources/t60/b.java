package t60;

import android.text.Spannable;
import android.text.SpannableString;

/* loaded from: classes4.dex */
public final class b extends Spannable.Factory {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f88760a = 0;

    @Override // android.text.Spannable.Factory
    public final Spannable newSpannable(CharSequence charSequence) {
        return charSequence instanceof Spannable ? (Spannable) charSequence : new SpannableString(charSequence);
    }
}
