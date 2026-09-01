package defpackage;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.os.Trace;
import android.util.Log;
import android.view.View;
import android.view.Window;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import org.json.JSONObject;
import sprig.graphics.k;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ep0 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ ep0(z46 z46Var, String str, m45 m45Var, n68 n68Var, q41 q41Var) {
        this.a = 4;
        this.b = z46Var;
        this.d = str;
        this.c = m45Var;
        this.e = n68Var;
        this.f = q41Var;
    }

    @Override // java.lang.Runnable
    public final void run() throws IOException {
        k78 k78VarD;
        boolean zEquals;
        Runnable bx3Var;
        switch (this.a) {
            case 0:
                mkd mkdVar = (mkd) this.b;
                ip6 ip6Var = (ip6) this.c;
                String str = (String) this.d;
                m73 m73Var = (m73) this.e;
                yy4 yy4Var = (yy4) this.f;
                Trace.beginSection("BackgroundTextMeasurement");
                try {
                    oic oicVarH = uic.h();
                    k78 k78Var = oicVarH instanceof k78 ? (k78) oicVarH : null;
                    if (k78Var == null || (k78VarD = k78Var.D(null, null)) == null) {
                        throw new IllegalStateException("Cannot create a mutable snapshot of an read-only snapshot");
                    }
                    try {
                        oic oicVarJ = k78VarD.j();
                        try {
                            mkd mkdVarC = il7.C(mkdVar, ip6Var);
                            ey3 ey3Var = ey3.a;
                            ar arVar = new ar(str, mkdVarC, ey3Var, ey3Var, yy4Var, m73Var);
                            arVar.q();
                            arVar.h();
                            k78VarD.w().E();
                            Trace.endSection();
                            return;
                        } finally {
                            oic.q(oicVarJ);
                        }
                    } finally {
                    }
                } catch (Throwable th) {
                    Trace.endSection();
                    throw th;
                }
            case 1:
                b52 b52Var = (b52) this.b;
                tqd tqdVar = (tqd) this.c;
                qg4 qg4Var = (qg4) this.d;
                tqd tqdVar2 = (tqd) this.e;
                qg4 qg4Var2 = (qg4) this.f;
                m50 m50Var = b52Var.c;
                qg4Var.getClass();
                tqdVar2.getClass();
                qg4Var2.getClass();
                rv8 rv8Var = (rv8) m50Var.d;
                f66 f66Var = (f66) m50Var.c;
                pkf pkfVar = (pkf) m50Var.b;
                f09 f09Var = new f09(tqdVar, tqdVar2);
                tqd tqdVar3 = tqd.PENDING;
                if (f09Var.equals(new f09(null, tqdVar3)) ? true : f09Var.equals(new f09(null, tqd.GRANTED)) ? true : f09Var.equals(new f09(null, tqd.NOT_GRANTED)) ? true : f09Var.equals(new f09(tqdVar3, tqd.NOT_GRANTED))) {
                    bx3Var = new n71(qg4Var.g(), pkfVar, f66Var, rv8Var);
                } else {
                    tqd tqdVar4 = tqd.GRANTED;
                    if (f09Var.equals(new f09(tqdVar4, tqdVar3)) ? true : f09Var.equals(new f09(tqd.NOT_GRANTED, tqdVar3))) {
                        bx3Var = new n71(qg4Var2.g(), pkfVar, f66Var, rv8Var);
                    } else if (f09Var.equals(new f09(tqdVar3, tqdVar4))) {
                        bx3Var = new t48(qg4Var.g(), qg4Var2.g(), (pkf) m50Var.b, (f66) m50Var.c, (rv8) m50Var.d);
                    } else {
                        if (f09Var.equals(new f09(tqdVar3, tqdVar3)) ? true : f09Var.equals(new f09(tqdVar4, tqdVar4)) ? true : f09Var.equals(new f09(tqdVar4, tqd.NOT_GRANTED))) {
                            zEquals = true;
                        } else {
                            tqd tqdVar5 = tqd.NOT_GRANTED;
                            zEquals = f09Var.equals(new f09(tqdVar5, tqdVar5));
                        }
                        boolean zEquals2 = zEquals ? true : f09Var.equals(new f09(tqd.NOT_GRANTED, tqdVar4));
                        int i = 2;
                        if (zEquals2) {
                            bx3Var = new bx3(i);
                        } else {
                            f49.L((f66) m50Var.c, d66.WARN, d46.R(e66.MAINTAINER, e66.TELEMETRY), new cn(tqdVar, 6, tqdVar2), null, 56);
                            bx3Var = new bx3(i);
                        }
                    }
                }
                bx3Var.run();
                b52Var.f = qg4Var2;
                return;
            case 2:
                mo3 mo3Var = (mo3) this.b;
                m6d m6dVar = (m6d) this.c;
                m6d m6dVar2 = (m6d) this.d;
                n1 n1Var = (n1) this.e;
                View view = (View) this.f;
                Window window = n1Var.getWindow();
                window.getClass();
                x45 x45Var = m6dVar.c;
                Resources resources = view.getResources();
                resources.getClass();
                boolean zBooleanValue = ((Boolean) x45Var.invoke(resources)).booleanValue();
                x45 x45Var2 = m6dVar2.c;
                Resources resources2 = view.getResources();
                resources2.getClass();
                mo3Var.b(m6dVar, m6dVar2, window, view, zBooleanValue, ((Boolean) x45Var2.invoke(resources2)).booleanValue());
                return;
            case 3:
                URL url = (URL) this.b;
                rya ryaVar = (rya) this.c;
                String str2 = (String) this.d;
                ReentrantLock reentrantLock = (ReentrantLock) this.e;
                Condition condition = (Condition) this.f;
                str2.getClass();
                URLConnection uRLConnectionOpenConnection = url.openConnection();
                uRLConnectionOpenConnection.getClass();
                HttpURLConnection httpURLConnection = (HttpURLConnection) uRLConnectionOpenConnection;
                try {
                    try {
                        InputStream inputStream = httpURLConnection.getInputStream();
                        inputStream.getClass();
                        String strY = qk7.y(new BufferedReader(new InputStreamReader(inputStream, wk1.a), 8192));
                        httpURLConnection.getInputStream().close();
                        ryaVar.a = new JSONObject(strY).optString(str2);
                        httpURLConnection.disconnect();
                        reentrantLock.lock();
                        try {
                            condition.signal();
                        } finally {
                        }
                        break;
                    } catch (Exception e) {
                        String name = op8.class.getName();
                        String message = e.getMessage();
                        if (message == null) {
                            message = "Error getting public key";
                        }
                        Log.d(name, message);
                        httpURLConnection.disconnect();
                        reentrantLock.lock();
                        try {
                            condition.signal();
                        } finally {
                        }
                        break;
                    }
                    return;
                } catch (Throwable th2) {
                    httpURLConnection.disconnect();
                    reentrantLock.lock();
                    try {
                        condition.signal();
                        throw th2;
                    } finally {
                    }
                }
            case 4:
                z46 z46Var = (z46) this.b;
                String str3 = (String) this.d;
                m45 m45Var = (m45) this.c;
                n68 n68Var = (n68) this.e;
                q41 q41Var = (q41) this.f;
                z46Var.getClass();
                boolean zE = gq7.E();
                if (zE) {
                    try {
                        Trace.beginSection(gq7.X(str3));
                    } finally {
                        if (zE) {
                            Trace.endSection();
                        }
                    }
                }
                try {
                    m45Var.invoke();
                    bv8 bv8Var = md5.d;
                    n68Var.h(bv8Var);
                    q41Var.a(bv8Var);
                } catch (Throwable th3) {
                    n68Var.h(new av8(th3));
                    q41Var.b(th3);
                }
                if (zE) {
                    return;
                } else {
                    return;
                }
            default:
                k.a((k) this.b, (View) this.c, (Bitmap) this.d, (Point) this.e, (k.e) this.f);
                return;
        }
    }

    public /* synthetic */ ep0(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
        this.f = obj5;
    }
}
