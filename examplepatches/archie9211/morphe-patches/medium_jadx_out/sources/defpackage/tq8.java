package defpackage;

import android.text.Editable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tq8 extends wq8 {
    @Override // defpackage.wq8
    public final void onCharacterAdded(Editable editable, int i) {
        editable.getClass();
        int i2 = i - 1;
        boolean z = false;
        char[] cArr = {':'};
        if (i2 >= 0 && i2 < editable.length()) {
            char cCharAt = editable.charAt(i2);
            int length = cArr.length;
            int i3 = 0;
            while (true) {
                if (i3 >= length) {
                    break;
                }
                if (cCharAt == cArr[i3]) {
                    z = true;
                    break;
                }
                i3++;
            }
        }
        if (z) {
            editable.replace(i2, i + 1, "☺️");
        }
    }
}
