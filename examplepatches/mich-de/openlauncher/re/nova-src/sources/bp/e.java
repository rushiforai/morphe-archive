package bp;

/* loaded from: classes4.dex */
public enum e {
    SIGN("sign"),
    VERIFY("verify"),
    ENCRYPT("encrypt"),
    DECRYPT("decrypt"),
    WRAP_KEY("wrapKey"),
    UNWRAP_KEY("unwrapKey"),
    /* JADX INFO: Fake field, exist only in values array */
    DERIVE_KEY("deriveKey"),
    /* JADX INFO: Fake field, exist only in values array */
    DERIVE_BITS("deriveBits");


    /* renamed from: a, reason: collision with root package name */
    public final String f18383a;

    e(String str) {
        this.f18383a = str;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.f18383a;
    }
}
