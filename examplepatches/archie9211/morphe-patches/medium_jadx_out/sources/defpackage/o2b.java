package defpackage;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import android.util.SparseArray;
import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuItem;
import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.adobe.internal.xmp.XMPException;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.Schema;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.google.android.gms.internal.p000firebaseauthapi.zzzx;
import com.google.android.recaptcha.internal.zzfx;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import com.medium.android.data.notification.YMl.DtuT;
import j$.util.DesugarCollections;
import j$.util.Objects;
import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.regex.Pattern;
import kotlinx.coroutines.TimeoutCancellationException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class o2b implements mre, iof, o92 {
    public static o2b f;
    public final /* synthetic */ int a;
    public Object b;
    public Object c;
    public Object d;
    public Object e;

    public o2b(Context context) {
        Activity activity;
        this.a = 2;
        context.getClass();
        this.b = context;
        Intent action = new Intent().setAction("android.intent.action.SEND");
        this.c = action;
        action.putExtra("androidx.core.app.EXTRA_CALLING_PACKAGE", context.getPackageName());
        action.putExtra("android.support.v4.app.EXTRA_CALLING_PACKAGE", context.getPackageName());
        action.addFlags(524288);
        while (true) {
            if (!(context instanceof ContextWrapper)) {
                activity = null;
                break;
            } else {
                if (context instanceof Activity) {
                    activity = (Activity) context;
                    break;
                }
                context = ((ContextWrapper) context).getBaseContext();
            }
        }
        if (activity != null) {
            ComponentName componentName = activity.getComponentName();
            ((Intent) this.c).putExtra("androidx.core.app.EXTRA_CALLING_ACTIVITY", componentName);
            ((Intent) this.c).putExtra("android.support.v4.app.EXTRA_CALLING_ACTIVITY", componentName);
        }
    }

    public static final /* synthetic */ zzfx V(o2b o2bVar, Exception exc) {
        v60 v60Var = (v60) o2bVar.d;
        d87 d87Var = d87.U0;
        int i = 8;
        return exc instanceof TimeoutCancellationException ? v60Var.a(exc, new zzfx(d87Var, d87.f, exc.getMessage(), i)) : exc instanceof zzfx ? v60Var.a(exc, (zzfx) exc) : v60Var.a(exc, new zzfx(d87Var, d87.w, exc.getMessage(), i));
    }

    public static final /* synthetic */ void Z(o2b o2bVar, long j, String str) throws zzfx {
        int i = 12;
        String str2 = null;
        if (str.length() == 0) {
            throw new zzfx(d87.V0, d87.i, str2, i);
        }
        if (j < 5000) {
            throw new zzfx(d87.b1, d87.q, str2, i);
        }
        if (nm.a((Application) o2bVar.b, "android.permission.INTERNET") != 0) {
            throw new zzfx(d87.U0, d87.C, str2, i);
        }
    }

    public static o2b k() {
        o2b o2bVar = f;
        if (o2bVar != null) {
            return o2bVar;
        }
        o2b o2bVar2 = new o2b(4);
        f = o2bVar2;
        return o2bVar2;
    }

    public boolean A(l6 l6Var, lx7 lx7Var) {
        ActionMode.Callback callback = (ActionMode.Callback) this.b;
        n2d n2dVarI = i(l6Var);
        aec aecVar = (aec) this.e;
        Menu py7Var = (Menu) aecVar.get(lx7Var);
        if (py7Var == null) {
            py7Var = new py7((Context) this.c, lx7Var);
            aecVar.put(lx7Var, py7Var);
        }
        return callback.onCreateActionMode(n2dVarI, py7Var);
    }

    public void B(go0 go0Var) {
        synchronized (this.b) {
            try {
                if (x(go0Var)) {
                    zhc zhcVar = (zhc) this.d;
                    if (!zhcVar.c) {
                        zhcVar.c = true;
                        ((Handler) this.c).removeCallbacksAndMessages(zhcVar);
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public Object C(p4d p4dVar) {
        Object objA = ((r6c) this.e).a(m2b.a, p4dVar);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    public synchronized void D(String str, String str2, String str3, String str4, td tdVar) {
        td tdVar2;
        try {
            qo7.j(str);
            qo7.i(str2);
            qo7.j(str3);
            qo7.i(str4);
            if (tdVar != null) {
                t4a t4aVar = new t4a(tdVar.a);
                if (t4aVar.c(4096)) {
                    t4aVar.e(RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH, true);
                }
                if (t4aVar.c(RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH)) {
                    t4aVar.e(1024, true);
                }
                if (t4aVar.c(1024)) {
                    t4aVar.e(512, true);
                }
                t4aVar.a(t4aVar.a);
                tdVar2 = new td(t4aVar.a);
            } else {
                tdVar2 = new td(0, (byte) 0);
            }
            if (((Pattern) this.e).matcher(str2).find() || ((Pattern) this.e).matcher(str4).find()) {
                throw new XMPException("Alias and actual property names must be simple", 102);
            }
            String strL = l(str);
            String strL2 = l(str3);
            if (strL == null) {
                throw new XMPException("Alias namespace is not registered", 101);
            }
            if (strL2 == null) {
                throw new XMPException("Actual namespace is not registered", 101);
            }
            String strConcat = strL.concat(str2);
            if (((HashMap) this.d).containsKey(strConcat)) {
                throw new XMPException("Alias is already existing", 4);
            }
            if (((HashMap) this.d).containsKey(strL2.concat(str4))) {
                throw new XMPException("Actual property is already an alias, use the base property", 4);
            }
            ((HashMap) this.d).put(strConcat, new baf(str3, strL2, str4, tdVar2));
        } catch (Throwable th) {
            throw th;
        }
    }

    public synchronized String E(String str, String str2) {
        try {
            qo7.j(str);
            if (str2 == null || str2.length() == 0) {
                throw new XMPException("Empty prefix", 4);
            }
            if (str2.charAt(str2.length() - 1) != ':') {
                str2 = str2.concat(":");
            }
            if (!kpe.d(str2.substring(0, str2.length() - 1))) {
                throw new XMPException("The prefix is a bad XML name", Mp4VideoDirectory.TAG_VENDOR);
            }
            String str3 = (String) ((HashMap) this.b).get(str);
            String str4 = (String) ((HashMap) this.c).get(str2);
            if (str3 != null) {
                return str3;
            }
            if (str4 != null) {
                String str5 = str2;
                int i = 1;
                while (((HashMap) this.c).containsKey(str5)) {
                    str5 = str2.substring(0, str2.length() - 1) + "_" + i + "_:";
                    i++;
                }
                str2 = str5;
            }
            ((HashMap) this.c).put(str2, str);
            ((HashMap) this.b).put(str, str2);
            return str2;
        } catch (Throwable th) {
            throw th;
        }
    }

    public void H(go0 go0Var) {
        synchronized (this.b) {
            try {
                if (x(go0Var)) {
                    zhc zhcVar = (zhc) this.d;
                    if (zhcVar.c) {
                        zhcVar.c = false;
                        I(zhcVar);
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public void I(zhc zhcVar) {
        Handler handler = (Handler) this.c;
        int i = zhcVar.b;
        if (i == -2) {
            return;
        }
        if (i <= 0) {
            i = i == -1 ? 1500 : 2750;
        }
        handler.removeCallbacksAndMessages(zhcVar);
        handler.sendMessageDelayed(Message.obtain(handler, 0, zhcVar), i);
    }

    public void J() {
        zhc zhcVar = (zhc) this.e;
        if (zhcVar != null) {
            this.d = zhcVar;
            this.e = null;
            go0 go0Var = (go0) zhcVar.a.get();
            if (go0Var == null) {
                this.d = null;
            } else {
                Handler handler = jo0.x;
                handler.sendMessage(handler.obtainMessage(0, go0Var.a));
            }
        }
    }

    public void K() {
        Context context = (Context) this.b;
        Intent intent = (Intent) this.c;
        ArrayList arrayList = (ArrayList) this.e;
        if (arrayList == null || arrayList.size() <= 1) {
            intent.setAction("android.intent.action.SEND");
            ArrayList arrayList2 = (ArrayList) this.e;
            if (arrayList2 == null || arrayList2.isEmpty()) {
                intent.removeExtra("android.intent.extra.STREAM");
                intent.setClipData(null);
                intent.setFlags(intent.getFlags() & (-2));
            } else {
                intent.putExtra("android.intent.extra.STREAM", (Parcelable) ((ArrayList) this.e).get(0));
                fp7.n(intent, (ArrayList) this.e);
            }
        } else {
            intent.setAction("android.intent.action.SEND_MULTIPLE");
            intent.putParcelableArrayListExtra("android.intent.extra.STREAM", (ArrayList) this.e);
            fp7.n(intent, (ArrayList) this.e);
        }
        context.startActivity(Intent.createChooser(intent, (String) this.d, null));
    }

    public void L(unc uncVar) {
        uncVar.getClass();
        fi2 fi2Var = new fi2(this, 24, uncVar);
        synchronized (this.d) {
        }
        ((Handler) ((md5) this.b).b).postDelayed(fi2Var, 5400000L);
    }

    public xmf M(JSONObject jSONObject) {
        JSONArray jSONArray;
        JSONArray jSONArray2;
        gof gofVarA;
        try {
            String string = jSONObject.getString("cachedTokenState");
            String string2 = jSONObject.getString("applicationName");
            boolean z = jSONObject.getBoolean("anonymous");
            String string3 = jSONObject.getString("version");
            String str = string3 != null ? string3 : "2";
            JSONArray jSONArray3 = jSONObject.getJSONArray("userInfos");
            int length = jSONArray3.length();
            if (length == 0) {
                return null;
            }
            ArrayList arrayList = new ArrayList(length);
            for (int i = 0; i < length; i++) {
                arrayList.add(ivg.d(jSONArray3.getString(i)));
            }
            xmf xmfVar = new xmf(xj4.e(string2), arrayList);
            if (!TextUtils.isEmpty(string)) {
                xmfVar.a = zpf.d(string);
            }
            if (!z) {
                xmfVar.h = Boolean.FALSE;
            }
            xmfVar.g = str;
            if (jSONObject.has("userMetadata") && (gofVarA = gof.a(jSONObject.getJSONObject("userMetadata"))) != null) {
                xmfVar.i = gofVarA;
            }
            if (jSONObject.has("userMultiFactorInfo") && (jSONArray2 = jSONObject.getJSONArray("userMultiFactorInfo")) != null) {
                ArrayList arrayList2 = new ArrayList();
                for (int i2 = 0; i2 < jSONArray2.length(); i2++) {
                    JSONObject jSONObject2 = new JSONObject(jSONArray2.getString(i2));
                    String strOptString = jSONObject2.optString("factorIdKey");
                    arrayList2.add("phone".equals(strOptString) ? d99.g(jSONObject2) : Objects.equals(strOptString, "totp") ? hqd.g(jSONObject2) : null);
                }
                xmfVar.h(arrayList2);
            }
            if (jSONObject.has("passkeyInfo") && (jSONArray = jSONObject.getJSONArray("passkeyInfo")) != null) {
                ArrayList arrayList3 = new ArrayList();
                for (int i3 = 0; i3 < jSONArray.length(); i3++) {
                    arrayList3.add(dvf.d(new JSONObject(jSONArray.getString(i3))));
                }
                xmfVar.m = arrayList3;
            }
            return xmfVar;
        } catch (zzzx e) {
            e = e;
            Log.wtf((String) ((xp) this.e).c, e);
            return null;
        } catch (ArrayIndexOutOfBoundsException e2) {
            e = e2;
            Log.wtf((String) ((xp) this.e).c, e);
            return null;
        } catch (IllegalArgumentException e3) {
            e = e3;
            Log.wtf((String) ((xp) this.e).c, e);
            return null;
        } catch (JSONException e4) {
            e = e4;
            Log.wtf((String) ((xp) this.e).c, e);
            return null;
        }
    }

    public u0g N() throws GeneralSecurityException {
        ujf ujfVar;
        qvg qvgVarB;
        f1g f1gVar = (f1g) this.b;
        if (f1gVar == null) {
            ygf.l("Cannot build without parameters");
            return null;
        }
        ujf ujfVar2 = (ujf) this.c;
        if (ujfVar2 == null || (ujfVar = (ujf) this.d) == null) {
            ygf.l("Cannot build without key material");
            return null;
        }
        if (f1gVar.a != ((qvg) ujfVar2.b).a.length) {
            ygf.l("AES key size mismatch");
            return null;
        }
        if (f1gVar.b != ((qvg) ujfVar.b).a.length) {
            ygf.l("HMAC key size mismatch");
            return null;
        }
        if (f1gVar.a() && ((Integer) this.e) == null) {
            ygf.l("Cannot create key without ID requirement with parameters with ID requirement");
            return null;
        }
        if (!((f1g) this.b).a() && ((Integer) this.e) != null) {
            ygf.l("Cannot create key with ID requirement with parameters without ID requirement");
            return null;
        }
        d1g d1gVar = ((f1g) this.b).e;
        if (d1gVar == d1g.e) {
            qvgVarB = mhg.a;
        } else if (d1gVar == d1g.d) {
            qvgVarB = mhg.a(((Integer) this.e).intValue());
        } else {
            if (d1gVar != d1g.c) {
                ygf.f("Unknown AesCtrHmacAeadParameters.Variant: ".concat(String.valueOf(d1gVar)));
                return null;
            }
            qvgVarB = mhg.b(((Integer) this.e).intValue());
        }
        return new u0g((f1g) this.b, (ujf) this.c, (ujf) this.d, qvgVarB, (Integer) this.e);
    }

    public p1g O() {
        Integer num = (Integer) this.b;
        if (num == null) {
            ygf.l("Key size is not set");
            return null;
        }
        if (((Integer) this.c) == null) {
            ygf.l("IV size is not set");
            return null;
        }
        if (((d1g) this.e) == null) {
            ygf.l("Variant is not set");
            return null;
        }
        if (((Integer) this.d) != null) {
            return new p1g(num.intValue(), ((Integer) this.c).intValue(), ((Integer) this.d).intValue(), (d1g) this.e);
        }
        ygf.l("Tag size is not set");
        return null;
    }

    public g2g P() {
        Integer num = (Integer) this.b;
        if (num == null) {
            ygf.l("Key size is not set");
            return null;
        }
        if (((d2g) this.e) == null) {
            ygf.l("Variant is not set");
            return null;
        }
        if (((Integer) this.c) == null) {
            ygf.l("IV size is not set");
            return null;
        }
        if (((Integer) this.d) != null) {
            return new g2g(num.intValue(), ((Integer) this.c).intValue(), ((Integer) this.d).intValue(), (d2g) this.e);
        }
        ygf.l("Tag size is not set");
        return null;
    }

    public scg Q() throws GeneralSecurityException {
        rcg rcgVar = (rcg) this.b;
        if (rcgVar == null) {
            ygf.l("HPKE KEM parameter is not set");
            return null;
        }
        pcg pcgVar = (pcg) this.c;
        if (pcgVar == null) {
            ygf.l("HPKE KDF parameter is not set");
            return null;
        }
        ocg ocgVar = (ocg) this.d;
        if (ocgVar == null) {
            ygf.l("HPKE AEAD parameter is not set");
            return null;
        }
        qcg qcgVar = (qcg) this.e;
        if (qcgVar != null) {
            return new scg(rcgVar, pcgVar, ocgVar, qcgVar);
        }
        ygf.l("HPKE variant is not set");
        return null;
    }

    public void R() {
        this.c = 12;
    }

    public void S(int i) {
        if (i != 12 && i != 16) {
            throw new GeneralSecurityException(String.format("Invalid IV size in bytes %d; acceptable values have 12 or 16 bytes", Integer.valueOf(i)));
        }
        this.c = Integer.valueOf(i);
    }

    public void T(String str, String str2) {
        String strEncodeToString;
        zjf zjfVarC = zjf.c((Context) this.b, (String) this.c);
        zjfVarC.getClass();
        vp7.p(str2);
        pkf pkfVar = (pkf) zjfVarC.c;
        String str3 = null;
        if (pkfVar == null) {
            Log.e("FirebearStorageCryptoHelper", "KeysetManager failed to initialize - unable to encrypt data");
        } else {
            try {
                synchronized (pkfVar) {
                    bxf bxfVarQ = ((pkf) zjfVarC.c).Q();
                    vp7.K();
                    strEncodeToString = Base64.encodeToString(((lwf) bxfVarQ.b(k40.n, lwf.class)).c(str2.getBytes(StandardCharsets.UTF_8), null), 2);
                }
                str3 = strEncodeToString;
            } catch (GeneralSecurityException e) {
                Log.e("FirebearStorageCryptoHelper", "Exception encountered while encrypting bytes:\n" + e.getMessage());
            }
        }
        if (str3 != null) {
            ((SharedPreferences) this.d).edit().putString(str, "ENCRYPTED:".concat(str3)).apply();
        }
    }

    public void U(HttpURLConnection httpURLConnection) {
        aj5 aj5Var;
        String str;
        xj4 xj4Var = (xj4) this.e;
        String strY = km4.y((String) this.d, "/FirebaseCore-Android");
        ma3 ma3Var = (ma3) this.c;
        if (ma3Var == null) {
            ma3Var = new ma3((Context) this.b);
            this.c = ma3Var;
        }
        httpURLConnection.setRequestProperty("X-Android-Package", ma3Var.b);
        httpURLConnection.setRequestProperty("X-Android-Cert", ((ma3) this.c).c);
        httpURLConnection.setRequestProperty("Accept-Language", ok7.K());
        httpURLConnection.setRequestProperty("X-Client-Version", strY);
        httpURLConnection.setRequestProperty("X-Firebase-Locale", null);
        xj4Var.a();
        httpURLConnection.setRequestProperty("X-Firebase-GMPID", xj4Var.c.b);
        wmf wmfVar = (wmf) xj4Var.b(wmf.class);
        if (wmfVar == null || (aj5Var = (aj5) wmfVar.c.get()) == null) {
            str = null;
        } else {
            try {
                fz2 fz2Var = (fz2) aj5Var;
                str = (String) vp7.h(!hk7.A(fz2Var.b) ? vp7.x("") : vp7.j(fz2Var.e, new ez2(fz2Var, 0)));
            } catch (InterruptedException | ExecutionException e) {
                Log.w("LocalRequestInterceptor", "Unable to get heartbeats: " + e.getMessage());
                str = null;
            }
        }
        httpURLConnection.setRequestProperty("X-Firebase-Client", str);
        wmf wmfVar2 = (wmf) xj4Var.b(wmf.class);
        if (wmfVar2 != null && wmfVar2.b.get() != null) {
            rd6.m();
        } else {
            if (TextUtils.isEmpty(null)) {
                return;
            }
            httpURLConnection.setRequestProperty("X-Firebase-AppCheck", null);
        }
    }

    public void W(int i) {
        switch (this.a) {
            case 25:
                if (i != 16 && i != 24 && i != 32) {
                    throw new InvalidAlgorithmParameterException(String.format("Invalid key size %d; only 16-byte, 24-byte and 32-byte AES keys are supported", Integer.valueOf(i)));
                }
                this.b = Integer.valueOf(i);
                return;
            default:
                if (i != 16 && i != 24 && i != 32) {
                    throw new InvalidAlgorithmParameterException(String.format("Invalid key size %d; only 16-byte, 24-byte and 32-byte AES keys are supported", Integer.valueOf(i)));
                }
                this.b = Integer.valueOf(i);
                return;
        }
    }

    public String X(String str) {
        String str2;
        String string = ((SharedPreferences) this.d).getString(str, null);
        if (string == null) {
            return null;
        }
        if (!string.startsWith("ENCRYPTED:")) {
            return string;
        }
        zjf zjfVarC = zjf.c((Context) this.b, (String) this.c);
        String strSubstring = string.substring(10);
        zjfVarC.getClass();
        pkf pkfVar = (pkf) zjfVarC.c;
        if (pkfVar == null) {
            Log.e("FirebearStorageCryptoHelper", "KeysetManager failed to initialize - unable to decrypt data");
            return null;
        }
        try {
            synchronized (pkfVar) {
                bxf bxfVarQ = ((pkf) zjfVarC.c).Q();
                vp7.K();
                str2 = new String(((lwf) bxfVarQ.b(k40.n, lwf.class)).b(Base64.decode(strSubstring, 2), null), StandardCharsets.UTF_8);
            }
            return str2;
        } catch (IllegalArgumentException | GeneralSecurityException e) {
            Log.e("FirebearStorageCryptoHelper", "Exception encountered while decrypting bytes:\n" + e.getMessage());
            return null;
        }
    }

    public void Y() {
        switch (this.a) {
            case 25:
                this.d = 16;
                break;
            default:
                this.d = 16;
                break;
        }
    }

    @Override // defpackage.iof
    /* JADX INFO: renamed from: a */
    public void mo105a(String str) {
        ((zjf) this.d).b(hp7.K(str));
    }

    @Override // defpackage.jre
    public boolean b() {
        return false;
    }

    public void c(String str) {
        Objects.requireNonNull(str, "baseUrl == null");
        pt5 pt5Var = new pt5();
        pt5Var.f(null, str);
        qt5 qt5VarC = pt5Var.c();
        if ("".equals(qt5VarC.f.get(r0.size() - 1))) {
            this.c = qt5VarC;
        } else {
            ik4.h("baseUrl must end in /: ", qt5VarC);
        }
    }

    public kjb d() {
        ArrayList arrayList = (ArrayList) this.d;
        if (((qt5) this.c) == null) {
            ygf.f("Base URL required.");
            return null;
        }
        up8 up8Var = (up8) this.b;
        if (up8Var == null) {
            up8Var = new up8();
        }
        up8 up8Var2 = up8Var;
        gq gqVar = da9.a;
        zi5 zi5Var = da9.c;
        ArrayList arrayList2 = new ArrayList((ArrayList) this.e);
        List listG = zi5Var.g(gqVar);
        arrayList2.addAll(listG);
        List listJ = zi5Var.j();
        ArrayList arrayList3 = new ArrayList(arrayList.size() + 1 + listJ.size());
        arrayList3.add(new o01(0));
        arrayList3.addAll(arrayList);
        arrayList3.addAll(listJ);
        qt5 qt5Var = (qt5) this.c;
        List listUnmodifiableList = DesugarCollections.unmodifiableList(arrayList3);
        List listUnmodifiableList2 = DesugarCollections.unmodifiableList(arrayList2);
        listG.size();
        return new kjb(up8Var2, qt5Var, listUnmodifiableList, listUnmodifiableList2, gqVar);
    }

    public void e(unc uncVar) {
        Runnable runnable;
        uncVar.getClass();
        synchronized (this.d) {
            runnable = (Runnable) ((LinkedHashMap) this.e).remove(uncVar);
        }
        if (runnable != null) {
            ((Handler) ((md5) this.b).b).removeCallbacks(runnable);
        }
    }

    public boolean f(zhc zhcVar, int i) {
        go0 go0Var = (go0) zhcVar.a.get();
        if (go0Var == null) {
            return false;
        }
        ((Handler) this.c).removeCallbacksAndMessages(zhcVar);
        Handler handler = jo0.x;
        handler.sendMessage(handler.obtainMessage(1, i, 0, go0Var.a));
        return true;
    }

    public synchronized baf g(String str) {
        return (baf) ((HashMap) this.d).get(str);
    }

    @Override // defpackage.iof
    public void h(xnf xnfVar) {
        ((ujf) this.e).r(new fpf((qw3) this.b, ((zpf) xnfVar).b, (String) this.c), (zjf) this.d);
    }

    public n2d i(l6 l6Var) {
        ArrayList arrayList = (ArrayList) this.d;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            n2d n2dVar = (n2d) arrayList.get(i);
            if (n2dVar != null && n2dVar.b == l6Var) {
                return n2dVar;
            }
        }
        n2d n2dVar2 = new n2d((Context) this.c, l6Var);
        arrayList.add(n2dVar2);
        return n2dVar2;
    }

    @Override // defpackage.jre
    public dx j(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        dx dxVarC = (dx) this.d;
        if (dxVarC == null) {
            dxVarC = dxVar3.c();
            this.d = dxVarC;
        }
        int iB = dxVarC.b();
        int i = 0;
        while (true) {
            dx dxVar4 = (dx) this.d;
            if (i >= iB) {
                if (dxVar4 != null) {
                    return dxVar4;
                }
                g76.g0("velocityVector");
                throw null;
            }
            if (dxVar4 == null) {
                g76.g0("velocityVector");
                throw null;
            }
            long j2 = j;
            dxVar4.e(i, ((ex) this.b).get(i).c(dxVar.a(i), dxVar2.a(i), dxVar3.a(i), j2));
            i++;
            j = j2;
        }
    }

    public synchronized String l(String str) {
        return (String) ((HashMap) this.b).get(str);
    }

    @Override // defpackage.o92
    public Object m0(jrg jrgVar) {
        switch (this.a) {
            case 21:
                awa awaVar = (awa) this.b;
                FirebaseAuth firebaseAuth = (FirebaseAuth) this.c;
                String str = (String) this.d;
                ujf ujfVar = (ujf) this.e;
                if (jrgVar.k()) {
                    return vp7.x(jrgVar.i());
                }
                Exception excH = jrgVar.h();
                vp7.p(excH);
                SparseArray sparseArray = knf.a;
                if (!(excH instanceof FirebaseAuthException ? ((FirebaseAuthException) excH).a.endsWith("MISSING_RECAPTCHA_TOKEN") : false)) {
                    Log.e("RecaptchaCallWrapper", "Initial task failed for action " + String.valueOf(awaVar) + "with exception - " + excH.getMessage());
                    return vp7.w(excH);
                }
                if (Log.isLoggable("RecaptchaCallWrapper", 4)) {
                    Log.i("RecaptchaCallWrapper", "Falling back to recaptcha enterprise flow for action ".concat(String.valueOf(awaVar)));
                }
                if (firebaseAuth.i() == null) {
                    uz5 uz5Var = new uz5(firebaseAuth.a, firebaseAuth);
                    synchronized (firebaseAuth) {
                        firebaseAuth.j = uz5Var;
                    }
                }
                uz5 uz5VarI = firebaseAuth.i();
                jrg jrgVarP = uz5VarI.p(str, Boolean.FALSE, awaVar);
                o2b o2bVar = new o2b(str, uz5VarI, awaVar, ujfVar, 22);
                p7f p7fVar = yfd.a;
                return jrgVarP.g(p7fVar, ujfVar).g(p7fVar, o2bVar);
            default:
                String str2 = (String) this.b;
                if (jrgVar.k()) {
                    return jrgVar;
                }
                Exception excH2 = jrgVar.h();
                vp7.p(excH2);
                SparseArray sparseArray2 = knf.a;
                if (!(excH2 instanceof FirebaseAuthException ? ((FirebaseAuthException) excH2).a.endsWith("INVALID_RECAPTCHA_TOKEN") : false)) {
                    return jrgVar;
                }
                if (Log.isLoggable("RecaptchaCallWrapper", 4)) {
                    Log.i("RecaptchaCallWrapper", "Invalid token - Refreshing Recaptcha Enterprise config and fetching new token for tenant " + str2);
                }
                return ((uz5) this.c).p(str2, Boolean.TRUE, (awa) this.d).g(yfd.a, (ujf) this.e);
        }
    }

    public synchronized String n(String str) {
        try {
            if (!str.endsWith(":")) {
                str = str.concat(":");
            }
        } catch (Throwable th) {
            throw th;
        }
        return (String) ((HashMap) this.c).get(str);
    }

    public que o(wg6 wg6Var, String str) {
        que queVar;
        que queVarA;
        wg6Var.getClass();
        synchronized (((zi5) this.e)) {
            try {
                vue vueVar = (vue) this.b;
                vueVar.getClass();
                queVar = (que) vueVar.a.get(str);
                if (wg6Var.t(queVar)) {
                    uue uueVar = (uue) this.c;
                    if (uueVar instanceof ipb) {
                        ipb ipbVar = (ipb) uueVar;
                        queVar.getClass();
                        wx6 wx6Var = ipbVar.d;
                        if (wx6Var != null) {
                            epb epbVar = ipbVar.e;
                            epbVar.getClass();
                            guc.s(queVar, epbVar, wx6Var);
                        }
                    }
                    queVar.getClass();
                } else {
                    g68 g68Var = new g68((qg2) this.d);
                    g68Var.a.put(zg7.d, str);
                    uue uueVar2 = (uue) this.c;
                    uueVar2.getClass();
                    try {
                        try {
                            queVarA = uueVar2.c(wg6Var, g68Var);
                        } catch (AbstractMethodError unused) {
                            queVarA = uueVar2.b(vx0.T(wg6Var), g68Var);
                        }
                    } catch (AbstractMethodError unused2) {
                        queVarA = uueVar2.a(vx0.T(wg6Var));
                    }
                    queVar = queVarA;
                    vue vueVar2 = (vue) this.b;
                    vueVar2.getClass();
                    queVar.getClass();
                    que queVar2 = (que) vueVar2.a.put(str, queVar);
                    if (queVar2 != null) {
                        queVar2.b();
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return queVar;
    }

    public to4 p(b55 b55Var) {
        return new to4(new a74(2, 4, null), new u50(12, new nz(b55Var, this, null)));
    }

    @Override // defpackage.jre
    public dx r(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        dx dxVarC = (dx) this.c;
        if (dxVarC == null) {
            dxVarC = dxVar.c();
            this.c = dxVarC;
        }
        int iB = dxVarC.b();
        int i = 0;
        while (true) {
            dx dxVar4 = (dx) this.c;
            if (i >= iB) {
                if (dxVar4 != null) {
                    return dxVar4;
                }
                g76.g0("valueVector");
                throw null;
            }
            if (dxVar4 == null) {
                g76.g0("valueVector");
                throw null;
            }
            long j2 = j;
            dxVar4.e(i, ((ex) this.b).get(i).e(dxVar.a(i), dxVar2.a(i), dxVar3.a(i), j2));
            i++;
            j = j2;
        }
    }

    @Override // defpackage.jre
    public dx s(dx dxVar, dx dxVar2, dx dxVar3) {
        dx dxVarC = (dx) this.e;
        if (dxVarC == null) {
            dxVarC = dxVar3.c();
            this.e = dxVarC;
        }
        int iB = dxVarC.b();
        int i = 0;
        while (true) {
            dx dxVar4 = (dx) this.e;
            if (i >= iB) {
                if (dxVar4 != null) {
                    return dxVar4;
                }
                g76.g0("endVelocityVector");
                throw null;
            }
            if (dxVar4 == null) {
                g76.g0("endVelocityVector");
                throw null;
            }
            dxVar4.e(i, ((ex) this.b).get(i).d(dxVar.a(i), dxVar2.a(i), dxVar3.a(i)));
            i++;
        }
    }

    @Override // defpackage.jre
    public long t(dx dxVar, dx dxVar2, dx dxVar3) {
        int iB = dxVar.b();
        long jMax = 0;
        for (int i = 0; i < iB; i++) {
            jMax = Math.max(jMax, ((ex) this.b).get(i).b(dxVar.a(i), dxVar2.a(i), dxVar3.a(i)));
        }
        return jMax;
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x0132  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0161  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01a9  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0203  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object u(defpackage.p92 r20, com.medium.android.core.models.EntityType r21, java.lang.Boolean r22, java.lang.String r23, java.lang.String r24, boolean r25) {
        /*
            Method dump skipped, instruction units count: 557
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o2b.u(p92, com.medium.android.core.models.EntityType, java.lang.Boolean, java.lang.String, java.lang.String, boolean):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object v(defpackage.p92 r12) throws java.io.IOException {
        /*
            r11 = this;
            java.lang.Object r0 = r11.d
            pu7 r0 = (defpackage.pu7) r0
            boolean r1 = r12 instanceof defpackage.r5e
            if (r1 == 0) goto L17
            r1 = r12
            r5e r1 = (defpackage.r5e) r1
            int r2 = r1.d
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L17
            int r2 = r2 - r3
            r1.d = r2
            goto L1c
        L17:
            r5e r1 = new r5e
            r1.<init>(r11, r12)
        L1c:
            java.lang.Object r12 = r1.b
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.d
            r4 = 1
            r5 = 0
            r6 = 0
            if (r3 == 0) goto L37
            if (r3 != r4) goto L31
            defpackage.br7.v(r12)
            bjb r12 = (defpackage.bjb) r12
            java.lang.Object r11 = r12.a
            goto La0
        L31:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r6
        L37:
            defpackage.br7.v(r12)
            java.lang.Object r12 = r11.c
            sh2 r12 = (defpackage.sh2) r12
            boolean r12 = r12.b()
            c1e r3 = defpackage.c1e.a
            if (r12 != 0) goto L50
            uld r11 = defpackage.wld.a
            java.lang.Object[] r12 = new java.lang.Object[r5]
            java.lang.String r0 = "Read contacts permission not granted, cannot upload contacts."
            defpackage.km4.I(r11, r6, r0, r12, r0)
            return r3
        L50:
            ek6 r12 = defpackage.ek6.LAST_CONTACTS_SHARED_AT
            r7 = 0
            long r9 = r0.l(r12, r7)
            int r9 = (r9 > r7 ? 1 : (r9 == r7 ? 0 : -1))
            if (r9 > 0) goto L66
            uld r11 = defpackage.wld.a
            java.lang.Object[] r12 = new java.lang.Object[r5]
            java.lang.String r0 = "User has not shared their address book in the past, not uploading contacts."
            defpackage.km4.I(r11, r6, r0, r12, r0)
            return r3
        L66:
            long r7 = r0.l(r12, r7)
            r9 = 2592000000(0x9a7ec800, double:1.280618154E-314)
            long r7 = r7 + r9
            long r9 = java.lang.System.currentTimeMillis()
            int r12 = (r9 > r7 ? 1 : (r9 == r7 ? 0 : -1))
            if (r12 >= 0) goto L82
            uld r11 = defpackage.wld.a
            java.lang.Object[] r12 = new java.lang.Object[r5]
            java.lang.String r0 = "Contacts already uploaded in the last 30 days, not uploading again."
            defpackage.km4.I(r11, r6, r0, r12, r0)
            return r3
        L82:
            uld r12 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r5]
            java.lang.String r3 = "Upload contacts silently."
            defpackage.km4.I(r12, r6, r3, r0, r3)
            java.lang.Object r12 = r11.e
            android.content.Context r12 = (android.content.Context) r12
            java.util.List r12 = defpackage.n01.e0(r12)
            java.lang.Object r11 = r11.b
            t5e r11 = (defpackage.t5e) r11
            r1.d = r4
            java.lang.Object r11 = r11.a(r12, r1)
            if (r11 != r2) goto La0
            return r2
        La0:
            boolean r12 = r11 instanceof defpackage.ajb
            if (r12 != 0) goto Lb0
            r12 = r11
            c1e r12 = (defpackage.c1e) r12
            uld r12 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r5]
            java.lang.String r1 = "Upload contacts silently successful."
            defpackage.km4.I(r12, r6, r1, r0, r1)
        Lb0:
            java.lang.Throwable r12 = defpackage.bjb.b(r11)
            if (r12 == 0) goto Lbf
            uld r0 = defpackage.wld.a
            java.lang.Object[] r1 = new java.lang.Object[r5]
            java.lang.String r2 = "Upload contacts silently failed."
            r0.e(r12, r2, r1)
        Lbf:
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o2b.v(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x013e  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x021e  */
    /* JADX WARN: Removed duplicated region for block: B:69:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:9:0x002d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object w(java.lang.String r28, java.lang.String r29, gen.model.SourceParameter r30, java.lang.String r31, boolean r32, defpackage.p92 r33) {
        /*
            Method dump skipped, instruction units count: 564
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o2b.w(java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, boolean, p92):java.lang.Object");
    }

    public boolean x(go0 go0Var) {
        zhc zhcVar = (zhc) this.d;
        return (zhcVar == null || go0Var == null || zhcVar.a.get() != go0Var) ? false : true;
    }

    public boolean y(ha3 ha3Var) {
        if (((ha3) this.c).equals(ha3Var)) {
            return true;
        }
        o2b o2bVar = (o2b) this.b;
        return o2bVar != null ? o2bVar.y(ha3Var) : false;
    }

    public boolean z(l6 l6Var, MenuItem menuItem) {
        return ((ActionMode.Callback) this.b).onActionItemClicked(i(l6Var), new wx7((Context) this.c, (s2d) menuItem));
    }

    public void F() {
        td tdVar = new td(0, (byte) 0);
        tdVar.e(1536, true);
        td tdVar2 = new td(0, (byte) 0);
        tdVar2.e(7680, true);
        D(Schema.XMP_PROPERTIES, "Author", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "creator", tdVar);
        D(Schema.XMP_PROPERTIES, "Authors", AEVqIoD.aJdXSfQUPeo, "creator", null);
        D(Schema.XMP_PROPERTIES, "Description", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "description", null);
        D(Schema.XMP_PROPERTIES, "Format", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "format", null);
        D(Schema.XMP_PROPERTIES, "Keywords", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "subject", null);
        D(Schema.XMP_PROPERTIES, "Locale", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "language", null);
        D(Schema.XMP_PROPERTIES, "Title", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "title", null);
        D("http://ns.adobe.com/xap/1.0/rights/", "Copyright", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "rights", null);
        D("http://ns.adobe.com/pdf/1.3/", "Author", peNPu.wiQscsVDfBuIVyM, "creator", tdVar);
        D("http://ns.adobe.com/pdf/1.3/", "BaseURL", Schema.XMP_PROPERTIES, "BaseURL", null);
        D("http://ns.adobe.com/pdf/1.3/", "CreationDate", Schema.XMP_PROPERTIES, "CreateDate", null);
        D("http://ns.adobe.com/pdf/1.3/", "Creator", Schema.XMP_PROPERTIES, "CreatorTool", null);
        D("http://ns.adobe.com/pdf/1.3/", "ModDate", Schema.XMP_PROPERTIES, "ModifyDate", null);
        D("http://ns.adobe.com/pdf/1.3/", "Subject", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "description", tdVar2);
        D("http://ns.adobe.com/pdf/1.3/", "Title", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "title", tdVar2);
        D(Schema.PHOTOSHOP_PROPERTIES, "Author", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "creator", tdVar);
        D(Schema.PHOTOSHOP_PROPERTIES, "Caption", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "description", tdVar2);
        D(Schema.PHOTOSHOP_PROPERTIES, "Copyright", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "rights", tdVar2);
        D(Schema.PHOTOSHOP_PROPERTIES, "Keywords", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "subject", null);
        D(Schema.PHOTOSHOP_PROPERTIES, "Marked", "http://ns.adobe.com/xap/1.0/rights/", "Marked", null);
        D(Schema.PHOTOSHOP_PROPERTIES, "Title", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "title", tdVar2);
        D(Schema.PHOTOSHOP_PROPERTIES, "WebStatement", "http://ns.adobe.com/xap/1.0/rights/", "WebStatement", null);
        D(Schema.EXIF_TIFF_PROPERTIES, "Artist", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "creator", tdVar);
        D(Schema.EXIF_TIFF_PROPERTIES, "Copyright", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "rights", null);
        D(Schema.EXIF_TIFF_PROPERTIES, "DateTime", Schema.XMP_PROPERTIES, "ModifyDate", null);
        D(Schema.EXIF_SPECIFIC_PROPERTIES, uvlZTF.sEBjSiWAA, Schema.XMP_PROPERTIES, "CreateDate", null);
        D(Schema.EXIF_TIFF_PROPERTIES, "ImageDescription", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "description", null);
        D(Schema.EXIF_TIFF_PROPERTIES, "Software", Schema.XMP_PROPERTIES, DtuT.PaoogsvhVp, null);
        D("http://ns.adobe.com/png/1.0/", "Author", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "creator", tdVar);
        D("http://ns.adobe.com/png/1.0/", "Copyright", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "rights", tdVar2);
        D("http://ns.adobe.com/png/1.0/", "CreationTime", Schema.XMP_PROPERTIES, "CreateDate", null);
        D("http://ns.adobe.com/png/1.0/", "Description", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "description", tdVar2);
        D("http://ns.adobe.com/png/1.0/", "ModificationTime", Schema.XMP_PROPERTIES, "ModifyDate", null);
        D("http://ns.adobe.com/png/1.0/", "Software", Schema.XMP_PROPERTIES, "CreatorTool", null);
        D("http://ns.adobe.com/png/1.0/", "Title", Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "title", tdVar2);
    }

    public void G() {
        E("http://www.w3.org/XML/1998/namespace", "xml");
        E("http://www.w3.org/1999/02/22-rdf-syntax-ns#", "rdf");
        E(Schema.DUBLIN_CORE_SPECIFIC_PROPERTIES, "dc");
        E("http://iptc.org/std/Iptc4xmpCore/1.0/xmlns/", "Iptc4xmpCore");
        E("http://iptc.org/std/Iptc4xmpExt/2008-02-29/", "Iptc4xmpExt");
        E("http://ns.adobe.com/DICOM/", "DICOM");
        E("http://ns.useplus.org/ldf/xmp/1.0/", "plus");
        E("adobe:ns:meta/", "x");
        E("http://ns.adobe.com/iX/1.0/", "iX");
        E(Schema.XMP_PROPERTIES, "xmp");
        E("http://ns.adobe.com/xap/1.0/rights/", "xmpRights");
        E("http://ns.adobe.com/xap/1.0/mm/", "xmpMM");
        E("http://ns.adobe.com/xap/1.0/bj/", AXoTRPEGKEve.qMiuDWs);
        E("http://ns.adobe.com/xmp/note/", "xmpNote");
        E("http://ns.adobe.com/pdf/1.3/", "pdf");
        E("http://ns.adobe.com/pdfx/1.3/", "pdfx");
        E("http://www.npes.org/pdfx/ns/id/", "pdfxid");
        E("http://www.aiim.org/pdfa/ns/schema#", "pdfaSchema");
        E("http://www.aiim.org/pdfa/ns/property#", "pdfaProperty");
        E("http://www.aiim.org/pdfa/ns/type#", "pdfaType");
        E("http://www.aiim.org/pdfa/ns/field#", "pdfaField");
        E("http://www.aiim.org/pdfa/ns/id/", "pdfaid");
        E("http://www.aiim.org/pdfa/ns/extension/", "pdfaExtension");
        E(Schema.PHOTOSHOP_PROPERTIES, "photoshop");
        E("http://ns.adobe.com/album/1.0/", "album");
        E(Schema.EXIF_SPECIFIC_PROPERTIES, "exif");
        E("http://cipa.jp/exif/1.0/", "exifEX");
        E(Schema.EXIF_ADDITIONAL_PROPERTIES, "aux");
        E(Schema.EXIF_TIFF_PROPERTIES, "tiff");
        E("http://ns.adobe.com/png/1.0/", "png");
        E("http://ns.adobe.com/jpeg/1.0/", "jpeg");
        E("http://ns.adobe.com/jp2k/1.0/", "jp2k");
        E("http://ns.adobe.com/camera-raw-settings/1.0/", "crs");
        E("http://ns.adobe.com/StockPhoto/1.0/", "bmsp");
        E("http://ns.adobe.com/creatorAtom/1.0/", "creatorAtom");
        E("http://ns.adobe.com/asf/1.0/", "asf");
        E("http://ns.adobe.com/xmp/wav/1.0/", "wav");
        E("http://ns.adobe.com/bwf/bext/1.0/", "bext");
        E("http://ns.adobe.com/riff/info/", "riffinfo");
        E("http://ns.adobe.com/xmp/1.0/Script/", "xmpScript");
        E("http://ns.adobe.com/TransformXMP/", "txmp");
        E("http://ns.adobe.com/swf/1.0/", "swf");
        E("http://ns.adobe.com/ccv/1.0/", "ccv");
        E("http://ns.adobe.com/xmp/1.0/DynamicMedia/", "xmpDM");
        E("http://ns.adobe.com/xmp/transient/1.0/", "xmpx");
        E("http://ns.adobe.com/xap/1.0/t/", QFTsJPDEnO.JrphR);
        E("http://ns.adobe.com/xap/1.0/t/pg/", "xmpTPg");
        E("http://ns.adobe.com/xap/1.0/g/", "xmpG");
        E("http://ns.adobe.com/xap/1.0/g/img/", "xmpGImg");
        E("http://ns.adobe.com/xap/1.0/sType/Font#", "stFnt");
        E("http://ns.adobe.com/xap/1.0/sType/Dimensions#", "stDim");
        E("http://ns.adobe.com/xap/1.0/sType/ResourceEvent#", "stEvt");
        E("http://ns.adobe.com/xap/1.0/sType/ResourceRef#", "stRef");
        E("http://ns.adobe.com/xap/1.0/sType/Version#", "stVer");
        E("http://ns.adobe.com/xap/1.0/sType/Job#", "stJob");
        E("http://ns.adobe.com/xap/1.0/sType/ManifestItem#", "stMfs");
        E("http://ns.adobe.com/xmp/Identifier/qual/1.0/", "xmpidq");
    }

    public /* synthetic */ o2b(Object obj, Object obj2, Object obj3, Object obj4, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
    }

    public o2b(Application application, sj0 sj0Var) {
        this.a = 27;
        this.b = application;
        this.c = sj0Var;
        this.d = new a98();
    }

    public o2b(ujf ujfVar, qw3 qw3Var, String str, zjf zjfVar) {
        this.a = 19;
        this.b = qw3Var;
        this.c = str;
        this.d = zjfVar;
        this.e = ujfVar;
    }

    public o2b(hx4 hx4Var, zk2 zk2Var, pf8 pf8Var, ble bleVar) {
        this.a = 5;
        zk2Var.getClass();
        this.b = hx4Var;
        this.c = zk2Var;
        this.d = pf8Var;
        this.e = bleVar;
    }

    public o2b(mq5 mq5Var, kla klaVar, zk2 zk2Var, ax2 ax2Var) {
        this.a = 10;
        mq5Var.getClass();
        zk2Var.getClass();
        this.b = mq5Var;
        this.c = klaVar;
        this.d = zk2Var;
        this.e = ax2Var;
    }

    public o2b(mq5 mq5Var, ble bleVar, zk2 zk2Var, s26 s26Var) {
        this.a = 12;
        mq5Var.getClass();
        zk2Var.getClass();
        this.b = mq5Var;
        this.c = bleVar;
        this.d = zk2Var;
        this.e = s26Var;
    }

    public o2b(t5e t5eVar, sh2 sh2Var, pu7 pu7Var, Context context) {
        this.a = 13;
        pu7Var.getClass();
        this.b = t5eVar;
        this.c = sh2Var;
        this.d = pu7Var;
        this.e = context;
    }

    public o2b(md5 md5Var, mya myaVar) {
        this.a = 7;
        this.b = md5Var;
        this.c = myaVar;
        this.d = new Object();
        this.e = new LinkedHashMap();
    }

    public o2b(sb2 sb2Var, ce ceVar, r91 r91Var) {
        this.a = 3;
        this.b = sb2Var;
        this.c = r91Var;
        this.d = pwd.e(Integer.MAX_VALUE, 6, null);
        this.e = new olb(5);
        va6 va6Var = (va6) sb2Var.Q().o0(cd7.g);
        if (va6Var != null) {
            va6Var.R(new jr(ceVar, 13, this));
        }
    }

    public o2b(yd4 yd4Var, yd4 yd4Var2, x45 x45Var) {
        this.a = 0;
        yd4Var.getClass();
        yd4Var2.getClass();
        this.b = yd4Var;
        this.c = yd4Var2;
        this.d = x45Var;
        this.e = k40.x(0, 7, null);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public o2b(int i) {
        this(yd4.CacheFirst, yd4.NetworkOnly, new qna(8));
        this.a = i;
        switch (i) {
            case 1:
                this.d = new ArrayList();
                this.e = new ArrayList();
                break;
            case 4:
                this.b = new Object();
                this.c = new Handler(Looper.getMainLooper(), new yhc(0, this));
                break;
            default:
                break;
        }
    }

    public o2b(Context context, xj4 xj4Var, String str) {
        this.a = 20;
        vp7.p(context);
        this.b = context;
        vp7.p(xj4Var);
        this.e = xj4Var;
        this.d = "Android/Fallback/".concat(str);
    }

    public o2b(vue vueVar, uue uueVar, qg2 qg2Var) {
        this.a = 15;
        vueVar.getClass();
        uueVar.getClass();
        qg2Var.getClass();
        this.b = vueVar;
        this.c = uueVar;
        this.d = qg2Var;
        this.e = new zi5(23);
    }

    public o2b(Context context, ActionMode.Callback callback) {
        this.a = 6;
        this.c = context;
        this.b = callback;
        this.d = new ArrayList();
        this.e = new aec(0);
    }

    public /* synthetic */ o2b(int i, boolean z) {
        this.a = i;
    }

    public o2b(ex exVar) {
        this.a = 14;
        this.b = exVar;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public o2b(hn4 hn4Var) {
        this(new hha(hn4Var));
        this.a = 14;
    }
}
