package r10;

import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d1 extends m1 {
    @Override // r10.m1
    public final boolean i(String str) {
        if (r70.j.I0(str, "33", false)) {
            if (Intrinsics.b(Locale.getDefault().getCountry(), "AU") && (str.length() == 12 || str.length() == 23)) {
                return true;
            }
        } else if (str.length() == 10) {
            return Intrinsics.b(Locale.getDefault().getCountry(), "AU");
        }
        return false;
    }
}
