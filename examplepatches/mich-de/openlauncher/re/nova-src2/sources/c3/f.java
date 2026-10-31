package c3;

/* loaded from: classes2.dex */
public final class f extends b {

    /* renamed from: g, reason: collision with root package name */
    public static f f19276g;

    public final boolean E(int i5) {
        if (i5 <= 0 || p().charAt(i5 - 1) == '\n') {
            return false;
        }
        return i5 == p().length() || p().charAt(i5) == '\n';
    }

    @Override // c3.b
    public final int[] k(int i5) {
        int length = p().length();
        if (length <= 0 || i5 >= length) {
            return null;
        }
        if (i5 < 0) {
            i5 = 0;
        }
        while (i5 < length && p().charAt(i5) == '\n' && (p().charAt(i5) == '\n' || (i5 != 0 && p().charAt(i5 - 1) != '\n'))) {
            i5++;
        }
        if (i5 >= length) {
            return null;
        }
        int i11 = i5 + 1;
        while (i11 < length && !E(i11)) {
            i11++;
        }
        return o(i5, i11);
    }

    @Override // c3.b
    public final int[] y(int i5) {
        int length = p().length();
        if (length <= 0 || i5 <= 0) {
            return null;
        }
        if (i5 > length) {
            i5 = length;
        }
        while (i5 > 0 && p().charAt(i5 - 1) == '\n' && !E(i5)) {
            i5--;
        }
        if (i5 <= 0) {
            return null;
        }
        int i11 = i5 - 1;
        while (i11 > 0 && (p().charAt(i11) == '\n' || (i11 != 0 && p().charAt(i11 - 1) != '\n'))) {
            i11--;
        }
        return o(i11, i5);
    }
}
