package ads_mobile_sdk;

import java.io.Closeable;
import java.nio.charset.Charset;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes.dex */
public final class ww2 implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f11503a;

    public ww2(byte[] bArr) {
        this.f11503a = bArr;
    }

    public static String a(ww2 ww2Var) {
        Charset charset = Charsets.f72000b;
        ww2Var.getClass();
        Intrinsics.g(charset, "charset");
        return new String(ww2Var.f11503a, charset);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
    }
}
