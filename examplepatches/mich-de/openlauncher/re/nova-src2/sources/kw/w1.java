package kw;

import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w1 extends z1 {

    /* renamed from: c, reason: collision with root package name */
    public final String f72719c;

    /* renamed from: d, reason: collision with root package name */
    public final cw.a0 f72720d;

    public w1(String countryCode) {
        Intrinsics.g(countryCode, "countryCode");
        this.f72719c = countryCode;
        this.f72720d = new cw.a0(2);
    }

    @Override // kw.z1
    public final String a() {
        return this.f72719c;
    }

    @Override // kw.z1
    public final String b() {
        return "+############";
    }

    @Override // kw.z1
    public final String c() {
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    @Override // kw.z1
    public final r3.i0 d() {
        return this.f72720d;
    }

    @Override // kw.z1
    public final String e(String input) {
        Intrinsics.g(input, "input");
        return b.c0.k("+", r70.k.z1(f(input), '0'));
    }

    @Override // kw.z1
    public final String f(String input) throws IOException {
        Intrinsics.g(input, "input");
        StringBuilder sb2 = new StringBuilder();
        int length = input.length();
        for (int i5 = 0; i5 < length; i5++) {
            char cCharAt = input.charAt(i5);
            if (z1.f72740a.f(cCharAt)) {
                sb2.append(cCharAt);
            }
        }
        String string = sb2.toString();
        String strSubstring = string.substring(0, Math.min(string.length(), 15));
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }
}
