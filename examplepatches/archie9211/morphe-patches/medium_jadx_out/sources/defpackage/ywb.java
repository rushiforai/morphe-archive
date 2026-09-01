package defpackage;

import android.util.Log;
import com.adobe.internal.xmp.XMPException;
import com.google.firebase.datatransport.TransportRegistrar;
import java.io.File;
import java.io.IOException;
import java.util.NoSuchElementException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ywb implements o92, qsd, dz1 {
    public final /* synthetic */ int a;

    public static /* synthetic */ void d() {
        throw new AssertionError();
    }

    public static /* synthetic */ void e(int i, String str) throws XMPException {
        throw new XMPException(str, i);
    }

    public static /* synthetic */ void g(Object obj) {
        throw new IllegalArgumentException(obj.toString());
    }

    public static /* synthetic */ void h(String str) {
        throw new NoSuchElementException(str);
    }

    public static /* synthetic */ void i(String str, Object obj) {
        throw new UnsupportedOperationException(str + obj);
    }

    public static /* synthetic */ void j(String str, Object obj, Object obj2, Object obj3) {
        throw new IllegalArgumentException(str + obj + obj2 + obj3);
    }

    public static /* synthetic */ void k(String str, Object obj, Throwable th) {
        throw new RuntimeException(str + obj, th);
    }

    public static /* synthetic */ void l(StringBuilder sb, Object obj, Object obj2) {
        sb.append(obj);
        sb.append(obj2);
        throw new IllegalArgumentException(sb.toString());
    }

    public static /* synthetic */ void n() {
        throw new NoSuchElementException();
    }

    public static /* synthetic */ void o(String str, Object obj) throws IOException {
        throw new IOException(str + obj);
    }

    @Override // defpackage.dz1
    public Object f(iq1 iq1Var) {
        switch (this.a) {
            case 10:
                return TransportRegistrar.lambda$getComponents$0(iq1Var);
            case 11:
                return TransportRegistrar.lambda$getComponents$1(iq1Var);
            default:
                return TransportRegistrar.lambda$getComponents$2(iq1Var);
        }
    }

    @Override // defpackage.o92
    public Object m0(jrg jrgVar) {
        boolean z;
        if (jrgVar.k()) {
            wh0 wh0Var = (wh0) jrgVar.i();
            uob uobVar = uob.e;
            uobVar.o("Crashlytics report successfully enqueued to DataTransport: " + wh0Var.b);
            File file = wh0Var.c;
            if (file.delete()) {
                uobVar.o("Deleted report file: " + file.getPath());
            } else {
                uobVar.q("Crashlytics could not delete report file: " + file.getPath(), null);
            }
            z = true;
        } else {
            Log.w("FirebaseCrashlytics", "Crashlytics report could not be enqueued to DataTransport", jrgVar.h());
            z = false;
        }
        return Boolean.valueOf(z);
    }

    public /* synthetic */ ywb(int i) {
        this.a = i;
    }

    @Override // defpackage.qsd
    public void a(Exception exc) {
    }
}
