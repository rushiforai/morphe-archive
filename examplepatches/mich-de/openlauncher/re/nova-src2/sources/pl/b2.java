package pl;

/* loaded from: classes.dex */
public enum b2 implements com.google.crypto.tink.shaded.protobuf.z {
    UNKNOWN_PREFIX(0),
    TINK(1),
    LEGACY(2),
    RAW(3),
    CRUNCHY(4),
    WITH_ID_REQUIREMENT(5),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f82616a;

    b2(int i5) {
        this.f82616a = i5;
    }

    public static b2 a(int i5) {
        if (i5 == 0) {
            return UNKNOWN_PREFIX;
        }
        if (i5 == 1) {
            return TINK;
        }
        if (i5 == 2) {
            return LEGACY;
        }
        if (i5 == 3) {
            return RAW;
        }
        if (i5 == 4) {
            return CRUNCHY;
        }
        if (i5 != 5) {
            return null;
        }
        return WITH_ID_REQUIREMENT;
    }

    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f82616a;
        }
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }
}
