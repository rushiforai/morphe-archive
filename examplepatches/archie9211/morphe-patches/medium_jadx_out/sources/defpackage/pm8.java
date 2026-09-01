package defpackage;

import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class pm8 {
    public static final Object[] a = new Object[0];
    public static final x68 b = new x68(0);

    public static final void a(int i, List list) {
        int size = list.size();
        if (i < 0 || i >= size) {
            z10.i(ev6.s(i, size, "Index ", " is out of bounds. The list has ", " elements."));
        }
    }

    public static final void b(int i, int i2, List list) {
        int size = list.size();
        if (i <= i2) {
            if (i >= 0) {
                if (i2 <= size) {
                    return;
                }
                throw new IndexOutOfBoundsException("toIndex (" + i2 + ") is more than than the list size (" + size + ')');
            }
            z10.i(ev6.w(pUlNWdybf.JookcXydMOx, i, ") is less than 0."));
            return;
        }
        ay0.e(ev6.s(i, i2, "Indices are out of order. fromIndex (", ") is greater than toIndex (", ")."));
    }
}
