package t5;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.LauncherApps;
import android.content.pm.ShortcutInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcel;
import android.os.UserHandle;
import android.text.Editable;
import android.text.TextUtils;
import android.util.Log;
import android.view.WindowManager;
import coil.memory.MemoryCache$Key;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.google.android.gms.common.internal.TelemetryData;
import com.google.android.gms.common.internal.zab;
import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.util.IntegerOverflowException;
import com.stripe.android.stripe3ds2.transaction.AcsData;
import com.stripe.android.view.StripeEditText;
import com.teslacoilsw.launcher.theme.AbstractThumbnailPicker;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.security.KeyFactory;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import java.security.interfaces.ECPublicKey;
import java.security.spec.ECParameterSpec;
import java.security.spec.ECPoint;
import java.security.spec.ECPublicKeySpec;
import java.security.spec.InvalidKeySpecException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.MissingFormatArgumentException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import javax.crypto.spec.SecretKeySpec;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import w70.i2;
import w70.u1;
import xk.r2;

/* loaded from: classes2.dex */
public final class d0 implements rg.l, v8.f, vk.t, xf.k {

    /* renamed from: c, reason: collision with root package name */
    public static d0 f88559c;

    /* renamed from: d, reason: collision with root package name */
    public static d0 f88560d;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f88561a;

    /* renamed from: b, reason: collision with root package name */
    public Object f88562b;

    public /* synthetic */ d0(Object obj, int i5) {
        this.f88561a = i5;
        this.f88562b = obj;
    }

    public static boolean A(Bundle bundle) {
        return "1".equals(bundle.getString("gcm.n.e")) || "1".equals(bundle.getString("gcm.n.e".replace("gcm.n.", "gcm.notification.")));
    }

    public static ECPublicKey G(Object obj) throws JOSEException {
        bp.b bVarH;
        if (obj instanceof Map) {
            bVarH = bp.b.h((Map) obj);
        } else {
            String string = obj != null ? obj.toString() : null;
            if (string == null) {
                string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            Set set = bp.b.f18355s;
            bVarH = bp.b.h(lp.d.i(-1, string));
        }
        bp.a aVar = bVarH.o;
        aVar.getClass();
        ECParameterSpec eCParameterSpecA = bp.c.a(aVar);
        if (eCParameterSpecA == null) {
            throw new JOSEException("Couldn't get EC parameter spec for curve " + aVar);
        }
        try {
            ECPublicKey eCPublicKey = (ECPublicKey) KeyFactory.getInstance("EC").generatePublic(new ECPublicKeySpec(new ECPoint(bVarH.f18356p.b(), bVarH.f18357q.b()), eCParameterSpecA));
            Intrinsics.f(eCPublicKey, "toECPublicKey(...)");
            return eCPublicKey;
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e3) {
            throw new JOSEException(e3.getMessage(), e3);
        }
    }

    public static String L(String str) {
        return str.startsWith("gcm.n.") ? str.substring(6) : str;
    }

    public static d0 h(byte[] bArr, el.j jVar) {
        if (jVar != null) {
            return new d0(tl.a.a(bArr), 2);
        }
        throw new NullPointerException("SecretKeyAccess required");
    }

    public static byte[] k(byte[] bArr) {
        if (bArr == null) {
            bArr = new byte[0];
        }
        return jk.b.u(p10.c0.e0(bArr.length), bArr);
    }

    public static d0 p(Context context) {
        if (f88559c == null) {
            f88559c = new d0(context.getApplicationContext(), 19);
        }
        return f88559c;
    }

    public String B(String... strArr) {
        String string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        for (String str : strArr) {
            if (str.length() > 0) {
                string = TextUtils.isEmpty(string) ? str : ((Resources) this.f88562b).getString(2132017844, string, str);
            }
        }
        return string;
    }

    public void C() {
        String string;
        StripeEditText stripeEditText = (StripeEditText) this.f88562b;
        Editable text = stripeEditText.getText();
        if (text == null || (string = text.toString()) == null) {
            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (string.length() > 1) {
            String strSubstring = string.substring(0, string.length() - 1);
            Intrinsics.f(strSubstring, "substring(...)");
            stripeEditText.setText(strSubstring);
        }
        stripeEditText.requestFocus();
        stripeEditText.setSelection(stripeEditText.length());
    }

    public void D(Map map) {
        m.w wVar = (m.w) this.f88562b;
        if (map == null) {
            wVar.y(null);
            return;
        }
        HashMap map2 = new HashMap();
        for (Map.Entry entry : map.entrySet()) {
            map2.put("samsung_" + ((String) entry.getKey()), entry.getValue());
        }
        wVar.y(map2);
    }

    public Bundle E() {
        Bundle bundle = (Bundle) this.f88562b;
        Bundle bundle2 = new Bundle(bundle);
        for (String str : bundle.keySet()) {
            if (!str.startsWith("google.c.a.") && !str.equals("from")) {
                bundle2.remove(str);
            }
        }
        return bundle2;
    }

    public AcsData F(JSONObject jSONObject) {
        Object objA;
        try {
            int i5 = Result.f71687b;
            Map mapI = lp.d.i(-1, jSONObject.toString());
            Intrinsics.f(mapI, "parse(...)");
            Map mapS0 = MapsKt.s0(mapI);
            objA = new AcsData(String.valueOf(mapS0.get("acsURL")), G(mapS0.get("acsEphemPubKey")), G(mapS0.get("sdkEphemPubKey")));
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            ((tv.c) this.f88562b).c(new IllegalArgumentException("Failed to parse ACS data: " + jSONObject, thA));
        }
        ResultKt.b(objA);
        return (AcsData) objA;
    }

    public void H(Object obj, Object... objArr) {
        List listAsList = Arrays.asList(objArr);
        xk.a0 a0Var = (xk.a0) this.f88562b;
        if (obj == null) {
            throw new NullPointerException("null key in entry: null=" + v30.e.u(listAsList));
        }
        Collection collection = (Collection) a0Var.get(obj);
        if (collection != null) {
            for (Object obj2 : listAsList) {
                w20.e.d(obj, obj2);
                collection.add(obj2);
            }
            return;
        }
        Iterator it = listAsList.iterator();
        if (it.hasNext()) {
            xk.c0 c0VarC = xk.c0.c();
            while (it.hasNext()) {
                Object next = it.next();
                w20.e.d(obj, next);
                c0VarC.add(next);
            }
            a0Var.put(obj, c0VarC);
        }
    }

    public int I() {
        return ((tl.a) this.f88562b).f89442a.length;
    }

    public byte[] J(el.j jVar) {
        if (jVar != null) {
            return ((tl.a) this.f88562b).b();
        }
        throw new NullPointerException("SecretKeyAccess required");
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0029  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void K(i1 newState) {
        Object value;
        i1 i1Var;
        Intrinsics.g(newState, "newState");
        i2 i2Var = (i2) this.f88562b;
        do {
            value = i2Var.getValue();
            i1Var = (i1) value;
            if (!(i1Var instanceof z0 ? true : Intrinsics.b(i1Var, l1.f88650b))) {
                if (i1Var instanceof c) {
                    if (newState.f88613a > i1Var.f88613a) {
                        i1Var = newState;
                    }
                } else if (!(i1Var instanceof n0)) {
                    throw new NoWhenBranchMatchedException();
                }
            }
        } while (!i2Var.i(value, i1Var));
    }

    @Override // xf.k
    public void a() {
    }

    @Override // rg.l
    public void accept(Object obj, Object obj2) {
        Parcel parcelObtain;
        fi.j jVar = (fi.j) obj2;
        switch (this.f88561a) {
            case 12:
                ug.b bVar = (ug.b) ((ug.a) obj).getService();
                zab zabVar = (zab) this.f88562b;
                parcelObtain = Parcel.obtain();
                parcelObtain.writeInterfaceToken(bVar.f32954c);
                parcelObtain.writeInt(1);
                zabVar.writeToParcel(parcelObtain, 0);
                try {
                    bVar.f32953b.transact(1, parcelObtain, null, 1);
                    parcelObtain.recycle();
                    jVar.a(null);
                    return;
                } finally {
                }
            default:
                ug.c cVar = (ug.c) ((ug.e) obj).getService();
                TelemetryData telemetryData = (TelemetryData) this.f88562b;
                parcelObtain = Parcel.obtain();
                parcelObtain.writeInterfaceToken(cVar.f32954c);
                if (telemetryData == null) {
                    parcelObtain.writeInt(0);
                } else {
                    parcelObtain.writeInt(1);
                    telemetryData.writeToParcel(parcelObtain, 0);
                }
                try {
                    cVar.f32953b.transact(1, parcelObtain, null, 1);
                    parcelObtain.recycle();
                    jVar.a(null);
                    return;
                } finally {
                }
        }
    }

    @Override // v8.f
    public void b(MemoryCache$Key memoryCache$Key, Bitmap bitmap, Map map) {
        ((fa.t) this.f88562b).o(memoryCache$Key, bitmap, map, u90.b.H(bitmap));
    }

    @Override // xf.k
    public void c(wm.b bVar) {
        bVar.b(((WindowManager) this.f88562b).getDefaultDisplay());
    }

    @Override // v8.f
    public void d(int i5) {
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x003f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public String e(fe.k0 k0Var) {
        String displayName;
        String str = k0Var.f54874c;
        String str2 = k0Var.f54873b;
        if (TextUtils.isEmpty(str) || "und".equals(str)) {
            displayName = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            int i5 = wf.v.f94376a;
            Locale localeForLanguageTag = i5 >= 21 ? Locale.forLanguageTag(str) : new Locale(str);
            Locale locale = i5 >= 24 ? Locale.getDefault(Locale.Category.DISPLAY) : Locale.getDefault();
            displayName = localeForLanguageTag.getDisplayName(locale);
            if (!TextUtils.isEmpty(displayName)) {
                try {
                    int iOffsetByCodePoints = displayName.offsetByCodePoints(0, 1);
                    displayName = displayName.substring(0, iOffsetByCodePoints).toUpperCase(locale) + displayName.substring(iOffsetByCodePoints);
                } catch (IndexOutOfBoundsException unused) {
                }
            }
        }
        String strB = B(displayName, g(k0Var));
        if (!TextUtils.isEmpty(strB)) {
            return strB;
        }
        if (TextUtils.isEmpty(str2)) {
            str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return str2;
    }

    @Override // v8.f
    public v8.a f(MemoryCache$Key memoryCache$Key) {
        return null;
    }

    public String g(fe.k0 k0Var) {
        Resources resources = (Resources) this.f88562b;
        int i5 = k0Var.f54876e;
        String string = (i5 & 2) != 0 ? resources.getString(2132017848) : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if ((i5 & 4) != 0) {
            string = B(string, resources.getString(2132017851));
        }
        if ((i5 & 8) != 0) {
            string = B(string, resources.getString(2132017850));
        }
        return (i5 & 1088) != 0 ? B(string, resources.getString(2132017849)) : string;
    }

    public ue.e0 i(int i5, mh.c cVar) {
        String str = (String) cVar.f76323b;
        if (i5 != 2) {
            if (i5 == 3 || i5 == 4) {
                return new ue.v(new ue.t(str));
            }
            if (i5 == 21) {
                return new ue.v(new ue.g());
            }
            if (i5 == 27) {
                return new ue.v(new ue.p(new og.i(m(cVar)), false, false));
            }
            if (i5 == 36) {
                return new ue.v(new ue.r(new og.i(m(cVar))));
            }
            if (i5 == 89) {
                return new ue.v(new ue.g((List) cVar.f76324c));
            }
            if (i5 == 138) {
                return new ue.v(new ue.f(str));
            }
            if (i5 == 172) {
                return new ue.v(new ue.b(str, 1));
            }
            if (i5 == 257) {
                return new ue.a0(new mh.c("application/vnd.dvb.ait", 24));
            }
            if (i5 == 134) {
                return new ue.a0(new mh.c("application/x-scte35", 24));
            }
            if (i5 != 135) {
                switch (i5) {
                    case 15:
                        return new ue.v(new ue.e(false, str));
                    case 16:
                        return new ue.v(new ue.m(new m.w(m(cVar))));
                    case 17:
                        return new ue.v(new ue.s(str));
                    default:
                        switch (i5) {
                            case 128:
                                break;
                            case EMPTY_TPAT_ERROR_VALUE:
                                break;
                            case MRAID_DOWNLOAD_JS_ERROR_VALUE:
                            default:
                                return null;
                        }
                }
            }
            return new ue.v(new ue.b(str, 0));
        }
        return new ue.v(new ue.j(new m.w(m(cVar))));
    }

    public SecretKeySpec j(SecretKeySpec secretKeySpec, byte[] bArr, byte[] bArr2, byte[] bArr3, byte[] bArr4, byte[] bArr5) throws JOSEException, IOException {
        byte[] bArrU = jk.b.u(bArr, bArr2, bArr3, bArr4, bArr5);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        Provider provider = (Provider) ((a5.d) this.f88562b).f267b;
        try {
            MessageDigest messageDigest = provider == null ? MessageDigest.getInstance("SHA-256") : MessageDigest.getInstance("SHA-256", provider);
            int i5 = 1;
            while (true) {
                long digestLength = messageDigest.getDigestLength() * 8;
                int i11 = (int) digestLength;
                if (i11 != digestLength) {
                    throw new IntegerOverflowException();
                }
                if (i5 > (i11 + 255) / i11) {
                    byte[] byteArray = byteArrayOutputStream.toByteArray();
                    return byteArray.length == 32 ? new SecretKeySpec(byteArray, "AES") : new SecretKeySpec(jk.b.U(0, 32, byteArray), "AES");
                }
                messageDigest.update(p10.c0.e0(i5));
                messageDigest.update(secretKeySpec.getEncoded());
                if (bArrU != null) {
                    messageDigest.update(bArrU);
                }
                try {
                    byteArrayOutputStream.write(messageDigest.digest());
                    i5++;
                } catch (IOException e3) {
                    throw new JOSEException("Couldn't write derived key: " + e3.getMessage(), e3);
                }
            }
        } catch (NoSuchAlgorithmException e11) {
            throw new JOSEException("Couldn't get message digest for KDF: " + e11.getMessage(), e11);
        }
    }

    public boolean l(String str) {
        String strY = y(str);
        return "1".equals(strY) || Boolean.parseBoolean(strY);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public List m(mh.c cVar) {
        String str;
        int i5;
        r2 r2Var = (r2) this.f88562b;
        com.google.android.gms.internal.consent_sdk.a aVar = new com.google.android.gms.internal.consent_sdk.a((byte[]) cVar.f76325d);
        while (aVar.g() > 0) {
            int iN = aVar.N();
            int iN2 = aVar.f31984b + aVar.N();
            if (iN == 134) {
                ArrayList arrayList = new ArrayList();
                int iN3 = aVar.N() & 31;
                for (int i11 = 0; i11 < iN3; i11++) {
                    String strL = aVar.L(3, vk.e.f92809c);
                    int iN4 = aVar.N();
                    boolean z11 = (iN4 & 128) != 0;
                    if (z11) {
                        i5 = iN4 & 63;
                        str = "application/cea-708";
                    } else {
                        str = "application/cea-608";
                        i5 = 1;
                    }
                    byte bN = (byte) aVar.N();
                    aVar.Z(1);
                    List listSingletonList = z11 ? Collections.singletonList((bN & 64) != 0 ? new byte[]{1} : new byte[]{0}) : null;
                    fe.j0 j0Var = new fe.j0();
                    j0Var.f54856k = str;
                    j0Var.f54848c = strL;
                    j0Var.C = i5;
                    j0Var.f54858m = listSingletonList;
                    arrayList.add(new fe.k0(j0Var));
                }
                r2Var = arrayList;
            }
            aVar.Y(iN2);
        }
        return r2Var;
    }

    public i1 n() {
        return (i1) ((i2) this.f88562b).getValue();
    }

    public long o() {
        ((vp.a) this.f88562b).getClass();
        return System.currentTimeMillis();
    }

    public Integer q(String str) {
        String strY = y(str);
        if (TextUtils.isEmpty(strY)) {
            return null;
        }
        try {
            return Integer.valueOf(Integer.parseInt(strY));
        } catch (NumberFormatException unused) {
            Log.w("NotificationParams", "Couldn't parse value of " + L(str) + "(" + strY + ") into an int");
            return null;
        }
    }

    public JSONArray r(String str) {
        String strY = y(str);
        if (TextUtils.isEmpty(strY)) {
            return null;
        }
        try {
            return new JSONArray(strY);
        } catch (JSONException unused) {
            Log.w("NotificationParams", "Malformed JSON for key " + L(str) + ": " + strY + ", falling back to default");
            return null;
        }
    }

    public Typeface s() {
        return (Typeface) this.f88562b;
    }

    public String t(Resources resources, String str, String str2) {
        String[] strArr;
        String strY = y(str2);
        if (!TextUtils.isEmpty(strY)) {
            return strY;
        }
        String strY2 = y(str2.concat("_loc_key"));
        if (TextUtils.isEmpty(strY2)) {
            return null;
        }
        int identifier = resources.getIdentifier(strY2, "string", str);
        if (identifier == 0) {
            Log.w("NotificationParams", L(str2.concat("_loc_key")) + " resource not found: " + str2 + " Default value will be used.");
            return null;
        }
        JSONArray jSONArrayR = r(str2.concat("_loc_args"));
        if (jSONArrayR == null) {
            strArr = null;
        } else {
            int length = jSONArrayR.length();
            strArr = new String[length];
            for (int i5 = 0; i5 < length; i5++) {
                strArr[i5] = jSONArrayR.optString(i5);
            }
        }
        if (strArr == null) {
            return resources.getString(identifier);
        }
        try {
            return resources.getString(identifier, strArr);
        } catch (MissingFormatArgumentException e3) {
            Log.w("NotificationParams", "Missing format argument for " + L(str2) + ": " + Arrays.toString(strArr) + " Default value will be used.", e3);
            return null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public ShortcutInfo u(UserHandle userHandle, String str, String str2) {
        w20.d dVar;
        List<String> listSingletonList = Collections.singletonList(str2);
        LauncherApps.ShortcutQuery shortcutQuery = new LauncherApps.ShortcutQuery();
        shortcutQuery.setQueryFlags(11);
        if (str != null) {
            shortcutQuery.setPackage(str);
            shortcutQuery.setActivity(null);
            shortcutQuery.setShortcutIds(listSingletonList);
        }
        try {
            dVar = new w20.d(((LauncherApps) this.f88562b).getShortcuts(shortcutQuery, userHandle));
        } catch (IllegalStateException | SecurityException unused) {
            dVar = w20.d.f93668b;
        }
        if (!dVar.f93669a || dVar.size() < 1) {
            return null;
        }
        return (ShortcutInfo) dVar.get(0);
    }

    public ShortcutInfo v(ShortcutKey shortcutKey) {
        return u(shortcutKey.f21252b, shortcutKey.f21251a.getPackageName(), shortcutKey.f21251a.getClassName());
    }

    @Override // vk.t
    public Iterator w(cz.b bVar, CharSequence charSequence) {
        return new vk.p(this, bVar, charSequence);
    }

    public Drawable x(ShortcutInfo shortcutInfo, int i5) {
        try {
            return ((LauncherApps) this.f88562b).getShortcutIconDrawable(shortcutInfo, i5);
        } catch (IllegalStateException | SecurityException e3) {
            Log.e("DeepShortcutManager", "Failed to get shortcut icon", e3);
            return null;
        }
    }

    public String y(String str) {
        Bundle bundle = (Bundle) this.f88562b;
        if (!bundle.containsKey(str) && str.startsWith("gcm.n.")) {
            String strReplace = !str.startsWith("gcm.n.") ? str : str.replace("gcm.n.", "gcm.notification.");
            if (bundle.containsKey(strReplace)) {
                str = strReplace;
            }
        }
        return bundle.getString(str);
    }

    public boolean z(uo.c cVar) {
        Set<String> set = cVar.f91413d;
        if (set == null) {
            return true;
        }
        for (String str : set) {
            if (!Collections.singleton("b64").contains(str) && !Collections.unmodifiableSet((Set) this.f88562b).contains(str)) {
                return false;
            }
        }
        return true;
    }

    public d0(StripeEditText backUpTarget) {
        this.f88561a = 23;
        Intrinsics.g(backUpTarget, "backUpTarget");
        this.f88562b = backUpTarget;
    }

    public d0(Application appContext) {
        this.f88561a = 29;
        Intrinsics.g(appContext, "appContext");
        this.f88562b = appContext;
    }

    public d0(int i5) {
        this.f88561a = i5;
        switch (i5) {
            case 9:
                this.f88562b = new HashSet(3);
                break;
            case 10:
                xk.l0 l0Var = xk.v0.f96030b;
                this.f88562b = r2.f96007e;
                break;
            case 15:
                this.f88562b = new CopyOnWriteArrayList();
                break;
            case 20:
                break;
            case 26:
                this.f88562b = xk.a0.a();
                break;
            case 27:
                this.f88562b = new a5.d(0);
                break;
            case 28:
                this.f88562b = Collections.EMPTY_SET;
                break;
            default:
                this.f88562b = u1.c(l1.f88650b);
                break;
        }
    }

    public d0(Resources resources) {
        this.f88561a = 11;
        resources.getClass();
        this.f88562b = resources;
    }

    public d0(Context context, int i5) {
        boolean zIsEmpty;
        this.f88561a = i5;
        switch (i5) {
            case 19:
                this.f88562b = (LauncherApps) context.getSystemService("launcherapps");
                return;
            default:
                SharedPreferences sharedPreferences = context.getSharedPreferences("com.google.android.gms.appid", 0);
                this.f88562b = sharedPreferences;
                File file = new File(context.getNoBackupFilesDir(), "com.google.android.gms.appid-no-backup");
                if (file.exists()) {
                    return;
                }
                try {
                    if (file.createNewFile()) {
                        synchronized (this) {
                            zIsEmpty = sharedPreferences.getAll().isEmpty();
                        }
                        if (zIsEmpty) {
                            return;
                        }
                        Log.i("FirebaseMessaging", "App restored, clearing state");
                        synchronized (this) {
                            sharedPreferences.edit().clear().commit();
                        }
                        return;
                    }
                    return;
                } catch (IOException e3) {
                    if (Log.isLoggable("FirebaseMessaging", 3)) {
                        e3.getMessage();
                        return;
                    }
                    return;
                }
        }
    }

    public d0(Bundle bundle) {
        this.f88561a = 4;
        this.f88562b = new Bundle(bundle);
    }

    public d0(xq.c logger) {
        this.f88561a = 18;
        Intrinsics.g(logger, "logger");
        this.f88562b = logger;
    }

    public d0(AbstractThumbnailPicker abstractThumbnailPicker) {
        this.f88561a = 7;
        this.f88562b = new WeakReference(abstractThumbnailPicker);
        new BitmapFactory.Options().inJustDecodeBounds = true;
    }
}
