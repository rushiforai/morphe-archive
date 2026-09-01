package defpackage;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Messenger;
import android.os.RemoteException;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import android.util.Pair;
import android.util.SparseArray;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.facebook.FacebookException;
import com.google.android.gms.common.api.Status;
import com.google.firebase.FirebaseException;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthMultiFactorException;
import com.google.firebase.auth.FirebaseAuthUserCollisionException;
import com.google.firebase.auth.internal.GenericIdpActivity;
import com.google.firebase.auth.internal.RecaptchaActivity;
import com.google.firebase.auth.internal.zzbw;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.share.PostShareData;
import com.medium.android.data.notification.YMl.DtuT;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.android.profile.ui.you.YouProfileTab;
import com.medium.android.profile.ui.you.i;
import gen.model.SourceParameter;
import j$.util.DesugarCollections;
import j$.util.Objects;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.KeyFactory;
import java.security.interfaces.ECPrivateKey;
import java.security.interfaces.ECPublicKey;
import java.security.spec.ECParameterSpec;
import java.security.spec.ECPoint;
import java.security.spec.ECPrivateKeySpec;
import java.security.spec.ECPublicKeySpec;
import java.security.spec.EllipticCurve;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.Executor;
import javax.crypto.Mac;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class d2f implements i1f, kwb, obf, kee, nfe, qbe, h8e, dle, khf, xq8, vnf, br8, o92, dfg, reg, rkg {
    public static d2f d;
    public final /* synthetic */ int a;
    public Object b;
    public Object c;

    public d2f(Context context, String str) {
        pkf pkfVarG;
        iv2 iv2Var;
        String strConcat;
        this.a = 26;
        this.b = str;
        try {
            mdg.a();
            iv2Var = new iv2();
            strConcat = "com.google.firebase.auth.api.crypto.".concat(str);
        } catch (IOException e) {
            e = e;
            Log.e("FirebearCryptoHelper", "Exception encountered during crypto setup:\n" + e.getMessage());
            pkfVarG = null;
        } catch (GeneralSecurityException e2) {
            e = e2;
            Log.e("FirebearCryptoHelper", "Exception encountered during crypto setup:\n" + e.getMessage());
            pkfVarG = null;
        }
        if (context == null) {
            throw new IllegalArgumentException("need an Android context");
        }
        iv2Var.a = context;
        iv2Var.e = "GenericIdpKeyset";
        iv2Var.b = strConcat;
        iv2Var.g = tdg.a;
        String strConcat2 = "android-keystore://firebear_master_key_id.".concat(str);
        if (!strConcat2.startsWith("android-keystore://")) {
            throw new IllegalArgumentException("key URI must start with android-keystore://");
        }
        iv2Var.c = strConcat2;
        pkfVarG = iv2Var.g();
        this.c = pkfVarG;
    }

    public static d2f t0(Context context, String str) {
        d2f d2fVar = d;
        if (d2fVar == null || !((String) d2fVar.b).equals(str)) {
            d = new d2f(context, str);
        }
        return d;
    }

    public static d2f u0(xug xugVar) throws GeneralSecurityException {
        int i = xeg.a[xugVar.ordinal()];
        int i2 = 20;
        boolean z = false;
        if (i == 1) {
            return new d2f(new d1g(19, "HmacSha256", false), xug.zza, z, i2);
        }
        if (i == 2) {
            return new d2f(new d1g(19, "HmacSha384", false), xug.zzb, z, i2);
        }
        if (i == 3) {
            return new d2f(new d1g(19, "HmacSha512", false), xug.zzc, z, i2);
        }
        throw new GeneralSecurityException("invalid curve type: ".concat(String.valueOf(xugVar)));
    }

    public static xmf z0(xj4 xj4Var, ppf ppfVar) {
        vp7.p(xj4Var);
        vp7.p(ppfVar);
        ArrayList arrayList = new ArrayList();
        ivg ivgVar = new ivg();
        vp7.n("firebase");
        String str = ppfVar.a;
        vp7.n(str);
        ivgVar.a = str;
        ivgVar.b = "firebase";
        ivgVar.e = ppfVar.b;
        ivgVar.c = ppfVar.d;
        String str2 = ppfVar.e;
        Uri uri = !TextUtils.isEmpty(str2) ? Uri.parse(str2) : null;
        if (uri != null) {
            ivgVar.d = uri.toString();
        }
        ivgVar.g = ppfVar.c;
        ivgVar.h = null;
        ivgVar.f = ppfVar.g;
        arrayList.add(ivgVar);
        List list = ppfVar.f.a;
        if (list != null && !list.isEmpty()) {
            for (int i = 0; i < list.size(); i++) {
                fqf fqfVar = (fqf) list.get(i);
                ivg ivgVar2 = new ivg();
                vp7.p(fqfVar);
                ivgVar2.a = fqfVar.a;
                String str3 = fqfVar.d;
                vp7.n(str3);
                ivgVar2.b = str3;
                ivgVar2.c = fqfVar.b;
                String str4 = fqfVar.c;
                Uri uri2 = !TextUtils.isEmpty(str4) ? Uri.parse(str4) : null;
                if (uri2 != null) {
                    ivgVar2.d = uri2.toString();
                }
                ivgVar2.e = fqfVar.g;
                ivgVar2.f = fqfVar.f;
                ivgVar2.g = false;
                ivgVar2.h = fqfVar.e;
                arrayList.add(ivgVar2);
            }
        }
        xmf xmfVar = new xmf(xj4Var, arrayList);
        xmfVar.i = new gof(ppfVar.i, ppfVar.h);
        xmfVar.j = ppfVar.j;
        xmfVar.k = ppfVar.k;
        xmfVar.h(vp7.J(ppfVar.l));
        List arrayList2 = ppfVar.m;
        if (arrayList2 == null) {
            arrayList2 = new ArrayList();
        }
        xmfVar.m = arrayList2;
        return xmfVar;
    }

    @Override // defpackage.obf
    public void A(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        ((obf) this.b).A(str, sourceParameter);
    }

    public r2g A0() {
        Integer num = (Integer) this.b;
        if (num == null) {
            ygf.l("Key size is not set");
            return null;
        }
        if (((d1g) this.c) != null) {
            return new r2g(num.intValue(), (d1g) this.c);
        }
        ygf.l("Variant is not set");
        return null;
    }

    @Override // defpackage.obf, defpackage.dle
    public void B(String str, g08 g08Var) {
        g08Var.getClass();
        ((obf) this.b).B(str, g08Var);
    }

    public dbg B0() throws GeneralSecurityException {
        Integer num = (Integer) this.b;
        if (num == null) {
            ygf.l("Key size is not set");
            return null;
        }
        if (((bbg) this.c) != null) {
            return new dbg(num.intValue(), (bbg) this.c);
        }
        ygf.l("Variant is not set");
        return null;
    }

    @Override // defpackage.obf, defpackage.nfe
    public void C(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        ((obf) this.b).C(sourceParameter);
    }

    public jrg C0(xj4 xj4Var, xmf xmfVar, zb0 zb0Var, String str, jyf jyfVar) {
        vp7.p(xj4Var);
        vp7.p(zb0Var);
        vp7.p(xmfVar);
        vp7.p(jyfVar);
        ArrayList arrayList = xmfVar.f;
        if (arrayList != null && arrayList.contains(zb0Var.d())) {
            return vp7.w(knf.a(new Status(17015, null, null, null)));
        }
        if (zb0Var instanceof qw3) {
            qw3 qw3Var = (qw3) zb0Var;
            if (TextUtils.isEmpty(qw3Var.c)) {
                jmf jmfVar = new jmf(qw3Var, str);
                jmfVar.c = xj4Var;
                jmfVar.d = xmfVar;
                jmfVar.e = jyfVar;
                jmfVar.f = jyfVar;
                return D0(jmfVar);
            }
            imf imfVar = new imf(qw3Var, 3);
            imfVar.c = xj4Var;
            imfVar.d = xmfVar;
            imfVar.e = jyfVar;
            imfVar.f = jyfVar;
            return D0(imfVar);
        }
        if (!(zb0Var instanceof c99)) {
            mmf mmfVar = new mmf(zb0Var);
            mmfVar.c = xj4Var;
            mmfVar.d = xmfVar;
            mmfVar.e = jyfVar;
            mmfVar.f = jyfVar;
            return D0(mmfVar);
        }
        oof.a.clear();
        imf imfVar2 = new imf((c99) zb0Var, 2);
        imfVar2.c = xj4Var;
        imfVar2.d = xmfVar;
        imfVar2.e = jyfVar;
        imfVar2.f = jyfVar;
        return D0(imfVar2);
    }

    @Override // defpackage.obf, defpackage.h8e
    public void D(String str, SourceParameter sourceParameter) {
        str.getClass();
        ((obf) this.b).D(str, sourceParameter);
    }

    public jrg D0(bof bofVar) {
        wfd wfdVar = new wfd();
        Executor executor = (Executor) this.c;
        pa6 pa6Var = new pa6(4);
        pa6Var.b = this;
        pa6Var.c = bofVar;
        pa6Var.d = wfdVar;
        executor.execute(pa6Var);
        return wfdVar.a;
    }

    public void E0(int i) {
        switch (this.a) {
            case 15:
                if (i != 16 && i != 32) {
                    throw new InvalidAlgorithmParameterException(String.format("Invalid key size %d; only 16-byte and 32-byte AES keys are supported", Integer.valueOf(i)));
                }
                this.b = Integer.valueOf(i);
                return;
            default:
                if (i != 32 && i != 48 && i != 64) {
                    throw new InvalidAlgorithmParameterException(String.format("Invalid key size %d; only 32-byte, 48-byte and 64-byte AES-SIV keys are supported", Integer.valueOf(i)));
                }
                this.b = Integer.valueOf(i);
                return;
        }
    }

    @Override // defpackage.obf, defpackage.kee
    public void F(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        ((obf) this.b).F(sourceParameter);
    }

    public void F0(Enum r2, Object obj) {
        ((HashMap) this.b).put(r2, obj);
        ((HashMap) this.c).put(obj, r2);
    }

    @Override // defpackage.obf
    public void G(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        ((obf) this.b).G(str, sourceParameter);
    }

    public void G0(Object obj, Status status) {
        FirebaseException firebaseAuthUserCollisionException;
        bof bofVar = (bof) this.b;
        wfd wfdVar = (wfd) this.c;
        vp7.q("completion source cannot be null", wfdVar);
        if (status == null) {
            wfdVar.b(obj);
            return;
        }
        if (bofVar.k == null) {
            if (bofVar.j == null) {
                wfdVar.a(knf.a(status));
                return;
            }
            SparseArray sparseArray = knf.a;
            int i = status.a;
            if (i == 17012 || i == 17007 || i == 17025) {
                Pair pair = (Pair) knf.a.get(i);
                firebaseAuthUserCollisionException = new FirebaseAuthUserCollisionException(knf.b(i), knf.c(pair != null ? (String) pair.second : "An internal error has occurred.", status));
            } else {
                firebaseAuthUserCollisionException = knf.a(status);
            }
            wfdVar.a(firebaseAuthUserCollisionException);
            return;
        }
        FirebaseAuth firebaseAuth = FirebaseAuth.getInstance(bofVar.c);
        zjf zjfVar = bofVar.k;
        if (!"reauthenticateWithCredential".equals(bofVar.a())) {
            "reauthenticateWithCredentialWithData".equals(bofVar.a());
        }
        SparseArray sparseArray2 = knf.a;
        firebaseAuth.getClass();
        zjfVar.getClass();
        Pair pair2 = (Pair) knf.a.get(17078);
        String str = (String) pair2.first;
        String str2 = (String) pair2.second;
        List list = (List) zjfVar.c;
        ArrayList<y48> arrayListJ = vp7.J(list);
        ArrayList arrayList = new ArrayList();
        for (y48 y48Var : arrayListJ) {
            if (y48Var instanceof d99) {
                arrayList.add((d99) y48Var);
            }
        }
        ArrayList<y48> arrayListJ2 = vp7.J(list);
        ArrayList arrayList2 = new ArrayList();
        for (y48 y48Var2 : arrayListJ2) {
            if (y48Var2 instanceof hqd) {
                arrayList2.add((hqd) y48Var2);
            }
        }
        ArrayList<y48> arrayListJ3 = vp7.J(list);
        vp7.n((String) zjfVar.b);
        ArrayList arrayList3 = new ArrayList();
        ArrayList arrayList4 = new ArrayList();
        for (y48 y48Var3 : arrayListJ3) {
            if (y48Var3 instanceof d99) {
                arrayList3.add((d99) y48Var3);
            } else {
                if (!(y48Var3 instanceof hqd)) {
                    ay0.e("MultiFactorInfo must be either PhoneMultiFactorInfo or TotpMultiFactorInfo. The factorId of this MultiFactorInfo: ".concat(y48Var3.d()));
                    return;
                }
                arrayList4.add((hqd) y48Var3);
            }
        }
        xj4 xj4Var = firebaseAuth.a;
        xj4Var.a();
        vp7.n(xj4Var.b);
        wfdVar.a(new FirebaseAuthMultiFactorException(str, str2));
    }

    @Override // defpackage.obf, defpackage.dle
    public void H(String str, String str2, g08 g08Var) {
        g08Var.getClass();
        ((obf) this.b).H(str, str2, g08Var);
    }

    public void H0(ssg ssgVar) throws IOException {
        if (((SharedPreferences.Editor) this.b).putString((String) this.c, vn7.p0(ssgVar.c())).commit()) {
            return;
        }
        ik4.g("Failed to write to SharedPreferences");
    }

    @Override // defpackage.obf, defpackage.h8e
    public void I(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        ((obf) this.b).I(sourceParameter);
    }

    @Override // defpackage.obf, defpackage.dle
    public void J(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        ((obf) this.b).J(sourceParameter, str, str2);
    }

    @Override // defpackage.obf
    public void L(String str, SourceParameter sourceParameter) {
        str.getClass();
        ((obf) this.b).L(str, sourceParameter);
    }

    @Override // defpackage.obf
    public void M(String str, SourceParameter sourceParameter) {
        str.getClass();
        ((obf) this.b).M(str, sourceParameter);
    }

    @Override // defpackage.xq8
    public void N(jrg jrgVar) {
        switch (this.a) {
            case 4:
                mgf mgfVar = (mgf) this.b;
                wfd wfdVar = (wfd) this.c;
                synchronized (mgfVar.f) {
                    mgfVar.e.remove(wfdVar);
                    break;
                }
                return;
            case 11:
                GenericIdpActivity genericIdpActivity = (GenericIdpActivity) this.b;
                String str = (String) this.c;
                myf myfVar = GenericIdpActivity.h;
                if (genericIdpActivity.getPackageManager().resolveActivity(new Intent("android.intent.action.VIEW"), 0) == null) {
                    Log.e("GenericIdpActivity", "Device cannot resolve intent for: android.intent.action.VIEW");
                    genericIdpActivity.p();
                    return;
                }
                List<ResolveInfo> listQueryIntentServices = genericIdpActivity.getPackageManager().queryIntentServices(new Intent("android.support.customtabs.action.CustomTabsService"), 0);
                if (listQueryIntentServices == null || listQueryIntentServices.isEmpty()) {
                    Intent intent = new Intent("android.intent.action.VIEW", (Uri) jrgVar.i());
                    intent.putExtra("com.android.browser.application_id", str);
                    Log.i("GenericIdpActivity", "Opening IDP Sign In link in a browser window.");
                    intent.addFlags(1073741824);
                    intent.addFlags(268435456);
                    genericIdpActivity.startActivity(intent);
                    return;
                }
                Intent intent2 = new Intent("android.intent.action.VIEW");
                if (!intent2.hasExtra("android.support.customtabs.extra.SESSION")) {
                    Bundle bundle = new Bundle();
                    bundle.putBinder("android.support.customtabs.extra.SESSION", null);
                    intent2.putExtras(bundle);
                }
                intent2.putExtra("android.support.customtabs.extra.EXTRA_ENABLE_INSTANT_APPS", true);
                intent2.putExtras(new Bundle());
                intent2.putExtra("androidx.browser.customtabs.extra.SHARE_STATE", 0);
                Log.i("GenericIdpActivity", "Opening IDP Sign In link in a custom chrome tab.");
                intent2.setData((Uri) jrgVar.i());
                genericIdpActivity.startActivity(intent2, null);
                return;
            default:
                RecaptchaActivity recaptchaActivity = (RecaptchaActivity) this.b;
                String str2 = (String) this.c;
                myf myfVar2 = RecaptchaActivity.h;
                if (recaptchaActivity.getPackageManager().resolveActivity(new Intent("android.intent.action.VIEW"), 0) == null) {
                    Log.e("RecaptchaActivity", "Device cannot resolve intent for: android.intent.action.VIEW");
                    recaptchaActivity.p();
                    return;
                }
                List<ResolveInfo> listQueryIntentServices2 = recaptchaActivity.getPackageManager().queryIntentServices(new Intent("android.support.customtabs.action.CustomTabsService"), 0);
                if (listQueryIntentServices2 == null || listQueryIntentServices2.isEmpty()) {
                    Intent intent3 = new Intent("android.intent.action.VIEW", (Uri) jrgVar.i());
                    intent3.putExtra("com.android.browser.application_id", str2);
                    intent3.addFlags(1073741824);
                    intent3.addFlags(268435456);
                    recaptchaActivity.startActivity(intent3);
                    return;
                }
                Intent intent4 = new Intent("android.intent.action.VIEW");
                if (!intent4.hasExtra("android.support.customtabs.extra.SESSION")) {
                    Bundle bundle2 = new Bundle();
                    bundle2.putBinder("android.support.customtabs.extra.SESSION", null);
                    intent4.putExtras(bundle2);
                }
                intent4.putExtra("android.support.customtabs.extra.EXTRA_ENABLE_INSTANT_APPS", true);
                intent4.putExtras(new Bundle());
                intent4.putExtra("androidx.browser.customtabs.extra.SHARE_STATE", 0);
                intent4.addFlags(1073741824);
                intent4.addFlags(268435456);
                intent4.setData((Uri) jrgVar.i());
                recaptchaActivity.startActivity(intent4, null);
                return;
        }
    }

    @Override // defpackage.rkg
    public byte[] O(int i, byte[] bArr) {
        return bArr.length <= 64 ? ((tkg) this.b).O(i, bArr) : ((vkg) this.c).O(i, bArr);
    }

    @Override // defpackage.i1f
    public void P(Bundle bundle, FacebookException facebookException) {
        e2f e2fVar = (e2f) this.b;
        m87 m87Var = (m87) this.c;
        m87Var.getClass();
        e2fVar.s(m87Var, bundle, facebookException);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.dfg
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object Q(java.lang.String r12, java.lang.String r13, defpackage.n92 r14) {
        /*
            Method dump skipped, instruction units count: 336
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.d2f.Q(java.lang.String, java.lang.String, n92):java.lang.Object");
    }

    @Override // defpackage.obf
    public void S(String str, SourceParameter sourceParameter) {
        ((obf) this.b).S(str, sourceParameter);
    }

    @Override // defpackage.obf
    public void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        ((obf) this.b).U(str, sourceParameter);
    }

    @Override // defpackage.kwb
    public int W(int i) {
        CharSequence charSequence = (CharSequence) this.b;
        do {
            i = ((h30) this.c).u(i);
            if (i == -1 || i == charSequence.length()) {
                return -1;
            }
        } while (Character.isWhitespace(charSequence.charAt(i)));
        return i;
    }

    @Override // defpackage.dle
    public void X(Uri uri, SourceParameter sourceParameter) {
        uri.getClass();
        sourceParameter.getClass();
        obf obfVar = (obf) this.b;
        String string = uri.toString();
        string.getClass();
        obfVar.o(string, sourceParameter);
    }

    @Override // defpackage.kwb
    public int Y(int i) {
        do {
            i = ((h30) this.c).x(i);
            if (i == -1 || i == 0) {
                return -1;
            }
        } while (Character.isWhitespace(((CharSequence) this.b).charAt(i - 1)));
        return i;
    }

    @Override // defpackage.obf
    public void Z(SourceParameter sourceParameter) {
        ((obf) this.b).Z(sourceParameter);
    }

    @Override // defpackage.reg
    public byte[] a0(byte[] bArr, zjf zjfVar) throws GeneralSecurityException {
        xug xugVar = (xug) this.b;
        ECPrivateKeySpec eCPrivateKeySpec = new ECPrivateKeySpec(qq7.I(((qvg) zjfVar.b).b()), en7.X(xugVar));
        cvg cvgVar = cvg.f;
        ECPrivateKey eCPrivateKey = (ECPrivateKey) ((KeyFactory) cvgVar.a.a("EC")).generatePrivate(eCPrivateKeySpec);
        zug zugVar = zug.zza;
        ECParameterSpec eCParameterSpecX = en7.X(xugVar);
        byte[] bArrA0 = en7.a0(eCPrivateKey, (ECPublicKey) ((KeyFactory) cvgVar.a.a("EC")).generatePublic(new ECPublicKeySpec(en7.Y(eCParameterSpecX.getCurve(), zugVar, bArr), eCParameterSpecX)));
        byte[] bArrH = il7.H(bArr, ((qvg) zjfVar.c).b());
        byte[] bArrH2 = il7.H(weg.m, mo102zza());
        d1g d1gVar = (d1g) this.c;
        int macLength = Mac.getInstance(d1gVar.b).getMacLength();
        byte[] bArr2 = weg.o;
        Charset charset = ejg.a;
        return d1gVar.e(macLength, d1gVar.f(il7.H(bArr2, bArrH2, "eae_prk".getBytes(charset), bArrA0), null), il7.H(weg.b(2, macLength), bArr2, bArrH2, "shared_secret".getBytes(charset), bArrH));
    }

    @Override // defpackage.kee, defpackage.nfe, defpackage.qbe, defpackage.h8e, defpackage.dle
    public void b(boolean z) {
        i iVar = (i) this.c;
        xpc xpcVar = iVar.k;
        int iIntValue = ((Number) xpcVar.getValue()).intValue();
        xpcVar.m(null, Integer.valueOf(iq7.v(z ? iIntValue + 1 : iIntValue - 1, 0, iVar.h)));
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public void c(CatalogItemType catalogItemType, String str, SourceParameter sourceParameter) {
        catalogItemType.getClass();
        sourceParameter.getClass();
        ((obf) this.b).c(catalogItemType, str, sourceParameter);
    }

    @Override // defpackage.obf, defpackage.qbe
    public void d(String str, String str2) {
        ((obf) this.b).d(str, str2);
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public void e(PostShareData postShareData, g08 g08Var) {
        postShareData.getClass();
        g08Var.getClass();
        ((obf) this.b).e(postShareData, g08Var);
    }

    @Override // defpackage.obf, defpackage.qbe
    public void f(String str, String str2) {
        str.getClass();
        ((obf) this.b).f(str, str2);
    }

    @Override // defpackage.obf, defpackage.kee, defpackage.nfe
    public void g(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        ((obf) this.b).g(sourceParameter);
    }

    @Override // defpackage.kwb
    public int h0(int i) {
        do {
            i = ((h30) this.c).x(i);
            if (i == -1) {
                return -1;
            }
        } while (Character.isWhitespace(((CharSequence) this.b).charAt(i)));
        return i;
    }

    @Override // defpackage.obf, defpackage.kee, defpackage.h8e, defpackage.dle
    public void i(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        ((obf) this.b).i(str, sourceParameter);
    }

    @Override // defpackage.kwb
    public int i0(int i) {
        do {
            i = ((h30) this.c).u(i);
            if (i == -1) {
                return -1;
            }
        } while (Character.isWhitespace(((CharSequence) this.b).charAt(i - 1)));
        return i;
    }

    @Override // defpackage.obf
    public void j(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ((obf) this.b).j(str, sourceParameter);
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public void k(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ((obf) this.b).k(str, sourceParameter);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.dfg
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object k0(java.lang.String r6, defpackage.n92 r7) {
        /*
            r5 = this;
            boolean r0 = r7 instanceof defpackage.ieg
            if (r0 == 0) goto L13
            r0 = r7
            ieg r0 = (defpackage.ieg) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L1a
        L13:
            ieg r0 = new ieg
            p92 r7 = (defpackage.p92) r7
            r0.<init>(r5, r7)
        L1a:
            java.lang.Object r7 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L36
            if (r2 != r3) goto L30
            a98 r6 = r0.b
            java.lang.String r0 = r0.f
            defpackage.br7.v(r7)
            r7 = r6
            r6 = r0
            goto L49
        L30:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L36:
            defpackage.br7.v(r7)
            java.lang.Object r7 = r5.c
            a98 r7 = (defpackage.a98) r7
            r0.f = r6
            r0.b = r7
            r0.e = r3
            java.lang.Object r0 = r7.m(r0, r4)
            if (r0 == r1) goto L8e
        L49:
            java.io.File r0 = new java.io.File     // Catch: java.lang.Throwable -> L83
            java.lang.Object r5 = r5.b     // Catch: java.lang.Throwable -> L83
            android.content.Context r5 = (android.content.Context) r5     // Catch: java.lang.Throwable -> L83
            java.io.File r5 = r5.getCacheDir()     // Catch: java.lang.Throwable -> L83
            java.lang.String r1 = "rce_"
            java.lang.String r2 = java.lang.String.valueOf(r6)     // Catch: java.lang.Throwable -> L83
            int r2 = r2.length()     // Catch: java.lang.Throwable -> L83
            r3 = 4
            int r3 = r3 + r2
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L83
            r2.<init>(r3)     // Catch: java.lang.Throwable -> L83
            r2.append(r1)     // Catch: java.lang.Throwable -> L83
            r2.append(r6)     // Catch: java.lang.Throwable -> L83
            java.lang.String r6 = r2.toString()     // Catch: java.lang.Throwable -> L83
            r0.<init>(r5, r6)     // Catch: java.lang.Throwable -> L83
            boolean r5 = r0.exists()     // Catch: java.lang.Throwable -> L83
            if (r5 == 0) goto L85
            byte[] r5 = defpackage.oh4.J0(r0)     // Catch: java.lang.Throwable -> L83
            java.nio.charset.Charset r6 = java.nio.charset.StandardCharsets.UTF_8     // Catch: java.lang.Throwable -> L83
            java.lang.String r0 = new java.lang.String     // Catch: java.lang.Throwable -> L83
            r0.<init>(r5, r6)     // Catch: java.lang.Throwable -> L83
            goto L86
        L83:
            r5 = move-exception
            goto L8a
        L85:
            r0 = r4
        L86:
            r7.f(r4)
            return r0
        L8a:
            r7.f(r4)
            throw r5
        L8e:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.d2f.k0(java.lang.String, n92):java.lang.Object");
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public void l(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        ((obf) this.b).l(sourceParameter, str, str2);
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public void m(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        ((obf) this.b).m(str, sourceParameter);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.o92
    public Object m0(jrg jrgVar) {
        if (!jrgVar.k()) {
            Exception excH = jrgVar.h();
            vp7.p(excH);
            String message = excH.getMessage();
            vp7.p(message);
            return vp7.w(new zzbw(message));
        }
        bqf bqfVar = (bqf) jrgVar.i();
        String str = bqfVar.a;
        if (str == null || str.isEmpty()) {
            return vp7.w(new zzbw(ka1.r("No Recaptcha Enterprise siteKey configured for tenant/project ", (String) this.b)));
        }
        j6g j6gVar = new j6g('/', 0);
        ujf ujfVar = new ujf(27, (boolean) (0 == true ? 1 : 0));
        ujfVar.b = j6gVar;
        List listM = new wjc(15, ujfVar).m(str);
        n92 n92Var = null;
        String str2 = listM.size() != 4 ? null : (String) listM.get(3);
        if (TextUtils.isEmpty(str2)) {
            return vp7.w(new Exception("Invalid siteKey format ".concat(str)));
        }
        if (Log.isLoggable("RecaptchaHandler", 4)) {
            Log.i("RecaptchaHandler", "Successfully obtained site key for tenant " + ((String) this.b));
        }
        uz5 uz5Var = (uz5) this.c;
        Object obj = uz5Var.f;
        xj4 xj4Var = (xj4) uz5Var.d;
        xj4Var.a();
        Application application = (Application) xj4Var.a;
        o33 o33VarG = vx0.G((k92) ((uz5) dq1.I(application).i).c, null, new kaf(application, str2, n92Var, 8), 3);
        wfd wfdVar = new wfd(new ujf(12));
        o33VarG.R(new j8e(wfdVar, 13, o33VarG));
        jrg jrgVar2 = wfdVar.a;
        uz5 uz5Var2 = (uz5) this.c;
        String str3 = (String) this.b;
        synchronized (uz5Var2.a) {
            uz5Var2.c = bqfVar;
            ((HashMap) uz5Var2.b).put(str3, jrgVar2);
        }
        return jrgVar2;
    }

    @Override // defpackage.obf, defpackage.qbe
    public void n() {
        ((obf) this.b).n();
    }

    @Override // defpackage.obf
    public void n0(String str, SourceParameter sourceParameter) {
        str.getClass();
        ((obf) this.b).n0(str, sourceParameter);
    }

    @Override // defpackage.obf, defpackage.kee, defpackage.nfe
    public void o(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ((obf) this.b).o(str, sourceParameter);
    }

    @Override // defpackage.obf
    public void o0(SourceParameter sourceParameter) {
        ((obf) this.b).o0(sourceParameter);
    }

    @Override // defpackage.br8
    public void onFailure(Exception exc) {
        ((wfd) this.b).a(exc);
        sv0.m((Context) this.c);
    }

    @Override // defpackage.obf
    public void p(SourceParameter sourceParameter, String str, String str2, boolean z) {
        str2.getClass();
        sourceParameter.getClass();
        ((obf) this.b).p(sourceParameter, str, str2, z);
    }

    @Override // defpackage.obf
    public void p0(SourceParameter sourceParameter) {
        ((obf) this.b).p0(sourceParameter);
    }

    @Override // defpackage.obf, defpackage.dle
    public void q(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        ((obf) this.b).q(sourceParameter);
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public void r(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        ((obf) this.b).r(sourceParameter, str, str2);
    }

    @Override // defpackage.obf, defpackage.qbe
    public void s(UpsellInfo upsellInfo, String str) {
        ((obf) this.b).s(upsellInfo, str);
    }

    public void s0(YouProfileTab youProfileTab) {
        youProfileTab.getClass();
        ((i) this.c).f.d("selected_tab", youProfileTab);
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public void u(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ((obf) this.b).u(str, sourceParameter);
    }

    @Override // defpackage.obf
    public void v(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        ((obf) this.b).v(str, sourceParameter);
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object v0(java.lang.String r8, defpackage.p92 r9) {
        /*
            r7 = this;
            boolean r0 = r9 instanceof defpackage.heg
            if (r0 == 0) goto L13
            r0 = r9
            heg r0 = (defpackage.heg) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            heg r0 = new heg
            r0.<init>(r7, r9)
        L18:
            java.lang.Object r9 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L34
            if (r2 != r4) goto L2e
            a98 r8 = r0.b
            java.lang.String r0 = r0.f
            defpackage.br7.v(r9)
            r9 = r8
            r8 = r0
            goto L47
        L2e:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r3
        L34:
            defpackage.br7.v(r9)
            java.lang.Object r9 = r7.c
            a98 r9 = (defpackage.a98) r9
            r0.f = r8
            r0.b = r9
            r0.e = r4
            java.lang.Object r0 = r9.m(r0, r3)
            if (r0 == r1) goto L8d
        L47:
            r0 = 0
            java.io.File r1 = new java.io.File     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            java.lang.Object r7 = r7.b     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            android.content.Context r7 = (android.content.Context) r7     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            java.io.File r7 = r7.getCacheDir()     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            java.lang.String r2 = "rce_"
            java.lang.String r5 = java.lang.String.valueOf(r8)     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            int r5 = r5.length()     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            r6 = 4
            int r6 = r6 + r5
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            r5.<init>(r6)     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            r5.append(r2)     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            r5.append(r8)     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            java.lang.String r8 = r5.toString()     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            r1.<init>(r7, r8)     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            boolean r7 = r1.exists()     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            if (r7 == 0) goto L7d
            boolean r7 = r1.delete()     // Catch: java.lang.Exception -> L7d java.lang.Throwable -> L7f
            if (r7 == 0) goto L7d
            goto L81
        L7d:
            r4 = r0
            goto L81
        L7f:
            r7 = move-exception
            goto L89
        L81:
            java.lang.Boolean r7 = java.lang.Boolean.valueOf(r4)     // Catch: java.lang.Throwable -> L7f
            r9.f(r3)
            return r7
        L89:
            r9.f(r3)
            throw r7
        L8d:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.d2f.v0(java.lang.String, p92):java.lang.Object");
    }

    @Override // defpackage.obf, defpackage.qbe
    public void w(String str, String str2) {
        str.getClass();
        ((obf) this.b).w(str, str2);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object w0(defpackage.mqf r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.ldg
            if (r0 == 0) goto L13
            r0 = r6
            ldg r0 = (defpackage.ldg) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ldg r0 = new ldg
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r6)
            goto L47
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r6)
            java.lang.Object r6 = r4.c
            tag r6 = (defpackage.tag) r6
            java.lang.Object r4 = r4.b
            prf r4 = (defpackage.prf) r4
            java.lang.String r4 = r4.b
            byte[] r5 = r5.d()
            r0.d = r3
            java.lang.Object r6 = r6.a(r4, r5, r0)
            if (r6 == r1) goto L5a
        L47:
            aeg r6 = (defpackage.aeg) r6
            mq7 r4 = r6.a
            int r4 = r4.z()
            r5 = 200(0xc8, float:2.8E-43)
            if (r4 != r5) goto L54
            goto L55
        L54:
            r3 = 0
        L55:
            java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
            return r4
        L5a:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.d2f.w0(mqf, p92):java.lang.Object");
    }

    @Override // defpackage.obf, defpackage.qbe
    public void x(eg1 eg1Var) {
        eg1Var.getClass();
        ((obf) this.b).x(eg1Var);
    }

    @Override // defpackage.khf
    public /* bridge */ /* synthetic */ Object y() {
        vgf vgfVar = (vgf) this.c;
        return new xgf((phf) ((vgf) this.b).y(), (thf) vgfVar.y());
    }

    public pif y0() {
        return new pif(DesugarCollections.unmodifiableMap((HashMap) this.b), DesugarCollections.unmodifiableMap((HashMap) this.c));
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public void z(SourceParameter sourceParameter, String str, String str2) {
        sourceParameter.getClass();
        ((obf) this.b).z(sourceParameter, str, str2);
    }

    @Override // defpackage.vnf
    public String zza() throws JSONException {
        switch (this.a) {
            case 9:
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("grantType", (String) this.b);
                jSONObject.put("refreshToken", (String) this.c);
                return jSONObject.toString();
            default:
                if (((pkf) this.c) == null) {
                    Log.e("FirebearCryptoHelper", "KeysetManager failed to initialize - unable to get Public key");
                    return null;
                }
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                hha hhaVar = new hha(byteArrayOutputStream);
                try {
                    synchronized (((pkf) this.c)) {
                        ((pkf) this.c).Q().l().i(hhaVar);
                        break;
                    }
                    return Base64.encodeToString(byteArrayOutputStream.toByteArray(), 8);
                } catch (IOException | GeneralSecurityException e) {
                    Log.e("FirebearCryptoHelper", "Exception encountered when attempting to get Public Key:\n" + e.getMessage());
                    return null;
                }
        }
    }

    public srg I0() throws GeneralSecurityException {
        ECPoint eCPoint;
        urg urgVar = (urg) this.b;
        if (urgVar == null) {
            ygf.l("Cannot build without a ecdsa public key");
            return null;
        }
        ujf ujfVar = (ujf) this.c;
        if (ujfVar == null) {
            ygf.l("Cannot build without a private value");
            return null;
        }
        BigInteger bigInteger = (BigInteger) ujfVar.b;
        ECPoint eCPoint2 = urgVar.j;
        grg grgVar = urgVar.i.b;
        BigInteger order = grgVar.b.getOrder();
        if (bigInteger.signum() <= 0 || bigInteger.compareTo(order) >= 0) {
            ygf.l("Invalid private value");
            return null;
        }
        ECParameterSpec eCParameterSpec = grgVar.b;
        if (!hkg.b(eCParameterSpec, hkg.a) && !hkg.b(eCParameterSpec, hkg.b) && !hkg.b(eCParameterSpec, hkg.c)) {
            ygf.l("spec must be NIST P256, P384 or P521");
            return null;
        }
        if (bigInteger.signum() != 1) {
            ygf.l(AXoTRPEGKEve.Ubwfx);
            return null;
        }
        if (bigInteger.compareTo(eCParameterSpec.getOrder()) >= 0) {
            ygf.l("k must be smaller than the order of the generator");
            return null;
        }
        EllipticCurve curve = eCParameterSpec.getCurve();
        ECPoint generator = eCParameterSpec.getGenerator();
        hkg.a(generator, curve);
        BigInteger a = eCParameterSpec.getCurve().getA();
        BigInteger bigIntegerC = hkg.c(curve);
        fkg fkgVarD = hkg.d(ECPoint.POINT_INFINITY, bigIntegerC);
        fkg fkgVarD2 = hkg.d(generator, bigIntegerC);
        for (int iBitLength = bigInteger.bitLength(); iBitLength >= 0; iBitLength--) {
            if (bigInteger.testBit(iBitLength)) {
                fkgVarD = hkg.f(fkgVarD, fkgVarD2, a, bigIntegerC);
                fkgVarD2 = hkg.e(fkgVarD2, a, bigIntegerC);
            } else {
                fkgVarD2 = hkg.f(fkgVarD, fkgVarD2, a, bigIntegerC);
                fkgVarD = hkg.e(fkgVarD, a, bigIntegerC);
            }
        }
        if (fkgVarD.c.equals(BigInteger.ZERO)) {
            eCPoint = ECPoint.POINT_INFINITY;
        } else {
            BigInteger bigIntegerModInverse = fkgVarD.c.modInverse(bigIntegerC);
            BigInteger bigIntegerMod = bigIntegerModInverse.multiply(bigIntegerModInverse).mod(bigIntegerC);
            eCPoint = new ECPoint(fkgVarD.a.multiply(bigIntegerMod).mod(bigIntegerC), fkgVarD.b.multiply(bigIntegerMod).mod(bigIntegerC).multiply(bigIntegerModInverse).mod(bigIntegerC));
        }
        hkg.a(eCPoint, curve);
        if (eCPoint.equals(eCPoint2)) {
            return new srg((urg) this.b, (ujf) this.c);
        }
        ygf.l("Invalid private value");
        return null;
    }

    public String x0(String str) {
        String str2;
        pkf pkfVar = (pkf) this.c;
        if (pkfVar == null) {
            Log.e(DtuT.dQVEEUmZHOBgV, "KeysetManager failed to initialize - unable to decrypt payload");
            return null;
        }
        try {
            synchronized (pkfVar) {
                bxf bxfVarQ = ((pkf) this.c).Q();
                try {
                    if (oag.a()) {
                        throw new GeneralSecurityException("Cannot use non-FIPS-compliant HybridConfigurationV1 in FIPS mode");
                    }
                    str2 = new String(((xwf) bxfVarQ.b(rx0.l, xwf.class)).a(Base64.decode(str, 8)), StandardCharsets.UTF_8);
                } catch (GeneralSecurityException e) {
                    throw new IllegalStateException(e);
                }
            }
            return str2;
        } catch (GeneralSecurityException e2) {
            Log.e("FirebearCryptoHelper", "Exception encountered while decrypting bytes:\n" + e2.getMessage());
            return null;
        }
    }

    public /* synthetic */ d2f(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    public /* synthetic */ d2f(Object obj, Object obj2, boolean z, int i) {
        this.a = i;
        this.b = obj2;
        this.c = obj;
    }

    public d2f(sv0 sv0Var, wfd wfdVar, Context context) {
        this.a = 10;
        this.b = wfdVar;
        this.c = context;
    }

    public d2f(Context context) {
        this.a = 19;
        this.b = context;
        this.c = new a98();
    }

    public d2f(Context context, String str, String str2) {
        this.a = 21;
        if (str != null) {
            this.c = str;
            Context applicationContext = context.getApplicationContext();
            if (str2 == null) {
                this.b = PreferenceManager.getDefaultSharedPreferences(applicationContext).edit();
                return;
            } else {
                this.b = applicationContext.getSharedPreferences(str2, 0).edit();
                return;
            }
        }
        ay0.e("keysetName cannot be null");
        throw null;
    }

    public d2f(IBinder iBinder) throws RemoteException {
        this.a = 23;
        String interfaceDescriptor = iBinder.getInterfaceDescriptor();
        if (Objects.equals(interfaceDescriptor, "android.os.IMessenger")) {
            this.b = new Messenger(iBinder);
            this.c = null;
        } else if (Objects.equals(interfaceDescriptor, "com.google.android.gms.iid.IMessengerCompat")) {
            this.c = new i0g(iBinder);
            this.b = null;
        } else {
            Log.w("MessengerIpcClient", "Invalid interface descriptor: ".concat(String.valueOf(interfaceDescriptor)));
            throw new RemoteException();
        }
    }

    @Override // defpackage.reg
    /* JADX INFO: renamed from: zza, reason: collision with other method in class */
    public byte[] mo102zza() throws GeneralSecurityException {
        int i = xeg.a[((xug) this.b).ordinal()];
        if (i == 1) {
            return weg.c;
        }
        if (i == 2) {
            return weg.d;
        }
        if (i == 3) {
            return weg.e;
        }
        ygf.l("Could not determine HPKE KEM ID");
        return null;
    }

    public d2f(k8g k8gVar) {
        this.a = 14;
        this.c = new Handler(Looper.getMainLooper());
        this.b = k8gVar;
    }

    public d2f() {
        this.a = 24;
        d2f d2fVar = ht2.m;
        tag tagVar = (tag) d2fVar.b;
        tag tagVar2 = new tag();
        tagVar2.a = Arrays.copyOf((long[]) tagVar.a, 10);
        tagVar2.b = Arrays.copyOf((long[]) tagVar.b, 10);
        tagVar2.c = Arrays.copyOf((long[]) tagVar.c, 10);
        this.b = tagVar2;
        this.c = Arrays.copyOf((long[]) d2fVar.c, 10);
    }

    public d2f(String str) {
        this.a = 9;
        this.b = kpf.REFRESH_TOKEN.toString();
        vp7.n(str);
        this.c = str;
    }

    public d2f(uz5 uz5Var, String str) {
        this.a = 13;
        this.b = str;
        Objects.requireNonNull(uz5Var);
        this.c = uz5Var;
    }

    public /* synthetic */ d2f(int i) {
        this.a = i;
    }
}
