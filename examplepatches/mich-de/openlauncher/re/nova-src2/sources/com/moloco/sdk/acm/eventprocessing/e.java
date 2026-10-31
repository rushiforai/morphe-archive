package com.moloco.sdk.acm.eventprocessing;

import android.util.Log;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes3.dex */
public final class e {
    @Nullable
    public static final o7.g a(@NotNull Map<String, ? extends Object> map) {
        Intrinsics.g(map, "<this>");
        try {
            ArrayList arrayList = new ArrayList(map.size());
            for (Map.Entry<String, ? extends Object> entry : map.entrySet()) {
                arrayList.add(new Pair(entry.getKey(), entry.getValue()));
            }
            Pair[] pairArr = (Pair[]) arrayList.toArray(new Pair[0]);
            Pair[] pairArr2 = (Pair[]) Arrays.copyOf(pairArr, pairArr.length);
            vm.c cVar = new vm.c(19);
            for (Pair pair : pairArr2) {
                cVar.s(pair.f71684b, (String) pair.f71683a);
            }
            return cVar.d();
        } catch (Exception e3) {
            Log.e("DBPeriodicRequest", e3.getMessage() + ". Data: " + map);
            return null;
        }
    }
}
