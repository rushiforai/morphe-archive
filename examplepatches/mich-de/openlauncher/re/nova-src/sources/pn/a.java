package pn;

import a2.c;
import androidx.recyclerview.widget.u1;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: g, reason: collision with root package name */
    public static final a f82677g;

    /* renamed from: a, reason: collision with root package name */
    public final int[] f82678a;

    /* renamed from: b, reason: collision with root package name */
    public final int[] f82679b;

    /* renamed from: c, reason: collision with root package name */
    public final b f82680c;

    /* renamed from: d, reason: collision with root package name */
    public final int f82681d;

    /* renamed from: e, reason: collision with root package name */
    public final int f82682e;

    /* renamed from: f, reason: collision with root package name */
    public final int f82683f;

    static {
        new a(4201, u1.FLAG_APPEARED_IN_PRE_LAYOUT, 1);
        new a(1033, 1024, 1);
        new a(67, 64, 1);
        new a(19, 16, 1);
        f82677g = new a(285, 256, 0);
        new a(301, 256, 1);
    }

    public a(int i5, int i11, int i12) {
        this.f82682e = i5;
        this.f82681d = i11;
        this.f82683f = i12;
        this.f82678a = new int[i11];
        this.f82679b = new int[i11];
        int i13 = 1;
        for (int i14 = 0; i14 < i11; i14++) {
            this.f82678a[i14] = i13;
            i13 *= 2;
            if (i13 >= i11) {
                i13 = (i13 ^ i5) & (i11 - 1);
            }
        }
        for (int i15 = 0; i15 < i11 - 1; i15++) {
            this.f82679b[this.f82678a[i15]] = i15;
        }
        this.f82680c = new b(this, new int[]{0});
    }

    public final int a(int i5, int i11) {
        if (i5 == 0 || i11 == 0) {
            return 0;
        }
        int[] iArr = this.f82679b;
        return this.f82678a[(iArr[i5] + iArr[i11]) % (this.f82681d - 1)];
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("GF(0x");
        sb2.append(Integer.toHexString(this.f82682e));
        sb2.append(AbstractJsonLexerKt.COMMA);
        return c.m(sb2, this.f82681d, ')');
    }
}
