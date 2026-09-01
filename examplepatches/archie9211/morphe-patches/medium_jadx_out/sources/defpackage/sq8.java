package defpackage;

import android.text.Editable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sq8 extends wq8 {
    @Override // defpackage.wq8
    public final void onCharacterAdded(Editable editable, int i) {
        boolean z;
        editable.getClass();
        int i2 = i - 2;
        boolean z2 = false;
        char[] cArr = {'.'};
        if (i2 < 0 || i2 >= editable.length()) {
            z = false;
        } else {
            char cCharAt = editable.charAt(i2);
            for (char c : cArr) {
                if (cCharAt == c) {
                    z = true;
                    break;
                }
            }
            z = false;
        }
        if (z) {
            int i3 = i - 1;
            char[] cArr2 = {'.'};
            if (i3 >= 0 && i3 < editable.length()) {
                char cCharAt2 = editable.charAt(i3);
                int length = cArr2.length;
                int i4 = 0;
                while (true) {
                    if (i4 >= length) {
                        break;
                    }
                    if (cCharAt2 == cArr2[i4]) {
                        z2 = true;
                        break;
                    }
                    i4++;
                }
            }
            if (z2) {
                editable.replace(i2, i + 1, "…");
            }
        }
    }
}
