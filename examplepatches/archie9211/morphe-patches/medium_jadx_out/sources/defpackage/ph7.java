package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ph7 {
    public static final nh7 a;
    public static final nh7 b;

    static {
        nh7 nh7Var = null;
        try {
            nh7Var = (nh7) Class.forName("com.google.protobuf.MapFieldSchemaFull").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        a = nh7Var;
        b = new nh7();
    }
}
