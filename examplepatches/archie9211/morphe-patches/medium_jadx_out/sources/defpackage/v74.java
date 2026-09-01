package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class v74 {
    public static final t74 a = new t74();
    public static final t74 b;

    static {
        u7a u7aVar = u7a.c;
        t74 t74Var = null;
        try {
            t74Var = (t74) Class.forName("androidx.datastore.preferences.protobuf.ExtensionSchemaFull").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        b = t74Var;
    }
}
