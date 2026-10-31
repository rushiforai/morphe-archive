package kotlin.text;

import b.u4;
import kotlin.ranges.IntRange;

/* loaded from: classes.dex */
public abstract class a {
    public static void a(int i5) {
        if (2 > i5 || i5 >= 37) {
            StringBuilder sbJ = u4.j(i5, "radix ", " was not in valid range ");
            sbJ.append(new IntRange(2, 36, 1));
            throw new IllegalArgumentException(sbJ.toString());
        }
    }

    public static boolean b(char c11) {
        return Character.isWhitespace(c11) || Character.isSpaceChar(c11);
    }
}
