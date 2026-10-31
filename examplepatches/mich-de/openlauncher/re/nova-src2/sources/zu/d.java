package zu;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.sequences.GeneratorSequence$iterator$1;
import kotlin.text.Regex;
import kotlin.text.RegexOption;
import p6.a1;

/* loaded from: classes4.dex */
public final class d {
    public static int a(int i5, String str) {
        if (str == null) {
            return i5;
        }
        RegexOption[] regexOptionArr = RegexOption.f72028c;
        Map mapJ0 = MapsKt.j0(new Pair(new Regex("Bank of America", 0), "boa"), new Pair(new Regex("Capital One", 0), "capitalone"), new Pair(new Regex("Citibank", 0), "citibank"), new Pair(new Regex("BBVA|COMPASS", 0), "compass"), new Pair(new Regex("MORGAN CHASE|JP MORGAN|Chase", 0), "morganchase"), new Pair(new Regex("NAVY FEDERAL CREDIT UNION", 0), "nfcu"), new Pair(new Regex("PNC\\s?BANK|PNC Bank", 0), "pnc"), new Pair(new Regex("SUNTRUST|SunTrust Bank", 0), "suntrust"), new Pair(new Regex("Silicon Valley Bank", 0), "svb"), new Pair(new Regex("Stripe|TestInstitution|Test Institution", 0), "stripe"), new Pair(new Regex("TD Bank", 0), "td"), new Pair(new Regex("USAA FEDERAL SAVINGS BANK|USAA Bank", 0), "usaa"), new Pair(new Regex("U\\.?S\\. BANK|US Bank", 0), "usbank"), new Pair(new Regex("Wells Fargo", 0), "wellsfargo"));
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : mapJ0.entrySet()) {
            if (new GeneratorSequence$iterator$1(Regex.d((Regex) entry.getKey(), str)).hasNext()) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        Iterator it = linkedHashMap.entrySet().iterator();
        Integer numValueOf = it.hasNext() ? Integer.valueOf(a1.u(i5, (String) ((Map.Entry) it.next()).getValue())) : null;
        return numValueOf != null ? numValueOf.intValue() : i5;
    }
}
