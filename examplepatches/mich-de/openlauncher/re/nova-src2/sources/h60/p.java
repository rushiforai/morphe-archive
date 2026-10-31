package h60;

import android.text.SpannableStringBuilder;
import android.text.Spanned;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes4.dex */
public final class p implements Appendable, CharSequence {

    /* renamed from: b, reason: collision with root package name */
    public final ArrayDeque f59494b = new ArrayDeque(8);

    /* renamed from: a, reason: collision with root package name */
    public final StringBuilder f59493a = new StringBuilder((CharSequence) com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);

    public p() {
        b(0, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    public static void c(p pVar, Object obj, int i5, int i11) {
        if (obj != null) {
            if (!obj.getClass().isArray()) {
                pVar.f59494b.push(new n(obj, i5, i11, 33));
                return;
            }
            for (Object obj2 : (Object[]) obj) {
                c(pVar, obj2, i5, i11);
            }
        }
    }

    public final void a(char c11) {
        this.f59493a.append(c11);
    }

    @Override // java.lang.Appendable
    public final Appendable append(char c11) {
        this.f59493a.append(c11);
        return this;
    }

    public final void b(int i5, CharSequence charSequence) {
        if (charSequence instanceof Spanned) {
            Spanned spanned = (Spanned) charSequence;
            boolean z11 = spanned instanceof o;
            Object[] spans = spanned.getSpans(0, spanned.length(), Object.class);
            int length = spans != null ? spans.length : 0;
            if (length > 0) {
                ArrayDeque arrayDeque = this.f59494b;
                if (!z11) {
                    for (int i11 = 0; i11 < length; i11++) {
                        Object obj = spans[i11];
                        arrayDeque.push(new n(obj, spanned.getSpanStart(obj) + i5, spanned.getSpanEnd(obj) + i5, spanned.getSpanFlags(obj)));
                    }
                    return;
                }
                for (int i12 = length - 1; i12 >= 0; i12--) {
                    Object obj2 = spans[i12];
                    arrayDeque.push(new n(obj2, spanned.getSpanStart(obj2) + i5, spanned.getSpanEnd(obj2) + i5, spanned.getSpanFlags(obj2)));
                }
            }
        }
    }

    @Override // java.lang.CharSequence
    public final char charAt(int i5) {
        return this.f59493a.charAt(i5);
    }

    @Override // java.lang.CharSequence
    public final int length() {
        return this.f59493a.length();
    }

    @Override // java.lang.CharSequence
    public final CharSequence subSequence(int i5, int i11) {
        List<n> listUnmodifiableList;
        int i12;
        StringBuilder sb2 = this.f59493a;
        int length = sb2.length();
        if (i11 <= i5 || i5 < 0 || i11 > length) {
            listUnmodifiableList = Collections.EMPTY_LIST;
        } else {
            ArrayDeque arrayDeque = this.f59494b;
            if (i5 == 0 && length == i11) {
                ArrayList arrayList = new ArrayList(arrayDeque);
                Collections.reverse(arrayList);
                listUnmodifiableList = Collections.unmodifiableList(arrayList);
            } else {
                ArrayList arrayList2 = new ArrayList(0);
                Iterator itDescendingIterator = arrayDeque.descendingIterator();
                while (itDescendingIterator.hasNext()) {
                    n nVar = (n) itDescendingIterator.next();
                    int i13 = nVar.f59490b;
                    if ((i13 >= i5 && i13 < i11) || (((i12 = nVar.f59491c) <= i11 && i12 > i5) || (i13 < i5 && i12 > i11))) {
                        arrayList2.add(nVar);
                    }
                }
                listUnmodifiableList = Collections.unmodifiableList(arrayList2);
            }
        }
        if (listUnmodifiableList.isEmpty()) {
            return sb2.subSequence(i5, i11);
        }
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(sb2.subSequence(i5, i11));
        int length2 = spannableStringBuilder.length();
        for (n nVar2 : listUnmodifiableList) {
            int iMax = Math.max(0, nVar2.f59490b - i5);
            spannableStringBuilder.setSpan(nVar2.f59489a, iMax, Math.min(length2, (nVar2.f59491c - nVar2.f59490b) + iMax), nVar2.f59492d);
        }
        return spannableStringBuilder;
    }

    @Override // java.lang.CharSequence
    public final String toString() {
        return this.f59493a.toString();
    }

    @Override // java.lang.Appendable
    public final Appendable append(CharSequence charSequence, int i5, int i11) {
        CharSequence charSequenceSubSequence = charSequence.subSequence(i5, i11);
        StringBuilder sb2 = this.f59493a;
        b(sb2.length(), charSequenceSubSequence);
        sb2.append(charSequenceSubSequence);
        return this;
    }

    @Override // java.lang.Appendable
    public final Appendable append(CharSequence charSequence) {
        StringBuilder sb2 = this.f59493a;
        b(sb2.length(), charSequence);
        sb2.append(charSequence);
        return this;
    }
}
