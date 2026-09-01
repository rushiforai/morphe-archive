package defpackage;

import android.os.Build;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import javax.net.ssl.SSLSocket;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class js implements yjc {
    public static final tz7 f = new tz7(11, false);
    public final Class a;
    public final Method b;
    public final Method c;
    public final Method d;
    public final Method e;

    public js(Class cls) throws NoSuchMethodException {
        this.a = cls;
        Method declaredMethod = cls.getDeclaredMethod("setUseSessionTickets", Boolean.TYPE);
        declaredMethod.getClass();
        this.b = declaredMethod;
        this.c = cls.getMethod("setHostname", String.class);
        this.d = cls.getMethod("getAlpnSelectedProtocol", null);
        this.e = cls.getMethod("setAlpnProtocols", byte[].class);
    }

    @Override // defpackage.yjc
    public final boolean a(SSLSocket sSLSocket) {
        return this.a.isInstance(sSLSocket);
    }

    @Override // defpackage.yjc
    public final boolean b() {
        boolean z = gr.e;
        return gr.e;
    }

    @Override // defpackage.yjc
    public final String c(SSLSocket sSLSocket) {
        if (this.a.isInstance(sSLSocket)) {
            try {
                byte[] bArr = (byte[]) this.d.invoke(sSLSocket, null);
                if (bArr != null) {
                    return new String(bArr, wk1.a);
                }
            } catch (IllegalAccessException e) {
                ay0.d(e);
                return null;
            } catch (InvocationTargetException e2) {
                Throwable cause = e2.getCause();
                if (!(cause instanceof NullPointerException) || !g76.L(((NullPointerException) cause).getMessage(), "ssl == null")) {
                    ay0.d(e2);
                    return null;
                }
            }
        }
        return null;
    }

    @Override // defpackage.yjc
    public final void d(SSLSocket sSLSocket, String str, List list) {
        if (this.a.isInstance(sSLSocket)) {
            try {
                this.b.invoke(sSLSocket, Boolean.TRUE);
                if (str != null && Build.VERSION.SDK_INT <= 23) {
                    this.c.invoke(sSLSocket, str);
                }
                Method method = this.e;
                ea9 ea9Var = ea9.a;
                method.invoke(sSLSocket, u3b.k(list));
            } catch (IllegalAccessException e) {
                ay0.d(e);
            } catch (InvocationTargetException e2) {
                ay0.d(e2);
            }
        }
    }
}
