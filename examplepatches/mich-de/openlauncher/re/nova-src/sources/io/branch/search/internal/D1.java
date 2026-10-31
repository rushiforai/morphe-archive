package io.branch.search.internal;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class D1 {
    @NotNull
    public static final Pair<String, String>[] a(@NotNull Map<String, String> map) {
        Intrinsics.g(map, "<this>");
        Set<Map.Entry<String, String>> setEntrySet = map.entrySet();
        ArrayList arrayList = new ArrayList(b70.c.u0(setEntrySet, 10));
        Iterator<T> it = setEntrySet.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            arrayList.add(new Pair(entry.getKey(), entry.getValue()));
        }
        Object[] array = arrayList.toArray(new Pair[0]);
        Intrinsics.e(array, "null cannot be cast to non-null type kotlin.Array<T of kotlin.collections.ArraysKt__ArraysJVMKt.toTypedArray>");
        return (Pair[]) array;
    }

    @NotNull
    public static final byte[] a(@NotNull Parcelable parcelable) {
        Intrinsics.g(parcelable, "<this>");
        Parcel parcelObtain = Parcel.obtain();
        Intrinsics.f(parcelObtain, "obtain()");
        parcelObtain.writeParcelable(parcelable, 0);
        byte[] data = parcelObtain.marshall();
        parcelObtain.recycle();
        Intrinsics.f(data, "data");
        return data;
    }
}
