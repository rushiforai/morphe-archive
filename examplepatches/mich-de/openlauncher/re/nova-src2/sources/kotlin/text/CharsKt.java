package kotlin.text;

import kotlin.Metadata;

@Metadata(d1 = {"kotlin/text/a", "kotlin/text/CharsKt"}, d2 = {}, k = 4, mv = {2, 1, 0}, xi = 49)
/* loaded from: classes.dex */
public final class CharsKt extends a {
    private CharsKt() {
    }

    public static final boolean c(char c11, char c12, boolean z11) {
        if (c11 == c12) {
            return true;
        }
        if (!z11) {
            return false;
        }
        char upperCase = Character.toUpperCase(c11);
        char upperCase2 = Character.toUpperCase(c12);
        return upperCase == upperCase2 || Character.toLowerCase(upperCase) == Character.toLowerCase(upperCase2);
    }
}
