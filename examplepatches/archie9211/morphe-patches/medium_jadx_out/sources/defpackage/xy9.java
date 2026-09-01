package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public enum xy9 {
    BOOLEAN(1),
    FLOAT(2),
    INTEGER(3),
    LONG(4),
    STRING(5),
    STRING_SET(6),
    DOUBLE(7),
    BYTES(8),
    VALUE_NOT_SET(0);

    public final int a;

    xy9(int i) {
        this.a = i;
    }

    public static xy9 forNumber(int i) {
        switch (i) {
            case 0:
                return VALUE_NOT_SET;
            case 1:
                return BOOLEAN;
            case 2:
                return FLOAT;
            case 3:
                return INTEGER;
            case 4:
                return LONG;
            case 5:
                return STRING;
            case 6:
                return STRING_SET;
            case 7:
                return DOUBLE;
            case 8:
                return BYTES;
            default:
                return null;
        }
    }

    public int getNumber() {
        return this.a;
    }

    @Deprecated
    public static xy9 valueOf(int i) {
        return forNumber(i);
    }
}
