package ow;

import b70.g;
import b70.k;
import java.util.ArrayList;
import java.util.Currency;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import kotlin.Pair;
import kotlin.collections.c;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final Map f81030a = k.e0(new Pair(c.f1(new String[]{"UGX", "AFN", "ALL", "AMD", "COP", "IDR", "ISK", "PKR", "LBP", "MMK", "LAK", "RSD"}), 2));

    public static int a(Currency currency) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : f81030a.entrySet()) {
            Set set = (Set) entry.getKey();
            String currencyCode = currency.getCurrencyCode();
            Intrinsics.f(currencyCode, "getCurrencyCode(...)");
            String upperCase = currencyCode.toUpperCase(Locale.ROOT);
            Intrinsics.f(upperCase, "toUpperCase(...)");
            if (set.contains(upperCase)) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        ArrayList arrayList = new ArrayList(linkedHashMap.size());
        Iterator it = linkedHashMap.entrySet().iterator();
        while (it.hasNext()) {
            arrayList.add(Integer.valueOf(((Number) ((Map.Entry) it.next()).getValue()).intValue()));
        }
        Integer num = (Integer) g.Y0(arrayList);
        return num != null ? num.intValue() : currency.getDefaultFractionDigits();
    }
}
