package defpackage;

import android.view.View;
import android.view.ViewGroup;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class h1 implements Iterator, th6 {
    public final /* synthetic */ int a;
    public int b;
    public final Object c;

    public h1(Object[] objArr) {
        this.a = 1;
        objArr.getClass();
        this.c = objArr;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                if (this.b < ((k1) obj).getSize()) {
                }
                break;
            case 1:
                if (this.b < ((Object[]) obj).length) {
                }
                break;
            case 2:
                if (this.b < ((xkc) obj).e()) {
                }
                break;
            case 3:
                if (this.b < ((byte[]) obj).length) {
                }
                break;
            case 4:
                if (this.b < ((int[]) obj).length) {
                }
                break;
            case 5:
                if (this.b < ((long[]) obj).length) {
                }
                break;
            case 6:
                if (this.b < ((short[]) obj).length) {
                }
                break;
            default:
                if (this.b < ((ViewGroup) obj).getChildCount()) {
                }
                break;
        }
        return true;
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                if (!hasNext()) {
                    ywb.n();
                    return null;
                }
                int i2 = this.b;
                this.b = i2 + 1;
                return ((k1) obj).get(i2);
            case 1:
                try {
                    int i3 = this.b;
                    this.b = i3 + 1;
                    return ((Object[]) obj)[i3];
                } catch (ArrayIndexOutOfBoundsException e) {
                    this.b--;
                    ywb.h(e.getMessage());
                    return null;
                }
            case 2:
                int i4 = this.b;
                this.b = i4 + 1;
                return ((xkc) obj).g(i4);
            case 3:
                int i5 = this.b;
                byte[] bArr = (byte[]) obj;
                if (i5 < bArr.length) {
                    this.b = i5 + 1;
                    return new tyd(bArr[i5]);
                }
                ywb.h(String.valueOf(i5));
                return null;
            case 4:
                int i6 = this.b;
                int[] iArr = (int[]) obj;
                if (i6 < iArr.length) {
                    this.b = i6 + 1;
                    return new zyd(iArr[i6]);
                }
                ywb.h(String.valueOf(i6));
                return null;
            case 5:
                int i7 = this.b;
                long[] jArr = (long[]) obj;
                if (i7 < jArr.length) {
                    this.b = i7 + 1;
                    return new ezd(jArr[i7]);
                }
                ywb.h(String.valueOf(i7));
                return null;
            case 6:
                int i8 = this.b;
                short[] sArr = (short[]) obj;
                if (i8 < sArr.length) {
                    this.b = i8 + 1;
                    return new kzd(sArr[i8]);
                }
                ywb.h(String.valueOf(i8));
                return null;
            default:
                int i9 = this.b;
                this.b = i9 + 1;
                View childAt = ((ViewGroup) obj).getChildAt(i9);
                if (childAt != null) {
                    return childAt;
                }
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 1:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 2:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 3:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 4:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 5:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 6:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                ViewGroup viewGroup = (ViewGroup) this.c;
                int i = this.b - 1;
                this.b = i;
                viewGroup.removeViewAt(i);
                return;
        }
    }

    public /* synthetic */ h1(int i, Object obj) {
        this.a = i;
        this.c = obj;
    }
}
