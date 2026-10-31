package com.amplitude;

import android.graphics.Matrix;
import b.c9;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.f2, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0436f2 extends AbstractC0473l2 {
    private Float A;
    private final float B;
    private final float C;
    private transient String D;
    private final transient Y3 E;

    /* renamed from: c, reason: collision with root package name */
    private int f20561c;

    /* renamed from: d, reason: collision with root package name */
    private String f20562d;

    /* renamed from: e, reason: collision with root package name */
    private String f20563e;

    /* renamed from: f, reason: collision with root package name */
    private String f20564f;

    /* renamed from: g, reason: collision with root package name */
    private boolean f20565g;

    /* renamed from: h, reason: collision with root package name */
    private final String f20566h;

    /* renamed from: i, reason: collision with root package name */
    private final int f20567i;

    /* renamed from: j, reason: collision with root package name */
    private final int f20568j;

    /* renamed from: k, reason: collision with root package name */
    private final float f20569k;

    /* renamed from: l, reason: collision with root package name */
    private final int f20570l;

    /* renamed from: m, reason: collision with root package name */
    private final int f20571m;
    private int n;
    private int o;

    /* renamed from: p, reason: collision with root package name */
    private Matrix f20572p;

    /* renamed from: q, reason: collision with root package name */
    private AbstractC0537x2 f20573q;

    /* renamed from: r, reason: collision with root package name */
    private AbstractC0537x2 f20574r;

    /* renamed from: s, reason: collision with root package name */
    private Integer f20575s;

    /* renamed from: t, reason: collision with root package name */
    private String f20576t;

    /* renamed from: u, reason: collision with root package name */
    private String f20577u;

    /* renamed from: v, reason: collision with root package name */
    private final String f20578v;

    /* renamed from: w, reason: collision with root package name */
    private Integer f20579w;

    /* renamed from: x, reason: collision with root package name */
    private Integer f20580x;

    /* renamed from: y, reason: collision with root package name */
    private List<C0436f2> f20581y;

    /* renamed from: z, reason: collision with root package name */
    private boolean f20582z;

    public /* synthetic */ C0436f2(int i5, String str, boolean z11, String str2, int i11, int i12, float f11, int i13, int i14, int i15, int i16, Matrix matrix, String str3, List list, boolean z12, Float f12, float f13, float f14, int i17) {
        this(i5, str, (i17 & 4) != 0 ? null : "sr_root", null, (i17 & 16) != 0 ? false : z11, (i17 & 32) != 0 ? "div" : str2, i11, i12, (i17 & 256) != 0 ? 0.0f : f11, i13, i14, (i17 & 2048) != 0 ? 0 : i15, (i17 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? 0 : i16, (i17 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? null : matrix, null, null, null, (524288 & i17) != 0 ? null : str3, null, (4194304 & i17) != 0 ? new ArrayList() : list, (8388608 & i17) != 0 ? false : z12, (16777216 & i17) != 0 ? null : f12, (33554432 & i17) != 0 ? 1.0f : f13, (i17 & 67108864) != 0 ? 1.0f : f14, null, new Y3());
    }

    public final float A() {
        return this.f20569k;
    }

    public final Float B() {
        return this.A;
    }

    public final boolean C() {
        return this.f20565g;
    }

    public final void a(Integer num) {
        this.f20575s = num;
    }

    public final void b(Integer num) {
        this.f20579w = num;
    }

    public final float c() {
        return this.B;
    }

    public final Integer d() {
        return this.f20575s;
    }

    public final String e() {
        return this.D;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C0436f2)) {
            return false;
        }
        C0436f2 c0436f2 = (C0436f2) obj;
        return this.f20561c == c0436f2.f20561c && Intrinsics.b(this.f20562d, c0436f2.f20562d) && Intrinsics.b(this.f20563e, c0436f2.f20563e) && Intrinsics.b(this.f20564f, c0436f2.f20564f) && this.f20565g == c0436f2.f20565g && Intrinsics.b(this.f20566h, c0436f2.f20566h) && this.f20567i == c0436f2.f20567i && this.f20568j == c0436f2.f20568j && Float.compare(this.f20569k, c0436f2.f20569k) == 0 && this.f20570l == c0436f2.f20570l && this.f20571m == c0436f2.f20571m && this.n == c0436f2.n && this.o == c0436f2.o && Intrinsics.b(this.f20572p, c0436f2.f20572p) && Intrinsics.b(this.f20575s, c0436f2.f20575s) && Intrinsics.b(this.f20576t, c0436f2.f20576t) && Intrinsics.b(this.f20577u, c0436f2.f20577u) && Intrinsics.b(this.f20578v, c0436f2.f20578v) && Intrinsics.b(this.f20579w, c0436f2.f20579w) && Intrinsics.b(this.f20580x, c0436f2.f20580x) && Intrinsics.b(this.f20581y, c0436f2.f20581y) && this.f20582z == c0436f2.f20582z && Intrinsics.b(this.A, c0436f2.A) && Float.compare(this.B, c0436f2.B) == 0 && Float.compare(this.C, c0436f2.C) == 0 && Intrinsics.b(this.D, c0436f2.D) && Intrinsics.b(this.E, c0436f2.E);
    }

    public final List f() {
        return this.f20581y;
    }

    public final boolean g() {
        return this.f20582z;
    }

    public final float h() {
        return this.C;
    }

    public final int hashCode() {
        int iE = b.c0.e(Integer.hashCode(this.f20561c) * 31, 31, this.f20562d);
        String str = this.f20563e;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f20564f;
        int iA = b.u4.a(this.o, b.u4.a(this.n, b.u4.a(this.f20571m, b.u4.a(this.f20570l, a80.m.d(this.f20569k, b.u4.a(this.f20568j, b.u4.a(this.f20567i, b.c0.e(c9.f((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.f20565g), 31, this.f20566h), 31), 31), 31), 31), 31), 31), 31);
        Matrix matrix = this.f20572p;
        int iHashCode2 = (iA + (matrix == null ? 0 : matrix.hashCode())) * 29791;
        Integer num = this.f20575s;
        int iHashCode3 = (iHashCode2 + (num == null ? 0 : num.hashCode())) * 31;
        String str3 = this.f20576t;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f20577u;
        int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f20578v;
        int iHashCode6 = (iHashCode5 + (str5 == null ? 0 : str5.hashCode())) * 31;
        Integer num2 = this.f20579w;
        int iHashCode7 = (iHashCode6 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Integer num3 = this.f20580x;
        int iF = c9.f(b.u4.c((iHashCode7 + (num3 == null ? 0 : num3.hashCode())) * 31, 31, this.f20581y), 31, this.f20582z);
        Float f11 = this.A;
        int iD = a80.m.d(this.C, a80.m.d(this.B, (iF + (f11 == null ? 0 : f11.hashCode())) * 31, 31), 31);
        String str6 = this.D;
        return this.E.hashCode() + ((iD + (str6 != null ? str6.hashCode() : 0)) * 31);
    }

    public final String i() {
        return this.f20564f;
    }

    public final int j() {
        return this.f20571m;
    }

    public final int k() {
        return this.f20571m;
    }

    public final int l() {
        return this.f20567i;
    }

    public final int m() {
        return this.f20568j;
    }

    public final int n() {
        return this.f20570l;
    }

    public final String o() {
        return this.f20578v;
    }

    public final Matrix p() {
        return this.f20572p;
    }

    public final int q() {
        return this.f20561c;
    }

    public final Integer r() {
        return this.f20580x;
    }

    public final Integer s() {
        return this.f20579w;
    }

    public final String t() {
        return this.f20563e;
    }

    public final String toString() {
        String str = this.f20562d;
        String str2 = this.f20563e;
        int i5 = this.f20567i;
        int i11 = this.f20568j;
        int i12 = this.f20570l;
        int i13 = this.f20571m;
        StringBuilder sbW = b.c0.w("[", str, " ", str2, "] [xy=");
        b.c0.A(sbW, i5, ",", i11, "] [wh=");
        sbW.append(i12);
        sbW.append("}x");
        sbW.append(i13);
        sbW.append("]");
        return sbW.toString();
    }

    public final int u() {
        return this.n;
    }

    public final int v() {
        return this.o;
    }

    public final String w() {
        return this.f20566h;
    }

    public final Y3 x() {
        return this.E;
    }

    public final String y() {
        return this.f20562d;
    }

    public final int z() {
        return this.f20570l;
    }

    public final void a(C0436f2 node) {
        Intrinsics.g(node, "node");
        node.f20579w = Integer.valueOf(a());
        C0436f2 c0436f2 = (C0436f2) b70.g.i1(this.f20581y);
        if (c0436f2 != null) {
            c0436f2.f20580x = Integer.valueOf(node.a());
        }
        this.f20581y.add(node);
    }

    public final C0436f2 b() {
        ArrayList arrayList = new ArrayList();
        Y3 y32 = new Y3();
        int i5 = this.f20561c;
        String viewClassName = this.f20562d;
        String str = this.f20563e;
        String str2 = this.f20564f;
        boolean z11 = this.f20565g;
        String tagName = this.f20566h;
        int i11 = this.f20567i;
        int i12 = this.f20568j;
        float f11 = this.f20569k;
        int i13 = this.f20570l;
        int i14 = this.f20571m;
        int i15 = this.n;
        int i16 = this.o;
        Matrix matrix = this.f20572p;
        Integer num = this.f20575s;
        String str3 = this.f20576t;
        String str4 = this.f20577u;
        String str5 = this.f20578v;
        Integer num2 = this.f20579w;
        boolean z12 = this.f20582z;
        Float f12 = this.A;
        float f13 = this.B;
        float f14 = this.C;
        String str6 = this.D;
        Intrinsics.g(viewClassName, "viewClassName");
        Intrinsics.g(tagName, "tagName");
        return new C0436f2(i5, viewClassName, str, str2, z11, tagName, i11, i12, f11, i13, i14, i15, i16, matrix, num, str3, str4, str5, num2, arrayList, z12, f12, f13, f14, str6, y32);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0436f2(int i5, String viewClassName, String str, String str2, boolean z11, String tagName, int i11, int i12, float f11, int i13, int i14, int i15, int i16, Matrix matrix, Integer num, String str3, String str4, String str5, Integer num2, List childNodes, boolean z12, Float f12, float f13, float f14, String str6, Y3 transientProps) {
        super(i5, EnumC0485n2.f20683e.a());
        Intrinsics.g(viewClassName, "viewClassName");
        Intrinsics.g(tagName, "tagName");
        Intrinsics.g(childNodes, "childNodes");
        Intrinsics.g(transientProps, "transientProps");
        this.f20561c = i5;
        this.f20562d = viewClassName;
        this.f20563e = str;
        this.f20564f = str2;
        this.f20565g = z11;
        this.f20566h = tagName;
        this.f20567i = i11;
        this.f20568j = i12;
        this.f20569k = f11;
        this.f20570l = i13;
        this.f20571m = i14;
        this.n = i15;
        this.o = i16;
        this.f20572p = matrix;
        this.f20575s = num;
        this.f20576t = str3;
        this.f20577u = str4;
        this.f20578v = str5;
        this.f20579w = num2;
        this.f20580x = null;
        this.f20581y = childNodes;
        this.f20582z = z12;
        this.A = f12;
        this.B = f13;
        this.C = f14;
        this.D = str6;
        this.E = transientProps;
    }

    public final void a(u4 viewCache, K3 logger) {
        Intrinsics.g(viewCache, "viewCache");
        Intrinsics.g(logger, "logger");
        E e3 = this.E.f20448a;
        this.D = e3 != null ? e3.a(viewCache, logger) : null;
    }
}
