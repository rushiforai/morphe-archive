package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qh7 {
    public static final oh7 a;
    public static final oh7 b;

    static {
        u7a u7aVar = u7a.c;
        oh7 oh7Var = null;
        try {
            oh7Var = (oh7) Class.forName("androidx.datastore.preferences.protobuf.MapFieldSchemaFull").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        a = oh7Var;
        b = new oh7();
    }
}
