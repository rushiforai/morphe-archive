package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class b80 {
    public static final int a;

    static {
        Object ajbVar;
        try {
            String property = System.getProperty("kotlinx.serialization.json.pool.size");
            property.getClass();
            ajbVar = tuc.O(property);
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        if (ajbVar instanceof ajb) {
            ajbVar = null;
        }
        Integer num = (Integer) ajbVar;
        a = num != null ? num.intValue() : 2097152;
    }
}
