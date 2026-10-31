package gf;

import java.util.Arrays;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes3.dex */
public final class x0 implements fe.e {

    /* renamed from: f, reason: collision with root package name */
    public static final ge.d f57654f = new ge.d(9);

    /* renamed from: a, reason: collision with root package name */
    public final int f57655a;

    /* renamed from: b, reason: collision with root package name */
    public final String f57656b;

    /* renamed from: c, reason: collision with root package name */
    public final int f57657c;

    /* renamed from: d, reason: collision with root package name */
    public final fe.k0[] f57658d;

    /* renamed from: e, reason: collision with root package name */
    public int f57659e;

    public x0(String str, fe.k0... k0VarArr) {
        wf.a.e(k0VarArr.length > 0);
        this.f57656b = str;
        this.f57658d = k0VarArr;
        this.f57655a = k0VarArr.length;
        int iF = wf.j.f(k0VarArr[0].f54883l);
        this.f57657c = iF == -1 ? wf.j.f(k0VarArr[0].f54882k) : iF;
        String str2 = k0VarArr[0].f54874c;
        str2 = (str2 == null || str2.equals("und")) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str2;
        int i5 = k0VarArr[0].f54876e | ReaderJsonLexerKt.BATCH_SIZE;
        for (int i11 = 1; i11 < k0VarArr.length; i11++) {
            String str3 = k0VarArr[i11].f54874c;
            if (!str2.equals((str3 == null || str3.equals("und")) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str3)) {
                a(i11, "languages", k0VarArr[0].f54874c, k0VarArr[i11].f54874c);
                return;
            } else {
                if (i5 != (k0VarArr[i11].f54876e | ReaderJsonLexerKt.BATCH_SIZE)) {
                    a(i11, "role flags", Integer.toBinaryString(k0VarArr[0].f54876e), Integer.toBinaryString(k0VarArr[i11].f54876e));
                    return;
                }
            }
        }
    }

    public static void a(int i5, String str, String str2, String str3) {
        StringBuilder sbW = b.c0.w("Different ", str, " combined in one TrackGroup: '", str2, "' (track 0) and '");
        sbW.append(str3);
        sbW.append("' (track ");
        sbW.append(i5);
        sbW.append(")");
        wf.a.p("TrackGroup", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, new IllegalStateException(sbW.toString()));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && x0.class == obj.getClass()) {
            x0 x0Var = (x0) obj;
            if (this.f57656b.equals(x0Var.f57656b) && Arrays.equals(this.f57658d, x0Var.f57658d)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        if (this.f57659e == 0) {
            this.f57659e = b.c0.e(527, 31, this.f57656b) + Arrays.hashCode(this.f57658d);
        }
        return this.f57659e;
    }
}
