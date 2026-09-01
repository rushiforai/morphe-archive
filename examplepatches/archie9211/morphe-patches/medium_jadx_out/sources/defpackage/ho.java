package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.util.LongSparseArray;
import androidx.core.widget.nRCC.nGxjfIr;
import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController;
import androidx.credentials.playservices.controllers.identityauth.createpassword.CredentialProviderCreatePasswordController;
import androidx.credentials.playservices.controllers.identityauth.createpublickeycredential.CredentialProviderCreatePublicKeyCredentialController;
import androidx.credentials.playservices.controllers.identityauth.getsigninintent.CredentialProviderGetSignInIntentController;
import androidx.credentials.playservices.controllers.identitycredentials.createdigitalcredential.CreateDigitalCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.createpasswordcredential.CreatePasswordCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.createpublickeycredential.CreatePublicKeyCredentialController;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicMarkableReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class ho implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ ho(nc2 nc2Var, Throwable th) {
        this.a = 18;
        Map map = Collections.EMPTY_MAP;
        this.b = nc2Var;
        this.c = th;
    }

    private final void a() {
        v80 v80Var = (v80) this.b;
        x45 x45Var = (x45) this.c;
        synchronized (v80Var.c) {
            x45Var.invoke(v80Var.b);
        }
    }

    private final void b() {
        m33 m33Var;
        bw8 bw8Var = (bw8) this.b;
        h8a h8aVar = (h8a) this.c;
        if (bw8Var.b != bw8.d) {
            ygf.f("provide() can be called only once.");
            return;
        }
        synchronized (bw8Var) {
            m33Var = bw8Var.a;
            bw8Var.a = null;
            bw8Var.b = h8aVar;
        }
        m33Var.e(h8aVar);
    }

    private final void c() {
        vv6 vv6Var = (vv6) this.b;
        h8a h8aVar = (h8a) this.c;
        synchronized (vv6Var) {
            try {
                if (vv6Var.b == null) {
                    vv6Var.a.add(h8aVar);
                } else {
                    vv6Var.b.add(h8aVar.get());
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    private final void d() {
        nc2 nc2Var = (nc2) this.b;
        String str = (String) this.c;
        lod lodVar = nc2Var.g.d;
        String strB = cl6.b(1024, str);
        synchronized (((AtomicMarkableReference) lodVar.g)) {
            try {
                String str2 = (String) ((AtomicMarkableReference) lodVar.g).getReference();
                if (strB == null ? str2 == null : strB.equals(str2)) {
                    return;
                }
                ((AtomicMarkableReference) lodVar.g).set(strB, true);
                ((ud2) ((m50) lodVar.b).c).a(new b2a(8, lodVar));
            } finally {
            }
        }
    }

    private final void e() {
        nc2 nc2Var = (nc2) this.b;
        Map map = (Map) this.c;
        zf3 zf3Var = (zf3) nc2Var.g.d.d;
        synchronized (zf3Var) {
            ((cl6) ((AtomicMarkableReference) zf3Var.d).getReference()).d(map);
            AtomicMarkableReference atomicMarkableReference = (AtomicMarkableReference) zf3Var.d;
            atomicMarkableReference.set((cl6) atomicMarkableReference.getReference(), true);
        }
        zf3Var.o();
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = 0;
        switch (this.a) {
            case 0:
                io.d((mo) this.b, (LongSparseArray) this.c);
                return;
            case 1:
                s10 s10Var = (s10) this.b;
                try {
                    ((Runnable) this.c).run();
                    return;
                } finally {
                    s10Var.c();
                }
            case 2:
                y3 y3Var = (y3) this.b;
                i40 i40Var = (i40) this.c;
                if (ec2.a.contains(l40.class)) {
                    return;
                }
                try {
                    y3Var.getClass();
                    pkf pkfVar = l40.a;
                    synchronized (pkfVar) {
                        b1c b1cVarY = pkfVar.y(y3Var);
                        if (b1cVarY != null) {
                            b1cVarY.a(i40Var);
                        }
                        break;
                    }
                    String str = g50.c;
                    if (o7f.u() != f50.EXPLICIT_ONLY && l40.a.v() > 100) {
                        l40.d(xq4.EVENT_THRESHOLD);
                        return;
                    } else {
                        if (l40.c == null) {
                            l40.c = l40.b.schedule(l40.d, 15L, TimeUnit.SECONDS);
                            return;
                        }
                        return;
                    }
                } catch (Throwable th) {
                    ec2.a(l40.class, th);
                    return;
                }
            case 3:
                y3 y3Var2 = (y3) this.b;
                b1c b1cVar = (b1c) this.c;
                if (ec2.a.contains(l40.class)) {
                    return;
                }
                try {
                    m40.S(y3Var2, b1cVar);
                    return;
                } catch (Throwable th2) {
                    ec2.a(l40.class, th2);
                    return;
                }
            case 4:
                Integer num = (Integer) this.b;
                List list = (List) this.c;
                if (bu1.p0(e50.a, num) || !bu1.p0(e50.b, num)) {
                    return;
                }
                if (e50.e >= 5) {
                    e50.a().clear();
                    e50.e = 0;
                    return;
                } else {
                    e50.a().addAll(0, list);
                    e50.e++;
                    return;
                }
            case 5:
                Context context = (Context) this.b;
                g50 g50Var = (g50) this.c;
                Bundle bundle = new Bundle();
                String[] strArr = {"com.facebook.core.Core", "com.facebook.login.Login", nGxjfIr.eHyTcinSorqtT, "com.facebook.places.Places", "com.facebook.messenger.Messenger", "com.facebook.applinks.AppLinks", "com.facebook.marketing.Marketing", "com.facebook.gamingservices.GamingServices", "com.facebook.all.All", "com.android.billingclient.api.BillingClient", "com.android.vending.billing.IInAppBillingService"};
                String[] strArr2 = {"core_lib_included", "login_lib_included", "share_lib_included", "places_lib_included", "messenger_lib_included", "applinks_lib_included", "marketing_lib_included", "gamingservices_lib_included", "all_lib_included", "billing_client_lib_included", "billing_service_lib_included"};
                int i2 = 0;
                for (int i3 = 0; i3 < 11; i3++) {
                    String str2 = strArr[i3];
                    String str3 = strArr2[i3];
                    try {
                        Class.forName(str2);
                        bundle.putInt(str3, 1);
                        i2 |= 1 << i3;
                    } catch (ClassNotFoundException unused) {
                    }
                }
                SharedPreferences sharedPreferences = context.getSharedPreferences("com.facebook.sdk.appEventPreferences", 0);
                if (sharedPreferences.getInt("kitsBitmask", 0) != i2) {
                    sharedPreferences.edit().putInt("kitsBitmask", i2).apply();
                    g50Var.g("fb_sdk_initialize", bundle);
                    return;
                }
                return;
            case 6:
                a();
                return;
            case 7:
                ((cz0) this.b).d((Context) this.c);
                return;
            case 8:
                m7f m7fVar = (m7f) this.b;
                String string = ((UUID) this.c).toString();
                string.getClass();
                bgf.u(m7fVar, string);
                return;
            case 9:
                String str4 = (String) this.b;
                Bundle bundle2 = (Bundle) this.c;
                if (ec2.a.contains(dq1.class)) {
                    return;
                }
                try {
                    new g50(f94.a(), (String) null).d(str4, bundle2);
                    return;
                } catch (Throwable th3) {
                    ec2.a(dq1.class, th3);
                    return;
                }
            case 10:
                xy1 xy1Var = (xy1) this.b;
                xy1Var.getLifecycle().a(new ly1((iq8) this.c, i, xy1Var));
                return;
            case 11:
                b();
                return;
            case 12:
                c();
                return;
            case 13:
                List<in0> list2 = (List) this.b;
                q62 q62Var = (q62) this.c;
                for (in0 in0Var : list2) {
                    Object obj = q62Var.d;
                    jn0 jn0Var = in0Var.a;
                    Object l72Var = jn0Var.e(obj) ? new l72(jn0Var.d()) : k72.a;
                    l2a l2aVar = in0Var.b;
                    l2aVar.getClass();
                    l2aVar.e(l72Var);
                }
                return;
            case 14:
                ((oa2) this.b).e((Context) this.c);
                return;
            case 15:
                ((jc2) this.b).b((String) this.c, Boolean.FALSE);
                return;
            case 16:
                d();
                return;
            case 17:
                e();
                return;
            case 18:
                nc2 nc2Var = (nc2) this.b;
                Throwable th4 = (Throwable) this.c;
                Map map = Collections.EMPTY_MAP;
                jc2 jc2Var = nc2Var.g;
                Thread threadCurrentThread = Thread.currentThread();
                jc2Var.getClass();
                long jCurrentTimeMillis = System.currentTimeMillis();
                td2 td2Var = jc2Var.n;
                if (td2Var == null || !td2Var.e.get()) {
                    long j = jCurrentTimeMillis / 1000;
                    String strD = jc2Var.d();
                    if (strD == null) {
                        Log.w("FirebaseCrashlytics", "Tried to write a non-fatal exception while no session was open.", null);
                        return;
                    }
                    q34 q34Var = new q34(strD, j, map);
                    jz1 jz1Var = jc2Var.m;
                    String strConcat = "Persisting non-fatal event for session ".concat(strD);
                    if (Log.isLoggable("FirebaseCrashlytics", 2)) {
                        Log.v("FirebaseCrashlytics", strConcat, null);
                    }
                    jz1Var.y(th4, threadCurrentThread, "error", q34Var, false);
                    return;
                }
                return;
            case 19:
                CreateDigitalCredentialController.handleResponse$lambda$4$0((CreateDigitalCredentialController) this.b, (bf2) this.c);
                return;
            case 20:
                CreatePasswordCredentialController.handleResponse$lambda$3$0((CreatePasswordCredentialController) this.b, (bf2) this.c);
                return;
            case 21:
                ((ah2) this.b).a((CreateCredentialException) this.c);
                return;
            case 22:
                CreatePublicKeyCredentialController.handleResponse$lambda$3$0((CreatePublicKeyCredentialController) this.b, (bf2) this.c);
                return;
            case 23:
                CredentialProviderBeginSignInController.handleResponse$lambda$5$0((CredentialProviderBeginSignInController) this.b, (GetCredentialUnknownException) this.c);
                return;
            case 24:
                CredentialProviderBeginSignInController.handleResponse$lambda$2$0((CredentialProviderBeginSignInController) this.b, (k95) this.c);
                return;
            case 25:
                CredentialProviderBeginSignInController.handleResponse$lambda$3$0((CredentialProviderBeginSignInController) this.b, (rya) this.c);
                return;
            case 26:
                ((ah2) this.b).a(this.c);
                return;
            case 27:
                CredentialProviderCreatePasswordController.handleResponse$lambda$2$0((CredentialProviderCreatePasswordController) this.b, (bf2) this.c);
                return;
            case 28:
                CredentialProviderCreatePublicKeyCredentialController.handleResponse$lambda$4$0((CredentialProviderCreatePublicKeyCredentialController) this.b, (bf2) this.c);
                return;
            default:
                CredentialProviderGetSignInIntentController.handleResponse$lambda$5$0((CredentialProviderGetSignInIntentController) this.b, (GetCredentialUnknownException) this.c);
                return;
        }
    }

    public /* synthetic */ ho(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }
}
