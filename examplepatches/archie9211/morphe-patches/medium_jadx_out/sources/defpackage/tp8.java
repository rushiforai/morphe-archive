package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.android.material.internal.It.KLTXZbnQvj;
import j$.util.DesugarCollections;
import java.net.ProxySelector;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;
import javax.net.SocketFactory;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.X509TrustManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tp8 {
    public int A;
    public int B;
    public long C;
    public zm7 D;
    public cgd E;
    public zg7 b;
    public ywb e;
    public boolean f;
    public boolean g;
    public wz7 h;
    public boolean i;
    public boolean j;
    public ba2 k;
    public x21 l;
    public oi3 m;
    public ProxySelector n;
    public wz7 o;
    public SocketFactory p;
    public SSLSocketFactory q;
    public X509TrustManager r;
    public List s;
    public List t;
    public HostnameVerifier u;
    public oj1 v;
    public f49 w;
    public int x;
    public int y;
    public int z;
    public n0c a = new n0c(15);
    public final ArrayList c = new ArrayList();
    public final ArrayList d = new ArrayList();

    public tp8() {
        TimeZone timeZone = ggf.a;
        this.e = new ywb(29);
        this.f = true;
        this.g = true;
        wz7 wz7Var = wz7.c;
        this.h = wz7Var;
        this.i = true;
        this.j = true;
        this.k = ba2.b0;
        this.m = oi3.c0;
        this.o = wz7Var;
        SocketFactory socketFactory = SocketFactory.getDefault();
        socketFactory.getClass();
        this.p = socketFactory;
        this.s = up8.G;
        this.t = up8.F;
        this.u = pp8.a;
        this.v = oj1.c;
        this.y = PhotoshopDirectory.TAG_PRINT_FLAGS_INFO;
        this.z = PhotoshopDirectory.TAG_PRINT_FLAGS_INFO;
        this.A = PhotoshopDirectory.TAG_PRINT_FLAGS_INFO;
        this.B = 60000;
        this.C = 1024L;
    }

    public final void a(List list) {
        list.getClass();
        ArrayList arrayList = new ArrayList(list);
        c8a c8aVar = c8a.H2_PRIOR_KNOWLEDGE;
        if (!arrayList.contains(c8aVar) && !arrayList.contains(c8a.HTTP_1_1)) {
            lg8.t("protocols must contain h2_prior_knowledge or http/1.1: ", arrayList);
            return;
        }
        if (arrayList.contains(c8aVar) && arrayList.size() > 1) {
            lg8.t(KLTXZbnQvj.bjPfjFyR, arrayList);
            return;
        }
        if (!arrayList.contains(c8a.HTTP_1_0)) {
            if (!arrayList.contains(null)) {
                arrayList.remove(c8a.SPDY_3);
                if (!arrayList.equals(this.t)) {
                    this.D = null;
                }
                List listUnmodifiableList = DesugarCollections.unmodifiableList(arrayList);
                listUnmodifiableList.getClass();
                this.t = listUnmodifiableList;
                return;
            }
            ay0.e("protocols must not contain null");
            return;
        }
        lg8.t("protocols must not contain http/1.0: ", arrayList);
    }
}
