package fr;

import b.u4;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final String f55604a;

    /* renamed from: b, reason: collision with root package name */
    public final String f55605b;

    public f(String key, String value) {
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        this.f55604a = key;
        this.f55605b = value;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return Intrinsics.b(this.f55604a, fVar.f55604a) && Intrinsics.b(this.f55605b, fVar.f55605b);
    }

    public final int hashCode() {
        return this.f55605b.hashCode() + (this.f55604a.hashCode() * 31);
    }

    public final String toString() throws UnsupportedEncodingException {
        Charset charset = Charsets.f72000b;
        String strEncode = URLEncoder.encode(this.f55604a, charset.name());
        Intrinsics.f(strEncode, "encode(...)");
        String strEncode2 = URLEncoder.encode(this.f55605b, charset.name());
        Intrinsics.f(strEncode2, "encode(...)");
        return u4.m(strEncode, "=", strEncode2);
    }
}
