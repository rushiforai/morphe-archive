package b;

import ads_mobile_sdk.dw0;
import ads_mobile_sdk.il2;
import ads_mobile_sdk.ji3;
import ads_mobile_sdk.lm0;
import ads_mobile_sdk.mw0;
import ads_mobile_sdk.rw0;
import ads_mobile_sdk.th3;
import ads_mobile_sdk.wg2;
import ads_mobile_sdk.xu0;
import ads_mobile_sdk.yu0;
import ads_mobile_sdk.yw;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherApps;
import android.content.pm.PackageInfo;
import android.content.pm.ShortcutInfo;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.UserHandle;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import aosp.android.icu.impl.CalendarAstronomer;
import com.android.billingclient.api.BillingClientStateListener;
import com.android.billingclient.api.BillingResult;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.teslacoilsw.launcher.preferences.SettingsActivity;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.ResultKt;
import kotlin.collections.AbstractCollection;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.text.Charsets;
import kotlin.text.MatchGroup;
import kotlin.text.MatcherMatchResult$groupValues$1;
import kotlin.text.MatcherMatchResult$groups$1;
import kotlin.text.Regex;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes.dex */
public final class i8 implements ba.d, u6, z6, za0.a, bh.d, com.google.android.gms.internal.consent_sdk.l7, BillingClientStateListener, de.a, ma0.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15893a;

    public /* synthetic */ i8(int i5) {
        this.f15893a = i5;
    }

    public static i2.g0 A(List list) {
        return new i2.g0(list, (Float.floatToRawIntBits(0.0f) << 32) | (Float.floatToRawIntBits(0.0f) & 4294967295L), (Float.floatToRawIntBits(0.0f) << 32) | (Float.floatToRawIntBits(Float.POSITIVE_INFINITY) & 4294967295L));
    }

    public static il2 c(int i5) {
        if (i5 == 0) {
            return il2.f4848b;
        }
        if (i5 != 1 && i5 == 2) {
            return il2.f4850d;
        }
        return il2.f4849c;
    }

    public static lm0 g(Context context, String str) {
        if (str != null && context != null) {
            try {
                if ("FireTVFOSDAT".equals(str)) {
                    return new lm0(context);
                }
            } catch (Exception e3) {
                Log.e("OMIDLIB", "Error creating attestation mechanism: ".concat(str), e3);
                return null;
            }
        }
        return null;
    }

    public static ads_mobile_sdk.q9 h(int i5) {
        ads_mobile_sdk.q9 q9Var = (ads_mobile_sdk.q9) ads_mobile_sdk.q9.f8523c.get(Integer.valueOf(i5));
        if (q9Var != null) {
            return q9Var;
        }
        throw new Exception("Invalid for value enum " + i8.class.getName() + ": " + i5);
    }

    public static Uri j(Uri uri, String str) {
        Intrinsics.g(uri, "<this>");
        String string = uri.toString();
        Intrinsics.f(string, "toString(...)");
        int iS0 = r70.k.S0(string, "&adurl", 0, false, 6);
        if (iS0 == -1) {
            iS0 = r70.k.S0(string, "?adurl=", 0, false, 6);
        }
        if (iS0 == -1) {
            Uri uriBuild = uri.buildUpon().appendQueryParameter("ms", str).build();
            Intrinsics.d(uriBuild);
            return uriBuild;
        }
        StringBuilder sb2 = new StringBuilder(str.length() + string.length() + 2 + 2);
        int i5 = iS0 + 1;
        String strSubstring = string.substring(0, i5);
        Intrinsics.f(strSubstring, "substring(...)");
        sb2.append(strSubstring);
        c0.C(sb2, "ms=", str, "&");
        String strSubstring2 = string.substring(i5);
        Intrinsics.f(strSubstring2, "substring(...)");
        sb2.append(strSubstring2);
        String string2 = sb2.toString();
        Intrinsics.f(string2, "toString(...)");
        return Uri.parse(string2);
    }

    public static String o(Context context) throws NoSuchAlgorithmException {
        String string;
        Intrinsics.g(context, "context");
        AtomicReference atomicReference = rw0.f9328g;
        String str = (String) atomicReference.get();
        if (str != null) {
            return str;
        }
        String strU = "B3EEABB8EE11C2BE770B684D95219ECB";
        if (!k9.J() && (string = Settings.Secure.getString(context.getContentResolver(), "android_id")) != null && string.length() != 0) {
            strU = u(string);
        }
        atomicReference.set(strU);
        return (String) atomicReference.get();
    }

    public static boolean p(Context context, String str) {
        Intrinsics.g(context, "context");
        return context.checkSelfPermission(str) == 0;
    }

    public static String q(String str, String str2) {
        kotlin.text.b bVarB = new Regex(str).b(str2);
        if (bVarB == null) {
            return null;
        }
        Collection collectionA = bVarB.a();
        AbstractCollection abstractCollection = (AbstractCollection) collectionA;
        if (abstractCollection.c() < 2) {
            return null;
        }
        int iC = abstractCollection.c();
        for (int i5 = 1; i5 < iC; i5++) {
            MatcherMatchResult$groupValues$1 matcherMatchResult$groupValues$1 = (MatcherMatchResult$groupValues$1) collectionA;
            if (!r70.k.U0((CharSequence) matcherMatchResult$groupValues$1.get(i5))) {
                return (String) matcherMatchResult$groupValues$1.get(i5);
            }
        }
        return null;
    }

    public static String r(String adUnitId) {
        MatcherMatchResult$groups$1 matcherMatchResult$groups$1;
        MatchGroup matchGroupD;
        Intrinsics.g(adUnitId, "adUnitId");
        kotlin.text.b bVarB = rw0.f9330i.b(adUnitId);
        if (bVarB == null || (matcherMatchResult$groups$1 = bVarB.f72035c) == null || (matchGroupD = matcherMatchResult$groups$1.d(1)) == null) {
            return null;
        }
        return matchGroupD.getF72022a();
    }

    public static h6.m1 t(h6.o1 owner, h6.x0 x0Var, int i5) {
        h6.j1 factory = x0Var;
        if ((i5 & 2) != 0) {
            Intrinsics.g(owner, "owner");
            factory = owner instanceof h6.n ? ((h6.n) owner).getDefaultViewModelProviderFactory() : m6.b.f76014a;
        }
        Intrinsics.g(owner, "owner");
        k6.c extras = owner instanceof h6.n ? ((h6.n) owner).getDefaultViewModelCreationExtras() : k6.a.f71149b;
        Intrinsics.g(owner, "owner");
        Intrinsics.g(factory, "factory");
        Intrinsics.g(extras, "extras");
        return new h6.m1(owner.getViewModelStore(), factory, extras);
    }

    public static String u(String str) throws NoSuchAlgorithmException {
        for (int i5 = 0; i5 < 2; i5++) {
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                byte[] bytes = str.getBytes(Charsets.f72000b);
                Intrinsics.f(bytes, "getBytes(...)");
                messageDigest.update(bytes);
                StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
                return String.format(Locale.US, "%032X", Arrays.copyOf(new Object[]{new BigInteger(1, messageDigest.digest())}, 1));
            } catch (NoSuchAlgorithmException unused) {
            }
        }
        return null;
    }

    public static k30.d v(CalendarAstronomer calendarAstronomer) {
        double dC = calendarAstronomer.c();
        k30.d dVar = k30.d.f70920c;
        if (dC < 0.10638435519278987d) {
            return dVar;
        }
        k30.d dVar2 = k30.d.f70922e;
        if (dC < 1.4644119716021067d) {
            return k30.d.f70921d;
        }
        if (dC < 1.6771806819876864d) {
            return dVar2;
        }
        k30.d dVar3 = k30.d.f70924g;
        if (dC < 3.0352082983970035d) {
            return k30.d.f70923f;
        }
        if (dC < 3.2479770087825828d) {
            return dVar3;
        }
        return dC < 4.6060046251919d ? k30.d.f70925h : dC < 4.81877333557748d ? k30.d.f70926i : dC < 6.176800951986796d ? k30.d.f70927j : dVar;
    }

    public static Drawable w(Context context, ShortcutInfo shortcutInfo, int i5) {
        try {
            return ((LauncherApps) context.getSystemService(LauncherApps.class)).getShortcutIconDrawable(shortcutInfo, i5);
        } catch (Exception e3) {
            Log.e("ShortcutCachingLogic", "Failed to get shortcut icon", e3);
            return null;
        }
    }

    public static Intent x(String str, Map map) {
        Intent intent = new Intent();
        intent.setComponent(SettingsActivity.f45966y);
        if (map != null && !map.isEmpty()) {
            str = u4.m(str, "?", b70.g.f1(map.entrySet(), "&", null, null, 0, new e0.z1(11), 30));
        }
        intent.putExtra("destination", str);
        intent.addFlags(67158016);
        return intent;
    }

    public static i2.g0 y(List list) {
        return new i2.g0(list, (Float.floatToRawIntBits(0.0f) << 32) | (Float.floatToRawIntBits(0.0f) & 4294967295L), (Float.floatToRawIntBits(Float.POSITIVE_INFINITY) << 32) | (Float.floatToRawIntBits(0.0f) & 4294967295L));
    }

    public static BitmapInfo z(Context context, ShortcutInfo shortcutInfo) {
        aa.g0 g0VarW = aa.g0.w(context);
        try {
            Drawable drawableW = w(context, shortcutInfo, ((o9.z0) o9.z0.f80267w.h(context)).f80271d);
            if (drawableW == null) {
                BitmapInfo bitmapInfo = BitmapInfo.f21150d;
                g0VarW.D();
                return bitmapInfo;
            }
            BitmapInfo bitmapInfo2 = new BitmapInfo(g0VarW.l(drawableW), aa.p.b(context, 16843829));
            g0VarW.D();
            return bitmapInfo2;
        } catch (Throwable th2) {
            try {
                g0VarW.D();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0020 A[PHI: r5
      0x0020: PHI (r5v2 int) = (r5v1 int), (r5v3 int) binds: [B:5:0x0019, B:7:0x001c] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // bh.d
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public bh.c a(Context context, String str, bh.b bVar) {
        switch (this.f15893a) {
            case 14:
                bh.c cVar = new bh.c();
                int iC = bVar.c(context, str, true);
                cVar.f17890b = iC;
                if (iC != 0) {
                    cVar.f17891c = 1;
                } else {
                    int iD = bVar.d(context, str);
                    cVar.f17889a = iD;
                    if (iD != 0) {
                        cVar.f17891c = -1;
                    }
                }
                return cVar;
            default:
                bh.c cVar2 = new bh.c();
                cVar2.f17889a = bVar.d(context, str);
                int i5 = 1;
                int iC2 = bVar.c(context, str, true);
                cVar2.f17890b = iC2;
                int i11 = cVar2.f17889a;
                if (i11 == 0) {
                    i11 = 0;
                    if (iC2 == 0) {
                        i5 = 0;
                    } else if (i11 >= iC2) {
                        i5 = -1;
                    }
                }
                cVar2.f17891c = i5;
                return cVar2;
        }
    }

    @Override // za0.a
    public za0.b b(String str) {
        return bb0.b.f17799a;
    }

    @Override // ba.d
    public CharSequence d(Object obj) {
        return ((ShortcutInfo) obj).getShortLabel();
    }

    @Override // ba.d
    public /* bridge */ /* synthetic */ BitmapInfo e(Context context, Object obj) {
        return z(context, (ShortcutInfo) obj);
    }

    @Override // ba.d
    public CharSequence f(Object obj, CharSequence charSequence) {
        CharSequence longLabel = ((ShortcutInfo) obj).getLongLabel();
        return TextUtils.isEmpty(longLabel) ? charSequence : longLabel;
    }

    @Override // de.a
    public long getTime() {
        return System.currentTimeMillis();
    }

    @Override // ba.d
    public UserHandle i(Object obj) {
        return ((ShortcutInfo) obj).getUserHandle();
    }

    @Override // ba.d
    public long k(Object obj, PackageInfo packageInfo) {
        ShortcutInfo shortcutInfo = (ShortcutInfo) obj;
        return (shortcutInfo == null || !u9.b.f90697j.b()) ? packageInfo.lastUpdateTime : Math.max(shortcutInfo.getLastChangedTimestamp(), packageInfo.lastUpdateTime);
    }

    @Override // ba.d
    public boolean l() {
        return false;
    }

    @Override // ba.d
    public ComponentName m(Object obj) {
        return ShortcutKey.b((ShortcutInfo) obj).f21251a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object n(long j11, Function1 function1, ContinuationImpl continuationImpl) {
        mw0 mw0Var;
        if (continuationImpl instanceof mw0) {
            mw0Var = (mw0) continuationImpl;
            int i5 = mw0Var.f7350c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mw0Var.f7350c = i5 - Integer.MIN_VALUE;
            } else {
                mw0Var = new mw0(this, continuationImpl);
            }
        }
        Object objC = mw0Var.f7348a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mw0Var.f7350c;
        try {
            if (i11 == 0) {
                ResultKt.b(objC);
                a60.d dVar = new a60.d(function1, null, 11);
                mw0Var.f7350c = 1;
                objC = t70.p2.c(j11, dVar, mw0Var);
                if (objC == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objC);
            }
            return new xu0(objC);
        } catch (TimeoutCancellationException e3) {
            yu0 yu0Var = new yu0(e3, 1);
            th3 th3VarA = ji3.a();
            th3VarA.e().f1799m = false;
            th3VarA.a(e3);
            return yu0Var;
        }
    }

    @Override // com.android.billingclient.api.BillingClientStateListener
    public void onBillingServiceDisconnected() {
        cy.d0.f48444c.j(null);
    }

    @Override // com.android.billingclient.api.BillingClientStateListener
    public void onBillingSetupFinished(BillingResult billingResult) {
        cy.d0 d0Var = cy.d0.f48442a;
        if (billingResult.getResponseCode() != 0) {
            cy.d0.f48444c.j(null);
        } else {
            cy.d0.f48444c.j(cy.d0.f48445d);
            cy.d0.E();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x0090, code lost:
    
        if (r10 == r1) goto L37;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r9v14 */
    /* JADX WARN: Type inference failed for: r9v19, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r9v22 */
    /* JADX WARN: Type inference failed for: r9v23 */
    /* JADX WARN: Type inference failed for: r9v24 */
    /* JADX WARN: Type inference failed for: r9v4 */
    /* JADX WARN: Type inference failed for: r9v5, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r9v6, types: [java.lang.String] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object s(om.e eVar, ContinuationImpl continuationImpl) {
        bn.u uVar;
        om.e eVar2;
        ?? r92;
        ?? r93;
        if (continuationImpl instanceof bn.u) {
            uVar = (bn.u) continuationImpl;
            int i5 = uVar.f18289w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f18289w = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new bn.u(this, continuationImpl);
            }
        }
        Object objI = uVar.f18287u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar.f18289w;
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        try {
            try {
            } catch (Exception e3) {
                e = e3;
            }
        } catch (Exception e11) {
            Log.w("FirebaseSessions", "Error getting Firebase installation id .", e11);
            r93 = eVar;
        }
        if (i11 == 0) {
            ResultKt.b(objI);
            om.d dVar = (om.d) eVar;
            fi.t tVarE = dVar.e();
            try {
                Intrinsics.f(tVarE, "getToken(...)");
                uVar.f18286t = dVar;
                uVar.f18289w = 1;
                Object objI2 = ul.b.i(tVarE, uVar);
                if (objI2 != coroutineSingletons) {
                    objI = objI2;
                    eVar = dVar;
                }
            } catch (Exception e12) {
                e = e12;
                eVar = dVar;
                Log.w("FirebaseSessions", "Error getting authentication token.", e);
                eVar2 = eVar;
                r92 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                fi.t tVarC = ((om.d) eVar2).c();
                Intrinsics.f(tVarC, "getId(...)");
                uVar.f18286t = r92;
                uVar.f18289w = 2;
                objI = ul.b.i(tVarC, uVar);
                eVar = r92;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ?? r94 = (String) uVar.f18286t;
            ResultKt.b(objI);
            eVar = r94;
            String str2 = (String) objI;
            r93 = eVar;
            if (str2 != null) {
                str = str2;
                r93 = eVar;
            }
            return new bn.v(str, r93);
        }
        om.e eVar3 = (om.e) uVar.f18286t;
        ResultKt.b(objI);
        eVar = eVar3;
        String strB = ((om.b) objI).b();
        Intrinsics.d(strB);
        eVar2 = eVar;
        r92 = strB;
        fi.t tVarC2 = ((om.d) eVar2).c();
        Intrinsics.f(tVarC2, "getId(...)");
        uVar.f18286t = r92;
        uVar.f18289w = 2;
        objI = ul.b.i(tVarC2, uVar);
        eVar = r92;
    }

    @Override // ma0.b
    public int seekTo(int i5) {
        return 0;
    }

    @Override // com.google.android.gms.internal.consent_sdk.m7
    public Object zzb() {
        return new com.google.android.gms.internal.consent_sdk.b();
    }

    @Override // b.u6
    public Object a(int i5) {
        switch (this.f15893a) {
            case 4:
                wg2 wg2VarA = wg2.a(i5);
                return wg2VarA == null ? wg2.USER_POPULATION_UNSPECIFIED : wg2VarA;
            case 10:
                dw0 dw0Var = i5 != 0 ? null : dw0.TAG_UNKNOWN;
                return dw0Var == null ? dw0.UNRECOGNIZED : dw0Var;
            default:
                yw ywVarA = yw.a(i5);
                return ywVarA == null ? yw.UNRECOGNIZED : ywVarA;
        }
    }

    @Override // b.z6
    public byte[] a(byte[] bArr, int i5, int i11) {
        byte[] bArr2 = new byte[i11];
        System.arraycopy(bArr, i5, bArr2, 0, i11);
        return bArr2;
    }
}
