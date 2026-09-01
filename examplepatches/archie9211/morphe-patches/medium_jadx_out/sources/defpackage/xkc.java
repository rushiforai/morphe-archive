package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xkc implements Cloneable {
    public /* synthetic */ boolean a;
    public /* synthetic */ int[] b;
    public /* synthetic */ Object[] c;
    public /* synthetic */ int d;

    public xkc(int i) {
        int i2;
        int i3 = 4;
        while (true) {
            i2 = 40;
            if (i3 >= 32) {
                break;
            }
            int i4 = (1 << i3) - 12;
            if (40 <= i4) {
                i2 = i4;
                break;
            }
            i3++;
        }
        int i5 = i2 / 4;
        this.b = new int[i5];
        this.c = new Object[i5];
    }

    public final void a(int i, Object obj) {
        int i2 = this.d;
        if (i2 != 0 && i <= this.b[i2 - 1]) {
            d(i, obj);
            return;
        }
        if (this.a && i2 >= this.b.length) {
            s42.U(this);
        }
        int i3 = this.d;
        if (i3 >= this.b.length) {
            int i4 = (i3 + 1) * 4;
            int i5 = 4;
            while (true) {
                if (i5 >= 32) {
                    break;
                }
                int i6 = (1 << i5) - 12;
                if (i4 <= i6) {
                    i4 = i6;
                    break;
                }
                i5++;
            }
            int i7 = i4 / 4;
            this.b = Arrays.copyOf(this.b, i7);
            this.c = Arrays.copyOf(this.c, i7);
        }
        this.b[i3] = i;
        this.c[i3] = obj;
        this.d = i3 + 1;
    }

    /* JADX INFO: renamed from: b, reason: merged with bridge method [inline-methods] */
    public final xkc clone() throws CloneNotSupportedException {
        Object objClone = super.clone();
        objClone.getClass();
        xkc xkcVar = (xkc) objClone;
        xkcVar.b = (int[]) this.b.clone();
        xkcVar.c = (Object[]) this.c.clone();
        return xkcVar;
    }

    public final int c(int i) {
        if (this.a) {
            s42.U(this);
        }
        return this.b[i];
    }

    public final void d(int i, Object obj) {
        int iC = vc2.C(this.d, i, this.b);
        if (iC >= 0) {
            this.c[iC] = obj;
            return;
        }
        int i2 = ~iC;
        int i3 = this.d;
        if (i2 < i3) {
            Object[] objArr = this.c;
            if (objArr[i2] == s42.j) {
                this.b[i2] = i;
                objArr[i2] = obj;
                return;
            }
        }
        if (this.a && i3 >= this.b.length) {
            s42.U(this);
            i2 = ~vc2.C(this.d, i, this.b);
        }
        int i4 = this.d;
        if (i4 >= this.b.length) {
            int i5 = (i4 + 1) * 4;
            int i6 = 4;
            while (true) {
                if (i6 >= 32) {
                    break;
                }
                int i7 = (1 << i6) - 12;
                if (i5 <= i7) {
                    i5 = i7;
                    break;
                }
                i6++;
            }
            int i8 = i5 / 4;
            this.b = Arrays.copyOf(this.b, i8);
            this.c = Arrays.copyOf(this.c, i8);
        }
        int i9 = this.d;
        if (i9 - i2 != 0) {
            int[] iArr = this.b;
            int i10 = i2 + 1;
            k80.h0(i10, i2, iArr, iArr, i9);
            Object[] objArr2 = this.c;
            k80.g0(i10, i2, this.d, objArr2, objArr2);
        }
        this.b[i2] = i;
        this.c[i2] = obj;
        this.d++;
    }

    public final int e() {
        if (this.a) {
            s42.U(this);
        }
        return this.d;
    }

    public final Object g(int i) {
        if (this.a) {
            s42.U(this);
        }
        Object[] objArr = this.c;
        if (i < objArr.length) {
            return objArr[i];
        }
        throw new ArrayIndexOutOfBoundsException();
    }

    public final String toString() {
        if (e() <= 0) {
            return "{}";
        }
        StringBuilder sb = new StringBuilder(this.d * 28);
        sb.append('{');
        int i = this.d;
        for (int i2 = 0; i2 < i; i2++) {
            if (i2 > 0) {
                sb.append(", ");
            }
            sb.append(c(i2));
            sb.append('=');
            Object objG = g(i2);
            if (objG != this) {
                sb.append(objG);
            } else {
                sb.append("(this Map)");
            }
        }
        sb.append('}');
        return sb.toString();
    }
}
