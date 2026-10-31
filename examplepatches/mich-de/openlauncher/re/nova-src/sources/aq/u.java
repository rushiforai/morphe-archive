package aq;

import com.google.android.gms.internal.measurement.k2;
import com.squareup.moshi.JsonDataException;
import com.squareup.moshi.JsonEncodingException;
import io.sentry.e3;
import java.io.Closeable;
import java.util.Arrays;

/* loaded from: classes4.dex */
public abstract class u implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public int f15512a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f15513b;

    /* renamed from: c, reason: collision with root package name */
    public String[] f15514c;

    /* renamed from: d, reason: collision with root package name */
    public int[] f15515d;

    public final void A(int i5) {
        int i11 = this.f15512a;
        int[] iArr = this.f15513b;
        if (i11 == iArr.length) {
            if (i11 == 256) {
                throw new JsonDataException("Nesting too deep at " + e());
            }
            this.f15513b = Arrays.copyOf(iArr, iArr.length * 2);
            String[] strArr = this.f15514c;
            this.f15514c = (String[]) Arrays.copyOf(strArr, strArr.length * 2);
            int[] iArr2 = this.f15515d;
            this.f15515d = Arrays.copyOf(iArr2, iArr2.length * 2);
        }
        int[] iArr3 = this.f15513b;
        int i12 = this.f15512a;
        this.f15512a = i12 + 1;
        iArr3[i12] = i5;
    }

    public abstract int D(e3 e3Var);

    public abstract void K();

    public abstract void M();

    public final void P(String str) throws JsonEncodingException {
        StringBuilder sbK = k2.k(str, " at path ");
        sbK.append(e());
        throw new JsonEncodingException(sbK.toString());
    }

    public abstract void a();

    public abstract void b();

    public abstract void c();

    public abstract void d();

    public final String e() {
        return m0.c(this.f15512a, this.f15513b, this.f15514c, this.f15515d);
    }

    public abstract boolean f();

    public abstract double h();

    public abstract int l();

    public abstract void p();

    public abstract String s();

    public abstract int w();
}
