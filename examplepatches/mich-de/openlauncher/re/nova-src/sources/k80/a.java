package k80;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes5.dex */
public final class a {

    /* renamed from: f, reason: collision with root package name */
    public static final char[] f71199f = {'+', '-', '*', '/', '%', '^', '!', '#', 167, '$', '&', ';', AbstractJsonLexerKt.COLON, '~', '<', '>', '|', '='};

    /* renamed from: a, reason: collision with root package name */
    public final int f71200a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f71201b;

    /* renamed from: c, reason: collision with root package name */
    public final String f71202c;

    /* renamed from: d, reason: collision with root package name */
    public final int f71203d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f71204e;

    public a(String str, int i5, int i11, int i12, boolean z11) {
        this.f71204e = i12;
        this.f71200a = i5;
        this.f71201b = z11;
        this.f71202c = str;
        this.f71203d = i11;
    }

    public final double a(double... dArr) {
        switch (this.f71204e) {
            case 0:
                return dArr[0] + dArr[1];
            case 1:
                return dArr[0] - dArr[1];
            case 2:
                return -dArr[0];
            case 3:
                return dArr[0];
            case 4:
                return dArr[0] * dArr[1];
            case 5:
                double d5 = dArr[1];
                if (d5 != 0.0d) {
                    return dArr[0] / d5;
                }
                throw new ArithmeticException("Division by zero!");
            case 6:
                return Math.pow(dArr[0], dArr[1]);
            default:
                double d11 = dArr[1];
                if (d11 != 0.0d) {
                    return dArr[0] % d11;
                }
                throw new ArithmeticException("Division by zero!");
        }
    }
}
