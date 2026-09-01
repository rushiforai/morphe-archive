package defpackage;

import com.squareup.moshi.JsonDataException;
import com.squareup.moshi.JsonEncodingException;
import java.io.Closeable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class hd6 implements Closeable {
    public int a;
    public int[] b;
    public String[] c;
    public int[] d;

    public abstract void B();

    public final String D() {
        return k50.b0(this.a, this.b, this.c, this.d);
    }

    public abstract dd6 I();

    public final void L(int i) {
        int i2 = this.a;
        int[] iArr = this.b;
        if (i2 == iArr.length) {
            if (i2 == 256) {
                throw new JsonDataException("Nesting too deep at ".concat(D()));
            }
            this.b = Arrays.copyOf(iArr, iArr.length * 2);
            String[] strArr = this.c;
            this.c = (String[]) Arrays.copyOf(strArr, strArr.length * 2);
            int[] iArr2 = this.d;
            this.d = Arrays.copyOf(iArr2, iArr2.length * 2);
        }
        int[] iArr3 = this.b;
        int i3 = this.a;
        this.a = i3 + 1;
        iArr3[i3] = i;
    }

    public abstract int N(gg5 gg5Var);

    public abstract void Q();

    public final void R(String str) throws JsonEncodingException {
        throw new JsonEncodingException(str + " at path " + D());
    }

    public abstract String X();

    public abstract void a0();

    public abstract void f();

    public abstract boolean hasNext();

    public abstract void m();

    public abstract boolean nextBoolean();

    public abstract double nextDouble();

    public abstract int nextInt();

    public abstract void p();

    public abstract String q();

    public abstract void v();
}
