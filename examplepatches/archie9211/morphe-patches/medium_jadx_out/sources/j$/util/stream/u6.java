package j$.util.stream;

import j$.util.Spliterator;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class u6 extends c implements Iterable {
    public Object e;
    public Object[] f;

    public u6(int i) {
        super(i);
        this.e = newArray(1 << this.a);
    }

    public Object b() {
        long jCount = count();
        if (jCount >= 2147483639) {
            j$.time.h.c("Stream size exceeds max array size");
            return null;
        }
        Object objNewArray = newArray((int) jCount);
        f(0, objNewArray);
        return objNewArray;
    }

    @Override // j$.util.stream.c
    public final void clear() {
        Object[] objArr = this.f;
        if (objArr != null) {
            this.e = objArr[0];
            this.f = null;
            this.d = null;
        }
        this.b = 0;
        this.c = 0;
    }

    public void f(int i, Object obj) {
        long j = i;
        long jCount = count() + j;
        if (jCount > q(obj) || jCount < j) {
            throw new IndexOutOfBoundsException("does not fit");
        }
        if (this.c == 0) {
            System.arraycopy(this.e, 0, obj, i, this.b);
            return;
        }
        for (int i2 = 0; i2 < this.c; i2++) {
            Object obj2 = this.f[i2];
            System.arraycopy(obj2, 0, obj, i, q(obj2));
            i += q(this.f[i2]);
        }
        int i3 = this.b;
        if (i3 > 0) {
            System.arraycopy(this.e, 0, obj, i, i3);
        }
    }

    public void g(Object obj) {
        for (int i = 0; i < this.c; i++) {
            Object obj2 = this.f[i];
            p(obj2, 0, q(obj2), obj);
        }
        p(this.e, 0, this.b, obj);
    }

    public abstract Object newArray(int i);

    public abstract void p(Object obj, int i, int i2, Object obj2);

    public abstract int q(Object obj);

    public final int r(long j) {
        if (this.c == 0) {
            if (j < this.b) {
                return 0;
            }
            throw new IndexOutOfBoundsException(Long.toString(j));
        }
        if (j >= count()) {
            throw new IndexOutOfBoundsException(Long.toString(j));
        }
        for (int i = 0; i <= this.c; i++) {
            if (j < this.d[i] + ((long) q(this.f[i]))) {
                return i;
            }
        }
        throw new IndexOutOfBoundsException(Long.toString(j));
    }

    public final void s(long j) {
        long jQ;
        int i = this.c;
        if (i == 0) {
            jQ = q(this.e);
        } else {
            jQ = ((long) q(this.f[i])) + this.d[i];
        }
        if (j > jQ) {
            if (this.f == null) {
                Object[] objArrT = t();
                this.f = objArrT;
                this.d = new long[8];
                objArrT[0] = this.e;
            }
            int i2 = this.c + 1;
            while (j > jQ) {
                Object[] objArr = this.f;
                if (i2 >= objArr.length) {
                    int length = objArr.length * 2;
                    this.f = Arrays.copyOf(objArr, length);
                    this.d = Arrays.copyOf(this.d, length);
                }
                int iMin = this.a;
                if (i2 != 0 && i2 != 1) {
                    iMin = Math.min((iMin + i2) - 1, 30);
                }
                int i3 = 1 << iMin;
                this.f[i2] = newArray(i3);
                long[] jArr = this.d;
                int i4 = i2 - 1;
                jArr[i2] = jArr[i4] + ((long) q(this.f[i4]));
                jQ += (long) i3;
                i2++;
            }
        }
    }

    public abstract Spliterator spliterator();

    @Override // java.lang.Iterable
    public final /* synthetic */ java.util.Spliterator spliterator() {
        return Spliterator.Wrapper.convert(spliterator());
    }

    public abstract Object[] t();

    public final void u() {
        long jQ;
        if (this.b == q(this.e)) {
            Object[] objArrT = this.f;
            if (objArrT == null) {
                objArrT = t();
                this.f = objArrT;
                this.d = new long[8];
                objArrT[0] = this.e;
            }
            int i = this.c;
            int i2 = i + 1;
            if (i2 >= objArrT.length || objArrT[i2] == null) {
                if (i == 0) {
                    jQ = q(this.e);
                } else {
                    jQ = ((long) q(objArrT[i])) + this.d[i];
                }
                s(jQ + 1);
            }
            this.b = 0;
            int i3 = this.c + 1;
            this.c = i3;
            this.e = this.f[i3];
        }
    }

    public u6() {
        this.e = newArray(16);
    }
}
