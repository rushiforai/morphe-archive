package com.moloco.sdk.internal.ortb;

import com.moloco.sdk.internal.ortb.model.C2935e;
import com.moloco.sdk.internal.ortb.model.C2937g;
import com.moloco.sdk.internal.ortb.model.E;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.Regex;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Regex f36622a = new Regex("\\$\\{AUCTION_PRICE\\}");

    @NotNull
    public static final C2937g a(@NotNull C2937g c2937g) {
        Intrinsics.g(c2937g, "<this>");
        List<E> listB = c2937g.b();
        ArrayList arrayList = new ArrayList(b70.c.u0(listB, 10));
        Iterator<T> it = listB.iterator();
        while (it.hasNext()) {
            List<C2935e> listB2 = ((E) it.next()).b();
            ArrayList arrayList2 = new ArrayList(b70.c.u0(listB2, 10));
            for (C2935e c2935e : listB2) {
                float price = c2935e.getPrice();
                String crid = c2935e.getCrid();
                String strA = a(c2935e.getAdm(), Float.valueOf(price));
                String burl = c2935e.getBurl();
                arrayList2.add(new C2935e(strA, price, burl != null ? a(burl, Float.valueOf(price)) : null, c2935e.getExt(), crid, c2935e.getBundle(), c2935e.getW(), c2935e.getH()));
            }
            arrayList.add(new E(arrayList2));
        }
        return new C2937g(arrayList);
    }

    @NotNull
    public static final String a(@NotNull String str, @Nullable Float f11) {
        String string;
        Intrinsics.g(str, "<this>");
        Regex regex = f36622a;
        if (f11 == null || (string = f11.toString()) == null) {
            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return regex.h(string, str);
    }
}
