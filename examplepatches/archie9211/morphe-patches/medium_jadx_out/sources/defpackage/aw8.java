package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum aw8 {
    UNSET(0),
    TRUE(1),
    FALSE(2);

    public final int a;

    aw8(int i) {
        this.a = i;
    }

    public static aw8 fromBoolean(Boolean bool) {
        return bool == null ? UNSET : bool.booleanValue() ? TRUE : FALSE;
    }

    public int getValue() {
        return this.a;
    }
}
