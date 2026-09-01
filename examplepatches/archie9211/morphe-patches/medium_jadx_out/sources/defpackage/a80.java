package defpackage;

import java.util.Arrays;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a80 extends x70 {
    public Object[] a;
    public int b;

    @Override // defpackage.x70
    public final int d() {
        return this.b;
    }

    @Override // defpackage.x70
    public final void f(int i, oy oyVar) {
        Object[] objArrCopyOf = this.a;
        if (objArrCopyOf.length <= i) {
            int length = objArrCopyOf.length;
            do {
                length *= 2;
            } while (length <= i);
            objArrCopyOf = Arrays.copyOf(this.a, length);
            this.a = objArrCopyOf;
        }
        if (objArrCopyOf[i] == null) {
            this.b++;
        }
        objArrCopyOf[i] = oyVar;
    }

    @Override // defpackage.x70
    public final Object get(int i) {
        return k80.y0(i, this.a);
    }

    @Override // defpackage.x70, java.lang.Iterable
    public final Iterator iterator() {
        return new z70(this);
    }
}
