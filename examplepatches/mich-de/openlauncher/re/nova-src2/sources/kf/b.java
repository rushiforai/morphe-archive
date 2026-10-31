package kf;

import android.text.Layout;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.text.style.UnderlineSpan;
import java.util.ArrayList;
import wf.v;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f71454a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f71455b;

    /* renamed from: c, reason: collision with root package name */
    public final StringBuilder f71456c;

    /* renamed from: d, reason: collision with root package name */
    public int f71457d;

    /* renamed from: e, reason: collision with root package name */
    public int f71458e;

    /* renamed from: f, reason: collision with root package name */
    public int f71459f;

    /* renamed from: g, reason: collision with root package name */
    public int f71460g;

    /* renamed from: h, reason: collision with root package name */
    public int f71461h;

    public b(int i5, int i11) {
        ArrayList arrayList = new ArrayList();
        this.f71454a = arrayList;
        ArrayList arrayList2 = new ArrayList();
        this.f71455b = arrayList2;
        StringBuilder sb2 = new StringBuilder();
        this.f71456c = sb2;
        this.f71460g = i5;
        arrayList.clear();
        arrayList2.clear();
        sb2.setLength(0);
        this.f71457d = 15;
        this.f71458e = 0;
        this.f71459f = 0;
        this.f71461h = i11;
    }

    public final void a(char c11) {
        StringBuilder sb2 = this.f71456c;
        if (sb2.length() < 32) {
            sb2.append(c11);
        }
    }

    public final void b() {
        StringBuilder sb2 = this.f71456c;
        int length = sb2.length();
        if (length > 0) {
            sb2.delete(length - 1, length);
            ArrayList arrayList = this.f71454a;
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                a aVar = (a) arrayList.get(size);
                int i5 = aVar.f71453c;
                if (i5 != length) {
                    return;
                }
                aVar.f71453c = i5 - 1;
            }
        }
    }

    public final jf.b c(int i5) {
        float f11;
        int i11 = this.f71458e + this.f71459f;
        int i12 = 32 - i11;
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        int i13 = 0;
        while (true) {
            ArrayList arrayList = this.f71455b;
            if (i13 >= arrayList.size()) {
                break;
            }
            CharSequence charSequenceSubSequence = (CharSequence) arrayList.get(i13);
            int i14 = v.f94376a;
            if (charSequenceSubSequence.length() > i12) {
                charSequenceSubSequence = charSequenceSubSequence.subSequence(0, i12);
            }
            spannableStringBuilder.append(charSequenceSubSequence);
            spannableStringBuilder.append('\n');
            i13++;
        }
        SpannableString spannableStringD = d();
        int i15 = v.f94376a;
        int length = spannableStringD.length();
        CharSequence charSequenceSubSequence2 = spannableStringD;
        if (length > i12) {
            charSequenceSubSequence2 = spannableStringD.subSequence(0, i12);
        }
        spannableStringBuilder.append(charSequenceSubSequence2);
        if (spannableStringBuilder.length() == 0) {
            return null;
        }
        int length2 = i12 - spannableStringBuilder.length();
        int i16 = i11 - length2;
        int i17 = i5 != Integer.MIN_VALUE ? i5 : (this.f71460g != 2 || (Math.abs(i16) >= 3 && length2 >= 0)) ? (this.f71460g != 2 || i16 <= 0) ? 0 : 2 : 1;
        if (i17 != 1) {
            if (i17 == 2) {
                i11 = 32 - length2;
            }
            f11 = ((i11 / 32.0f) * 0.8f) + 0.1f;
        } else {
            f11 = 0.5f;
        }
        float f12 = f11;
        int i18 = this.f71457d;
        if (i18 > 7) {
            i18 -= 17;
        } else if (this.f71460g == 1) {
            i18 -= this.f71461h - 1;
        }
        return new jf.b(spannableStringBuilder, Layout.Alignment.ALIGN_NORMAL, null, null, i18, 1, Integer.MIN_VALUE, f12, i17, Integer.MIN_VALUE, -3.4028235E38f, -3.4028235E38f, -3.4028235E38f, false, -16777216, Integer.MIN_VALUE, 0.0f);
    }

    public final SpannableString d() {
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(this.f71456c);
        int length = spannableStringBuilder.length();
        int i5 = -1;
        int i11 = -1;
        int i12 = -1;
        int i13 = -1;
        int i14 = 0;
        int i15 = 0;
        boolean z11 = false;
        while (true) {
            ArrayList arrayList = this.f71454a;
            if (i14 >= arrayList.size()) {
                break;
            }
            a aVar = (a) arrayList.get(i14);
            boolean z12 = aVar.f71452b;
            int i16 = aVar.f71451a;
            if (i16 != 8) {
                boolean z13 = i16 == 7;
                if (i16 != 7) {
                    i13 = c.A[i16];
                }
                z11 = z13;
            }
            int i17 = aVar.f71453c;
            i14++;
            if (i17 != (i14 < arrayList.size() ? ((a) arrayList.get(i14)).f71453c : length)) {
                if (i5 != -1 && !z12) {
                    spannableStringBuilder.setSpan(new UnderlineSpan(), i5, i17, 33);
                    i5 = -1;
                } else if (i5 == -1 && z12) {
                    i5 = i17;
                }
                if (i11 != -1 && !z11) {
                    spannableStringBuilder.setSpan(new StyleSpan(2), i11, i17, 33);
                    i11 = -1;
                } else if (i11 == -1 && z11) {
                    i11 = i17;
                }
                if (i13 != i12) {
                    if (i12 != -1) {
                        spannableStringBuilder.setSpan(new ForegroundColorSpan(i12), i15, i17, 33);
                    }
                    i12 = i13;
                    i15 = i17;
                }
            }
        }
        if (i5 != -1 && i5 != length) {
            spannableStringBuilder.setSpan(new UnderlineSpan(), i5, length, 33);
        }
        if (i11 != -1 && i11 != length) {
            spannableStringBuilder.setSpan(new StyleSpan(2), i11, length, 33);
        }
        if (i15 != length && i12 != -1) {
            spannableStringBuilder.setSpan(new ForegroundColorSpan(i12), i15, length, 33);
        }
        return new SpannableString(spannableStringBuilder);
    }

    public final boolean e() {
        return this.f71454a.isEmpty() && this.f71455b.isEmpty() && this.f71456c.length() == 0;
    }
}
