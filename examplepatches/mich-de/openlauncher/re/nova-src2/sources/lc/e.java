package lc;

import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Base64;
import com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI;
import com.fyber.inneractive.sdk.ignite.h;
import com.fyber.inneractive.sdk.ignite.k;
import com.fyber.inneractive.sdk.ignite.l;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.UnrecoverableEntryException;
import java.security.cert.CertificateException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import javax.crypto.NoSuchPaddingException;
import l1.a2;
import m.w;
import org.json.JSONArray;
import org.json.JSONException;
import ps.j;
import tm.o;

/* loaded from: classes2.dex */
public final class e extends c {

    /* renamed from: c, reason: collision with root package name */
    public o f74847c;

    /* renamed from: d, reason: collision with root package name */
    public l f74848d;

    /* renamed from: e, reason: collision with root package name */
    public final w f74849e;

    /* renamed from: f, reason: collision with root package name */
    public final b50.d f74850f;

    /* renamed from: g, reason: collision with root package name */
    public jc.b f74851g;

    /* renamed from: h, reason: collision with root package name */
    public oc.a f74852h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f74853i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f74854j;

    /* renamed from: k, reason: collision with root package name */
    public final AtomicBoolean f74855k;

    public e(a aVar, boolean z11, boolean z12, h hVar, l lVar) {
        super(aVar, hVar);
        this.f74853i = false;
        this.f74854j = false;
        this.f74855k = new AtomicBoolean(false);
        this.f74848d = lVar;
        this.f74853i = z11;
        this.f74850f = new b50.d();
        this.f74849e = new w(aVar.g());
        this.f74854j = z12;
        if (z12) {
            Context contextG = aVar.g();
            o oVar = new o(29, false);
            oVar.f89494c = contextG.getApplicationContext();
            tc.a aVar2 = new tc.a();
            aVar2.f88954b = false;
            aVar2.f88953a = oVar;
            oVar.f89493b = aVar2;
            oVar.f89495d = this;
            oVar.f89496e = this;
            this.f74847c = oVar;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:53:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0104  */
    @Override // lc.c, lc.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b() throws JSONException {
        boolean z11;
        k kVar;
        String strB;
        jc.b bVarF;
        nc.c cVar = nc.c.ENCRYPTION_EXCEPTION;
        jc.b bVar = this.f74851g;
        AtomicBoolean atomicBoolean = this.f74855k;
        rc.a aVar = rc.a.f85792b;
        if (bVar == null) {
            Object[] objArr = {"OneDTAuthenticator"};
            k kVar2 = aVar.f85793a;
            if (kVar2 != null) {
                kVar2.i("%s : initializing new Ignite authentication session", objArr);
            }
            w wVar = this.f74849e;
            wVar.getClass();
            a2 a2Var = (a2) wVar.f75379c;
            try {
                a2Var.c();
            } catch (IOException e3) {
                e = e3;
                nc.a.b(cVar, j.b(e, nc.b.FAILED_INIT_ENCRYPTION));
            } catch (InvalidAlgorithmParameterException e11) {
                e = e11;
                nc.a.b(cVar, j.b(e, nc.b.FAILED_INIT_ENCRYPTION));
            } catch (InvalidKeyException e12) {
                e = e12;
                nc.a.b(cVar, j.b(e, nc.b.FAILED_INIT_ENCRYPTION));
            } catch (KeyStoreException e13) {
                e = e13;
                nc.a.b(cVar, j.b(e, nc.b.FAILED_INIT_ENCRYPTION));
            } catch (NoSuchAlgorithmException e14) {
                e = e14;
                nc.a.b(cVar, j.b(e, nc.b.FAILED_INIT_ENCRYPTION));
            } catch (NoSuchProviderException e15) {
                e = e15;
                nc.a.b(cVar, j.b(e, nc.b.FAILED_INIT_ENCRYPTION));
            } catch (UnrecoverableEntryException e16) {
                e = e16;
                nc.a.b(cVar, j.b(e, nc.b.FAILED_INIT_ENCRYPTION));
            } catch (CertificateException e17) {
                e = e17;
                nc.a.b(cVar, j.b(e, nc.b.FAILED_INIT_ENCRYPTION));
            } catch (NoSuchPaddingException e18) {
                e = e18;
                nc.a.b(cVar, j.b(e, nc.b.FAILED_INIT_ENCRYPTION));
            } catch (Exception e19) {
                nc.a.b(cVar, j.b(e19, nc.b.FAILED_INIT_ENCRYPTION));
            }
            String string = ((SharedPreferences) wVar.f75378b).getString("odt", null);
            if (TextUtils.isEmpty(string)) {
                strB = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                this.f74850f.getClass();
                bVarF = b50.d.f(strB);
                this.f74851g = bVarF;
                if (bVarF.f69432b <= TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis())) {
                }
            } else {
                try {
                    JSONArray jSONArray = new JSONArray(string);
                    strB = a2Var.b(jSONArray.getString(1), Base64.decode(jSONArray.getString(0), 0));
                } catch (IOException e21) {
                    e = e21;
                    nc.a.b(cVar, j.b(e, nc.b.FAILED_EXTRACT_ENCRYPTED_DATA));
                    strB = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    this.f74850f.getClass();
                    bVarF = b50.d.f(strB);
                    this.f74851g = bVarF;
                    if (bVarF.f69432b <= TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis())) {
                    }
                    z11 = this.f74854j;
                    if (!z11) {
                    }
                    if (this.f74853i) {
                    }
                    Object[] objArr2 = {"OneDTAuthenticator"};
                    kVar = aVar.f85793a;
                    if (kVar != null) {
                    }
                    this.f74844a.b();
                } catch (InvalidAlgorithmParameterException e22) {
                    e = e22;
                    nc.a.b(cVar, j.b(e, nc.b.FAILED_EXTRACT_ENCRYPTED_DATA));
                    strB = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    this.f74850f.getClass();
                    bVarF = b50.d.f(strB);
                    this.f74851g = bVarF;
                    if (bVarF.f69432b <= TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis())) {
                    }
                    z11 = this.f74854j;
                    if (!z11) {
                    }
                    if (this.f74853i) {
                    }
                    Object[] objArr22 = {"OneDTAuthenticator"};
                    kVar = aVar.f85793a;
                    if (kVar != null) {
                    }
                    this.f74844a.b();
                } catch (InvalidKeyException e23) {
                    e = e23;
                    nc.a.b(cVar, j.b(e, nc.b.FAILED_EXTRACT_ENCRYPTED_DATA));
                    strB = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    this.f74850f.getClass();
                    bVarF = b50.d.f(strB);
                    this.f74851g = bVarF;
                    if (bVarF.f69432b <= TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis())) {
                    }
                    z11 = this.f74854j;
                    if (!z11) {
                    }
                    if (this.f74853i) {
                    }
                    Object[] objArr222 = {"OneDTAuthenticator"};
                    kVar = aVar.f85793a;
                    if (kVar != null) {
                    }
                    this.f74844a.b();
                } catch (NoSuchAlgorithmException e24) {
                    e = e24;
                    nc.a.b(cVar, j.b(e, nc.b.FAILED_EXTRACT_ENCRYPTED_DATA));
                    strB = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    this.f74850f.getClass();
                    bVarF = b50.d.f(strB);
                    this.f74851g = bVarF;
                    if (bVarF.f69432b <= TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis())) {
                    }
                    z11 = this.f74854j;
                    if (!z11) {
                    }
                    if (this.f74853i) {
                    }
                    Object[] objArr2222 = {"OneDTAuthenticator"};
                    kVar = aVar.f85793a;
                    if (kVar != null) {
                    }
                    this.f74844a.b();
                } catch (NoSuchPaddingException e25) {
                    e = e25;
                    nc.a.b(cVar, j.b(e, nc.b.FAILED_EXTRACT_ENCRYPTED_DATA));
                    strB = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    this.f74850f.getClass();
                    bVarF = b50.d.f(strB);
                    this.f74851g = bVarF;
                    if (bVarF.f69432b <= TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis())) {
                    }
                    z11 = this.f74854j;
                    if (!z11) {
                    }
                    if (this.f74853i) {
                    }
                    Object[] objArr22222 = {"OneDTAuthenticator"};
                    kVar = aVar.f85793a;
                    if (kVar != null) {
                    }
                    this.f74844a.b();
                } catch (JSONException e26) {
                    e = e26;
                    nc.a.b(cVar, j.b(e, nc.b.FAILED_EXTRACT_ENCRYPTED_DATA));
                    strB = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    this.f74850f.getClass();
                    bVarF = b50.d.f(strB);
                    this.f74851g = bVarF;
                    if (bVarF.f69432b <= TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis())) {
                    }
                    z11 = this.f74854j;
                    if (!z11) {
                    }
                    if (this.f74853i) {
                    }
                    Object[] objArr222222 = {"OneDTAuthenticator"};
                    kVar = aVar.f85793a;
                    if (kVar != null) {
                    }
                    this.f74844a.b();
                } catch (Exception e27) {
                    nc.a.b(cVar, j.b(e27, nc.b.FAILED_EXTRACT_ENCRYPTED_DATA));
                }
                this.f74850f.getClass();
                bVarF = b50.d.f(strB);
                this.f74851g = bVarF;
                if (bVarF.f69432b <= TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis())) {
                    rc.a.a("%s : One DT resolved from cache", "OneDTAuthenticator");
                    jc.b bVar2 = this.f74851g;
                    l lVar = this.f74848d;
                    if (lVar != null) {
                        rc.a.a("%s : setting one dt entity", "IgniteManager");
                        lVar.f69430b = bVar2;
                    }
                } else {
                    atomicBoolean.set(true);
                }
            }
        }
        z11 = this.f74854j;
        if (!z11 && this.f74847c == null) {
            rc.a.b("%s : unable to authenticate: authenticator destroyed", "OneDTAuthenticator");
            a("Unable to authenticate: authenticator destroyed");
            return;
        }
        if (this.f74853i && !atomicBoolean.get()) {
            if (z11) {
                this.f74847c.M();
            }
        } else {
            Object[] objArr2222222 = {"OneDTAuthenticator"};
            kVar = aVar.f85793a;
            if (kVar != null) {
                kVar.i("%s : will try to authenticate with Ignite if didn't done yet", objArr2222222);
            }
            this.f74844a.b();
        }
    }

    @Override // lc.c, lc.a
    public final void c(ComponentName componentName, IBinder iBinder) {
        pc.a aVar;
        a aVar2 = this.f74844a;
        boolean zJ = aVar2.j();
        if (!zJ && (aVar = this.f74845b) != null) {
            aVar.onOdtUnsupported();
        }
        if (this.f74847c != null && aVar2.j() && this.f74854j) {
            this.f74847c.M();
        }
        if (zJ || this.f74853i) {
            super.c(componentName, iBinder);
        }
    }

    @Override // lc.c, lc.a
    public final String d() {
        a aVar = this.f74844a;
        if (aVar instanceof c) {
            return aVar.d();
        }
        return null;
    }

    @Override // lc.c, lc.a
    public final void destroy() {
        this.f74848d = null;
        o oVar = this.f74847c;
        if (oVar != null) {
            tc.a aVar = (tc.a) oVar.f89493b;
            if (aVar != null && aVar.f88954b) {
                ((Context) oVar.f89494c).unregisterReceiver(aVar);
                ((tc.a) oVar.f89493b).f88954b = false;
            }
            tc.a aVar2 = (tc.a) oVar.f89493b;
            if (aVar2 != null) {
                aVar2.f88953a = null;
                oVar.f89493b = null;
            }
            oVar.f89495d = null;
            oVar.f89494c = null;
            oVar.f89496e = null;
            this.f74847c = null;
        }
        oc.a aVar3 = this.f74852h;
        if (aVar3 != null) {
            kc.b bVar = aVar3.f80313b;
            if (bVar != null) {
                bVar.f71325c.clear();
                aVar3.f80313b = null;
            }
            aVar3.f80314c = null;
            aVar3.f80312a = null;
            this.f74852h = null;
        }
        this.f74845b = null;
        this.f74844a.destroy();
    }

    @Override // lc.c, lc.a
    public final String i() {
        a aVar = this.f74844a;
        if (aVar instanceof c) {
            return aVar.i();
        }
        return null;
    }

    @Override // lc.c, lc.a
    public final boolean j() {
        return this.f74844a.j();
    }

    public final void l() {
        a aVar = this.f74844a;
        IIgniteServiceAPI iIgniteServiceAPIK = aVar.k();
        nc.c cVar = nc.c.ONE_DT_REQUEST_ERROR;
        if (iIgniteServiceAPIK == null) {
            rc.a.b("%s : service is unavailable", "OneDTAuthenticator");
            nc.b bVar = nc.b.FAILED_INIT_ENCRYPTION;
            nc.a.b(cVar, "error_code", "Ignite service unavailable");
            return;
        }
        if (this.f74852h == null) {
            oc.a aVar2 = new oc.a();
            aVar2.f80312a = this;
            aVar2.f80313b = new kc.b(aVar2);
            aVar2.f80314c = iIgniteServiceAPIK;
            this.f74852h = aVar2;
        }
        if (TextUtils.isEmpty(aVar.e())) {
            nc.b bVar2 = nc.b.FAILED_INIT_ENCRYPTION;
            nc.a.b(cVar, "error_code", "Invalid session token");
            rc.a.b("%s : service session is unavailable", "OneDTAuthenticator");
            return;
        }
        oc.a aVar3 = this.f74852h;
        String strE = aVar.e();
        aVar3.getClass();
        try {
            Bundle bundle = new Bundle();
            bundle.putString("clientToken", strE);
            aVar3.f80314c.getProperty("onedtid", bundle, new Bundle(), aVar3.f80313b);
        } catch (RemoteException e3) {
            nc.a.a(cVar, e3);
            rc.a.b("%s : request failed : %s", "OneDTPropertyHandler", e3.toString());
        }
    }

    @Override // lc.c, lc.a
    public final void c(String str) {
        super.c(str);
        a aVar = this.f74844a;
        if (aVar.h()) {
            AtomicBoolean atomicBoolean = this.f74855k;
            if (atomicBoolean.get() && aVar.j()) {
                atomicBoolean.set(false);
                l();
            }
        }
    }
}
