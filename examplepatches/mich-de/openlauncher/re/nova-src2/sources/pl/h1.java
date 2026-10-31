package pl;

/* loaded from: classes3.dex */
public enum h1 implements com.google.crypto.tink.shaded.protobuf.z {
    UNKNOWN_STATUS(0),
    ENABLED(1),
    DISABLED(2),
    DESTROYED(3),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f82632a;

    h1(int i5) {
        this.f82632a = i5;
    }

    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f82632a;
        }
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }
}
