package z;

import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class v implements Cloneable {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ boolean f97842a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ long[] f97843b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object[] f97844c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ int f97845d;

    public v(int i5) {
        if (i5 == 0) {
            this.f97843b = a0.a.f55b;
            this.f97844c = a0.a.f56c;
            return;
        }
        int i11 = i5 * 8;
        int i12 = 4;
        while (true) {
            if (i12 >= 32) {
                break;
            }
            int i13 = (1 << i12) - 12;
            if (i11 <= i13) {
                i11 = i13;
                break;
            }
            i12++;
        }
        int i14 = i11 / 8;
        this.f97843b = new long[i14];
        this.f97844c = new Object[i14];
    }

    public final void a() {
        int i5 = this.f97845d;
        Object[] objArr = this.f97844c;
        for (int i11 = 0; i11 < i5; i11++) {
            objArr[i11] = null;
        }
        this.f97845d = 0;
        this.f97842a = false;
    }

    public final Object c(long j11) {
        Object obj;
        int iB = a0.a.b(this.f97843b, this.f97845d, j11);
        if (iB < 0 || (obj = this.f97844c[iB]) == w.f97848a) {
            return null;
        }
        return obj;
    }

    public final Object clone() throws CloneNotSupportedException {
        Object objClone = super.clone();
        Intrinsics.e(objClone, "null cannot be cast to non-null type androidx.collection.LongSparseArray<E of androidx.collection.LongSparseArray>");
        v vVar = (v) objClone;
        vVar.f97843b = (long[]) this.f97843b.clone();
        vVar.f97844c = (Object[]) this.f97844c.clone();
        return vVar;
    }

    public final long d(int i5) {
        int i11;
        if (i5 < 0 || i5 >= (i11 = this.f97845d)) {
            android.support.v4.media.session.b.k0("Expected index to be within 0..size()-1, but was " + i5);
            throw null;
        }
        if (this.f97842a) {
            long[] jArr = this.f97843b;
            Object[] objArr = this.f97844c;
            int i12 = 0;
            for (int i13 = 0; i13 < i11; i13++) {
                Object obj = objArr[i13];
                if (obj != w.f97848a) {
                    if (i13 != i12) {
                        jArr[i12] = jArr[i13];
                        objArr[i12] = obj;
                        objArr[i13] = null;
                    }
                    i12++;
                }
            }
            this.f97842a = false;
            this.f97845d = i12;
        }
        return this.f97843b[i5];
    }

    public final void e(long j11, Object obj) {
        Object obj2 = w.f97848a;
        int iB = a0.a.b(this.f97843b, this.f97845d, j11);
        if (iB >= 0) {
            this.f97844c[iB] = obj;
            return;
        }
        int i5 = ~iB;
        int i11 = this.f97845d;
        if (i5 < i11) {
            Object[] objArr = this.f97844c;
            if (objArr[i5] == obj2) {
                this.f97843b[i5] = j11;
                objArr[i5] = obj;
                return;
            }
        }
        if (this.f97842a) {
            long[] jArr = this.f97843b;
            if (i11 >= jArr.length) {
                Object[] objArr2 = this.f97844c;
                int i12 = 0;
                for (int i13 = 0; i13 < i11; i13++) {
                    Object obj3 = objArr2[i13];
                    if (obj3 != obj2) {
                        if (i13 != i12) {
                            jArr[i12] = jArr[i13];
                            objArr2[i12] = obj3;
                            objArr2[i13] = null;
                        }
                        i12++;
                    }
                }
                this.f97842a = false;
                this.f97845d = i12;
                i5 = ~a0.a.b(this.f97843b, i12, j11);
            }
        }
        int i14 = this.f97845d;
        if (i14 >= this.f97843b.length) {
            int i15 = (i14 + 1) * 8;
            int i16 = 4;
            while (true) {
                if (i16 >= 32) {
                    break;
                }
                int i17 = (1 << i16) - 12;
                if (i15 <= i17) {
                    i15 = i17;
                    break;
                }
                i16++;
            }
            int i18 = i15 / 8;
            long[] jArrCopyOf = Arrays.copyOf(this.f97843b, i18);
            Intrinsics.f(jArrCopyOf, "copyOf(...)");
            this.f97843b = jArrCopyOf;
            Object[] objArrCopyOf = Arrays.copyOf(this.f97844c, i18);
            Intrinsics.f(objArrCopyOf, "copyOf(...)");
            this.f97844c = objArrCopyOf;
        }
        int i19 = this.f97845d;
        if (i19 - i5 != 0) {
            long[] jArr2 = this.f97843b;
            int i21 = i5 + 1;
            u90.b.s(jArr2, jArr2, i21, i5, i19);
            Object[] objArr3 = this.f97844c;
            u90.b.t(objArr3, i21, objArr3, i5, this.f97845d);
        }
        this.f97843b[i5] = j11;
        this.f97844c[i5] = obj;
        this.f97845d++;
    }

    public final void f(long j11) {
        int iB = a0.a.b(this.f97843b, this.f97845d, j11);
        if (iB >= 0) {
            Object[] objArr = this.f97844c;
            Object obj = objArr[iB];
            Object obj2 = w.f97848a;
            if (obj != obj2) {
                objArr[iB] = obj2;
                this.f97842a = true;
            }
        }
    }

    public final int g() {
        if (this.f97842a) {
            int i5 = this.f97845d;
            long[] jArr = this.f97843b;
            Object[] objArr = this.f97844c;
            int i11 = 0;
            for (int i12 = 0; i12 < i5; i12++) {
                Object obj = objArr[i12];
                if (obj != w.f97848a) {
                    if (i12 != i11) {
                        jArr[i11] = jArr[i12];
                        objArr[i11] = obj;
                        objArr[i12] = null;
                    }
                    i11++;
                }
            }
            this.f97842a = false;
            this.f97845d = i11;
        }
        return this.f97845d;
    }

    public final Object h(int i5) {
        int i11;
        if (i5 < 0 || i5 >= (i11 = this.f97845d)) {
            android.support.v4.media.session.b.k0("Expected index to be within 0..size()-1, but was " + i5);
            throw null;
        }
        if (this.f97842a) {
            long[] jArr = this.f97843b;
            Object[] objArr = this.f97844c;
            int i12 = 0;
            for (int i13 = 0; i13 < i11; i13++) {
                Object obj = objArr[i13];
                if (obj != w.f97848a) {
                    if (i13 != i12) {
                        jArr[i12] = jArr[i13];
                        objArr[i12] = obj;
                        objArr[i13] = null;
                    }
                    i12++;
                }
            }
            this.f97842a = false;
            this.f97845d = i12;
        }
        return this.f97844c[i5];
    }

    public final String toString() {
        if (g() <= 0) {
            return "{}";
        }
        StringBuilder sb2 = new StringBuilder(this.f97845d * 28);
        sb2.append(AbstractJsonLexerKt.BEGIN_OBJ);
        int i5 = this.f97845d;
        for (int i11 = 0; i11 < i5; i11++) {
            if (i11 > 0) {
                sb2.append(", ");
            }
            sb2.append(d(i11));
            sb2.append('=');
            Object objH = h(i11);
            if (objH != sb2) {
                sb2.append(objH);
            } else {
                sb2.append("(this Map)");
            }
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    public /* synthetic */ v(Object obj) {
        this(10);
    }
}
