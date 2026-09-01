package defpackage;

import java.lang.reflect.InvocationTargetException;
import org.chromium.support_lib_boundary.WebViewProviderFactoryBoundaryInterface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class a2f {
    public static final f2f a;

    static {
        f2f xsaVar;
        try {
            xsaVar = new qlb((WebViewProviderFactoryBoundaryInterface) vx0.H(WebViewProviderFactoryBoundaryInterface.class, jq7.n()));
        } catch (ClassNotFoundException unused) {
            xsaVar = new xsa(3);
        } catch (IllegalAccessException e) {
            ik4.j(e);
            return;
        } catch (NoSuchMethodException e2) {
            ik4.j(e2);
            return;
        } catch (InvocationTargetException e3) {
            ik4.j(e3);
            return;
        }
        a = xsaVar;
    }
}
