package defpackage;

import java.util.Iterator;
import java.util.regex.Matcher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class btg implements Iterator {
    public String b;
    public final CharSequence c;
    public final /* synthetic */ int f;
    public final /* synthetic */ Object g;
    public int a = 2;
    public int d = 0;
    public int e = Integer.MAX_VALUE;

    public btg(wjc wjcVar, CharSequence charSequence, Object obj, int i) {
        this.f = i;
        this.g = obj;
        this.c = charSequence;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        String string;
        int iEnd;
        int i = this.a;
        if (i == 4) {
            lg8.d();
            return false;
        }
        int i2 = i - 1;
        if (i2 == 0) {
            return true;
        }
        if (i2 != 2) {
            this.a = 4;
            int i3 = this.d;
            while (true) {
                int iStart = this.d;
                if (iStart != -1) {
                    int i4 = this.f;
                    CharSequence charSequence = this.c;
                    Object obj = this.g;
                    switch (i4) {
                        case 0:
                            Matcher matcher = (Matcher) ((nec) obj).b;
                            iStart = !matcher.find(iStart) ? -1 : matcher.start();
                            break;
                        default:
                            j6g j6gVar = (j6g) obj;
                            int length = charSequence.length();
                            if (iStart >= 0 && iStart <= length) {
                                while (iStart < length) {
                                    if (!(charSequence.charAt(iStart) == j6gVar.b)) {
                                        iStart++;
                                    }
                                    break;
                                }
                            } else {
                                z10.i(ok7.O(iStart, length, "index"));
                                iStart = 0;
                            }
                            break;
                    }
                    if (iStart == -1) {
                        iStart = charSequence.length();
                        this.d = -1;
                        iEnd = -1;
                    } else {
                        switch (i4) {
                            case 0:
                                iEnd = ((Matcher) ((nec) obj).b).end();
                                break;
                            default:
                                iEnd = iStart + 1;
                                break;
                        }
                        this.d = iEnd;
                    }
                    if (iEnd == i3) {
                        int i5 = iEnd + 1;
                        this.d = i5;
                        if (i5 > charSequence.length()) {
                            this.d = -1;
                        }
                    } else {
                        if (i3 < iStart) {
                            charSequence.charAt(i3);
                        }
                        if (iStart > i3) {
                            charSequence.charAt(iStart - 1);
                        }
                        int i6 = this.e;
                        if (i6 == 1) {
                            iStart = charSequence.length();
                            this.d = -1;
                            if (iStart > i3) {
                                charSequence.charAt(iStart - 1);
                            }
                        } else {
                            this.e = i6 - 1;
                        }
                        string = charSequence.subSequence(i3, iStart).toString();
                    }
                } else {
                    this.a = 3;
                    string = null;
                }
            }
            this.b = string;
            if (this.a != 3) {
                this.a = 1;
                return true;
            }
        }
        return false;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            ywb.n();
            return null;
        }
        this.a = 2;
        String str = this.b;
        this.b = null;
        return str;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }
}
