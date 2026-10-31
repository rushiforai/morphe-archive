package com.facebook.ads.redexgen.X;

import android.text.Layout;
import java.util.Comparator;

/* renamed from: com.facebook.ads.redexgen.X.ba, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1511ba {
    public static String[] A02 = {"rDZHST5SRHhT1EGWJY5b43Pu6xH8Nu0f", "ANWXJQhqjTMeXSDmEDDzGZ2F3QelD9zK", "IvEqAJTC0cGoM7EjdnVAccNRQ5425EdX", "PyaJEHj4RQqfucJT0y2fJlBrbNuWbIle", "NR1yOPVRLR2TvdgiOhZJ9hURmR1ECghp", "0x4i4Gcdw9ziy2L2UFpwaHIuTG8Na5AZ", "W9W9yQjhujKCuViLN7JX9pBUfm1YLnZd", "jNusheCEHEDQwMvn7U3eFvzJJQIUfYdQ"};
    public static final Comparator<C1511ba> A03 = new Comparator() { // from class: com.facebook.ads.redexgen.X.bZ
        @Override // java.util.Comparator
        public final int compare(Object obj, Object obj2) {
            return Integer.compare(((C1511ba) obj2).A00, ((C1511ba) obj).A00);
        }
    };
    public final int A00;
    public final C1251Th A01;

    public C1511ba(CharSequence charSequence, Layout.Alignment alignment, float f11, int i5, int i11, float f12, int i12, float f13, boolean z11, int i13, int i14) {
        C1052Ld cueBuilder = new C1052Ld().A0G(charSequence).A0F(alignment).A07(f11, i5).A09(i11).A04(f12).A0A(i12).A06(f13);
        if (z11) {
            cueBuilder.A0C(i13);
        }
        this.A01 = cueBuilder.A0H();
        this.A00 = i14;
    }

    public static /* synthetic */ Comparator A01() {
        Comparator<C1511ba> comparator = A03;
        if (A02[4].charAt(11) != 'T') {
            throw new RuntimeException();
        }
        String[] strArr = A02;
        strArr[7] = "oNQv1xNd4q0J4q1apCs9eSyUuvFsewhq";
        strArr[1] = "6NCmUAoYGh99Jki2l20l5bjfE1NrLyzZ";
        return comparator;
    }
}
