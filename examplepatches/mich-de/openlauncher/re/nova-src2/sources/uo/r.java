package uo;

import java.io.Serializable;
import java.util.Objects;

/* loaded from: classes4.dex */
public final class r implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final String f91498a;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f91499b;

    /* renamed from: c, reason: collision with root package name */
    public final lp.b f91500c;

    public r(String str) {
        Objects.requireNonNull(str, "The string must not be null");
        this.f91498a = str;
        this.f91499b = null;
        this.f91500c = null;
    }

    public final String toString() {
        String str = this.f91498a;
        if (str != null) {
            return str;
        }
        byte[] bArr = this.f91499b;
        if (bArr != null) {
            return new String(bArr, lp.f.f75086a);
        }
        lp.b bVar = this.f91500c;
        if (bVar != null) {
            return new String(bVar.a(), lp.f.f75086a);
        }
        return null;
    }

    public r(byte[] bArr) {
        this.f91498a = null;
        Objects.requireNonNull(bArr, "The byte array must not be null");
        this.f91499b = bArr;
        this.f91500c = null;
    }

    public r(lp.b bVar) {
        this.f91498a = null;
        this.f91499b = null;
        Objects.requireNonNull(bVar, "The Base64URL-encoded object must not be null");
        this.f91500c = bVar;
    }
}
