package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class v17 {
    public static final u17 a;
    public static final u17 b;

    static {
        u7a u7aVar = u7a.c;
        u17 u17Var = null;
        try {
            u17Var = (u17) Class.forName("androidx.datastore.preferences.protobuf.ListFieldSchemaFull").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        a = u17Var;
        b = new u17();
    }
}
