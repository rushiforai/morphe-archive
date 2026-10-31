package kw;

import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class y1 extends z1 {

    /* renamed from: c, reason: collision with root package name */
    public final v1 f72734c;

    /* renamed from: d, reason: collision with root package name */
    public final String f72735d;

    /* renamed from: e, reason: collision with root package name */
    public final String f72736e;

    /* renamed from: f, reason: collision with root package name */
    public final String f72737f;

    /* renamed from: g, reason: collision with root package name */
    public final s0 f72738g;

    public y1(v1 v1Var) {
        this.f72734c = v1Var;
        this.f72735d = v1Var.f72701a;
        String str = v1Var.f72703c;
        this.f72736e = str != null ? r70.j.E0(str, '#', '5') : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f72737f = v1Var.f72702b;
        this.f72738g = new s0(this, 1);
    }

    @Override // kw.z1
    public final String a() {
        return this.f72737f;
    }

    @Override // kw.z1
    public final String b() {
        return this.f72736e;
    }

    @Override // kw.z1
    public final String c() {
        return this.f72735d;
    }

    @Override // kw.z1
    public final r3.i0 d() {
        return this.f72738g;
    }

    @Override // kw.z1
    public final String e(String input) {
        Intrinsics.g(input, "input");
        return b.c0.E(this.f72735d, r70.k.z1(f(input), '0'));
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

    public final String g(String filteredInput) {
        Intrinsics.g(filteredInput, "filteredInput");
        v1 v1Var = this.f72734c;
        if (v1Var.f72703c == null) {
            return filteredInput;
        }
        StringBuilder sb2 = new StringBuilder();
        String str = v1Var.f72703c;
        int i5 = 0;
        for (int i11 = 0; i11 < str.length(); i11++) {
            char cCharAt = str.charAt(i11);
            if (i5 < filteredInput.length()) {
                if (cCharAt == '#') {
                    cCharAt = filteredInput.charAt(i5);
                    i5++;
                }
                sb2.append(cCharAt);
            }
        }
        if (i5 < filteredInput.length()) {
            sb2.append(' ');
            String strSubstring = filteredInput.substring(i5);
            Intrinsics.f(strSubstring, "substring(...)");
            char[] charArray = strSubstring.toCharArray();
            Intrinsics.f(charArray, "toCharArray(...)");
            sb2.append(charArray);
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
