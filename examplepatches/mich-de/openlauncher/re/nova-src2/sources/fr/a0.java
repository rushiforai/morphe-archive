package fr;

import b.u4;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes4.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f55577a;

    /* renamed from: b, reason: collision with root package name */
    public final String f55578b;

    public a0(String key, String value) {
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        this.f55577a = key;
        this.f55578b = value;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a0)) {
            return false;
        }
        a0 a0Var = (a0) obj;
        return Intrinsics.b(this.f55577a, a0Var.f55577a) && Intrinsics.b(this.f55578b, a0Var.f55578b);
    }

    public final int hashCode() {
        return this.f55578b.hashCode() + (this.f55577a.hashCode() * 31);
    }

    public final String toString() throws UnsupportedEncodingException {
        Charset charset = Charsets.f72000b;
        String strEncode = URLEncoder.encode(this.f55577a, charset.name());
        Intrinsics.f(strEncode, "encode(...)");
        String strEncode2 = URLEncoder.encode(this.f55578b, charset.name());
        Intrinsics.f(strEncode2, "encode(...)");
        return u4.m(strEncode, "=", strEncode2);
    }
}
