package pl;

/* loaded from: classes.dex */
public enum x0 implements com.google.crypto.tink.shaded.protobuf.z {
    UNKNOWN_HASH(0),
    SHA1(1),
    SHA384(2),
    SHA256(3),
    SHA512(4),
    SHA224(5),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f82655a;

    x0(int i5) {
        this.f82655a = i5;
    }

    public static x0 a(int i5) {
        if (i5 == 0) {
            return UNKNOWN_HASH;
        }
        if (i5 == 1) {
            return SHA1;
        }
        if (i5 == 2) {
            return SHA384;
        }
        if (i5 == 3) {
            return SHA256;
        }
        if (i5 == 4) {
            return SHA512;
        }
        if (i5 != 5) {
            return null;
        }
        return SHA224;
    }

    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f82655a;
        }
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }
}
