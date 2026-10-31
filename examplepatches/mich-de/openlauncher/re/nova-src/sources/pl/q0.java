package pl;

/* loaded from: classes3.dex */
public enum q0 implements com.google.crypto.tink.shaded.protobuf.z {
    UNKNOWN_ENCODING(0),
    IEEE_P1363(1),
    DER(2),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f82638a;

    q0(int i5) {
        this.f82638a = i5;
    }

    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f82638a;
        }
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }
}
