package iw;

import hv.g3;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.enums.EnumEntriesKt;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Serializable
/* loaded from: classes4.dex */
public final class o {
    public static final /* synthetic */ o[] A;

    @NotNull
    public static final n Companion;

    /* renamed from: b, reason: collision with root package name */
    public static final Object f68149b;

    /* renamed from: c, reason: collision with root package name */
    public static final o f68150c;

    /* renamed from: d, reason: collision with root package name */
    public static final o f68151d;

    /* renamed from: e, reason: collision with root package name */
    public static final o f68152e;

    /* renamed from: f, reason: collision with root package name */
    public static final o f68153f;

    /* renamed from: g, reason: collision with root package name */
    public static final o f68154g;

    /* renamed from: h, reason: collision with root package name */
    public static final o f68155h;

    /* renamed from: i, reason: collision with root package name */
    public static final o f68156i;

    /* renamed from: j, reason: collision with root package name */
    public static final o f68157j;

    /* renamed from: k, reason: collision with root package name */
    public static final o f68158k;

    /* renamed from: l, reason: collision with root package name */
    public static final o f68159l;

    /* renamed from: m, reason: collision with root package name */
    public static final o f68160m;
    public static final o n;
    public static final o o;

    /* renamed from: p, reason: collision with root package name */
    public static final o f68161p;

    /* renamed from: q, reason: collision with root package name */
    public static final o f68162q;

    /* renamed from: r, reason: collision with root package name */
    public static final o f68163r;

    /* renamed from: s, reason: collision with root package name */
    public static final o f68164s;

    /* renamed from: t, reason: collision with root package name */
    public static final o f68165t;

    /* renamed from: u, reason: collision with root package name */
    public static final o f68166u;

    /* renamed from: v, reason: collision with root package name */
    public static final o f68167v;

    /* renamed from: w, reason: collision with root package name */
    public static final o f68168w;

    /* renamed from: x, reason: collision with root package name */
    public static final o f68169x;

    /* renamed from: y, reason: collision with root package name */
    public static final o f68170y;

    /* renamed from: z, reason: collision with root package name */
    public static final o f68171z;

    /* renamed from: a, reason: collision with root package name */
    public final int f68172a;

    static {
        o oVar = new o("Area", 0, 2132019653);
        f68150c = oVar;
        o oVar2 = new o("Cedex", 1, 2132019643);
        f68151d = oVar2;
        o oVar3 = new o("City", 2, 2132019644);
        f68152e = oVar3;
        o oVar4 = new o("Country", 3, 2132019647);
        o oVar5 = new o("County", 4, 2132019648);
        f68153f = oVar5;
        o oVar6 = new o("Department", 5, 2132019650);
        f68154g = oVar6;
        o oVar7 = new o("District", 6, 2132019651);
        f68155h = oVar7;
        o oVar8 = new o("DoSi", 7, 2132019659);
        f68156i = oVar8;
        o oVar9 = new o("Eircode", 8, 2132019654);
        f68157j = oVar9;
        o oVar10 = new o("Emirate", 9, 2132019639);
        f68158k = oVar10;
        o oVar11 = new o("Island", 10, 2132019657);
        f68159l = oVar11;
        o oVar12 = new o("Neighborhood", 11, 2132019661);
        f68160m = oVar12;
        o oVar13 = new o("Oblast", 12, 2132019662);
        n = oVar13;
        o oVar14 = new o("Parish", 13, 2132019642);
        o = oVar14;
        o oVar15 = new o("Pin", 14, 2132019656);
        f68161p = oVar15;
        o oVar16 = new o("PostTown", 15, 2132019665);
        f68162q = oVar16;
        o oVar17 = new o("Postal", 16, 2132019666);
        f68163r = oVar17;
        o oVar18 = new o("Perfecture", 17, 2132019658);
        f68164s = oVar18;
        o oVar19 = new o("Province", 18, 2132019670);
        f68165t = oVar19;
        o oVar20 = new o("State", 19, 2132019674);
        f68166u = oVar20;
        o oVar21 = new o("Suburb", 20, 2132019676);
        f68167v = oVar21;
        o oVar22 = new o("SuburbOrCity", 21, 2132019641);
        f68168w = oVar22;
        o oVar23 = new o("Townload", 22, 2132019655);
        f68169x = oVar23;
        o oVar24 = new o("VillageTownship", 23, 2132019677);
        f68170y = oVar24;
        o oVar25 = new o("Zip", 24, 2132019678);
        f68171z = oVar25;
        o[] oVarArr = {oVar, oVar2, oVar3, oVar4, oVar5, oVar6, oVar7, oVar8, oVar9, oVar10, oVar11, oVar12, oVar13, oVar14, oVar15, oVar16, oVar17, oVar18, oVar19, oVar20, oVar21, oVar22, oVar23, oVar24, oVar25};
        A = oVarArr;
        EnumEntriesKt.a(oVarArr);
        Companion = new n();
        f68149b = LazyKt.b(LazyThreadSafetyMode.f71680b, new g3(12));
    }

    public o(String str, int i5, int i11) {
        this.f68172a = i11;
    }

    public static o valueOf(String str) {
        return (o) Enum.valueOf(o.class, str);
    }

    public static o[] values() {
        return (o[]) A.clone();
    }
}
