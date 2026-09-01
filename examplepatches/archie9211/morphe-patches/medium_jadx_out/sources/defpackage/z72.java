package defpackage;

import android.view.contentcapture.ContentCaptureSession;
import java.nio.charset.Charset;
import java.util.Set;
import kotlin.KotlinNothingValueException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class z72 implements qrd, dz1 {
    public final /* synthetic */ int a;

    public static /* bridge */ /* synthetic */ ContentCaptureSession a(Object obj) {
        return (ContentCaptureSession) obj;
    }

    public static /* synthetic */ void b() {
        throw new KotlinNothingValueException();
    }

    public static /* synthetic */ void c(String str) {
        throw new NullPointerException(str);
    }

    public static /* synthetic */ void d(String str, Object obj) {
        throw new IllegalArgumentException(str + obj);
    }

    public static /* synthetic */ void e(String str, Object obj, Object obj2) {
        throw new IllegalStateException((str + obj + obj2).toString());
    }

    @Override // defpackage.qrd
    public Object apply(Object obj) {
        nu2.b.getClass();
        return rd2.a.I((pd2) obj).getBytes(Charset.forName("UTF-8"));
    }

    @Override // defpackage.dz1
    public Object f(iq1 iq1Var) {
        Set setS = iq1Var.S(rj0.class);
        md5 md5Var = md5.c;
        if (md5Var == null) {
            synchronized (md5.class) {
                try {
                    md5Var = md5.c;
                    if (md5Var == null) {
                        md5Var = new md5(0);
                        md5.c = md5Var;
                    }
                } finally {
                }
            }
        }
        return new e33(setS, md5Var);
    }
}
