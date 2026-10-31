package cw;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g1 implements r3.i0 {
    @Override // r3.i0
    public final r3.f0 a(m3.g text) {
        Intrinsics.g(text, "text");
        String str = text.f75880b;
        int length = str.length();
        String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        for (int i5 = 0; i5 < length; i5++) {
            str2 = str2 + str.charAt(i5);
            if (i5 == 3 || i5 == 9) {
                str2 = str2 + ' ';
            }
        }
        return new r3.f0(new m3.g(str2), new w(3));
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof g1);
    }

    public final int hashCode() {
        return Character.hashCode(' ');
    }

    public final String toString() {
        return "FourteenAndFifteenPanLength(separator= )";
    }
}
