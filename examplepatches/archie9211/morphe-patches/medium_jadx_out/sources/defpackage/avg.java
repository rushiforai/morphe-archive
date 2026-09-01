package defpackage;

import java.security.Provider;
import java.security.Security;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class avg implements fvg {
    public final /* synthetic */ int a;
    public final jvg b;

    public /* synthetic */ avg(jvg jvgVar, int i) {
        this.a = i;
        this.b = jvgVar;
    }

    @Override // defpackage.fvg
    public final Object a(String str) {
        int i = this.a;
        jvg jvgVar = this.b;
        switch (i) {
            case 0:
                String[] strArr = {"GmsCore_OpenSSL", "AndroidOpenSSL"};
                ArrayList arrayList = new ArrayList();
                for (int i2 = 0; i2 < 2; i2++) {
                    Provider provider = Security.getProvider(strArr[i2]);
                    if (provider != null) {
                        arrayList.add(provider);
                    }
                }
                Iterator it2 = arrayList.iterator();
                Exception exc = null;
                while (it2.hasNext()) {
                    try {
                        return jvgVar.d(str, (Provider) it2.next());
                    } catch (Exception e) {
                        if (exc == null) {
                            exc = e;
                        }
                    }
                }
                return jvgVar.d(str, null);
            default:
                return jvgVar.d(str, null);
        }
    }
}
