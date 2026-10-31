package om;

import android.text.TextUtils;
import com.google.firebase.installations.FirebaseInstallationsException;
import java.io.IOException;
import java.util.Iterator;

/* loaded from: classes.dex */
public final /* synthetic */ class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f80507a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d f80508b;

    public /* synthetic */ c(d dVar, int i5) {
        this.f80507a = i5;
        this.f80508b = dVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0056  */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() {
        pm.b bVarI;
        switch (this.f80507a) {
            case 0:
                this.f80508b.a();
                return;
            case 1:
                this.f80508b.a();
                return;
            default:
                d dVar = this.f80508b;
                pm.b bVarD = dVar.d();
                try {
                    int i5 = bVarD.f82666b;
                    if (i5 == 5) {
                        bVarI = dVar.i(bVarD);
                    } else {
                        if (i5 == 3) {
                            bVarI = dVar.i(bVarD);
                        } else if (!dVar.f80513d.a(bVarD)) {
                            return;
                        } else {
                            bVarI = dVar.b(bVarD);
                        }
                    }
                    dVar.f(bVarI);
                    synchronized (dVar) {
                        if (bVarI.a()) {
                            String str = bVarI.f82665a;
                            boolean z11 = !TextUtils.isEmpty(str) ? !TextUtils.equals(bVarD.f82665a, str) ? true : !bVarD.a() : false;
                            if (z11) {
                                Iterator it = dVar.f80520k.iterator();
                                while (it.hasNext()) {
                                    ((tm.i) it.next()).a();
                                }
                            }
                        }
                    }
                    if (bVarI.a()) {
                        String str2 = bVarI.f82665a;
                        synchronized (dVar) {
                            dVar.f80519j = str2;
                        }
                    }
                    int i11 = bVarI.f82666b;
                    if (i11 == 5) {
                        dVar.j(new FirebaseInstallationsException());
                        return;
                    }
                    if (i11 == 2 || i11 == 1) {
                        dVar.j(new IOException("Installation ID could not be validated with the Firebase servers (maybe it was deleted). Firebase Installations will need to create a new Installation ID and auth token. Please retry your last request."));
                        return;
                    } else {
                        dVar.k(bVarI);
                        return;
                    }
                } catch (FirebaseInstallationsException e3) {
                    dVar.j(e3);
                    return;
                }
        }
    }
}
