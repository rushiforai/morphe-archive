package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class gmc {
    public static final /* synthetic */ int a = 0;

    static {
        Object ajbVar;
        Object ajbVar2;
        Exception exc = new Exception();
        String simpleName = bgf.class.getSimpleName();
        StackTraceElement stackTraceElement = exc.getStackTrace()[0];
        new StackTraceElement("_COROUTINE.".concat(simpleName), "_", stackTraceElement.getFileName(), stackTraceElement.getLineNumber());
        try {
            ajbVar = kn0.class.getCanonicalName();
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        if (bjb.b(ajbVar) != null) {
            ajbVar = "kotlin.coroutines.jvm.internal.BaseContinuationImpl";
        }
        try {
            ajbVar2 = gmc.class.getCanonicalName();
        } catch (Throwable th2) {
            ajbVar2 = new ajb(th2);
        }
        if (bjb.b(ajbVar2) != null) {
            ajbVar2 = "kotlinx.coroutines.internal.StackTraceRecoveryKt";
        }
    }
}
