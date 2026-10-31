package io.branch.engage.sesame_lite.internal;

import b70.g;
import com.amplitude.android.migration.DatabaseConstants;
import java.io.IOException;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.UByte;
import kotlin.UInt;
import kotlin.ULong;
import kotlin.UShort;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import t70.l;
import t70.m;
import x80.i;
import x80.j;
import x80.m0;

@Metadata(d1 = {"\u0000\u0094\u0001\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u001c\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u0004\n\u0002\u0010\u0010\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\u001a)\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0001\u001a\u00020\u00002\u0012\b\u0002\u0010\u0004\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0003\u0018\u00010\u0002¢\u0006\u0004\b\u0006\u0010\u0007\u001a0\u0010\r\u001a\u00020\u0005\"\u0004\b\u0000\u0010\b*\b\u0012\u0004\u0012\u00028\u00000\t2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\nH\u0086\b¢\u0006\u0004\b\r\u0010\u000e\u001a\u001b\u0010\u0011\u001a\u0004\u0018\u00010\u0003*\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0003¢\u0006\u0004\b\u0011\u0010\u0012\u001a%\u0010\u0016\u001a\u00020\u0000*\u00020\u00132\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u00000\u0014¢\u0006\u0004\b\u0016\u0010\u0017\u001a1\u0010\u001a\u001a\b\u0012\u0004\u0012\u00028\u00000\u0019\"\u0004\b\u0000\u0010\b*\u00020\u00132\u0012\u0010\u0018\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00028\u00000\u0014¢\u0006\u0004\b\u001a\u0010\u001b\u001a%\u0010\u001e\u001a\u00020\u0005*\u00020\u00132\u0012\u0010\u001d\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u001c0\u0014¢\u0006\u0004\b\u001e\u0010\u001f\u001a\u0017\u0010\"\u001a\u00020!*\u00020 H\u0086@ø\u0001\u0000¢\u0006\u0004\b\"\u0010#\u001aG\u0010(\u001a\b\u0012\u0004\u0012\u00028\u00000\u0019\"\u0004\b\u0000\u0010\b*\b\u0012\u0004\u0012\u00028\u00000$2\u0006\u0010%\u001a\u00020\n2\u0014\b\u0004\u0010'\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020&0\u0014H\u0086\bø\u0001\u0001¢\u0006\u0004\b(\u0010)\u001aG\u0010*\u001a\b\u0012\u0004\u0012\u00028\u00000\u0019\"\u0004\b\u0000\u0010\b*\b\u0012\u0004\u0012\u00028\u00000$2\u0006\u0010%\u001a\u00020\n2\u0014\b\u0004\u0010'\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020&0\u0014H\u0086\bø\u0001\u0001¢\u0006\u0004\b*\u0010)\u001a`\u00101\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u000100\"\u0010\b\u0000\u0010,\u0018\u0001*\b\u0012\u0004\u0012\u00028\u00000+\"\u0004\b\u0001\u0010-2*\u0010/\u001a\u0016\u0012\u0012\b\u0001\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010.0\t\"\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010.H\u0086\b¢\u0006\u0004\b1\u00102\u001aM\u00106\u001a\u00020\u0000\"\u0004\b\u0000\u0010,\"\u0004\b\u0001\u0010-2\u0018\u00104\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00010\t032\u0018\u00105\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00010\t03¢\u0006\u0004\b6\u00107\"\u0018\u0010<\u001a\u000209*\u0002088Fø\u0001\u0000¢\u0006\u0006\u001a\u0004\b:\u0010;\"\u0018\u0010>\u001a\u000209*\u0002088Fø\u0001\u0000¢\u0006\u0006\u001a\u0004\b=\u0010;\"\u0018\u0010B\u001a\u00020\n*\u00020?8Fø\u0001\u0000¢\u0006\u0006\u001a\u0004\b@\u0010A\"\u0018\u0010D\u001a\u00020\n*\u00020?8Fø\u0001\u0000¢\u0006\u0006\u001a\u0004\bC\u0010A\u0082\u0002\u000b\n\u0002\b\u0019\n\u0005\b\u009920\u0001¨\u0006E"}, d2 = {com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "condition", "Lkotlin/Function0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "msg", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "assertTrue", "(ZLkotlin/jvm/functions/Function0;)V", "T", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "indexA", "indexB", "swap", "([Ljava/lang/Object;II)V", "Lorg/json/JSONObject;", DatabaseConstants.KEY_FIELD, "optStringNull", "(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;", "Lorg/json/JSONArray;", "Lkotlin/Function1;", "predicate", "any", "(Lorg/json/JSONArray;Lkotlin/jvm/functions/Function1;)Z", "mapping", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "map", "(Lorg/json/JSONArray;Lkotlin/jvm/functions/Function1;)Ljava/util/List;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "block", "forEach", "(Lorg/json/JSONArray;Lkotlin/jvm/functions/Function1;)V", "Lx80/i;", "Lx80/m0;", "await", "(Lx80/i;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "limit", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "selector", "takeMinN", "(Ljava/lang/Iterable;ILkotlin/jvm/functions/Function1;)Ljava/util/List;", "takeMaxN", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "K", "V", "Lkotlin/Pair;", "pairs", "Ljava/util/EnumMap;", "enumMapOf", "([Lkotlin/Pair;)Ljava/util/EnumMap;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "map1", "map2", "mapEquals", "(Ljava/util/Map;Ljava/util/Map;)Z", "Lkotlin/UShort;", "Lkotlin/UByte;", "getHiByte-xj2QHRw", "(S)B", "hiByte", "getLoByte-xj2QHRw", "loByte", "Lkotlin/ULong;", "getHiInt-VKZWuLQ", "(J)I", "hiInt", "getLoInt-VKZWuLQ", "loInt", "sesame-lite_release"}, k = 2, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class UtilsKt {
    public static final boolean any(@NotNull JSONArray jSONArray, @NotNull Function1<? super JSONObject, Boolean> predicate) throws JSONException {
        Intrinsics.g(jSONArray, "<this>");
        Intrinsics.g(predicate, "predicate");
        int length = jSONArray.length();
        for (int i5 = 0; i5 < length; i5++) {
            JSONObject item = jSONArray.getJSONObject(i5);
            Intrinsics.f(item, "item");
            if (((Boolean) predicate.invoke(item)).booleanValue()) {
                return true;
            }
        }
        return false;
    }

    public static final void assertTrue(boolean z11, @Nullable Function0<String> function0) {
    }

    public static /* synthetic */ void assertTrue$default(boolean z11, Function0 function0, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            function0 = null;
        }
        assertTrue(z11, function0);
    }

    @Nullable
    public static final Object await(@NotNull final i iVar, @NotNull Continuation<? super m0> continuation) {
        final m mVar = new m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        iVar.b(new j() { // from class: io.branch.engage.sesame_lite.internal.UtilsKt$await$2$1
            @Override // x80.j
            public void onFailure(@NotNull i call, @NotNull IOException e3) {
                Intrinsics.g(call, "call");
                Intrinsics.g(e3, "e");
                if (mVar.isCancelled()) {
                    return;
                }
                l lVar = mVar;
                int i5 = Result.f71687b;
                lVar.resumeWith(ResultKt.a(e3));
            }

            @Override // x80.j
            public void onResponse(@NotNull i call, @NotNull m0 response) {
                Intrinsics.g(call, "call");
                Intrinsics.g(response, "response");
                l lVar = mVar;
                int i5 = Result.f71687b;
                lVar.resumeWith(response);
            }
        });
        mVar.v(new Function1<Throwable, Unit>() { // from class: io.branch.engage.sesame_lite.internal.UtilsKt$await$2$2
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                invoke((Throwable) obj);
                return Unit.f71706a;
            }

            public final void invoke(@Nullable Throwable th2) {
                try {
                    iVar.cancel();
                } catch (Throwable unused) {
                }
            }
        });
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    public static final /* synthetic */ <K extends Enum<K>, V> EnumMap<K, V> enumMapOf(Pair<? extends K, ? extends V>... pairs) {
        Intrinsics.g(pairs, "pairs");
        Intrinsics.k();
        throw null;
    }

    public static final void forEach(@NotNull JSONArray jSONArray, @NotNull Function1<? super JSONObject, ? extends Object> block) throws JSONException {
        Intrinsics.g(jSONArray, "<this>");
        Intrinsics.g(block, "block");
        int length = jSONArray.length();
        for (int i5 = 0; i5 < length; i5++) {
            JSONObject jSONObject = jSONArray.getJSONObject(i5);
            Intrinsics.f(jSONObject, "this.getJSONObject(i)");
            block.invoke(jSONObject);
        }
    }

    /* renamed from: getHiByte-xj2QHRw, reason: not valid java name */
    public static final byte m334getHiBytexj2QHRw(short s11) {
        UInt.Companion companion = UInt.f71696b;
        byte b11 = (byte) ((s11 & 65280) >>> 8);
        UByte.Companion companion2 = UByte.f71693b;
        return b11;
    }

    /* renamed from: getHiInt-VKZWuLQ, reason: not valid java name */
    public static final int m335getHiIntVKZWuLQ(long j11) {
        ULong.Companion companion = ULong.f71699b;
        return (int) ((j11 & (-4294967296L)) >>> 32);
    }

    /* renamed from: getLoByte-xj2QHRw, reason: not valid java name */
    public static final byte m336getLoBytexj2QHRw(short s11) {
        UShort.Companion companion = UShort.f71703b;
        byte b11 = (byte) (s11 & 255);
        UByte.Companion companion2 = UByte.f71693b;
        return b11;
    }

    /* renamed from: getLoInt-VKZWuLQ, reason: not valid java name */
    public static final int m337getLoIntVKZWuLQ(long j11) {
        ULong.Companion companion = ULong.f71699b;
        return (int) (j11 & 4294967295L);
    }

    @NotNull
    public static final <T> List<T> map(@NotNull JSONArray jSONArray, @NotNull Function1<? super JSONObject, ? extends T> mapping) throws JSONException {
        Intrinsics.g(jSONArray, "<this>");
        Intrinsics.g(mapping, "mapping");
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i5 = 0; i5 < length; i5++) {
            JSONObject item = jSONArray.getJSONObject(i5);
            Intrinsics.f(item, "item");
            arrayList.add(mapping.invoke(item));
        }
        return arrayList;
    }

    public static final <K, V> boolean mapEquals(@NotNull Map<K, V[]> map1, @NotNull Map<K, V[]> map2) {
        Intrinsics.g(map1, "map1");
        Intrinsics.g(map2, "map2");
        if (map1.size() != map2.size()) {
            return false;
        }
        if (map1.isEmpty()) {
            return true;
        }
        for (Map.Entry<K, V[]> entry : map1.entrySet()) {
            K key = entry.getKey();
            V[] value = entry.getValue();
            V[] vArr = map2.get(key);
            if (vArr == null || value.length != vArr.length) {
                return false;
            }
            ArrayList arrayListG1 = kotlin.collections.c.g1(value, vArr);
            if (!arrayListG1.isEmpty()) {
                Iterator it = arrayListG1.iterator();
                while (it.hasNext()) {
                    Pair pair = (Pair) it.next();
                    if (!Intrinsics.b(pair.f71683a, pair.f71684b)) {
                        return false;
                    }
                }
            }
        }
        return true;
    }

    @Nullable
    public static final String optStringNull(@NotNull JSONObject jSONObject, @NotNull String key) {
        Intrinsics.g(jSONObject, "<this>");
        Intrinsics.g(key, "key");
        if (!jSONObject.has(key) || jSONObject.isNull(key)) {
            return null;
        }
        return jSONObject.optString(key);
    }

    public static final <T> void swap(@NotNull T[] tArr, int i5, int i11) {
        Intrinsics.g(tArr, "<this>");
        T t6 = tArr[i5];
        tArr[i5] = tArr[i11];
        tArr[i11] = t6;
    }

    @NotNull
    public static final <T> List<T> takeMaxN(@NotNull Iterable<? extends T> iterable, int i5, @NotNull Function1<? super T, Double> selector) {
        Intrinsics.g(iterable, "<this>");
        Intrinsics.g(selector, "selector");
        Object[] objArr = new Object[i5];
        for (int i11 = 0; i11 < i5; i11++) {
            objArr[i11] = null;
        }
        double[] dArr = new double[i5];
        int i12 = 0;
        for (T t6 : iterable) {
            double dDoubleValue = ((Number) selector.invoke(t6)).doubleValue();
            int i13 = i12;
            while (i13 > 0 && dDoubleValue > dArr[i13 - 1]) {
                i13--;
            }
            if (i13 >= 0 && i13 < i5) {
                if (i13 == i12) {
                    objArr[i13] = t6;
                    dArr[i13] = dDoubleValue;
                    i12++;
                } else {
                    int i14 = i5 - 1;
                    int i15 = i13 + 1;
                    if (i15 <= i14) {
                        while (true) {
                            int i16 = i14 - 1;
                            objArr[i14] = objArr[i16];
                            dArr[i14] = dArr[i16];
                            if (i14 == i15) {
                                break;
                            }
                            i14--;
                        }
                    }
                    objArr[i13] = t6;
                    dArr[i13] = dDoubleValue;
                }
            }
        }
        ArrayList arrayList = new ArrayList();
        for (int i17 = 0; i17 < i5; i17++) {
            Object obj = objArr[i17];
            if (obj != null) {
                arrayList.add(obj);
            }
        }
        return g.I1(arrayList);
    }

    @NotNull
    public static final <T> List<T> takeMinN(@NotNull Iterable<? extends T> iterable, int i5, @NotNull Function1<? super T, Double> selector) {
        Intrinsics.g(iterable, "<this>");
        Intrinsics.g(selector, "selector");
        Object[] objArr = new Object[i5];
        for (int i11 = 0; i11 < i5; i11++) {
            objArr[i11] = null;
        }
        double[] dArr = new double[i5];
        int i12 = 0;
        for (T t6 : iterable) {
            double dDoubleValue = ((Number) selector.invoke(t6)).doubleValue();
            int i13 = i12;
            while (i13 > 0 && dDoubleValue < dArr[i13 - 1]) {
                i13--;
            }
            if (i13 >= 0 && i13 < i5) {
                if (i13 == i12) {
                    objArr[i13] = t6;
                    dArr[i13] = dDoubleValue;
                    i12++;
                } else {
                    int i14 = i5 - 1;
                    int i15 = i13 + 1;
                    if (i15 <= i14) {
                        while (true) {
                            int i16 = i14 - 1;
                            objArr[i14] = objArr[i16];
                            dArr[i14] = dArr[i16];
                            if (i14 == i15) {
                                break;
                            }
                            i14--;
                        }
                    }
                    objArr[i13] = t6;
                    dArr[i13] = dDoubleValue;
                }
            }
        }
        ArrayList arrayList = new ArrayList();
        for (int i17 = 0; i17 < i5; i17++) {
            Object obj = objArr[i17];
            if (obj != null) {
                arrayList.add(obj);
            }
        }
        return g.I1(arrayList);
    }
}
