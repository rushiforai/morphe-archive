package el;

import b.c0;
import b.u4;
import java.security.GeneralSecurityException;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes3.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final CopyOnWriteArrayList f52807a = new CopyOnWriteArrayList();

    public static void a(String str) throws GeneralSecurityException {
        Iterator it = f52807a.iterator();
        if (!it.hasNext()) {
            throw new GeneralSecurityException(c0.k("No KMS client does support: ", str));
        }
        throw u4.e(it);
    }
}
