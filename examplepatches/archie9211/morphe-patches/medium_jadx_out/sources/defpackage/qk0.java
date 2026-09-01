package defpackage;

import java.io.IOException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.ServiceLoader;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qk0 implements m45 {
    public static final qk0 b = new qk0(0);
    public static final qk0 c = new qk0(1);
    public static final qk0 d = new qk0(2);
    public static final qk0 e = new qk0(3);
    public static final qk0 f = new qk0(4);
    public static final qk0 g = new qk0(5);
    public static final qk0 h = new qk0(6);
    public static final qk0 i = new qk0(7);
    public static final qk0 j = new qk0(8);
    public static final qk0 k = new qk0(9);
    public static final qk0 l = new qk0(10);
    public static final qk0 m = new qk0(11);
    public static final /* synthetic */ qk0 n = new qk0(15);
    public final /* synthetic */ int a;

    public /* synthetic */ qk0(int i2) {
        this.a = i2;
    }

    @Override // defpackage.m45
    public final Object invoke() throws NoSuchAlgorithmException, IOException, KeyStoreException, CertificateException {
        switch (this.a) {
            case 0:
                return new uu1(op8.j(1308617531));
            case 1:
                t01 t01Var = t01.a;
                ServiceLoader serviceLoaderLoad = ServiceLoader.load(u01.class, u01.class.getClassLoader());
                serviceLoaderLoad.getClass();
                u01 u01Var = (u01) bu1.y0(serviceLoaderLoad);
                if (u01Var != null) {
                    return u01Var;
                }
                ygf.f("No BuiltInsLoader implementation was found. Please ensure that the META-INF/services/ is not stripped from your application and that the Java virtual machine is not running under a security manager");
                return null;
            case 2:
                return new uu1(uu1.b);
            case 3:
                return new uu1(uu1.b);
            case 4:
                zx2 zx2Var = new zx2(new x67("DefaultBuiltIns"));
                zx2Var.c();
                return zx2Var;
            case 5:
                Set set = w93.b;
                return ey3.a;
            case 6:
                n14 n14Var = n14.a;
                return (zx2) zx2.f.getValue();
            case 7:
                return null;
            case 8:
                fj6[] fj6VarArr = a96.g;
                Map mapSingletonMap = Collections.singletonMap(n86.a, new kuc("Deprecated in Java"));
                mapSingletonMap.getClass();
                return mapSingletonMap;
            case 9:
                fj6[] fj6VarArr2 = ah6.q;
                return Object.class;
            case 10:
                rz7 rz7Var = rz7.a;
                ServiceLoader serviceLoaderLoad2 = ServiceLoader.load(sz7.class, sz7.class.getClassLoader());
                serviceLoaderLoad2.getClass();
                List listM1 = bu1.m1(serviceLoaderLoad2);
                if (!listM1.isEmpty()) {
                    return listM1;
                }
                ygf.f("No MetadataExtensions instances found in the classpath. Please ensure that the META-INF/services/ is not stripped from your application and that the Java virtual machine is not running under a security manager");
                return null;
            case 11:
                return c1e.a;
            case 12:
                return new Object[6];
            case 13:
                return new Object[7];
            case 14:
                throw null;
            default:
                KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
                keyStore.load(null);
                return keyStore;
        }
    }
}
