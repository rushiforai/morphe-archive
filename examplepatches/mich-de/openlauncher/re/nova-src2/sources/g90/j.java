package g90;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSocket;
import kotlin.jvm.internal.Intrinsics;
import x80.f0;

/* loaded from: classes5.dex */
public final class j extends m {

    /* renamed from: c, reason: collision with root package name */
    public static final boolean f57267c;

    static {
        String property = System.getProperty("java.specification.version");
        Integer numU0 = property != null ? r70.i.u0(property) : null;
        boolean z11 = false;
        if (numU0 == null) {
            try {
                SSLSocket.class.getMethod("getApplicationProtocol", null);
                z11 = true;
            } catch (NoSuchMethodException unused) {
            }
        } else if (numU0.intValue() >= 9) {
            z11 = true;
        }
        f57267c = z11;
    }

    @Override // g90.m
    public final void d(SSLSocket sSLSocket, String str, List protocols) {
        Intrinsics.g(protocols, "protocols");
        SSLParameters sSLParameters = sSLSocket.getSSLParameters();
        ArrayList arrayList = new ArrayList();
        for (Object obj : protocols) {
            if (((f0) obj) != f0.HTTP_1_0) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(((f0) it.next()).f95490a);
        }
        sSLParameters.setApplicationProtocols((String[]) arrayList2.toArray(new String[0]));
        sSLSocket.setSSLParameters(sSLParameters);
    }

    @Override // g90.m
    public final String f(SSLSocket sSLSocket) {
        try {
            String applicationProtocol = sSLSocket.getApplicationProtocol();
            if (applicationProtocol == null ? true : applicationProtocol.equals(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
                return null;
            }
            return applicationProtocol;
        } catch (UnsupportedOperationException unused) {
            return null;
        }
    }
}
