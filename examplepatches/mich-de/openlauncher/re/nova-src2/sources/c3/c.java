package c3;

import java.text.BreakIterator;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class c extends b {

    /* renamed from: i, reason: collision with root package name */
    public static c f19234i;

    /* renamed from: j, reason: collision with root package name */
    public static c f19235j;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f19236g;

    /* renamed from: h, reason: collision with root package name */
    public BreakIterator f19237h;

    public /* synthetic */ c(int i5) {
        this.f19236g = i5;
    }

    public boolean E(int i5) {
        if (i5 <= 0 || !F(i5 - 1)) {
            return false;
        }
        return i5 == p().length() || !F(i5);
    }

    public boolean F(int i5) {
        if (i5 < 0 || i5 >= p().length()) {
            return false;
        }
        return Character.isLetterOrDigit(p().codePointAt(i5));
    }

    @Override // c3.b
    public final int[] k(int i5) {
        switch (this.f19236g) {
            case 0:
                int length = p().length();
                if (length <= 0 || i5 >= length) {
                    return null;
                }
                if (i5 < 0) {
                    i5 = 0;
                }
                do {
                    BreakIterator breakIterator = this.f19237h;
                    if (breakIterator == null) {
                        Intrinsics.m("impl");
                        throw null;
                    }
                    if (breakIterator.isBoundary(i5)) {
                        BreakIterator breakIterator2 = this.f19237h;
                        if (breakIterator2 == null) {
                            Intrinsics.m("impl");
                            throw null;
                        }
                        int iFollowing = breakIterator2.following(i5);
                        if (iFollowing == -1) {
                            return null;
                        }
                        return o(i5, iFollowing);
                    }
                    BreakIterator breakIterator3 = this.f19237h;
                    if (breakIterator3 == null) {
                        Intrinsics.m("impl");
                        throw null;
                    }
                    i5 = breakIterator3.following(i5);
                } while (i5 != -1);
                return null;
            default:
                if (p().length() <= 0 || i5 >= p().length()) {
                    return null;
                }
                if (i5 < 0) {
                    i5 = 0;
                }
                while (!F(i5) && (!F(i5) || (i5 != 0 && F(i5 - 1)))) {
                    BreakIterator breakIterator4 = this.f19237h;
                    if (breakIterator4 == null) {
                        Intrinsics.m("impl");
                        throw null;
                    }
                    i5 = breakIterator4.following(i5);
                    if (i5 == -1) {
                        return null;
                    }
                }
                BreakIterator breakIterator5 = this.f19237h;
                if (breakIterator5 == null) {
                    Intrinsics.m("impl");
                    throw null;
                }
                int iFollowing2 = breakIterator5.following(i5);
                if (iFollowing2 == -1 || !E(iFollowing2)) {
                    return null;
                }
                return o(i5, iFollowing2);
        }
    }

    @Override // c3.b
    public final void q(String str) {
        switch (this.f19236g) {
            case 0:
                this.f19222a = str;
                BreakIterator breakIterator = this.f19237h;
                if (breakIterator != null) {
                    breakIterator.setText(str);
                    return;
                } else {
                    Intrinsics.m("impl");
                    throw null;
                }
            default:
                this.f19222a = str;
                BreakIterator breakIterator2 = this.f19237h;
                if (breakIterator2 != null) {
                    breakIterator2.setText(str);
                    return;
                } else {
                    Intrinsics.m("impl");
                    throw null;
                }
        }
    }

    @Override // c3.b
    public final int[] y(int i5) {
        switch (this.f19236g) {
            case 0:
                int length = p().length();
                if (length <= 0 || i5 <= 0) {
                    return null;
                }
                if (i5 > length) {
                    i5 = length;
                }
                do {
                    BreakIterator breakIterator = this.f19237h;
                    if (breakIterator == null) {
                        Intrinsics.m("impl");
                        throw null;
                    }
                    if (breakIterator.isBoundary(i5)) {
                        BreakIterator breakIterator2 = this.f19237h;
                        if (breakIterator2 == null) {
                            Intrinsics.m("impl");
                            throw null;
                        }
                        int iPreceding = breakIterator2.preceding(i5);
                        if (iPreceding == -1) {
                            return null;
                        }
                        return o(iPreceding, i5);
                    }
                    BreakIterator breakIterator3 = this.f19237h;
                    if (breakIterator3 == null) {
                        Intrinsics.m("impl");
                        throw null;
                    }
                    i5 = breakIterator3.preceding(i5);
                } while (i5 != -1);
                return null;
            default:
                int length2 = p().length();
                if (length2 <= 0 || i5 <= 0) {
                    return null;
                }
                if (i5 > length2) {
                    i5 = length2;
                }
                while (i5 > 0 && !F(i5 - 1) && !E(i5)) {
                    BreakIterator breakIterator4 = this.f19237h;
                    if (breakIterator4 == null) {
                        Intrinsics.m("impl");
                        throw null;
                    }
                    i5 = breakIterator4.preceding(i5);
                    if (i5 == -1) {
                        return null;
                    }
                }
                BreakIterator breakIterator5 = this.f19237h;
                if (breakIterator5 == null) {
                    Intrinsics.m("impl");
                    throw null;
                }
                int iPreceding2 = breakIterator5.preceding(i5);
                if (iPreceding2 == -1 || !F(iPreceding2)) {
                    return null;
                }
                if (iPreceding2 == 0 || !F(iPreceding2 - 1)) {
                    return o(iPreceding2, i5);
                }
                return null;
        }
    }
}
