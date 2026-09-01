package defpackage;

import java.text.BreakIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o4 extends n4 {
    public static o4 e;
    public static o4 f;
    public final /* synthetic */ int c;
    public BreakIterator d;

    @Override // defpackage.n4
    public final int[] f(int i) {
        switch (this.c) {
            case 0:
                int length = j().length();
                if (length <= 0 || i >= length) {
                    return null;
                }
                if (i < 0) {
                    i = 0;
                }
                do {
                    BreakIterator breakIterator = this.d;
                    if (breakIterator == null) {
                        g76.g0("impl");
                        throw null;
                    }
                    boolean zIsBoundary = breakIterator.isBoundary(i);
                    BreakIterator breakIterator2 = this.d;
                    if (zIsBoundary) {
                        if (breakIterator2 == null) {
                            g76.g0("impl");
                            throw null;
                        }
                        int iFollowing = breakIterator2.following(i);
                        if (iFollowing == -1) {
                            return null;
                        }
                        return i(i, iFollowing);
                    }
                    if (breakIterator2 == null) {
                        g76.g0("impl");
                        throw null;
                    }
                    i = breakIterator2.following(i);
                } while (i != -1);
                return null;
            default:
                if (j().length() <= 0 || i >= j().length()) {
                    return null;
                }
                if (i < 0) {
                    i = 0;
                }
                while (!w(i) && (!w(i) || (i != 0 && w(i - 1)))) {
                    BreakIterator breakIterator3 = this.d;
                    if (breakIterator3 == null) {
                        g76.g0("impl");
                        throw null;
                    }
                    i = breakIterator3.following(i);
                    if (i == -1) {
                        return null;
                    }
                }
                BreakIterator breakIterator4 = this.d;
                if (breakIterator4 == null) {
                    g76.g0("impl");
                    throw null;
                }
                int iFollowing2 = breakIterator4.following(i);
                if (iFollowing2 == -1 || !v(iFollowing2)) {
                    return null;
                }
                return i(i, iFollowing2);
        }
    }

    @Override // defpackage.n4
    public final int[] r(int i) {
        switch (this.c) {
            case 0:
                int length = j().length();
                if (length <= 0 || i <= 0) {
                    return null;
                }
                if (i > length) {
                    i = length;
                }
                do {
                    BreakIterator breakIterator = this.d;
                    if (breakIterator == null) {
                        g76.g0("impl");
                        throw null;
                    }
                    boolean zIsBoundary = breakIterator.isBoundary(i);
                    BreakIterator breakIterator2 = this.d;
                    if (zIsBoundary) {
                        if (breakIterator2 == null) {
                            g76.g0("impl");
                            throw null;
                        }
                        int iPreceding = breakIterator2.preceding(i);
                        if (iPreceding == -1) {
                            return null;
                        }
                        return i(iPreceding, i);
                    }
                    if (breakIterator2 == null) {
                        g76.g0("impl");
                        throw null;
                    }
                    i = breakIterator2.preceding(i);
                } while (i != -1);
                return null;
            default:
                int length2 = j().length();
                if (length2 <= 0 || i <= 0) {
                    return null;
                }
                if (i > length2) {
                    i = length2;
                }
                while (i > 0 && !w(i - 1) && !v(i)) {
                    BreakIterator breakIterator3 = this.d;
                    if (breakIterator3 == null) {
                        g76.g0("impl");
                        throw null;
                    }
                    i = breakIterator3.preceding(i);
                    if (i == -1) {
                        return null;
                    }
                }
                BreakIterator breakIterator4 = this.d;
                if (breakIterator4 == null) {
                    g76.g0("impl");
                    throw null;
                }
                int iPreceding2 = breakIterator4.preceding(i);
                if (iPreceding2 == -1 || !w(iPreceding2)) {
                    return null;
                }
                if (iPreceding2 == 0 || !w(iPreceding2 - 1)) {
                    return i(iPreceding2, i);
                }
                return null;
        }
    }

    public final void u(String str) {
        switch (this.c) {
            case 0:
                this.a = str;
                BreakIterator breakIterator = this.d;
                if (breakIterator != null) {
                    breakIterator.setText(str);
                    return;
                } else {
                    g76.g0("impl");
                    throw null;
                }
            default:
                this.a = str;
                BreakIterator breakIterator2 = this.d;
                if (breakIterator2 != null) {
                    breakIterator2.setText(str);
                    return;
                } else {
                    g76.g0("impl");
                    throw null;
                }
        }
    }

    public boolean v(int i) {
        if (i <= 0 || !w(i - 1)) {
            return false;
        }
        return i == j().length() || !w(i);
    }

    public boolean w(int i) {
        if (i < 0 || i >= j().length()) {
            return false;
        }
        return Character.isLetterOrDigit(j().codePointAt(i));
    }
}
