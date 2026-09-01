package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class af8 {
    public static final ye8 a;
    public static final ye8 b;

    static {
        u7a u7aVar = u7a.c;
        ye8 ye8Var = null;
        try {
            ye8Var = (ye8) Class.forName("androidx.datastore.preferences.protobuf.NewInstanceSchemaFull").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        a = ye8Var;
        b = new ye8();
    }
}
