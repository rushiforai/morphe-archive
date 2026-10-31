package com.amplitude;

import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* renamed from: com.amplitude.d2, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class EnumC0424d2 {

    /* renamed from: b, reason: collision with root package name */
    public static final C0394c2 f20524b;

    /* renamed from: c, reason: collision with root package name */
    private static final Map<Integer, EnumC0424d2> f20525c;

    /* renamed from: d, reason: collision with root package name */
    public static final EnumC0424d2 f20526d;

    /* renamed from: e, reason: collision with root package name */
    public static final EnumC0424d2 f20527e;

    /* renamed from: f, reason: collision with root package name */
    public static final EnumC0424d2 f20528f;

    /* renamed from: g, reason: collision with root package name */
    public static final EnumC0424d2 f20529g;

    /* renamed from: h, reason: collision with root package name */
    public static final EnumC0424d2 f20530h;

    /* renamed from: i, reason: collision with root package name */
    public static final EnumC0424d2 f20531i;

    /* renamed from: j, reason: collision with root package name */
    public static final EnumC0424d2 f20532j;

    /* renamed from: k, reason: collision with root package name */
    public static final EnumC0424d2 f20533k;

    /* renamed from: l, reason: collision with root package name */
    public static final EnumC0424d2 f20534l;

    /* renamed from: m, reason: collision with root package name */
    public static final EnumC0424d2 f20535m;
    public static final EnumC0424d2 n;
    public static final EnumC0424d2 o;

    /* renamed from: p, reason: collision with root package name */
    public static final EnumC0424d2 f20536p;

    /* renamed from: q, reason: collision with root package name */
    public static final EnumC0424d2 f20537q;

    /* renamed from: r, reason: collision with root package name */
    public static final EnumC0424d2 f20538r;

    /* renamed from: s, reason: collision with root package name */
    public static final EnumC0424d2 f20539s;

    /* renamed from: t, reason: collision with root package name */
    public static final EnumC0424d2 f20540t;

    /* renamed from: u, reason: collision with root package name */
    private static final /* synthetic */ EnumC0424d2[] f20541u;

    /* renamed from: v, reason: collision with root package name */
    private static final /* synthetic */ EnumEntries f20542v;

    /* renamed from: a, reason: collision with root package name */
    private final int f20543a;

    static {
        EnumC0424d2 enumC0424d2 = new EnumC0424d2("Mutation", 0, 0);
        f20526d = enumC0424d2;
        EnumC0424d2 enumC0424d22 = new EnumC0424d2("MouseMove", 1, 1);
        f20527e = enumC0424d22;
        EnumC0424d2 enumC0424d23 = new EnumC0424d2("MouseInteraction", 2, 2);
        f20528f = enumC0424d23;
        EnumC0424d2 enumC0424d24 = new EnumC0424d2("Scroll", 3, 3);
        f20529g = enumC0424d24;
        EnumC0424d2 enumC0424d25 = new EnumC0424d2("ViewportResize", 4, 4);
        f20530h = enumC0424d25;
        EnumC0424d2 enumC0424d26 = new EnumC0424d2("Input", 5, 5);
        f20531i = enumC0424d26;
        EnumC0424d2 enumC0424d27 = new EnumC0424d2("TouchMove", 6, 6);
        f20532j = enumC0424d27;
        EnumC0424d2 enumC0424d28 = new EnumC0424d2("MediaInteraction", 7, 7);
        f20533k = enumC0424d28;
        EnumC0424d2 enumC0424d29 = new EnumC0424d2("StyleSheetRule", 8, 8);
        f20534l = enumC0424d29;
        EnumC0424d2 enumC0424d210 = new EnumC0424d2("CanvasMutation", 9, 9);
        f20535m = enumC0424d210;
        EnumC0424d2 enumC0424d211 = new EnumC0424d2("Font", 10, 10);
        n = enumC0424d211;
        EnumC0424d2 enumC0424d212 = new EnumC0424d2("Log", 11, 11);
        o = enumC0424d212;
        EnumC0424d2 enumC0424d213 = new EnumC0424d2("Drag", 12, 12);
        f20536p = enumC0424d213;
        EnumC0424d2 enumC0424d214 = new EnumC0424d2("StyleDeclaration", 13, 13);
        f20537q = enumC0424d214;
        EnumC0424d2 enumC0424d215 = new EnumC0424d2("Selection", 14, 14);
        f20538r = enumC0424d215;
        EnumC0424d2 enumC0424d216 = new EnumC0424d2("AdoptedStyleSheet", 15, 15);
        f20539s = enumC0424d216;
        EnumC0424d2 enumC0424d217 = new EnumC0424d2("CustomElement", 16, 16);
        f20540t = enumC0424d217;
        EnumC0424d2[] enumC0424d2Arr = {enumC0424d2, enumC0424d22, enumC0424d23, enumC0424d24, enumC0424d25, enumC0424d26, enumC0424d27, enumC0424d28, enumC0424d29, enumC0424d210, enumC0424d211, enumC0424d212, enumC0424d213, enumC0424d214, enumC0424d215, enumC0424d216, enumC0424d217};
        f20541u = enumC0424d2Arr;
        i70.a aVarA = EnumEntriesKt.a(enumC0424d2Arr);
        f20542v = aVarA;
        f20524b = new C0394c2();
        int iD0 = b70.k.d0(b70.c.u0(aVarA, 10));
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0 < 16 ? 16 : iD0);
        b70.a aVar = new b70.a(aVarA);
        while (aVar.hasNext()) {
            Object next = aVar.next();
            linkedHashMap.put(Integer.valueOf(((EnumC0424d2) next).f20543a), next);
        }
        f20525c = linkedHashMap;
    }

    public EnumC0424d2(String str, int i5, int i11) {
        this.f20543a = i11;
    }

    public static EnumC0424d2 valueOf(String str) {
        return (EnumC0424d2) Enum.valueOf(EnumC0424d2.class, str);
    }

    public static EnumC0424d2[] values() {
        return (EnumC0424d2[]) f20541u.clone();
    }

    public final int b() {
        return this.f20543a;
    }
}
