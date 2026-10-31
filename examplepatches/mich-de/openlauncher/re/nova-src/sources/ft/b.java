package ft;

import ai.r2;
import com.amplitude.eventbridge.EventBridgeChannel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b {

    /* renamed from: m, reason: collision with root package name */
    public static final b6.b f55885m;
    public static final List n;
    public static final b o;

    /* renamed from: p, reason: collision with root package name */
    public static final b f55886p;

    /* renamed from: q, reason: collision with root package name */
    public static final b f55887q;

    /* renamed from: r, reason: collision with root package name */
    public static final b f55888r;

    /* renamed from: s, reason: collision with root package name */
    public static final b f55889s;

    /* renamed from: t, reason: collision with root package name */
    public static final b f55890t;

    /* renamed from: u, reason: collision with root package name */
    public static final b f55891u;

    /* renamed from: v, reason: collision with root package name */
    public static final b f55892v;

    /* renamed from: w, reason: collision with root package name */
    public static final b f55893w;

    /* renamed from: x, reason: collision with root package name */
    public static final b f55894x;

    /* renamed from: y, reason: collision with root package name */
    public static final /* synthetic */ b[] f55895y;

    /* renamed from: z, reason: collision with root package name */
    public static final /* synthetic */ i70.a f55896z;

    /* renamed from: a, reason: collision with root package name */
    public final String f55897a;

    /* renamed from: b, reason: collision with root package name */
    public final String f55898b;

    /* renamed from: c, reason: collision with root package name */
    public final int f55899c;

    /* renamed from: d, reason: collision with root package name */
    public final int f55900d;

    /* renamed from: e, reason: collision with root package name */
    public final int f55901e;

    /* renamed from: f, reason: collision with root package name */
    public final Set f55902f;

    /* renamed from: g, reason: collision with root package name */
    public final int f55903g;

    /* renamed from: h, reason: collision with root package name */
    public final Pattern f55904h;

    /* renamed from: i, reason: collision with root package name */
    public final Map f55905i;

    /* renamed from: j, reason: collision with root package name */
    public final Map f55906j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f55907k;

    /* renamed from: l, reason: collision with root package name */
    public final int f55908l;

    static {
        b bVar = new b("Visa", 0, "visa", "Visa", 2131232307, null, 0, Pattern.compile("^(4)[0-9]*$"), b70.k.e0(new Pair(1, Pattern.compile("^4$"))), null, 1, 1656);
        o = bVar;
        b bVar2 = new b("MasterCard", 1, "mastercard", "Mastercard", 2131232189, null, 0, Pattern.compile("^(2221|2222|2223|2224|2225|2226|2227|2228|2229|222|223|224|225|226|227|228|229|23|24|25|26|270|271|2720|50|51|52|53|54|55|56|57|58|59|67)[0-9]*$"), MapsKt.j0(new Pair(1, Pattern.compile("^2|5|6$")), new Pair(2, Pattern.compile("^(22|23|24|25|26|27|50|51|52|53|54|55|56|57|58|59|67)$"))), null, 2, 1656);
        f55886p = bVar2;
        b bVar3 = new b("AmericanExpress", 2, "amex", "American Express", 2131232133, kotlin.collections.c.f1(new Integer[]{3, 4}), 15, Pattern.compile("^(34|37)[0-9]*$"), b70.k.e0(new Pair(1, Pattern.compile("^3$"))), null, 3, 1552);
        f55887q = bVar3;
        b bVar4 = new b("Discover", 3, "discover", "Discover", 2131232172, null, 0, Pattern.compile("^(60|64|65)[0-9]*$"), b70.k.e0(new Pair(1, Pattern.compile("^6$"))), null, 4, 1656);
        f55888r = bVar4;
        b bVar5 = new b("JCB", 4, "jcb", "JCB", 2131232185, null, 0, Pattern.compile("^(352[89]|35[3-8][0-9])[0-9]*$"), MapsKt.j0(new Pair(1, Pattern.compile("^3$")), new Pair(2, Pattern.compile("^(35)$")), new Pair(3, Pattern.compile("^(35[2-8])$"))), null, 5, 1656);
        f55889s = bVar5;
        b bVar6 = new b("DinersClub", 5, "diners", "Diners Club", 2131232169, null, 16, Pattern.compile("^(36|30|38|39)[0-9]*$"), b70.k.e0(new Pair(1, Pattern.compile("^3$"))), b70.k.e0(new Pair(Pattern.compile("^(36)[0-9]*$"), 14)), 6, 1080);
        f55890t = bVar6;
        b bVar7 = new b("UnionPay", 6, "unionpay", "UnionPay", 2131232302, null, 0, Pattern.compile("^(62|81)[0-9]*$"), b70.k.e0(new Pair(1, Pattern.compile("^6|8$"))), null, 7, 1656);
        f55891u = bVar7;
        b bVar8 = new b("CartesBancaires", 7, "cartes_bancaires", "Cartes Bancaires", 2131232158, null, 0, Pattern.compile("(^(4)[0-9]*) |^(2221|2222|2223|2224|2225|2226|2227|2228|2229|222|223|224|225|226|227|228|229|23|24|25|26|270|271|2720|50|51|52|53|54|55|56|57|58|59|67)[0-9]*$"), MapsKt.j0(new Pair(1, Pattern.compile("^4$")), new Pair(2, Pattern.compile("^2|5|6$")), new Pair(3, Pattern.compile("^(22|23|24|25|26|27|50|51|52|53|54|55|56|57|58|59|67)$"))), null, 8, 632);
        f55892v = bVar8;
        b bVar9 = new b("Interac", 8, "interac", "Interac", 2131232182, null, 0, Pattern.compile("^(4506|4519|4724|4536|500|5510|629449)[0-9]*$"), MapsKt.j0(new Pair(1, Pattern.compile("^(4|5|6)$")), new Pair(2, Pattern.compile("^(45|50|55|62)$")), new Pair(3, Pattern.compile("^(450|451|472|453|500|551|629)$")), new Pair(4, Pattern.compile("^(4506|4519|4724|4536|5510|6294)$")), new Pair(5, Pattern.compile("^(62944)$")), new Pair(6, Pattern.compile("^(629449)$"))), null, 9, 632);
        f55893w = bVar9;
        b bVar10 = new b("Unknown", 9, "unknown", "Unknown", 2131232305, kotlin.collections.c.f1(new Integer[]{3, 4}), 0, null, b70.h.f17594a, null, -1, 1752);
        f55894x = bVar10;
        b[] bVarArr = {bVar, bVar2, bVar3, bVar4, bVar5, bVar6, bVar7, bVar8, bVar9, bVar10};
        f55895y = bVarArr;
        i70.a aVarA = EnumEntriesKt.a(bVarArr);
        f55896z = aVarA;
        f55885m = new b6.b();
        ArrayList arrayList = new ArrayList();
        b70.a aVar = new b70.a(aVarA);
        while (aVar.hasNext()) {
            Object next = aVar.next();
            if (((b) next).f55907k) {
                arrayList.add(next);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Object next2 = it.next();
            if (((b) next2).f55908l > 0) {
                arrayList2.add(next2);
            }
        }
        n = b70.g.D1(new r2(13), arrayList2);
    }

    public b(String str, int i5, String str2, String str3, int i11, Set set, int i12, Pattern pattern, Map map, Map map2, int i13, int i14) {
        int i15 = (i14 & 8) != 0 ? 2131232166 : 2131232167;
        set = (i14 & 32) != 0 ? ab.e0.U(3) : set;
        i12 = (i14 & 64) != 0 ? 16 : i12;
        pattern = (i14 & 128) != 0 ? null : pattern;
        map2 = (i14 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? b70.h.f17594a : map2;
        boolean z11 = (i14 & 1024) != 0;
        this.f55897a = str2;
        this.f55898b = str3;
        this.f55899c = i11;
        this.f55900d = i15;
        this.f55901e = 2131232177;
        this.f55902f = set;
        this.f55903g = i12;
        this.f55904h = pattern;
        this.f55905i = map;
        this.f55906j = map2;
        this.f55907k = z11;
        this.f55908l = i13;
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f55895y.clone();
    }

    public final int a() {
        Integer num = (Integer) b70.g.j1(this.f55902f);
        if (num != null) {
            return num.intValue();
        }
        return 3;
    }

    public final int b(String cardNumber) {
        Object next;
        Intrinsics.g(cardNumber, "cardNumber");
        hq.f fVar = new hq.f(cardNumber);
        Iterator it = this.f55906j.entrySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (((Pattern) ((Map.Entry) next).getKey()).matcher(fVar.f59964d).matches()) {
                break;
            }
        }
        Map.Entry entry = (Map.Entry) next;
        return entry != null ? ((Number) entry.getValue()).intValue() : this.f55903g;
    }

    public final boolean c(String str) {
        String string;
        return a() == ((str == null || (string = r70.k.u1(str).toString()) == null) ? 0 : string.length());
    }
}
