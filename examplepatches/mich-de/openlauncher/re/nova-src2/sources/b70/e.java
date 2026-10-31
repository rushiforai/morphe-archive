package b70;

import b.u4;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;

/* loaded from: classes.dex */
public abstract class e extends d {
    public static final int J0(int i5, List list) {
        if (i5 >= 0 && i5 <= ul.b.K(list)) {
            return ul.b.K(list) - i5;
        }
        StringBuilder sbJ = u4.j(i5, "Element index ", " must be in range [");
        sbJ.append(new IntRange(0, ul.b.K(list), 1));
        sbJ.append("].");
        throw new IndexOutOfBoundsException(sbJ.toString());
    }

    public static final int K0(int i5, List list) {
        if (i5 >= 0 && i5 <= list.size()) {
            return list.size() - i5;
        }
        StringBuilder sbJ = u4.j(i5, "Position index ", " must be in range [");
        sbJ.append(new IntRange(0, list.size(), 1));
        sbJ.append("].");
        throw new IndexOutOfBoundsException(sbJ.toString());
    }

    public static m L0(List list) {
        Intrinsics.g(list, "<this>");
        return new m(list);
    }
}
