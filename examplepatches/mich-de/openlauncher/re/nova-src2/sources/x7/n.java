package x7;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import androidx.work.impl.WorkDatabase_Impl;
import b.i8;
import b3.t1;
import c0.d0;
import c0.m2;
import com.google.android.gms.internal.consent_sdk.f0;
import com.google.android.gms.internal.consent_sdk.j0;
import com.google.android.gms.internal.consent_sdk.w3;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import e1.m0;
import e10.o4;
import e10.y2;
import h6.f1;
import h6.j1;
import h6.l1;
import h6.m1;
import h6.n1;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.LazyKt;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import l10.w;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;
import org.json.JSONArray;
import org.json.JSONObject;
import pp.b0;
import r10.x1;
import v2.a0;
import v2.g0;
import v2.y;
import v2.z;

/* loaded from: classes.dex */
public final class n implements vd.b, m2, j0 {

    /* renamed from: a, reason: collision with root package name */
    public Object f95149a;

    /* renamed from: b, reason: collision with root package name */
    public Object f95150b;

    /* renamed from: c, reason: collision with root package name */
    public Object f95151c;

    /* renamed from: d, reason: collision with root package name */
    public Object f95152d;

    public /* synthetic */ n(Object obj, Object obj2, Object obj3, Object obj4) {
        this.f95149a = obj;
        this.f95150b = obj2;
        this.f95151c = obj3;
        this.f95152d = obj4;
    }

    public static List f(List list) {
        if (list.isEmpty()) {
            return list;
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(list.get(0));
        String str = ((ExternalLink) list.get(0)).f78381e;
        int size = list.size();
        for (int i5 = 1; i5 < size; i5++) {
            if (!Intrinsics.b(((ExternalLink) list.get(i5)).f78381e, str)) {
                arrayList.add(list.get(i5));
                str = ((ExternalLink) list.get(i5)).f78381e;
            }
        }
        return arrayList;
    }

    @Override // c0.j2
    public long b(c0.s sVar, c0.s sVar2, c0.s sVar3) {
        int iB = sVar.b();
        long jMax = 0;
        for (int i5 = 0; i5 < iB; i5++) {
            jMax = Math.max(jMax, ((c0.t) this.f95149a).get(i5).e(sVar.a(i5), sVar2.a(i5), sVar3.a(i5)));
        }
        return jMax;
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:44:0x0154. Please report as an issue. */
    /* JADX WARN: Removed duplicated region for block: B:179:0x024d A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x01a5  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x01f5  */
    @Override // com.google.android.gms.internal.consent_sdk.j0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean c(String str, JSONObject jSONObject) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        boolean zBooleanValue;
        String str2;
        String str3;
        String str4;
        String str5;
        Integer num;
        HashMap map;
        Iterator it;
        int iIntValue;
        Object obj;
        com.google.android.gms.internal.consent_sdk.h hVar = (com.google.android.gms.internal.consent_sdk.h) this.f95150b;
        Application application = (Application) this.f95149a;
        int iHashCode = str.hashCode();
        if (iHashCode == 94746189) {
            if (!str.equals("clear")) {
                return false;
            }
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray(UserMetadata.KEYDATA_FILENAME);
            if (jSONArrayOptJSONArray == null || jSONArrayOptJSONArray.length() == 0) {
                jSONObject.toString();
                return true;
            }
            HashSet hashSet = new HashSet();
            int length = jSONArrayOptJSONArray.length();
            for (int i5 = 0; i5 < length; i5++) {
                String strOptString = jSONArrayOptJSONArray.optString(i5);
                if (!TextUtils.isEmpty(strOptString)) {
                    hashSet.add(strOptString);
                }
            }
            i30.j.V(application, hashSet);
            return true;
        }
        if (iHashCode != 113399775 || !str.equals("write")) {
            return false;
        }
        f0 f0Var = new f0(application);
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            if (f0Var.d(jSONObject.opt(next), next)) {
                hVar.f32083c.add(next);
            }
        }
        hVar.f32082b.edit().putStringSet("written_values", hVar.f32083c).commit();
        f0Var.b();
        HashMap mapA = f0Var.a();
        if (mapA.size() <= 1) {
            return true;
        }
        w3 w3Var = (w3) this.f95151c;
        com.google.android.gms.internal.consent_sdk.f fVar = w3Var.f32281a;
        AtomicReference atomicReference = fVar.f32068g;
        AtomicReference atomicReference2 = fVar.f32067f;
        AtomicReference atomicReference3 = fVar.f32066e;
        AtomicReference atomicReference4 = fVar.f32065d;
        AtomicReference atomicReference5 = fVar.f32064c;
        AtomicReference atomicReference6 = fVar.f32063b;
        if (atomicReference.get() != null) {
            zBooleanValue = ((Boolean) atomicReference.get()).booleanValue();
        } else {
            Context context = fVar.f32062a;
            if (context == null) {
                atomicReference.set(Boolean.FALSE);
            } else {
                try {
                    atomicReference6.set(FirebaseAnalytics.class.getDeclaredMethod("getInstance", Context.class).invoke(null, context));
                    atomicReference5.set(FirebaseAnalytics.class.getDeclaredMethod("setConsent", Map.class));
                    Method declaredMethod = xl.a.class.getDeclaredMethod("valueOf", String.class);
                    Method declaredMethod2 = xl.b.class.getDeclaredMethod("valueOf", String.class);
                    atomicReference4.set(declaredMethod);
                    atomicReference3.set(declaredMethod2);
                    atomicReference.set(Boolean.TRUE);
                    zBooleanValue = true;
                } catch (Exception e3) {
                    Log.w("UserMessagingPlatform", "No Firebase class found. ", e3);
                    atomicReference.set(Boolean.FALSE);
                }
            }
            zBooleanValue = false;
        }
        if (zBooleanValue) {
            Context context2 = w3Var.f32282b;
            if (atomicReference2.get() == null) {
                try {
                    atomicReference2.set(zg.b.a(context2).b(128, context2.getPackageName()).metaData);
                } catch (PackageManager.NameNotFoundException | NullPointerException e11) {
                    Log.w("UserMessagingPlatform", "Failed to get metadata. ", e11);
                }
            }
            String str6 = "IABTCF_gdprApplies";
            Integer num2 = (Integer) mapA.get("IABTCF_gdprApplies");
            HashMap map2 = new HashMap();
            Iterator it2 = mapA.keySet().iterator();
            while (it2.hasNext()) {
                String str7 = (String) it2.next();
                if (!str7.equals(str6)) {
                    switch (str7.hashCode()) {
                        case -1926457382:
                            if (str7.equals("UMP_CoMoAdPersonalizationPurposeConsentStatus")) {
                                str2 = "google_analytics_default_allow_ad_personalization_signals";
                                str3 = str6;
                                str4 = "AD_PERSONALIZATION";
                                iIntValue = ((Integer) mapA.get(str7)).intValue();
                                num = num2;
                                if (iIntValue == -1) {
                                    map = mapA;
                                    if (iIntValue != 1) {
                                        it = it2;
                                        if (iIntValue == 2) {
                                            map2.put(str4, "DENIED");
                                        } else if (iIntValue != 4) {
                                            if (iIntValue != 5) {
                                                Log.w("UserMessagingPlatform", "Invalid CoMo consent status: " + iIntValue);
                                            } else if (atomicReference2.get() != null && (obj = ((Bundle) atomicReference2.get()).get(str2)) != null) {
                                                Object obj2 = obj instanceof Boolean ? (Boolean) obj : obj instanceof String ? (String) obj : null;
                                                if (obj2 == null) {
                                                    Log.w("UserMessagingPlatform", "No default metadata");
                                                } else if (obj2 instanceof Boolean) {
                                                    map2.put(str4, true != ((Boolean) obj2).booleanValue() ? "DENIED" : "GRANTED");
                                                } else if ((obj2 instanceof String) && obj2.equals("eu_consent_policy") && ((str4.equals("AD_PERSONALIZATION") || str4.equals("AD_USER_DATA")) && num != null)) {
                                                    map2.put(str4, num.intValue() == 1 ? "DENIED" : "GRANTED");
                                                } else {
                                                    Log.w("UserMessagingPlatform", "Failed to get the default eu_consent_policy value.");
                                                }
                                            }
                                        }
                                        str6 = str3;
                                        num2 = num;
                                        mapA = map;
                                        it2 = it;
                                        break;
                                    } else {
                                        map2.put(str4, "GRANTED");
                                        str6 = str3;
                                        num2 = num;
                                        mapA = map;
                                        break;
                                    }
                                } else {
                                    map = mapA;
                                    it = it2;
                                    str6 = str3;
                                    num2 = num;
                                    mapA = map;
                                    it2 = it;
                                }
                            } else {
                                str3 = str6;
                                num = num2;
                                map = mapA;
                                it = it2;
                                str6 = str3;
                                num2 = num;
                                mapA = map;
                                it2 = it;
                            }
                            break;
                        case -142866440:
                            if (!str7.equals("UMP_CoMoAnalyticsStoragePurposeConsentStatus")) {
                                str3 = str6;
                                num = num2;
                                map = mapA;
                                it = it2;
                                str6 = str3;
                                num2 = num;
                                mapA = map;
                                it2 = it;
                                break;
                            } else {
                                str2 = "google_analytics_default_allow_analytics_storage";
                                str5 = "ANALYTICS_STORAGE";
                                str3 = str6;
                                str4 = str5;
                                iIntValue = ((Integer) mapA.get(str7)).intValue();
                                num = num2;
                                if (iIntValue == -1) {
                                }
                            }
                            break;
                        case 1068702385:
                            if (!str7.equals("UMP_CoMoAdStoragePurposeConsentStatus")) {
                                str3 = str6;
                                num = num2;
                                map = mapA;
                                it = it2;
                                str6 = str3;
                                num2 = num;
                                mapA = map;
                                it2 = it;
                                break;
                            } else {
                                str2 = "google_analytics_default_allow_ad_storage";
                                str5 = "AD_STORAGE";
                                str3 = str6;
                                str4 = str5;
                                iIntValue = ((Integer) mapA.get(str7)).intValue();
                                num = num2;
                                if (iIntValue == -1) {
                                }
                            }
                            break;
                        case 1479307131:
                            if (!str7.equals("UMP_CoMoAdUserDataPurposeConsentStatus")) {
                                str3 = str6;
                                num = num2;
                                map = mapA;
                                it = it2;
                                str6 = str3;
                                num2 = num;
                                mapA = map;
                                it2 = it;
                                break;
                            } else {
                                str2 = "google_analytics_default_allow_ad_user_data";
                                str3 = str6;
                                str4 = "AD_USER_DATA";
                                iIntValue = ((Integer) mapA.get(str7)).intValue();
                                num = num2;
                                if (iIntValue == -1) {
                                }
                            }
                            break;
                        default:
                            str3 = str6;
                            num = num2;
                            map = mapA;
                            it = it2;
                            str6 = str3;
                            num2 = num;
                            mapA = map;
                            it2 = it;
                            break;
                    }
                }
            }
            map2.toString();
            HashMap map3 = new HashMap();
            for (String str8 : map2.keySet()) {
                try {
                } catch (Exception e12) {
                    e = e12;
                }
                try {
                    map3.put((Enum) ((Method) atomicReference3.get()).invoke(null, str8), (Enum) ((Method) atomicReference4.get()).invoke(null, map2.get(str8)));
                } catch (Exception e13) {
                    e = e13;
                    Log.w("UserMessagingPlatform", "Failed to invoke the Firebase static method.", e);
                }
            }
            if (atomicReference5.get() != null && !map3.isEmpty()) {
                try {
                    ((Method) atomicReference5.get()).invoke(atomicReference6.get(), map3);
                } catch (Exception e14) {
                    Log.w("UserMessagingPlatform", "Failed to invoke Firebase method. ", e14);
                }
            }
        }
        f0Var.c();
        return true;
    }

    public fl.o d() throws GeneralSecurityException {
        Integer num = (Integer) this.f95149a;
        if (num == null) {
            throw new GeneralSecurityException("Key size is not set");
        }
        if (((Integer) this.f95150b) == null) {
            throw new GeneralSecurityException("IV size is not set");
        }
        if (((fl.j) this.f95152d) == null) {
            throw new GeneralSecurityException("Variant is not set");
        }
        if (((Integer) this.f95151c) != null) {
            return new fl.o(num.intValue(), ((Integer) this.f95150b).intValue(), ((Integer) this.f95151c).intValue(), (fl.j) this.f95152d);
        }
        throw new GeneralSecurityException("Tag size is not set");
    }

    public m8.k e() {
        Context context = (Context) this.f95149a;
        x8.b bVar = (x8.b) this.f95150b;
        a70.d dVarA = LazyKt.a(new m8.d(this, 0));
        a70.d dVarA2 = LazyKt.a(new m8.d(this, 1));
        a70.d dVarA3 = LazyKt.a(m8.e.f76055j);
        m8.b bVar2 = (m8.b) this.f95151c;
        if (bVar2 == null) {
            EmptyList emptyList = EmptyList.f71733a;
            bVar2 = new m8.b(emptyList, emptyList, emptyList, emptyList, emptyList);
        }
        return new m8.k(context, bVar, dVarA, dVarA2, dVarA3, bVar2, (lm.e) this.f95152d);
    }

    public void g(String str) {
        WorkDatabase_Impl workDatabase_Impl = (WorkDatabase_Impl) this.f95149a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        qp.h hVar = (qp.h) this.f95151c;
        d7.g gVarAcquire = hVar.acquire();
        if (str == null) {
            gVarAcquire.bindNull(1);
        } else {
            gVarAcquire.bindString(1, str);
        }
        workDatabase_Impl.beginTransaction();
        try {
            gVarAcquire.executeUpdateDelete();
            workDatabase_Impl.setTransactionSuccessful();
        } finally {
            workDatabase_Impl.endTransaction();
            hVar.release(gVarAcquire);
        }
    }

    @Override // w60.a
    public Object get() {
        return new h((Executor) ((w60.a) this.f95149a).get(), (be.d) ((w60.a) this.f95150b).get(), (u) ((i50.c) this.f95151c).get(), (ce.b) ((w60.a) this.f95152d).get(), 1);
    }

    public void h(v2.m mVar, boolean z11) {
        a0 a0Var = (a0) this.f95152d;
        List list = mVar.f91975a;
        List list2 = list;
        int size = list2.size();
        for (int i5 = 0; i5 < size; i5++) {
            if (((v2.t) list.get(i5)).l()) {
                s(mVar);
                return;
            }
        }
        t1 t1Var = (t1) this.f95149a;
        if (t1Var == null) {
            throw new IllegalStateException("layoutCoordinates not set");
        }
        g0.m(mVar, t1Var.M(0L), new b0.e(23, this, a0Var));
        if (((y) this.f95150b) == y.f92023b) {
            if (z11) {
                int size2 = list2.size();
                for (int i11 = 0; i11 < size2; i11++) {
                    ((v2.t) list.get(i11)).a();
                }
            }
            m0 m0Var = mVar.f91976b;
            if (m0Var != null) {
                m0Var.p(!a0Var.f91911c);
            }
        }
    }

    public Uri i(w wVar) {
        Uri uri = (Uri) this.f95149a;
        if (wVar.f74465b) {
            return uri;
        }
        l10.t tVar = wVar.f74464a;
        float f11 = tVar.f74458e.f90183f ? 61.0f : 50.0f;
        float f12 = tVar.f74459f;
        return (45.0f > f12 || f12 > f11) ? (50.0f > f12 || f12 > 69.0f) ? (78.0f > f12 || f12 > 82.0f) ? uri : (Uri) this.f95152d : (Uri) this.f95151c : (Uri) this.f95150b;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:111:0x01bb A[Catch: Exception -> 0x0048, TryCatch #1 {Exception -> 0x0048, blocks: (B:13:0x003f, B:96:0x017f, B:111:0x01bb, B:114:0x01c2, B:117:0x01c8, B:120:0x01d3, B:121:0x01e4, B:123:0x01ea, B:125:0x01f6, B:130:0x0201, B:131:0x0218, B:18:0x004f, B:102:0x0197, B:21:0x005c, B:108:0x01af, B:24:0x0069, B:64:0x010d, B:27:0x0076, B:58:0x00f5, B:30:0x0083, B:70:0x0124), top: B:137:0x0030 }] */
    /* JADX WARN: Removed duplicated region for block: B:115:0x01c5  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x01c8 A[Catch: Exception -> 0x0048, TryCatch #1 {Exception -> 0x0048, blocks: (B:13:0x003f, B:96:0x017f, B:111:0x01bb, B:114:0x01c2, B:117:0x01c8, B:120:0x01d3, B:121:0x01e4, B:123:0x01ea, B:125:0x01f6, B:130:0x0201, B:131:0x0218, B:18:0x004f, B:102:0x0197, B:21:0x005c, B:108:0x01af, B:24:0x0069, B:64:0x010d, B:27:0x0076, B:58:0x00f5, B:30:0x0083, B:70:0x0124), top: B:137:0x0030 }] */
    /* JADX WARN: Removed duplicated region for block: B:118:0x01d0  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x01d3 A[Catch: Exception -> 0x0048, TryCatch #1 {Exception -> 0x0048, blocks: (B:13:0x003f, B:96:0x017f, B:111:0x01bb, B:114:0x01c2, B:117:0x01c8, B:120:0x01d3, B:121:0x01e4, B:123:0x01ea, B:125:0x01f6, B:130:0x0201, B:131:0x0218, B:18:0x004f, B:102:0x0197, B:21:0x005c, B:108:0x01af, B:24:0x0069, B:64:0x010d, B:27:0x0076, B:58:0x00f5, B:30:0x0083, B:70:0x0124), top: B:137:0x0030 }] */
    /* JADX WARN: Removed duplicated region for block: B:133:0x021e A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:73:0x012d A[Catch: Exception -> 0x00af, TRY_ENTER, TryCatch #0 {Exception -> 0x00af, blocks: (B:33:0x0096, B:36:0x00ac, B:40:0x00b4, B:42:0x00bc, B:44:0x00c4, B:49:0x00cd, B:54:0x00e4, B:60:0x00fc, B:66:0x0113, B:73:0x012d, B:76:0x013b, B:78:0x013f, B:80:0x0147, B:82:0x014f, B:87:0x0158, B:92:0x016e, B:98:0x0186, B:104:0x019e), top: B:136:0x0096 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0023  */
    /* JADX WARN: Type inference failed for: r2v10 */
    /* JADX WARN: Type inference failed for: r2v11 */
    /* JADX WARN: Type inference failed for: r2v12, types: [xz.e] */
    /* JADX WARN: Type inference failed for: r2v13 */
    /* JADX WARN: Type inference failed for: r2v14, types: [xz.e] */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v16, types: [xz.e] */
    /* JADX WARN: Type inference failed for: r2v17 */
    /* JADX WARN: Type inference failed for: r2v18, types: [xz.e] */
    /* JADX WARN: Type inference failed for: r2v19 */
    /* JADX WARN: Type inference failed for: r2v20, types: [xz.e] */
    /* JADX WARN: Type inference failed for: r2v23 */
    /* JADX WARN: Type inference failed for: r2v24 */
    /* JADX WARN: Type inference failed for: r2v25, types: [xz.e] */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v6 */
    /* JADX WARN: Type inference failed for: r2v7 */
    /* JADX WARN: Type inference failed for: r2v8 */
    /* JADX WARN: Type inference failed for: r2v9 */
    /* JADX WARN: Type inference failed for: r3v3, types: [xz.e] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object j(a00.b bVar, Context context, ContinuationImpl continuationImpl) {
        xz.a aVar;
        n nVar;
        Result result;
        ?? r22;
        Object obj;
        Object obj2;
        Object obj3;
        Object obj4;
        Object obj5;
        Object obj6;
        List list;
        List listF;
        Context context2;
        Context context3 = context;
        j20.h hVar = (j20.h) this.f95151c;
        q20.p pVar = (q20.p) this.f95150b;
        if (continuationImpl instanceof xz.a) {
            aVar = (xz.a) continuationImpl;
            int i5 = aVar.f96482x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f96482x = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new xz.a(this, continuationImpl);
            }
        }
        Object obj7 = aVar.f96480v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        try {
            switch (aVar.f96482x) {
                case 0:
                    ResultKt.b(obj7);
                    ?? eVar = new xz.e(EmptyList.f71733a);
                    try {
                        y2.f51877a.getClass();
                        if (y2.y1().l() == o4.f51728b) {
                            if (y2.r().l() != e10.a0.f51429b) {
                                if (Intrinsics.b(bVar != null ? bVar.f67h : null, "deezer.android.app") && ul.b.N(context3, g20.a.f56916b)) {
                                    if (hVar.f61215d != null) {
                                        int iOrdinal = ((e10.a0) y2.r().l()).ordinal();
                                        if (iOrdinal == 1) {
                                            aVar.f96478t = this;
                                            aVar.f96479u = eVar;
                                            aVar.f96482x = 4;
                                            Object objN = hVar.n(aVar);
                                            if (objN != coroutineSingletons) {
                                                r22 = eVar;
                                                obj = objN;
                                                nVar = this;
                                                result = new Result(obj);
                                                context2 = r22;
                                                context3 = context2;
                                            }
                                        } else if (iOrdinal == 2) {
                                            aVar.f96478t = this;
                                            aVar.f96479u = eVar;
                                            aVar.f96482x = 5;
                                            Object objM = hVar.m(aVar);
                                            if (objM != coroutineSingletons) {
                                                r22 = eVar;
                                                obj2 = objM;
                                                nVar = this;
                                                result = new Result(obj2);
                                                context2 = r22;
                                                context3 = context2;
                                            }
                                        } else if (iOrdinal != 3) {
                                            nVar = this;
                                            result = null;
                                            context2 = eVar;
                                            context3 = context2;
                                        } else {
                                            aVar.f96478t = this;
                                            aVar.f96479u = eVar;
                                            aVar.f96482x = 6;
                                            Object objL = hVar.l(aVar);
                                            if (objL != coroutineSingletons) {
                                                r22 = eVar;
                                                obj3 = objL;
                                                nVar = this;
                                                result = new Result(obj3);
                                                context2 = r22;
                                                context3 = context2;
                                            }
                                        }
                                        return coroutineSingletons;
                                    }
                                }
                            }
                            nVar = this;
                            context3 = eVar;
                            result = null;
                        } else if (Intrinsics.b(bVar != null ? bVar.f67h : null, "com.spotify.music") && ul.b.N(context3, g20.a.f56915a)) {
                            if (pVar.f61215d != null) {
                                int iOrdinal2 = ((o4) y2.y1().l()).ordinal();
                                if (iOrdinal2 == 1) {
                                    aVar.f96478t = this;
                                    aVar.f96479u = eVar;
                                    aVar.f96482x = 1;
                                    Object objQ = pVar.q(aVar);
                                    if (objQ != coroutineSingletons) {
                                        r22 = eVar;
                                        obj4 = objQ;
                                        nVar = this;
                                        result = new Result(obj4);
                                        context2 = r22;
                                    }
                                } else if (iOrdinal2 != 2) {
                                    if (iOrdinal2 == 3) {
                                        aVar.f96478t = this;
                                        aVar.f96479u = eVar;
                                        aVar.f96482x = 2;
                                        Object objP = pVar.p(aVar);
                                        if (objP != coroutineSingletons) {
                                            r22 = eVar;
                                            obj6 = objP;
                                            nVar = this;
                                            result = new Result(obj6);
                                            context2 = r22;
                                        }
                                    }
                                    nVar = this;
                                    result = null;
                                    context2 = eVar;
                                } else {
                                    aVar.f96478t = this;
                                    aVar.f96479u = eVar;
                                    aVar.f96482x = 3;
                                    Object objO = pVar.o(aVar);
                                    if (objO != coroutineSingletons) {
                                        r22 = eVar;
                                        obj5 = objO;
                                        nVar = this;
                                        result = new Result(obj5);
                                        context2 = r22;
                                    }
                                }
                                return coroutineSingletons;
                            }
                            context3 = context2;
                        }
                        if (result != null) {
                            Object obj8 = result.f71688a;
                            if (obj8 instanceof Result.Failure) {
                                obj8 = null;
                            }
                            list = (List) obj8;
                        } else {
                            list = null;
                        }
                        if (list != null) {
                            nVar.getClass();
                            listF = f(list);
                        } else {
                            listF = null;
                        }
                        if (listF == null) {
                            return context3;
                        }
                        List<ExternalLink> list2 = listF;
                        ArrayList arrayList = new ArrayList(b70.c.u0(list2, 10));
                        for (ExternalLink externalLink : list2) {
                            String str = externalLink.f78378b;
                            String str2 = externalLink.f78380d;
                            if (str2 == null || str2.length() == 0) {
                                str2 = null;
                            }
                            if (str2 == null) {
                                str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                            }
                            arrayList.add(new x1(str, Uri.parse(str2), b0.f82691d, Intent.parseUri(externalLink.f78381e, 0), null));
                        }
                        return new xz.e(arrayList);
                    } catch (Exception e3) {
                        e = e3;
                        context3 = eVar;
                        mc0.b bVar2 = mc0.d.f76206a;
                        bVar2.r("LocalMediaController");
                        bVar2.p(e, "Exception while getting recommendation results", new Object[0]);
                        return context3;
                    }
                case 1:
                    r22 = aVar.f96479u;
                    nVar = aVar.f96478t;
                    ResultKt.b(obj7);
                    obj4 = ((Result) obj7).f71688a;
                    result = new Result(obj4);
                    context2 = r22;
                    context3 = context2;
                    if (result != null) {
                    }
                    if (list != null) {
                    }
                    if (listF == null) {
                    }
                    break;
                case 2:
                    r22 = aVar.f96479u;
                    nVar = aVar.f96478t;
                    ResultKt.b(obj7);
                    obj6 = ((Result) obj7).f71688a;
                    result = new Result(obj6);
                    context2 = r22;
                    context3 = context2;
                    if (result != null) {
                    }
                    if (list != null) {
                    }
                    if (listF == null) {
                    }
                    break;
                case 3:
                    r22 = aVar.f96479u;
                    nVar = aVar.f96478t;
                    ResultKt.b(obj7);
                    obj5 = ((Result) obj7).f71688a;
                    result = new Result(obj5);
                    context2 = r22;
                    context3 = context2;
                    if (result != null) {
                    }
                    if (list != null) {
                    }
                    if (listF == null) {
                    }
                    break;
                case 4:
                    r22 = aVar.f96479u;
                    nVar = aVar.f96478t;
                    ResultKt.b(obj7);
                    obj = ((Result) obj7).f71688a;
                    result = new Result(obj);
                    context2 = r22;
                    context3 = context2;
                    if (result != null) {
                    }
                    if (list != null) {
                    }
                    if (listF == null) {
                    }
                    break;
                case 5:
                    r22 = aVar.f96479u;
                    nVar = aVar.f96478t;
                    ResultKt.b(obj7);
                    obj2 = ((Result) obj7).f71688a;
                    result = new Result(obj2);
                    context2 = r22;
                    context3 = context2;
                    if (result != null) {
                    }
                    if (list != null) {
                    }
                    if (listF == null) {
                    }
                    break;
                case 6:
                    r22 = aVar.f96479u;
                    nVar = aVar.f96478t;
                    ResultKt.b(obj7);
                    obj3 = ((Result) obj7).f71688a;
                    result = new Result(obj3);
                    context2 = r22;
                    context3 = context2;
                    if (result != null) {
                    }
                    if (list != null) {
                    }
                    if (listF == null) {
                    }
                    break;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        } catch (Exception e11) {
            e = e11;
        }
    }

    @Override // c0.j2
    public c0.s k(long j11, c0.s sVar, c0.s sVar2, c0.s sVar3) {
        if (((c0.s) this.f95150b) == null) {
            this.f95150b = sVar.c();
        }
        c0.s sVar4 = (c0.s) this.f95150b;
        if (sVar4 == null) {
            Intrinsics.m("valueVector");
            throw null;
        }
        int iB = sVar4.b();
        for (int i5 = 0; i5 < iB; i5++) {
            c0.s sVar5 = (c0.s) this.f95150b;
            if (sVar5 == null) {
                Intrinsics.m("valueVector");
                throw null;
            }
            sVar5.e(((c0.t) this.f95149a).get(i5).c(j11, sVar.a(i5), sVar2.a(i5), sVar3.a(i5)), i5);
        }
        c0.s sVar6 = (c0.s) this.f95150b;
        if (sVar6 != null) {
            return sVar6;
        }
        Intrinsics.m("valueVector");
        throw null;
    }

    public f1 m(KClass modelClass, String key) {
        f1 viewModel;
        f1 f1VarCreate;
        Intrinsics.g(modelClass, "modelClass");
        Intrinsics.g(key, "key");
        synchronized (((i8) this.f95152d)) {
            try {
                n1 n1Var = (n1) this.f95149a;
                n1Var.getClass();
                viewModel = (f1) n1Var.f59410a.get(key);
                if (modelClass.isInstance(viewModel)) {
                    Object obj = (j1) this.f95150b;
                    if (obj instanceof l1) {
                        Intrinsics.d(viewModel);
                        ((l1) obj).onRequery(viewModel);
                    }
                    Intrinsics.e(viewModel, "null cannot be cast to non-null type T of androidx.lifecycle.viewmodel.ViewModelProviderImpl.getViewModel");
                } else {
                    k6.d dVar = new k6.d((k6.c) this.f95151c);
                    dVar.f71150a.put(m1.f59408b, key);
                    j1 factory = (j1) this.f95150b;
                    Intrinsics.g(factory, "factory");
                    try {
                        try {
                            f1VarCreate = factory.create(modelClass, dVar);
                        } catch (AbstractMethodError unused) {
                            f1VarCreate = factory.create(JvmClassMappingKt.b(modelClass), dVar);
                        }
                    } catch (AbstractMethodError unused2) {
                        f1VarCreate = factory.create(JvmClassMappingKt.b(modelClass));
                    }
                    viewModel = f1VarCreate;
                    n1 n1Var2 = (n1) this.f95149a;
                    n1Var2.getClass();
                    Intrinsics.g(viewModel, "viewModel");
                    f1 f1Var = (f1) n1Var2.f59410a.put(key, viewModel);
                    if (f1Var != null) {
                        f1Var.clear$lifecycle_viewmodel_release();
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return viewModel;
    }

    public void o(int i5) throws GeneralSecurityException {
        if (i5 != 12 && i5 != 16) {
            throw new GeneralSecurityException(String.format("Invalid IV size in bytes %d; acceptable values have 12 or 16 bytes", Integer.valueOf(i5)));
        }
        this.f95150b = Integer.valueOf(i5);
    }

    @Override // c0.j2
    public c0.s p(long j11, c0.s sVar, c0.s sVar2, c0.s sVar3) {
        if (((c0.s) this.f95151c) == null) {
            this.f95151c = sVar3.c();
        }
        c0.s sVar4 = (c0.s) this.f95151c;
        if (sVar4 == null) {
            Intrinsics.m("velocityVector");
            throw null;
        }
        int iB = sVar4.b();
        for (int i5 = 0; i5 < iB; i5++) {
            c0.s sVar5 = (c0.s) this.f95151c;
            if (sVar5 == null) {
                Intrinsics.m("velocityVector");
                throw null;
            }
            sVar5.e(((c0.t) this.f95149a).get(i5).d(j11, sVar.a(i5), sVar2.a(i5), sVar3.a(i5)), i5);
        }
        c0.s sVar6 = (c0.s) this.f95151c;
        if (sVar6 != null) {
            return sVar6;
        }
        Intrinsics.m("velocityVector");
        throw null;
    }

    public void q(int i5) throws InvalidAlgorithmParameterException {
        if (i5 != 16 && i5 != 24 && i5 != 32) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size %d; only 16-byte, 24-byte and 32-byte AES keys are supported", Integer.valueOf(i5)));
        }
        this.f95149a = Integer.valueOf(i5);
    }

    public void r() {
        this.f95151c = 16;
    }

    public void s(v2.m mVar) {
        if (((y) this.f95150b) == y.f92023b) {
            t1 t1Var = (t1) this.f95149a;
            if (t1Var == null) {
                throw new IllegalStateException("layoutCoordinates not set");
            }
            g0.l(mVar, t1Var.M(0L), new z((a0) this.f95152d, 1));
        }
        this.f95150b = y.f92024c;
    }

    @Override // c0.j2
    public c0.s t(c0.s sVar, c0.s sVar2, c0.s sVar3) {
        if (((c0.s) this.f95152d) == null) {
            this.f95152d = sVar3.c();
        }
        c0.s sVar4 = (c0.s) this.f95152d;
        if (sVar4 == null) {
            Intrinsics.m("endVelocityVector");
            throw null;
        }
        int iB = sVar4.b();
        for (int i5 = 0; i5 < iB; i5++) {
            c0.s sVar5 = (c0.s) this.f95152d;
            if (sVar5 == null) {
                Intrinsics.m("endVelocityVector");
                throw null;
            }
            sVar5.e(((c0.t) this.f95149a).get(i5).b(sVar.a(i5), sVar2.a(i5), sVar3.a(i5)), i5);
        }
        c0.s sVar6 = (c0.s) this.f95152d;
        if (sVar6 != null) {
            return sVar6;
        }
        Intrinsics.m("endVelocityVector");
        throw null;
    }

    @Override // com.google.android.gms.internal.consent_sdk.j0
    public Executor zza() {
        return (Executor) this.f95152d;
    }

    public n(n1 store, j1 factory, k6.c defaultExtras) {
        Intrinsics.g(store, "store");
        Intrinsics.g(factory, "factory");
        Intrinsics.g(defaultExtras, "defaultExtras");
        this.f95149a = store;
        this.f95150b = factory;
        this.f95151c = defaultExtras;
        this.f95152d = new i8(27);
    }

    public n(Context context, int i5) {
        switch (i5) {
            case 10:
                this.f95149a = new zz.g(context, new o7.a(17), this);
                this.f95150b = (q20.p) ul.b.E(context, g20.a.f56915a);
                this.f95151c = (j20.h) ul.b.E(context, g20.a.f56916b);
                this.f95152d = new h6.m0();
                break;
            default:
                this.f95149a = context.getApplicationContext();
                this.f95150b = c9.e.f19860a;
                this.f95151c = null;
                this.f95152d = new lm.e(16);
                break;
        }
    }

    public n(c0.t tVar) {
        this.f95149a = tVar;
    }

    public n(d0 d0Var) {
        this(new vm.c(d0Var, 5));
    }
}
