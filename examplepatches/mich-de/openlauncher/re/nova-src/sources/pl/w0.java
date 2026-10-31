package pl;

/* loaded from: classes3.dex */
public enum w0 implements com.google.crypto.tink.shaded.protobuf.z {
    UNKNOWN_CURVE(0),
    NIST_P256(2),
    NIST_P384(3),
    NIST_P521(4),
    CURVE25519(5),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f82646a;

    w0(int i5) {
        this.f82646a = i5;
    }

    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f82646a;
        }
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }
}
