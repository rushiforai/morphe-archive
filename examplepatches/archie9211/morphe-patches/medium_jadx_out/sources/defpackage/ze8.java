package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ze8 {
    public static final xe8 a;
    public static final xe8 b;

    static {
        xe8 xe8Var = null;
        try {
            xe8Var = (xe8) Class.forName("com.google.protobuf.NewInstanceSchemaFull").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        a = xe8Var;
        b = new xe8();
    }
}
