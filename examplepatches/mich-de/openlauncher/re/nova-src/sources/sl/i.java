package sl;

import java.security.GeneralSecurityException;
import java.security.Provider;
import java.security.Security;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f87507a;

    /* renamed from: b, reason: collision with root package name */
    public final k f87508b;

    public /* synthetic */ i(k kVar, int i5) {
        this.f87507a = i5;
        this.f87508b = kVar;
    }

    public final Object a(String str) throws GeneralSecurityException {
        switch (this.f87507a) {
            case 0:
                String[] strArr = {"GmsCore_OpenSSL", "AndroidOpenSSL"};
                ArrayList arrayList = new ArrayList();
                for (int i5 = 0; i5 < 2; i5++) {
                    Provider provider = Security.getProvider(strArr[i5]);
                    if (provider != null) {
                        arrayList.add(provider);
                    }
                }
                Iterator it = arrayList.iterator();
                Exception exc = null;
                while (true) {
                    boolean zHasNext = it.hasNext();
                    k kVar = this.f87508b;
                    if (!zHasNext) {
                        return kVar.a(str, null);
                    }
                    try {
                        return kVar.a(str, (Provider) it.next());
                    } catch (Exception e3) {
                        if (exc == null) {
                            exc = e3;
                        }
                    }
                }
            case 1:
                return this.f87508b.a(str, null);
            default:
                String[] strArr2 = {"GmsCore_OpenSSL", "AndroidOpenSSL", "Conscrypt"};
                ArrayList arrayList2 = new ArrayList();
                for (int i11 = 0; i11 < 3; i11++) {
                    Provider provider2 = Security.getProvider(strArr2[i11]);
                    if (provider2 != null) {
                        arrayList2.add(provider2);
                    }
                }
                Iterator it2 = arrayList2.iterator();
                Exception exc2 = null;
                while (it2.hasNext()) {
                    try {
                        return this.f87508b.a(str, (Provider) it2.next());
                    } catch (Exception e11) {
                        if (exc2 == null) {
                            exc2 = e11;
                        }
                    }
                }
                throw new GeneralSecurityException("No good Provider found.", exc2);
        }
    }
}
