package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r4 extends n4 {
    public static r4 c;

    @Override // defpackage.n4
    public final int[] f(int i) {
        int length = j().length();
        if (length <= 0 || i >= length) {
            return null;
        }
        if (i < 0) {
            i = 0;
        }
        while (i < length && j().charAt(i) == '\n' && (j().charAt(i) == '\n' || (i != 0 && j().charAt(i - 1) != '\n'))) {
            i++;
        }
        if (i >= length) {
            return null;
        }
        int i2 = i + 1;
        while (i2 < length && !u(i2)) {
            i2++;
        }
        return i(i, i2);
    }

    @Override // defpackage.n4
    public final int[] r(int i) {
        int length = j().length();
        if (length <= 0 || i <= 0) {
            return null;
        }
        if (i > length) {
            i = length;
        }
        while (i > 0 && j().charAt(i - 1) == '\n' && !u(i)) {
            i--;
        }
        if (i <= 0) {
            return null;
        }
        int i2 = i - 1;
        while (i2 > 0 && (j().charAt(i2) == '\n' || (i2 != 0 && j().charAt(i2 - 1) != '\n'))) {
            i2--;
        }
        return i(i2, i);
    }

    public final boolean u(int i) {
        if (i <= 0 || j().charAt(i - 1) == '\n') {
            return false;
        }
        return i == j().length() || j().charAt(i) == '\n';
    }
}
