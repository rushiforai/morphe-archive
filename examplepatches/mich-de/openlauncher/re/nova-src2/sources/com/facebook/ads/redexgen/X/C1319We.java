package com.facebook.ads.redexgen.X;

import androidx.compose.ui.node.LayoutNode;
import com.google.common.base.ElementTypesAreNonnullByDefault;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.We, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1319We {
    public static String[] A04 = {"GDF7LT9zaN1tQTqlfLNLfAIfOtG9s0hL", "1cIEi", "LEB4R7gs6bsfmRbxrEjZlrEpKVzBfHoW", "GRwMr", "vE3lOApuJipIWEcGhcTLuWUdfiSHNcaM", "VHJbobYshQpQJc84hdTVV33YzEjVEGH4", "BPjDLgO1rk9tBxxzuhgjx7EasFoI5ksj", "We4pisMx0yRYlbPFur3a9KCcHEHqNzeD"};
    public final int A00;
    public final A7 A01;
    public final InterfaceC1321Wg A02;
    public final boolean A03;

    public C1319We(InterfaceC1321Wg strategy) {
        this(strategy, false, A7.A03(), LayoutNode.NotPlacedPlaceOrder);
    }

    public C1319We(InterfaceC1321Wg strategy, boolean omitEmptyStrings, A7 trimmer, int limit) {
        this.A02 = strategy;
        this.A03 = omitEmptyStrings;
        this.A01 = trimmer;
        this.A00 = limit;
    }

    public static C1319We A02(char separator) {
        return A03(A7.A02(separator));
    }

    public static C1319We A03(final A7 separatorMatcher) {
        AbstractC1335Wu.A04(separatorMatcher);
        return new C1319We(new A4(separatorMatcher));
    }

    private Iterator<String> A04(CharSequence sequence) {
        return this.A02.ABT(this, sequence);
    }

    public final List<String> A06(CharSequence sequence) {
        AbstractC1335Wu.A04(sequence);
        Iterator<String> itA04 = A04(sequence);
        ArrayList arrayList = new ArrayList();
        while (true) {
            boolean zHasNext = itA04.hasNext();
            String[] strArr = A04;
            if (strArr[7].charAt(8) == strArr[5].charAt(8)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A04;
            strArr2[7] = "8TlqMoe7Qz8AAdZs3cRhuRffJeUXlyVi";
            strArr2[5] = "2lJKwnsTF8A7HJC30NZyYWaavFcWeBv2";
            if (zHasNext) {
                arrayList.add(itA04.next());
            } else {
                return Collections.unmodifiableList(arrayList);
            }
        }
    }
}
