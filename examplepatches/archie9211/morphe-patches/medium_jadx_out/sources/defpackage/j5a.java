package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum j5a implements o56 {
    CLASS(0),
    INTERFACE(1),
    ENUM_CLASS(2),
    ENUM_ENTRY(3),
    ANNOTATION_CLASS(4),
    OBJECT(5),
    COMPANION_OBJECT(6);

    public final int a;

    j5a(int i) {
        this.a = i;
    }

    public static j5a valueOf(int i) {
        switch (i) {
            case 0:
                return CLASS;
            case 1:
                return INTERFACE;
            case 2:
                return ENUM_CLASS;
            case 3:
                return ENUM_ENTRY;
            case 4:
                return ANNOTATION_CLASS;
            case 5:
                return OBJECT;
            case 6:
                return COMPANION_OBJECT;
            default:
                return null;
        }
    }

    @Override // defpackage.o56
    public final int getNumber() {
        return this.a;
    }
}
