package hq;

import b.c0;
import com.stripe.android.cards.Bin;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f extends h {

    /* renamed from: i, reason: collision with root package name */
    public static final Set f59962i = kotlin.collections.c.f1(new Character[]{'-', ' '});

    /* renamed from: c, reason: collision with root package name */
    public final String f59963c;

    /* renamed from: d, reason: collision with root package name */
    public final String f59964d;

    /* renamed from: e, reason: collision with root package name */
    public final int f59965e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f59966f;

    /* renamed from: g, reason: collision with root package name */
    public final Bin f59967g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f59968h;

    public f(String denormalized) throws IOException {
        Intrinsics.g(denormalized, "denormalized");
        this.f59963c = denormalized;
        StringBuilder sb2 = new StringBuilder();
        boolean z11 = false;
        for (int i5 = 0; i5 < denormalized.length(); i5++) {
            char cCharAt = denormalized.charAt(i5);
            if (!f59962i.contains(Character.valueOf(cCharAt))) {
                sb2.append(cCharAt);
            }
        }
        String cardNumber = sb2.toString();
        this.f59964d = cardNumber;
        int length = cardNumber.length();
        this.f59965e = length;
        this.f59966f = length == 19;
        Intrinsics.g(cardNumber, "cardNumber");
        String strG1 = r70.l.G1(6, cardNumber);
        strG1 = strG1.length() != 6 ? null : strG1;
        this.f59967g = strG1 != null ? new Bin(strG1) : null;
        if (cardNumber != null) {
            int length2 = cardNumber.length() - 1;
            int i11 = 0;
            boolean z12 = true;
            while (true) {
                if (-1 < length2) {
                    char cCharAt2 = cardNumber.charAt(length2);
                    if (!Character.isDigit(cCharAt2)) {
                        break;
                    }
                    int numericValue = Character.getNumericValue(cCharAt2);
                    boolean z13 = !z12;
                    numericValue = z12 ? numericValue : numericValue * 2;
                    if (numericValue > 9) {
                        numericValue -= 9;
                    }
                    i11 += numericValue;
                    length2--;
                    z12 = z13;
                } else if (i11 % 10 == 0) {
                    z11 = true;
                }
            }
        }
        this.f59968h = z11;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.Map] */
    public final String a(int i5) {
        Set set = (Set) h.f59971b.get(Integer.valueOf(i5));
        if (set == null) {
            set = h.f59970a;
        }
        String strG1 = r70.l.G1(i5, this.f59964d);
        int size = set.size() + 1;
        String[] strArr = new String[size];
        int length = strG1.length();
        Iterator it = b70.g.C1(b70.g.I1(set)).iterator();
        int i11 = 0;
        int i12 = 0;
        while (true) {
            if (!it.hasNext()) {
                int i13 = 0;
                while (true) {
                    if (i13 >= size) {
                        i13 = -1;
                        break;
                    }
                    if (strArr[i13] == null) {
                        break;
                    }
                    i13++;
                }
                Integer numValueOf = i13 != -1 ? Integer.valueOf(i13) : null;
                if (numValueOf != null) {
                    int iIntValue = numValueOf.intValue();
                    String strSubstring = strG1.substring(i12);
                    Intrinsics.f(strSubstring, "substring(...)");
                    strArr[iIntValue] = strSubstring;
                }
                ArrayList arrayList = new ArrayList();
                for (int i14 = 0; i14 < size; i14++) {
                    String str = strArr[i14];
                    if (str == null) {
                        break;
                    }
                    arrayList.add(str);
                }
                return b70.g.f1(arrayList, " ", null, null, 0, null, 62);
            }
            Object next = it.next();
            int i15 = i11 + 1;
            if (i11 < 0) {
                ul.b.e0();
                throw null;
            }
            int iIntValue2 = ((Number) next).intValue() - i11;
            if (length > iIntValue2) {
                String strSubstring2 = strG1.substring(i12, iIntValue2);
                Intrinsics.f(strSubstring2, "substring(...)");
                strArr[i11] = strSubstring2;
                i12 = iIntValue2;
            }
            i11 = i15;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f) && Intrinsics.b(this.f59963c, ((f) obj).f59963c);
    }

    public final int hashCode() {
        return this.f59963c.hashCode();
    }

    public final String toString() {
        return c0.l("Unvalidated(denormalized=", this.f59963c, ")");
    }
}
