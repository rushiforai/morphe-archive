package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public enum gc9 {
    STAR(1),
    POLYGON(2);

    public final int a;

    gc9(int i) {
        this.a = i;
    }

    public static gc9 forValue(int i) {
        for (gc9 gc9Var : values()) {
            if (gc9Var.a == i) {
                return gc9Var;
            }
        }
        return null;
    }
}
