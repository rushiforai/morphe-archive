package defpackage;

import android.content.Context;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.work.impl.WorkDatabase;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import java.io.ByteArrayInputStream;
import java.io.CharConversionException;
import java.io.File;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.KeyStoreException;
import java.security.ProviderException;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class iv2 implements uc8, ete {
    public Object a;
    public Object b;
    public Object c;
    public Object d;
    public Object e;
    public Object f;
    public Object g;
    public Object h;

    public iv2(Context context, r32 r32Var, q7f q7fVar, i2a i2aVar, WorkDatabase workDatabase, c8f c8fVar, ArrayList arrayList) {
        context.getClass();
        i2aVar.getClass();
        this.a = r32Var;
        this.b = q7fVar;
        this.c = i2aVar;
        this.d = workDatabase;
        this.e = c8fVar;
        this.f = arrayList;
        Context applicationContext = context.getApplicationContext();
        applicationContext.getClass();
        this.g = applicationContext;
        this.h = new vwa(15);
    }

    public static void e(String str, JSONObject jSONObject) {
        String str2 = str + jSONObject.toString();
        if (Log.isLoggable("FirebaseCrashlytics", 3)) {
            Log.d("FirebaseCrashlytics", str2, null);
        }
    }

    public static hha f(byte[] bArr) throws IOException {
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        try {
            ssg ssgVarV = ssg.v(byteArrayInputStream, ptf.a);
            byteArrayInputStream.close();
            ssg ssgVarO = bxf.e(ssgVarV).o();
            xtf xtfVar = (xtf) ssgVarO.d(5);
            if (!xtfVar.a.equals(ssgVarO)) {
                if (!xtfVar.b.s()) {
                    xtfVar.d();
                }
                xtf.a(xtfVar.b, ssgVarO);
            }
            return new hha((rsg) xtfVar);
        } catch (Throwable th) {
            byteArrayInputStream.close();
            throw th;
        }
    }

    public void a() {
        File file = (File) this.f;
        f66 f66Var = (f66) this.c;
        if (ht2.k0(file, f66Var)) {
            try {
                File[] fileArrV0 = ht2.v0(file, f66Var);
                if (fileArrV0 != null) {
                    for (File file2 : fileArrV0) {
                        oh4.H0(file2);
                    }
                }
            } catch (Throwable th) {
                f49.L((f66) this.c, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new ir(10, this), th, 48);
            }
        }
    }

    @Override // defpackage.uc8
    public void b(yu2 yu2Var) {
        r40.C((dm0) this.a, "NDK crash report ", (f66) this.c, new fi2(this, 5, yu2Var));
    }

    public w1c c(y1c y1cVar) {
        w1c w1cVar = null;
        try {
            if (!y1c.SKIP_CACHE_LOOKUP.equals(y1cVar)) {
                JSONObject jSONObjectT = ((olb) this.d).t();
                if (jSONObjectT != null) {
                    w1c w1cVarL = ((qlb) this.c).l(jSONObjectT);
                    e("Loaded cached settings: ", jSONObjectT);
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    if (y1c.IGNORE_CACHE_EXPIRATION.equals(y1cVar) || w1cVarL.c >= jCurrentTimeMillis) {
                        try {
                            if (Log.isLoggable("FirebaseCrashlytics", 2)) {
                                Log.v("FirebaseCrashlytics", "Returning cached settings.", null);
                            }
                            return w1cVarL;
                        } catch (Exception e) {
                            w1cVar = w1cVarL;
                            e = e;
                            Log.e("FirebaseCrashlytics", "Failed to get cached settings", e);
                            return w1cVar;
                        }
                    }
                    if (Log.isLoggable("FirebaseCrashlytics", 2)) {
                        Log.v("FirebaseCrashlytics", "Cached settings have expired.", null);
                        return null;
                    }
                } else if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                    Log.d("FirebaseCrashlytics", "No cached settings data found.", null);
                }
            }
            return null;
        } catch (Exception e2) {
            e = e2;
        }
    }

    public w1c d() {
        return (w1c) ((AtomicReference) this.g).get();
    }

    public synchronized pkf g() {
        pkf pkfVar;
        try {
            if (((String) this.e) == null) {
                throw new IllegalArgumentException("keysetName cannot be null");
            }
            isg isgVar = (isg) this.g;
            if (isgVar != null && ((wjc) this.f) == null) {
                this.f = new wjc(11, kk7.M(isgVar.c()));
            }
            synchronized (pkf.d) {
                Context context = (Context) this.a;
                String str = (String) this.e;
                String str2 = (String) this.b;
                byte[] bArrO0 = null;
                if (str != null) {
                    Context applicationContext = context.getApplicationContext();
                    try {
                        String string = (str2 == null ? PreferenceManager.getDefaultSharedPreferences(applicationContext) : applicationContext.getSharedPreferences(str2, 0)).getString(str, null);
                        if (string != null) {
                            bArrO0 = vn7.o0(string);
                        }
                    } catch (ClassCastException | IllegalArgumentException unused) {
                        throw new CharConversionException(ev6.x("can't read keyset; the pref value ", str, AXoTRPEGKEve.OZsOJdtZLlh));
                    }
                } else {
                    ay0.e("keysetName cannot be null");
                }
                String str3 = (String) this.c;
                if (bArrO0 == null) {
                    if (str3 != null) {
                        this.d = i();
                    }
                    wjc wjcVar = (wjc) this.f;
                    if (wjcVar == null) {
                        throw new GeneralSecurityException("cannot read or generate keyset");
                    }
                    bxf bxfVarC = bxf.c(wjcVar);
                    d2f d2fVar = new d2f((Context) this.a, (String) this.e, (String) this.b);
                    kfg kfgVar = (kfg) this.d;
                    try {
                        if (kfgVar != null) {
                            bxfVarC.j(d2fVar, kfgVar, new byte[0]);
                        } else {
                            d2fVar.H0(bxfVarC.o());
                        }
                        ssg ssgVarO = bxfVarC.o();
                        xtf xtfVar = (xtf) ssgVarO.d(5);
                        if (!xtfVar.a.equals(ssgVarO)) {
                            if (!xtfVar.b.s()) {
                                xtfVar.d();
                            }
                            xtf.a(xtfVar.b, ssgVarO);
                        }
                        this.h = new hha((rsg) xtfVar);
                    } catch (IOException e) {
                        throw new GeneralSecurityException(e);
                    }
                } else if (str3 != null) {
                    this.h = h(bArrO0);
                } else {
                    this.h = f(bArrO0);
                }
                pkfVar = new pkf(this);
            }
        } catch (Throwable th) {
            throw th;
        } finally {
        }
        return pkfVar;
    }

    @Override // defpackage.ete
    public View getRoot() {
        return (CoordinatorLayout) this.a;
    }

    public hha h(byte[] bArr) {
        try {
            this.d = g01.W((String) this.c);
            try {
                ssg ssgVarO = bxf.d(new ujf(13, new ByteArrayInputStream(bArr)), (kfg) this.d, new byte[0]).o();
                xtf xtfVar = (xtf) ssgVarO.d(5);
                if (!xtfVar.a.equals(ssgVarO)) {
                    if (!xtfVar.b.s()) {
                        xtfVar.d();
                    }
                    xtf.a(xtfVar.b, ssgVarO);
                }
                return new hha((rsg) xtfVar);
            } catch (IOException | GeneralSecurityException e) {
                try {
                    return f(bArr);
                } catch (IOException unused) {
                    throw e;
                }
            }
        } catch (GeneralSecurityException | ProviderException e2) {
            try {
                hha hhaVarF = f(bArr);
                Object obj = pkf.d;
                Log.w("pkf", "cannot use Android Keystore, it'll be disabled", e2);
                return hhaVarF;
            } catch (IOException unused2) {
                throw e2;
            }
        }
    }

    public kfg i() throws KeyStoreException {
        Object obj = pkf.d;
        try {
            boolean zX = g01.X((String) this.c);
            try {
                return g01.W((String) this.c);
            } catch (GeneralSecurityException | ProviderException e) {
                if (!zX) {
                    throw new KeyStoreException(ev6.x("the master key ", (String) this.c, " exists but is unusable"), e);
                }
                Object obj2 = pkf.d;
                Log.w("pkf", "cannot use Android Keystore, it'll be disabled", e);
                return null;
            }
        } catch (GeneralSecurityException | ProviderException e2) {
            Object obj3 = pkf.d;
            Log.w("pkf", "cannot use Android Keystore, it'll be disabled", e2);
            return null;
        }
    }

    public iv2() {
        this.a = null;
        this.e = null;
        this.b = null;
        this.c = null;
        this.d = null;
        this.f = null;
        this.g = null;
    }
}
