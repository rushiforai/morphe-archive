package defpackage;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.res.AssetManager;
import android.os.Build;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.util.Log;
import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.google.android.gms.analytics.wYI.ivbZv;
import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ing implements png, iof {
    public Object a;
    public Object b;
    public Object c;
    public Object d;
    public Object e;
    public Object f;

    public static void b(List list, String str, String str2, ru ruVar) {
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            sx1 sx1Var = (sx1) it2.next();
            if (sx1Var instanceof nx1) {
                ruVar.b.add(sx1Var);
            } else {
                if (!(sx1Var instanceof ox1)) {
                    ygf.a();
                    return;
                }
                ox1 ox1Var = (ox1) sx1Var;
                if (bu1.p0(ox1Var.b, str2) || ox1Var.a.equals(str)) {
                    b(ox1Var.c, str, str2, ruVar);
                }
            }
        }
    }

    public static ArrayList c(List list, String str, l44 l44Var, String str2) {
        ru ruVar = new ru(l44Var);
        b(list, str, str2, ruVar);
        ArrayList arrayList = ruVar.b;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Object obj : arrayList) {
            nx1 nx1Var = (nx1) obj;
            f09 f09Var = new f09(nx1Var.b(), nx1Var.d);
            Object arrayList2 = linkedHashMap.get(f09Var);
            if (arrayList2 == null) {
                arrayList2 = new ArrayList();
                linkedHashMap.put(f09Var, arrayList2);
            }
            ((List) arrayList2).add(obj);
        }
        Collection<List> collectionValues = linkedHashMap.values();
        ArrayList arrayList3 = new ArrayList(cu1.k0(collectionValues, 10));
        for (List list2 : collectionValues) {
            nx1 nx1Var2 = (nx1) bu1.x0(list2);
            String str3 = nx1Var2.a;
            o7f o7fVar = nx1Var2.b;
            String str4 = nx1Var2.c;
            List list3 = nx1Var2.d;
            List list4 = nx1Var2.e;
            ArrayList arrayList4 = new ArrayList();
            Iterator it2 = list2.iterator();
            while (it2.hasNext()) {
                bu1.n0(((nx1) it2.next()).f, arrayList4);
            }
            arrayList3.add(new nx1(str3, o7fVar, str4, list3, list4, arrayList4));
        }
        return arrayList3;
    }

    public static ing k(String str, pmf pmfVar, d1g d1gVar, e1g e1gVar, Integer num) throws GeneralSecurityException {
        if (e1gVar != e1g.m) {
            if (num == null) {
                ygf.l("Keys with output prefix type different from raw should have an id requirement.");
                return null;
            }
        } else if (num != null) {
            ygf.l("Keys with output prefix type raw should not have an id requirement.");
            return null;
        }
        int i = aog.a;
        byte[] bArr = new byte[str.length()];
        for (int i2 = 0; i2 < str.length(); i2++) {
            char cCharAt = str.charAt(i2);
            if (cCharAt < '!' || cCharAt > '~') {
                StringBuilder sb = new StringBuilder(String.valueOf(cCharAt).length() + 33);
                sb.append("Not a printable ASCII character: ");
                sb.append(cCharAt);
                throw new GeneralSecurityException(sb.toString());
            }
            bArr[i2] = (byte) cCharAt;
        }
        cmf cmfVarA = cmf.a(bArr);
        ing ingVar = new ing();
        ingVar.a = str;
        ingVar.b = cmfVarA;
        ingVar.c = pmfVar;
        ingVar.d = d1gVar;
        ingVar.e = e1gVar;
        ingVar.f = num;
        return ingVar;
    }

    @Override // defpackage.iof
    /* JADX INFO: renamed from: a */
    public void mo105a(String str) {
        ((zjf) this.e).b(hp7.K(str));
    }

    public y26 e() throws IOException {
        ea9 ea9Var = ea9.a;
        Object obj = ea9.a;
        c92 c92Var = obj != null ? (c92) obj : null;
        Context contextB = c92Var != null ? c92Var.b() : null;
        AssetManager assets = contextB != null ? contextB.getAssets() : null;
        if (assets != null) {
            InputStream inputStreamOpen = assets.open((String) this.a);
            inputStreamOpen.getClass();
            return vo7.N(inputStreamOpen);
        }
        if (Build.FINGERPRINT == null) {
            ik4.g("Platform applicationContext not initialized. Possibly running Android unit test without Robolectric. Android tests should run with Robolectric and call OkHttp.initialize before test");
            return null;
        }
        ik4.g("Platform applicationContext not initialized. Startup Initializer possibly disabled, call OkHttp.initialize before test.");
        return null;
    }

    public void f() {
        try {
            yua yuaVar = new yua(e());
            try {
                h21 h21VarR = yuaVar.r(yuaVar.p());
                h21 h21VarR2 = yuaVar.r(yuaVar.p());
                yuaVar.close();
                synchronized (this) {
                    h21VarR.getClass();
                    this.d = h21VarR;
                    h21VarR2.getClass();
                    this.e = h21VarR2;
                }
            } finally {
            }
        } finally {
            ((CountDownLatch) this.c).countDown();
        }
    }

    public void g(Object obj, ArrayList arrayList, List list, String str) {
        l44 l44Var = (l44) this.b;
        if (obj instanceof i31) {
            ((ArrayList) this.f).add(new z21(((i31) obj).a, arrayList, list, str));
            return;
        }
        if (obj instanceof List) {
            int i = 0;
            for (Object obj2 : (Iterable) obj) {
                int i2 = i + 1;
                if (i < 0) {
                    d46.i0();
                    throw null;
                }
                g(obj2, bu1.R0(arrayList, Integer.valueOf(i)), list, str);
                i = i2;
            }
            return;
        }
        if (obj instanceof Map) {
            Map map = (Map) obj;
            Object obj3 = map.get("__typename");
            ArrayList<nx1> arrayListC = c(list, str, l44Var, obj3 instanceof String ? (String) obj3 : null);
            ArrayList arrayList2 = new ArrayList();
            for (nx1 nx1Var : arrayListC) {
                nx1Var.getClass();
                Iterator it2 = nx1Var.d.iterator();
                if (it2.hasNext()) {
                    throw ev6.q(it2);
                }
                Object objB = ((cd7) this.c).B(nx1Var, l44Var, map, "");
                g(objB, bu1.R0(arrayList, nx1Var.b()), nx1Var.f, nx1Var.b.H().u);
                arrayList2.add(new f09(nx1Var.b(), objB));
            }
            ei7.V(arrayList2);
        }
    }

    @Override // defpackage.iof
    public void h(xnf xnfVar) {
        String str = (String) this.a;
        String str2 = (String) this.b;
        String str3 = (String) this.c;
        String str4 = (String) this.d;
        String str5 = ((zpf) xnfVar).b;
        sqf sqfVar = new sqf();
        vp7.n(str);
        sqfVar.a = str;
        vp7.n(str2);
        sqfVar.b = str2;
        sqfVar.c = str3;
        sqfVar.d = str4;
        sqfVar.e = str5;
        ujf ujfVar = (ujf) this.f;
        zjf zjfVar = (zjf) this.e;
        bh4 bh4Var = (bh4) ujfVar.b;
        vwa vwaVar = new vwa(16, ujfVar, zjfVar, this, false);
        unf unfVar = (unf) bh4Var.b;
        qk7.D(unfVar.t("/signupNewUser", (String) bh4Var.a), sqfVar, vwaVar, new rqf(), (o2b) unfVar.b);
    }

    public f1g i() throws GeneralSecurityException {
        if (((Integer) this.f) == null) {
            ygf.l("AES key size is not set");
            return null;
        }
        if (((Integer) this.a) == null) {
            ygf.l("HMAC key size is not set");
            return null;
        }
        if (((Integer) this.b) == null) {
            ygf.l("iv size is not set");
            return null;
        }
        Integer num = (Integer) this.c;
        if (num == null) {
            ygf.l("tag size is not set");
            return null;
        }
        if (((e1g) this.d) == null) {
            ygf.l("hash type is not set");
            return null;
        }
        if (((d1g) this.e) == null) {
            ygf.l("variant is not set");
            return null;
        }
        int iIntValue = num.intValue();
        e1g e1gVar = (e1g) this.d;
        if (e1gVar == e1g.c) {
            if (iIntValue > 20) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 20 bytes for SHA1", num));
            }
        } else if (e1gVar == e1g.d) {
            if (iIntValue > 28) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 28 bytes for SHA224", num));
            }
        } else if (e1gVar == e1g.e) {
            if (iIntValue > 32) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 32 bytes for SHA256", num));
            }
        } else if (e1gVar == e1g.f) {
            if (iIntValue > 48) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 48 bytes for SHA384", num));
            }
        } else {
            if (e1gVar != e1g.g) {
                ygf.l("unknown hash type; must be SHA1, SHA224, SHA256, SHA384 or SHA512");
                return null;
            }
            if (iIntValue > 64) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 64 bytes for SHA512", num));
            }
        }
        return new f1g(((Integer) this.f).intValue(), ((Integer) this.a).intValue(), ((Integer) this.b).intValue(), ((Integer) this.c).intValue(), (d1g) this.e, (e1g) this.d);
    }

    public void l(int i) throws InvalidAlgorithmParameterException {
        if (i != 16 && i != 24 && i != 32) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size %d; only 16-byte, 24-byte and 32-byte AES keys are supported", Integer.valueOf(i)));
        }
        this.f = Integer.valueOf(i);
    }

    public void m(bzf bzfVar) throws GeneralSecurityException {
        if (!jcg.g.contains(bzfVar)) {
            throw new GeneralSecurityException(ev6.x("Invalid DEM parameters ", String.valueOf(bzfVar), "; only AES128_GCM_RAW, AES256_GCM_RAW, AES128_CTR_HMAC_SHA256_RAW, AES256_CTR_HMAC_SHA256_RAW XCHACHA20_POLY1305_RAW and AES256_SIV_RAW are currently supported."));
        }
        this.d = bzfVar;
    }

    public void n(int i) throws InvalidAlgorithmParameterException {
        if (i < 16) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size in bytes %d; HMAC key must be at least 16 bytes", Integer.valueOf(i)));
        }
        this.a = Integer.valueOf(i);
    }

    public void o(int i) throws GeneralSecurityException {
        if (i < 12 || i > 16) {
            throw new GeneralSecurityException(String.format("Invalid IV size in bytes %d; IV size must be between 12 and 16 bytes", Integer.valueOf(i)));
        }
        this.b = Integer.valueOf(i);
    }

    public void p(int i) throws GeneralSecurityException {
        if (i < 10) {
            throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; must be at least 10 bytes", Integer.valueOf(i)));
        }
        this.c = Integer.valueOf(i);
    }

    public void d() {
        Messenger messenger;
        nl7 nl7Var = ((pl7) this.f).a;
        gg5 gg5Var = nl7Var.f;
        if (gg5Var != null && (messenger = nl7Var.g) != null) {
            try {
                Message messageObtain = Message.obtain();
                messageObtain.what = 7;
                messageObtain.arg1 = 1;
                messageObtain.setData(null);
                messageObtain.replyTo = messenger;
                ((Messenger) gg5Var.b).send(messageObtain);
            } catch (RemoteException unused) {
                Log.i(QFTsJPDEnO.oIbcgLwo, "Remote error unregistering client messenger.");
            }
        }
        nl7Var.b.disconnect();
        ((BroadcastReceiver.PendingResult) this.e).finish();
    }

    public jcg j() throws GeneralSecurityException {
        fcg fcgVar = (fcg) this.a;
        if (fcgVar == null) {
            ygf.l("Elliptic curve type is not set");
            return null;
        }
        if (((ecg) this.b) == null) {
            ygf.l(ivbZv.jdHmvZYhkofYF);
            return null;
        }
        if (((bzf) this.d) == null) {
            ygf.l("DEM parameters are not set");
            return null;
        }
        if (((gcg) this.e) == null) {
            ygf.l("Variant is not set");
            return null;
        }
        fcg fcgVar2 = fcg.e;
        if (fcgVar != fcgVar2 && ((hcg) this.c) == null) {
            ygf.l("Point format is not set");
            return null;
        }
        if (fcgVar != fcgVar2 || ((hcg) this.c) == null) {
            return new jcg((fcg) this.a, (ecg) this.b, (hcg) this.c, (bzf) this.d, (gcg) this.e, (qvg) this.f);
        }
        ygf.l("For Curve25519 point format must not be set");
        return null;
    }
}
