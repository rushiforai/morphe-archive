package defpackage;

import android.text.Editable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mq8 extends wq8 {
    @Override // defpackage.wq8
    public final void onCharacterAdded(Editable editable, int i) {
        editable.getClass();
        int i2 = i - 2;
        gi7.a.getClass();
        char[] cArr = fi7.c;
        char c = '?';
        int i3 = -1;
        int i4 = 0;
        if (mk7.A(editable, i2, Arrays.copyOf(cArr, 13))) {
            int i5 = i - 1;
            if (mk7.A(editable, i5, '^')) {
                char cCharAt = editable.charAt(i);
                char[] cArr2 = fi7.d;
                while (true) {
                    if (i4 >= 13) {
                        break;
                    }
                    if (cCharAt == cArr[i4]) {
                        i3 = i4;
                        break;
                    }
                    i4++;
                }
                if (i3 >= 0 && i3 < 10) {
                    c = cArr2[i3];
                }
                editable.replace(i5, i + 1, String.valueOf(c));
                return;
            }
        }
        int i6 = i - 1;
        char[] cArr3 = fi7.d;
        if (!mk7.A(editable, i6, Arrays.copyOf(cArr3, 10))) {
            int i7 = i + 1;
            if (!mk7.A(editable, i7, Arrays.copyOf(cArr3, 10))) {
                if (mk7.A(editable, i6, '<') && mk7.A(editable, i, '3')) {
                    editable.replace(i6, i7, "❤");
                    return;
                }
                if (mk7.A(editable, i2, Arrays.copyOf(cArr, 13))) {
                    if (mk7.A(editable, i6, '-', 8212)) {
                        editable.replace(i6, i, "–");
                        return;
                    }
                    return;
                } else {
                    if (mk7.A(editable, i - 4, Arrays.copyOf(cArr, 13))) {
                        int i8 = i - 3;
                        if (mk7.A(editable, i8, ' ', 160, 8202) && mk7.A(editable, i2, 8212) && mk7.A(editable, i6, ' ', 160, 8202)) {
                            editable.replace(i8, i, "–");
                            return;
                        }
                        return;
                    }
                    return;
                }
            }
        }
        char cCharAt2 = editable.charAt(i);
        while (true) {
            if (i4 >= 13) {
                break;
            }
            if (cCharAt2 == cArr[i4]) {
                i3 = i4;
                break;
            }
            i4++;
        }
        if (i3 >= 0 && i3 < 10) {
            c = cArr3[i3];
        }
        editable.replace(i, i + 1, String.valueOf(c));
    }
}
