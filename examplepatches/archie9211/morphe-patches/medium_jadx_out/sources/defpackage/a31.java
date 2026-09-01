package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class a31 {
    public static final /* synthetic */ int a = 0;

    static {
        Object ajbVar;
        try {
            ajbVar = Class.forName("java.lang.ClassValue");
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        if (!(ajbVar instanceof ajb)) {
            ajbVar = Boolean.TRUE;
        }
        Object obj = Boolean.FALSE;
        if (ajbVar instanceof ajb) {
            ajbVar = obj;
        }
    }
}
