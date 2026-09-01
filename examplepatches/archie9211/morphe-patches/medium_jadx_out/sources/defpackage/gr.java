package defpackage;

import android.content.Context;
import android.net.http.X509TrustManagerExtensions;
import android.os.Build;
import android.os.StrictMode;
import android.security.NetworkSecurityPolicy;
import android.util.Log;
import java.io.IOException;
import java.lang.reflect.Method;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArraySet;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.X509TrustManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gr extends ea9 implements c92 {
    public static final boolean e;
    public Context c;
    public final ArrayList d;

    static {
        e = Build.VERSION.SDK_INT < 29;
    }

    public gr() {
        fnc fncVar;
        try {
            Class<?> cls = Class.forName("com.android.org.conscrypt".concat(".OpenSSLSocketImpl"));
            Class.forName("com.android.org.conscrypt".concat(".OpenSSLSocketFactoryImpl"));
            Class.forName("com.android.org.conscrypt".concat(".SSLParametersImpl"));
            fncVar = new fnc(cls);
        } catch (Exception e2) {
            CopyOnWriteArraySet copyOnWriteArraySet = eq.a;
            eq.a(up8.class.getName(), 5, "unable to load android socket classes", e2);
            fncVar = null;
        }
        ArrayList arrayListS0 = k80.s0(new yjc[]{fncVar, new u33(js.f), new u33(z42.a), new u33(sx0.a)});
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
        ptd qp0Var;
        try {
            x509TrustManagerExtensions = new X509TrustManagerExtensions(x509TrustManager);
        } catch (IllegalArgumentException unused) {
            x509TrustManagerExtensions = null;
        }
        rm rmVar = x509TrustManagerExtensions != null ? new rm(x509TrustManager, x509TrustManagerExtensions) : null;
        if (rmVar != null) {
            return rmVar;
        }
        try {
            StrictMode.noteSlowCall("buildTrustRootIndex");
            Method declaredMethod = x509TrustManager.getClass().getDeclaredMethod("findTrustAnchorByIssuerAndSignature", X509Certificate.class);
            declaredMethod.setAccessible(true);
            qp0Var = new fr(x509TrustManager, declaredMethod);
        } catch (NoSuchMethodException unused2) {
            X509Certificate[] acceptedIssuers = x509TrustManager.getAcceptedIssuers();
            qp0Var = new qp0((X509Certificate[]) Arrays.copyOf(acceptedIssuers, acceptedIssuers.length));
        }
        return new no0(qp0Var);
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
    public final void e(Socket socket, InetSocketAddress inetSocketAddress, int i) throws IOException {
        inetSocketAddress.getClass();
        try {
            socket.connect(inetSocketAddress, i);
        } catch (ClassCastException e2) {
            if (Build.VERSION.SDK_INT != 26) {
                throw e2;
            }
            throw new IOException("Exception in connect", e2);
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
    public final boolean h(String str) {
        str.getClass();
        return Build.VERSION.SDK_INT >= 24 ? NetworkSecurityPolicy.getInstance().isCleartextTrafficPermitted(str) : NetworkSecurityPolicy.getInstance().isCleartextTrafficPermitted();
    }

    @Override // defpackage.ea9
    public final void i(int i, String str, Throwable th) {
        if (i == 5) {
            Log.w("OkHttp", str, th);
        } else {
            Log.i("OkHttp", str, th);
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
