package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public class v6 extends c implements Consumer, Iterable {
    public Object[] e = new Object[1 << 4];
    public Object[][] f;

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public void n(Object obj) {
        long length;
        int i = this.b;
        Object[] objArr = this.e;
        if (i == objArr.length) {
            Object[][] objArr2 = this.f;
            if (objArr2 == null) {
                Object[][] objArr3 = new Object[8][];
                this.f = objArr3;
                this.d = new long[8];
                objArr3[0] = objArr;
                objArr2 = objArr3;
            }
            int i2 = this.c;
            int i3 = i2 + 1;
            if (i3 >= objArr2.length || objArr2[i3] == null) {
                if (i2 == 0) {
                    length = objArr.length;
                } else {
                    length = ((long) objArr2[i2].length) + this.d[i2];
                }
                p(length + 1);
            }
            this.b = 0;
            int i4 = this.c + 1;
            this.c = i4;
            objArr = this.f[i4];
            this.e = objArr;
            i = 0;
        }
        this.b = i + 1;
        objArr[i] = obj;
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.c
    public final void clear() {
        Object[][] objArr = this.f;
        if (objArr != null) {
            this.e = objArr[0];
            int i = 0;
            while (true) {
                Object[] objArr2 = this.e;
                if (i >= objArr2.length) {
                    break;
                }
                objArr2[i] = null;
                i++;
            }
            this.f = null;
            this.d = null;
        } else {
            for (int i2 = 0; i2 < this.b; i2++) {
                this.e[i2] = null;
            }
        }
        this.b = 0;
        this.c = 0;
    }

    @Override // java.lang.Iterable
    public void forEach(Consumer consumer) {
        for (int i = 0; i < this.c; i++) {
            for (Object obj : this.f[i]) {
                consumer.n(obj);
            }
        }
        for (int i2 = 0; i2 < this.b; i2++) {
            consumer.n(this.e[i2]);
        }
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        Spliterator spliterator = spliterator();
        Objects.requireNonNull(spliterator);
        return new j$.util.c1(spliterator);
    }

    public final void p(long j) {
        int i = this.c;
        long length = i == 0 ? this.e.length : this.d[i] + ((long) this.f[i].length);
        if (j > length) {
            if (this.f == null) {
                Object[][] objArr = new Object[8][];
                this.f = objArr;
                this.d = new long[8];
                objArr[0] = this.e;
            }
            int i2 = i + 1;
            while (j > length) {
                Object[][] objArr2 = this.f;
                if (i2 >= objArr2.length) {
                    int length2 = objArr2.length * 2;
                    this.f = (Object[][]) Arrays.copyOf(objArr2, length2);
                    this.d = Arrays.copyOf(this.d, length2);
                }
                int iMin = this.a;
                if (i2 != 0 && i2 != 1) {
                    iMin = Math.min((iMin + i2) - 1, 30);
                }
                int i3 = 1 << iMin;
                Object[][] objArr3 = this.f;
                objArr3[i2] = new Object[i3];
                long[] jArr = this.d;
                int i4 = i2 - 1;
                jArr[i2] = jArr[i4] + ((long) objArr3[i4].length);
                length += (long) i3;
                i2++;
            }
        }
    }

    @Override // java.lang.Iterable
    public Spliterator spliterator() {
        return new m6(this, 0, this.c, 0, this.b);
    }

    public final String toString() {
        ArrayList arrayList = new ArrayList();
        Objects.requireNonNull(arrayList);
        forEach(new j$.util.n(8, arrayList));
        return "SpinedBuffer:" + arrayList.toString();
    }

    @Override // java.lang.Iterable
    public final /* synthetic */ java.util.Spliterator spliterator() {
        return Spliterator.Wrapper.convert(spliterator());
    }
}
