package b;

import ads_mobile_sdk.rb1;
import android.content.SharedPreferences;
import android.text.TextUtils;
import com.android.billingclient.api.BillingResult;
import com.bytedance.sdk.component.adexpress.dynamic.dj.fby;
import com.bytedance.sdk.openadsdk.core.rmy;
import com.bytedance.sdk.openadsdk.pmi.zb.ycx;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.ServiceConfigurationError;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReferenceArray;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.KotlinNothingValueException;
import kotlin.ResultKt;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public abstract /* synthetic */ class c9 {
    public static final int _getNumber$1(int i5) {
        if (i5 != 4) {
            return b(i5);
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    public static /* synthetic */ int a(Object obj) {
        if (obj instanceof String) {
            return 2;
        }
        if (obj instanceof Boolean) {
            return 1;
        }
        if (obj instanceof Long) {
            return 3;
        }
        if (obj instanceof Double) {
            return 4;
        }
        throw new AssertionError("invalid tag type: ".concat(String.valueOf(obj.getClass())));
    }

    public static /* synthetic */ int b(int i5) {
        if (i5 == 1) {
            return 0;
        }
        if (i5 == 2) {
            return 1;
        }
        if (i5 == 3) {
            return 2;
        }
        if (i5 == 4) {
            return -1;
        }
        throw null;
    }

    public static int c(double d5, int i5, int i11) {
        return (Double.hashCode(d5) + i5) * i11;
    }

    public static int d(int i5, int i11, int i12) {
        int i13 = i5 / i11;
        return i13 + i13 + i12;
    }

    public static int e(int i5, int i11, int i12, int i13) {
        return com.google.android.gms.internal.consent_sdk.o5.W(i5) + i11 + i12 + i13;
    }

    public static int f(int i5, int i11, boolean z11) {
        return (Boolean.hashCode(z11) + i5) * i11;
    }

    public static BillingResult g(int i5, String str) {
        BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
        builderNewBuilder.setResponseCode(i5);
        builderNewBuilder.setDebugMessage(str);
        return builderNewBuilder.build();
    }

    public static ycx h(String str) {
        ycx ycxVar = new ycx();
        ycxVar.zb(str);
        return ycxVar;
    }

    public static com.google.android.gms.internal.measurement.y1 i(com.google.android.gms.internal.measurement.y1 y1Var) {
        int size = y1Var.size();
        return y1Var.zzg(size + size);
    }

    public static String j(Number number, String str) {
        return number.getClass().getName().concat(str);
    }

    public static String k(StringBuilder sb2, float f11, char c11) {
        sb2.append(f11);
        sb2.append(c11);
        return sb2.toString();
    }

    public static String l(StringBuilder sb2, Map map, char c11) {
        sb2.append(map);
        sb2.append(c11);
        return sb2.toString();
    }

    public static ArrayList m(int i5, HashMap map, ArrayList arrayList, int i11, String str) {
        map.put(Integer.valueOf(i5), arrayList);
        ArrayList arrayList2 = new ArrayList(i11);
        arrayList2.add(str);
        return arrayList2;
    }

    public static /* synthetic */ Iterator n() {
        try {
            return Arrays.asList(new ed[0]).iterator();
        } catch (Throwable th2) {
            throw new ServiceConfigurationError(th2.getMessage(), th2);
        }
    }

    public static KotlinNothingValueException o(Object obj) {
        ResultKt.b(obj);
        return new KotlinNothingValueException();
    }

    public static void p(int i5, rmy.AnonymousClass1 anonymousClass1, String str, int i11, String str2) {
        anonymousClass1.put(Integer.valueOf(i5), str);
        anonymousClass1.put(Integer.valueOf(i11), str2);
    }

    public static void q(SharedPreferences sharedPreferences, String str, boolean z11) {
        sharedPreferences.edit().putBoolean(str, z11).apply();
    }

    public static /* synthetic */ void r(e9 e9Var) {
        if (e9Var != null) {
            throw new ClassCastException();
        }
    }

    public static void s(String str, String str2, String str3, StringBuilder sb2, boolean z11) {
        sb2.append(z11);
        sb2.append(str);
        sb2.append(str2);
        sb2.append(str3);
    }

    public static /* synthetic */ void t(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, cl.y yVar, Set set) {
        while (!atomicReferenceFieldUpdater.compareAndSet(yVar, null, set) && atomicReferenceFieldUpdater.get(yVar) == null) {
        }
    }

    public static boolean u(fby fbyVar, String str) {
        return TextUtils.equals(fbyVar.jc().zb(), str);
    }

    public static /* synthetic */ boolean v(AtomicReferenceArray atomicReferenceArray, int i5, Object obj) {
        while (!atomicReferenceArray.compareAndSet(i5, null, obj)) {
            if (atomicReferenceArray.get(i5) != null) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ boolean w(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, b80.f fVar, Object obj) {
        while (!atomicReferenceFieldUpdater.compareAndSet(fVar, obj, b80.i.f17633c)) {
            if (atomicReferenceFieldUpdater.get(fVar) != obj) {
                return false;
            }
        }
        return true;
    }

    public static int x(int i5, int i11, int i12) {
        return com.google.android.gms.internal.consent_sdk.o5.W(i5) + i11 + i12;
    }

    public static /* synthetic */ String y(int i5) {
        return i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? AbstractJsonLexerKt.NULL : "UNSPECIFIED" : "FROM_DEFAULT_COUNTRY" : "FROM_NUMBER_WITHOUT_PLUS_SIGN" : "FROM_NUMBER_WITH_IDD" : "FROM_NUMBER_WITH_PLUS_SIGN";
    }

    public static /* synthetic */ String z(int i5) {
        return i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? AbstractJsonLexerKt.NULL : "RUNNING" : "QUEUED" : "QUEUING" : "IDLE";
    }
}
