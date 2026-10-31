package x80;

import java.util.regex.Pattern;

/* loaded from: classes5.dex */
public final class c extends p0 {

    /* renamed from: d, reason: collision with root package name */
    public final z80.e f95407d;

    /* renamed from: e, reason: collision with root package name */
    public final String f95408e;

    /* renamed from: f, reason: collision with root package name */
    public final String f95409f;

    /* renamed from: g, reason: collision with root package name */
    public final m90.d0 f95410g;

    public c(z80.e eVar, String str, String str2) {
        this.f95407d = eVar;
        this.f95408e = str;
        this.f95409f = str2;
        this.f95410g = x7.f.r(new eb0.v((m90.j0) eVar.f98323c.get(1), this));
    }

    @Override // x80.p0
    public final long contentLength() {
        String str = this.f95409f;
        if (str == null) {
            return -1L;
        }
        byte[] bArr = y80.c.f96853a;
        try {
            return Long.parseLong(str);
        } catch (NumberFormatException unused) {
            return -1L;
        }
    }

    @Override // x80.p0
    public final a0 contentType() {
        String str = this.f95408e;
        if (str == null) {
            return null;
        }
        Pattern pattern = a0.f95396e;
        return z.b(str);
    }

    @Override // x80.p0
    public final m90.i source() {
        return this.f95410g;
    }
}
