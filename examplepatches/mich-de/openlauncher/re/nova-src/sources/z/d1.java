package z;

import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class d1 implements Cloneable {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ boolean f97756a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ int[] f97757b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object[] f97758c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ int f97759d;

    public d1(int i5) {
        int i11;
        int i12 = 4;
        while (true) {
            i11 = 40;
            if (i12 >= 32) {
                break;
            }
            int i13 = (1 << i12) - 12;
            if (40 <= i13) {
                i11 = i13;
                break;
            }
            i12++;
        }
        int i14 = i11 / 4;
        this.f97757b = new int[i14];
        this.f97758c = new Object[i14];
    }

    public final void a(int i5, Object obj) {
        int i11 = this.f97759d;
        if (i11 != 0 && i5 <= this.f97757b[i11 - 1]) {
            e(i5, obj);
            return;
        }
        if (this.f97756a && i11 >= this.f97757b.length) {
            e1.a(this);
        }
        int i12 = this.f97759d;
        if (i12 >= this.f97757b.length) {
            int i13 = (i12 + 1) * 4;
            int i14 = 4;
            while (true) {
                if (i14 >= 32) {
                    break;
                }
                int i15 = (1 << i14) - 12;
                if (i13 <= i15) {
                    i13 = i15;
                    break;
                }
                i14++;
            }
            int i16 = i13 / 4;
            int[] iArrCopyOf = Arrays.copyOf(this.f97757b, i16);
            Intrinsics.f(iArrCopyOf, "copyOf(...)");
            this.f97757b = iArrCopyOf;
            Object[] objArrCopyOf = Arrays.copyOf(this.f97758c, i16);
            Intrinsics.f(objArrCopyOf, "copyOf(...)");
            this.f97758c = objArrCopyOf;
        }
        this.f97757b[i12] = i5;
        this.f97758c[i12] = obj;
        this.f97759d = i12 + 1;
    }

    /* renamed from: c, reason: merged with bridge method [inline-methods] */
    public final d1 clone() throws CloneNotSupportedException {
        Object objClone = super.clone();
        Intrinsics.e(objClone, "null cannot be cast to non-null type androidx.collection.SparseArrayCompat<E of androidx.collection.SparseArrayCompat>");
        d1 d1Var = (d1) objClone;
        d1Var.f97757b = (int[]) this.f97757b.clone();
        d1Var.f97758c = (Object[]) this.f97758c.clone();
        return d1Var;
    }

    public final int d(int i5) {
        if (this.f97756a) {
            e1.a(this);
        }
        return this.f97757b[i5];
    }

    public final void e(int i5, Object obj) {
        int iA = a0.a.a(this.f97759d, i5, this.f97757b);
        if (iA >= 0) {
            this.f97758c[iA] = obj;
            return;
        }
        int i11 = ~iA;
        int i12 = this.f97759d;
        if (i11 < i12) {
            Object[] objArr = this.f97758c;
            if (objArr[i11] == e1.f97763a) {
                this.f97757b[i11] = i5;
                objArr[i11] = obj;
                return;
            }
        }
        if (this.f97756a && i12 >= this.f97757b.length) {
            e1.a(this);
            i11 = ~a0.a.a(this.f97759d, i5, this.f97757b);
        }
        int i13 = this.f97759d;
        if (i13 >= this.f97757b.length) {
            int i14 = (i13 + 1) * 4;
            int i15 = 4;
            while (true) {
                if (i15 >= 32) {
                    break;
                }
                int i16 = (1 << i15) - 12;
                if (i14 <= i16) {
                    i14 = i16;
                    break;
                }
                i15++;
            }
            int i17 = i14 / 4;
            int[] iArrCopyOf = Arrays.copyOf(this.f97757b, i17);
            Intrinsics.f(iArrCopyOf, "copyOf(...)");
            this.f97757b = iArrCopyOf;
            Object[] objArrCopyOf = Arrays.copyOf(this.f97758c, i17);
            Intrinsics.f(objArrCopyOf, "copyOf(...)");
            this.f97758c = objArrCopyOf;
        }
        int i18 = this.f97759d;
        if (i18 - i11 != 0) {
            int[] iArr = this.f97757b;
            int i19 = i11 + 1;
            u90.b.p(i19, i11, iArr, iArr, i18);
            Object[] objArr2 = this.f97758c;
            u90.b.t(objArr2, i19, objArr2, i11, this.f97759d);
        }
        this.f97757b[i11] = i5;
        this.f97758c[i11] = obj;
        this.f97759d++;
    }

    public final int f() {
        if (this.f97756a) {
            e1.a(this);
        }
        return this.f97759d;
    }

    public final Object g(int i5) {
        if (this.f97756a) {
            e1.a(this);
        }
        Object[] objArr = this.f97758c;
        if (i5 < objArr.length) {
            return objArr[i5];
        }
        throw new ArrayIndexOutOfBoundsException();
    }

    public final String toString() {
        if (f() <= 0) {
            return "{}";
        }
        StringBuilder sb2 = new StringBuilder(this.f97759d * 28);
        sb2.append(AbstractJsonLexerKt.BEGIN_OBJ);
        int i5 = this.f97759d;
        for (int i11 = 0; i11 < i5; i11++) {
            if (i11 > 0) {
                sb2.append(", ");
            }
            sb2.append(d(i11));
            sb2.append('=');
            Object objG = g(i11);
            if (objG != this) {
                sb2.append(objG);
            } else {
                sb2.append("(this Map)");
            }
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
