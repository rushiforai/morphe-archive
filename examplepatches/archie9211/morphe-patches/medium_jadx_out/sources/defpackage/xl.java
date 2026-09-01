package defpackage;

import android.content.Context;
import android.net.http.X509TrustManagerExtensions;
import android.os.Build;
import android.os.StrictMode;
import android.security.NetworkSecurityPolicy;
import android.util.CloseGuard;
import android.util.Log;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.X509TrustManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xl extends ea9 implements c92 {
    public static final boolean e;
    public Context c;
    public final ArrayList d;

    static {
        e = Build.VERSION.SDK_INT >= 29;
    }

    public xl() {
        ArrayList arrayListS0 = k80.s0(new yjc[]{Build.VERSION.SDK_INT >= 29 ? new yl() : null, new u33(js.f), new u33(z42.a), new u33(sx0.a)});
        ArrayList arrayList = new ArrayList();
        for (Object obj : arrayListS0) {
            if (((yjc) obj).b()) {
                arrayList.add(obj);
            }
        }
        this.d = arrayList;
    }

    @Override // defpackage.c92
    public final void a(Context context) {
        this.c = context;
    }

    @Override // defpackage.c92
    public final Context b() {
        return this.c;
    }

    @Override // defpackage.ea9
    public final f49 c(X509TrustManager x509TrustManager) {
        X509TrustManagerExtensions x509TrustManagerExtensions;
        try {
            x509TrustManagerExtensions = new X509TrustManagerExtensions(x509TrustManager);
        } catch (IllegalArgumentException unused) {
            x509TrustManagerExtensions = null;
        }
        rm rmVar = x509TrustManagerExtensions != null ? new rm(x509TrustManager, x509TrustManagerExtensions) : null;
        if (rmVar != null) {
            return rmVar;
        }
        StrictMode.noteSlowCall("buildTrustRootIndex");
        X509Certificate[] acceptedIssuers = x509TrustManager.getAcceptedIssuers();
        return new no0(new qp0((X509Certificate[]) Arrays.copyOf(acceptedIssuers, acceptedIssuers.length)));
    }

    @Override // defpackage.ea9
    public final void d(SSLSocket sSLSocket, String str, List list) {
        Object next;
        Iterator it2 = this.d.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            } else {
                next = it2.next();
                if (((yjc) next).a(sSLSocket)) {
                    break;
                }
            }
        }
        yjc yjcVar = (yjc) next;
        if (yjcVar != null) {
            yjcVar.d(sSLSocket, str, list);
        }
    }

    @Override // defpackage.ea9
    public final String f(SSLSocket sSLSocket) {
        Object next;
        Iterator it2 = this.d.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (((yjc) next).a(sSLSocket)) {
                break;
            }
        }
        yjc yjcVar = (yjc) next;
        if (yjcVar != null) {
            return yjcVar.c(sSLSocket);
        }
        return null;
    }

    @Override // defpackage.ea9
    public final Object g() {
        if (Build.VERSION.SDK_INT < 30) {
            return super.g();
        }
        CloseGuard closeGuard = new CloseGuard();
        closeGuard.open("response.body().close()");
        return closeGuard;
    }

    @Override // defpackage.ea9
    public final boolean h(String str) {
        str.getClass();
        return NetworkSecurityPolicy.getInstance().isCleartextTrafficPermitted(str);
    }

    @Override // defpackage.ea9
    public final void i(int i, String str, Throwable th) {
        if (i == 5) {
            boolean z = gr.e;
            Log.w("OkHttp", str, th);
        } else {
            boolean z2 = gr.e;
            Log.i("OkHttp", str, th);
        }
    }

    @Override // defpackage.ea9
    public final void j(String str, Object obj) {
        if (Build.VERSION.SDK_INT < 30) {
            super.j(str, obj);
        } else {
            obj.getClass();
            ((CloseGuard) obj).warnIfOpen();
        }
    }

    @Override // defpackage.ea9
    public final SSLContext k() throws NoSuchAlgorithmException {
        StrictMode.noteSlowCall("newSSLContext");
        SSLContext sSLContext = SSLContext.getInstance("TLS");
        sSLContext.getClass();
        return sSLContext;
    }
}
