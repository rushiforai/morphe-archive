package r10;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k1 extends m1 {
    @Override // r10.m1
    public final boolean i(String str) {
        if (!r70.j.I0(str, "1Z", false)) {
            return false;
        }
        String strSubstring = str.substring(2, str.length());
        Intrinsics.f(strSubstring, "substring(...)");
        return m1.a(2, 1, strSubstring);
    }
}
