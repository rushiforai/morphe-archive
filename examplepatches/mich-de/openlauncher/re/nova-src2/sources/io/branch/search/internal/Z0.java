package io.branch.search.internal;

import io.branch.search.internal.AbstractC3196i6;
import java.io.IOException;
import java.util.ArrayList;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgressionIterator;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;

/* loaded from: classes4.dex */
public final class Z0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3224k1 f63782a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final t70.c0 f63783b;

    public Z0(@NotNull C3224k1 autoSuggestService, @NotNull t70.j1 networkPoolDispatcher) {
        Intrinsics.g(autoSuggestService, "autoSuggestService");
        Intrinsics.g(networkPoolDispatcher, "networkPoolDispatcher");
        this.f63782a = autoSuggestService;
        this.f63783b = networkPoolDispatcher;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0071 A[Catch: s9 -> 0x007a, TryCatch #0 {s9 -> 0x007a, blocks: (B:12:0x0028, B:20:0x0044, B:22:0x004a, B:24:0x0056, B:26:0x005c, B:32:0x0071, B:27:0x0064, B:29:0x0068, B:34:0x0074, B:35:0x0079, B:17:0x0037), top: B:38:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:39:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(Z0 z02, String str, C3123e1 c3123e1, String str2, Continuation continuation) throws JSONException, IOException {
        X0 x02;
        ArrayList arrayListA;
        JSONArray jSONArray;
        z02.getClass();
        if (continuation instanceof X0) {
            x02 = (X0) continuation;
            int i5 = x02.f63609d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x02.f63609d = i5 - Integer.MIN_VALUE;
            } else {
                x02 = new X0(z02, continuation);
            }
        }
        Object objA = x02.f63607b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x02.f63609d;
        try {
            if (i11 == 0) {
                ResultKt.b(objA);
                C3224k1 c3224k1 = z02.f63782a;
                x02.f63606a = z02;
                x02.f63609d = 1;
                objA = c3224k1.a(str, c3123e1, str2, x02);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                z02 = x02.f63606a;
                ResultKt.b(objA);
            }
            AbstractC3196i6 abstractC3196i6 = (AbstractC3196i6) objA;
            if (abstractC3196i6 instanceof AbstractC3196i6.b) {
                JSONArray jSONArray2 = (JSONArray) ((AbstractC3196i6.b) abstractC3196i6).f64739a;
                if (jSONArray2.length() > 0 && (jSONArray = jSONArray2.getJSONArray(1)) != null) {
                    z02.getClass();
                    arrayListA = a(jSONArray);
                }
                return arrayListA != null ? EmptyList.f71733a : arrayListA;
            }
            if (!(abstractC3196i6 instanceof AbstractC3196i6.a)) {
                throw new NoWhenBranchMatchedException();
            }
            arrayListA = null;
            if (arrayListA != null) {
            }
        } catch (C3367s9 unused) {
            return EmptyList.f71733a;
        }
    }

    @NotNull
    public static ArrayList a(@NotNull JSONArray jSONArray) throws JSONException {
        Intrinsics.g(jSONArray, "<this>");
        ArrayList arrayList = new ArrayList();
        IntProgressionIterator it = kotlin.ranges.a.m0(0, jSONArray.length()).iterator();
        while (it.f71911c) {
            String string = jSONArray.getString(it.nextInt());
            Intrinsics.f(string, "getString(index)");
            arrayList.add(string);
        }
        return arrayList;
    }
}
