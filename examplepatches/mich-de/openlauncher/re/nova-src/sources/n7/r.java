package n7;

import android.webkit.WebMessage;
import android.webkit.WebMessagePort;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import org.chromium.support_lib_boundary.WebMessagePortBoundaryInterface;
import org.chromium.support_lib_boundary.WebkitToCompatConverterBoundaryInterface;

/* loaded from: classes2.dex */
public final class r extends m7.k {

    /* renamed from: a, reason: collision with root package name */
    public WebMessagePort f77934a;

    /* renamed from: b, reason: collision with root package name */
    public WebMessagePortBoundaryInterface f77935b;

    public r(WebMessagePort webMessagePort) {
        this.f77934a = webMessagePort;
    }

    public static WebMessage a(m7.j jVar) {
        WebMessagePort[] webMessagePortArr;
        String strB = jVar.b();
        m7.k[] kVarArr = jVar.f76025a;
        if (kVarArr == null) {
            webMessagePortArr = null;
        } else {
            int length = kVarArr.length;
            WebMessagePort[] webMessagePortArr2 = new WebMessagePort[length];
            for (int i5 = 0; i5 < length; i5++) {
                webMessagePortArr2[i5] = ((r) kVarArr[i5]).b();
            }
            webMessagePortArr = webMessagePortArr2;
        }
        return new WebMessage(strB, webMessagePortArr);
    }

    public static m7.k[] c(WebMessagePort[] webMessagePortArr) {
        if (webMessagePortArr == null) {
            return null;
        }
        m7.k[] kVarArr = new m7.k[webMessagePortArr.length];
        for (int i5 = 0; i5 < webMessagePortArr.length; i5++) {
            kVarArr[i5] = new r(webMessagePortArr[i5]);
        }
        return kVarArr;
    }

    public final WebMessagePort b() throws IllegalArgumentException {
        if (this.f77934a == null) {
            d dVar = x.f77964a;
            this.f77934a = (WebMessagePort) ((WebkitToCompatConverterBoundaryInterface) dVar.f77914b).convertWebMessagePort(Proxy.getInvocationHandler(this.f77935b));
        }
        return this.f77934a;
    }

    public r(InvocationHandler invocationHandler) {
        this.f77935b = (WebMessagePortBoundaryInterface) u90.b.i(WebMessagePortBoundaryInterface.class, invocationHandler);
    }
}
