package kw;

import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;
import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;

/* loaded from: classes4.dex */
public final class p0 implements x2 {

    /* renamed from: f, reason: collision with root package name */
    public static final Pattern f72544f;

    /* renamed from: a, reason: collision with root package name */
    public final ResolvableString f72545a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f72546b;

    /* renamed from: c, reason: collision with root package name */
    public final int f72547c;

    /* renamed from: d, reason: collision with root package name */
    public final w70.i2 f72548d;

    /* renamed from: e, reason: collision with root package name */
    public final w70.i2 f72549e;

    static {
        Pattern patternCompile = Pattern.compile("[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+");
        Intrinsics.f(patternCompile, "compile(...)");
        f72544f = patternCompile;
    }

    public p0(boolean z11, int i5) {
        IdentifierResolvableString identifierResolvableStringU = zg.a.U(2132019769, new Object[0], EmptyList.f71733a);
        z11 = (i5 & 2) != 0 ? false : z11;
        this.f72545a = identifierResolvableStringU;
        this.f72546b = z11;
        this.f72547c = 6;
        this.f72548d = w70.u1.c(null);
        this.f72549e = w70.u1.c(Boolean.FALSE);
    }

    @Override // kw.x2
    public final String a(String rawValue) {
        Intrinsics.g(rawValue, "rawValue");
        return rawValue;
    }

    @Override // kw.x2
    public final w70.i2 b() {
        return this.f72549e;
    }

    @Override // kw.x2
    public final w70.g2 c() {
        return this.f72548d;
    }

    @Override // kw.x2
    public final r3.i0 d() {
        return null;
    }

    @Override // kw.x2
    public final String e() {
        return null;
    }

    @Override // kw.x2
    public final ResolvableString getLabel() {
        return this.f72545a;
    }

    @Override // kw.x2
    public final y3.n getLayoutDirection() {
        return null;
    }

    @Override // kw.x2
    public final int h() {
        return 0;
    }

    @Override // kw.x2
    public final String i(String userTyped) throws IOException {
        Intrinsics.g(userTyped, "userTyped");
        StringBuilder sb2 = new StringBuilder();
        for (int i5 = 0; i5 < userTyped.length(); i5++) {
            char cCharAt = userTyped.charAt(i5);
            if (!kotlin.text.a.b(cCharAt)) {
                sb2.append(cCharAt);
            }
        }
        return sb2.toString();
    }

    @Override // kw.x2
    public final e3 j(String input) {
        Intrinsics.g(input, "input");
        boolean z11 = input.length() == 0;
        if (!this.f72546b || !z11) {
            if (r70.k.U0(input)) {
                return f3.f72376b;
            }
            if (!f72544f.matcher(input).matches()) {
                if (!r70.k.K0(input, "@", false) || !new Regex(".*@.*\\..+").f(input)) {
                    int i5 = 0;
                    for (int i11 = 0; i11 < input.length(); i11++) {
                        if (input.charAt(i11) == '@') {
                            i5++;
                        }
                    }
                    if (i5 <= 1) {
                        return new g3(2132019770);
                    }
                }
                return new h3(2132019770, 6, (List) null);
            }
        }
        return k3.f72462a;
    }

    @Override // kw.x2
    public final boolean k() {
        return this.f72546b;
    }

    @Override // kw.x2
    public final String l(String displayName) {
        Intrinsics.g(displayName, "displayName");
        return displayName;
    }

    @Override // kw.x2
    public final int m() {
        return this.f72547c;
    }

    @Override // kw.x2
    public final boolean n() {
        return true;
    }

    @Override // kw.x2
    public final boolean o() {
        return true;
    }
}
