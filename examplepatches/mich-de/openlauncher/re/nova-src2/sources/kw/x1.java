package kw;

import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x1 implements r3.s {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ y1 f72731a;

    public x1(y1 y1Var) {
        this.f72731a = y1Var;
    }

    @Override // r3.s
    public final int m(int i5) throws IOException {
        String str = this.f72731a.f72734c.f72703c;
        if (str == null) {
            return i5;
        }
        if (i5 == 0) {
            return 0;
        }
        String strSubstring = str.substring(0, Math.min(i5, str.length()));
        Intrinsics.f(strSubstring, "substring(...)");
        StringBuilder sb2 = new StringBuilder();
        int length = strSubstring.length();
        for (int i11 = 0; i11 < length; i11++) {
            char cCharAt = strSubstring.charAt(i11);
            if (cCharAt != '#') {
                sb2.append(cCharAt);
            }
        }
        int length2 = sb2.toString().length();
        if (i5 > str.length()) {
            length2++;
        }
        return i5 - length2;
    }

    @Override // r3.s
    public final int o(int i5) {
        String str = this.f72731a.f72734c.f72703c;
        if (str == null) {
            return i5;
        }
        if (i5 == 0) {
            return 0;
        }
        int i11 = 0;
        int i12 = 0;
        int i13 = -1;
        for (int i14 = 0; i14 < str.length(); i14++) {
            i11++;
            if (str.charAt(i14) == '#' && (i12 = i12 + 1) == i5) {
                i13 = i11;
            }
        }
        return i13 == -1 ? (i5 - i12) + str.length() + 1 : i13;
    }
}
