package c3;

import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Region;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.os.SystemClock;
import android.os.Trace;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.platform.AndroidComposeView;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class j0 extends a5.b {
    public static final z.b0 R;
    public final v70.i A;
    public boolean B;
    public g0 C;
    public z.c0 D;
    public final z.d0 E;
    public final z.a0 F;
    public final z.a0 G;
    public final String H;
    public final String I;
    public final x7.u J;
    public final z.c0 K;
    public b3 L;
    public boolean M;
    public final z.a0 N;
    public final ae.m O;
    public final ArrayList P;
    public final i0 Q;

    /* renamed from: d, reason: collision with root package name */
    public final AndroidComposeView f19328d;

    /* renamed from: e, reason: collision with root package name */
    public int f19329e = Integer.MIN_VALUE;

    /* renamed from: f, reason: collision with root package name */
    public final i0 f19330f = new i0(this, 0);

    /* renamed from: g, reason: collision with root package name */
    public final AccessibilityManager f19331g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f19332h;

    /* renamed from: i, reason: collision with root package name */
    public long f19333i;

    /* renamed from: j, reason: collision with root package name */
    public final c0 f19334j;

    /* renamed from: k, reason: collision with root package name */
    public final d0 f19335k;

    /* renamed from: l, reason: collision with root package name */
    public List f19336l;

    /* renamed from: m, reason: collision with root package name */
    public final Handler f19337m;
    public final f0 n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public int f19338p;

    /* renamed from: q, reason: collision with root package name */
    public b5.g f19339q;

    /* renamed from: r, reason: collision with root package name */
    public b5.g f19340r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f19341s;

    /* renamed from: t, reason: collision with root package name */
    public final z.c0 f19342t;

    /* renamed from: u, reason: collision with root package name */
    public final z.c0 f19343u;

    /* renamed from: v, reason: collision with root package name */
    public final z.d1 f19344v;

    /* renamed from: w, reason: collision with root package name */
    public final z.d1 f19345w;

    /* renamed from: x, reason: collision with root package name */
    public int f19346x;

    /* renamed from: y, reason: collision with root package name */
    public Integer f19347y;

    /* renamed from: z, reason: collision with root package name */
    public final z.f f19348z;

    static {
        int[] iArr = {2131427347, 2131427348, 2131427359, 2131427370, 2131427373, 2131427374, 2131427375, 2131427376, 2131427377, 2131427378, 2131427349, 2131427350, 2131427351, 2131427352, 2131427353, 2131427354, 2131427355, 2131427356, 2131427357, 2131427358, 2131427360, 2131427361, 2131427362, 2131427363, 2131427364, 2131427365, 2131427366, 2131427367, 2131427368, 2131427369, 2131427371, 2131427372};
        z.b0 b0Var = z.l.f97786a;
        z.b0 b0Var2 = new z.b0(32);
        int i5 = b0Var2.f97784b;
        if (i5 < 0) {
            android.support.v4.media.session.b.m0(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            throw null;
        }
        int i11 = i5 + 32;
        b0Var2.d(i11);
        int[] iArr2 = b0Var2.f97783a;
        int i12 = b0Var2.f97784b;
        if (i5 != i12) {
            u90.b.p(i11, i5, iArr2, iArr2, i12);
        }
        u90.b.u(i5, 0, iArr, iArr2, 12);
        b0Var2.f97784b += 32;
        R = b0Var2;
    }

    /* JADX WARN: Type inference failed for: r2v4, types: [c3.c0] */
    /* JADX WARN: Type inference failed for: r2v5, types: [c3.d0] */
    public j0(AndroidComposeView androidComposeView) {
        this.f19328d = androidComposeView;
        Object systemService = androidComposeView.getContext().getSystemService("accessibility");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.accessibility.AccessibilityManager");
        AccessibilityManager accessibilityManager = (AccessibilityManager) systemService;
        this.f19331g = accessibilityManager;
        this.f19333i = 100L;
        this.f19334j = new AccessibilityManager.AccessibilityStateChangeListener() { // from class: c3.c0
            @Override // android.view.accessibility.AccessibilityManager.AccessibilityStateChangeListener
            public final void onAccessibilityStateChanged(boolean z11) {
                j0 j0Var = this.f19238a;
                j0Var.f19336l = z11 ? j0Var.f19331g.getEnabledAccessibilityServiceList(-1) : EmptyList.f71733a;
            }
        };
        this.f19335k = new AccessibilityManager.TouchExplorationStateChangeListener() { // from class: c3.d0
            @Override // android.view.accessibility.AccessibilityManager.TouchExplorationStateChangeListener
            public final void onTouchExplorationStateChanged(boolean z11) {
                j0 j0Var = this.f19250a;
                j0Var.f19336l = j0Var.f19331g.getEnabledAccessibilityServiceList(-1);
            }
        };
        this.f19336l = accessibilityManager.getEnabledAccessibilityServiceList(-1);
        this.f19337m = new Handler(Looper.getMainLooper());
        this.n = new f0(this);
        this.o = Integer.MIN_VALUE;
        this.f19338p = Integer.MIN_VALUE;
        this.f19342t = new z.c0();
        this.f19343u = new z.c0();
        this.f19344v = new z.d1(0);
        this.f19345w = new z.d1(0);
        this.f19346x = -1;
        this.f19348z = new z.f(0);
        this.A = v70.o.b(1, 6, null);
        this.B = true;
        z.c0 c0Var = z.n.f97803a;
        Intrinsics.e(c0Var, "null cannot be cast to non-null type androidx.collection.IntObjectMap<V of androidx.collection.IntObjectMapKt.intObjectMapOf>");
        this.D = c0Var;
        this.E = new z.d0();
        this.F = new z.a0();
        this.G = new z.a0();
        this.H = "android.view.accessibility.extra.EXTRA_DATA_TEST_TRAVERSALBEFORE_VAL";
        this.I = "android.view.accessibility.extra.EXTRA_DATA_TEST_TRAVERSALAFTER_VAL";
        this.J = new x7.u(11);
        this.K = new z.c0();
        j3.q qVarA = androidComposeView.getSemanticsOwner().a();
        Intrinsics.e(c0Var, "null cannot be cast to non-null type androidx.collection.IntObjectMap<V of androidx.collection.IntObjectMapKt.intObjectMapOf>");
        this.L = new b3(qVarA, c0Var);
        this.N = z.i.a();
        androidComposeView.addOnAttachStateChangeListener(new e0(this, 0));
        this.O = new ae.m(this, 2);
        this.P = new ArrayList();
        this.Q = new i0(this, 1);
    }

    public static /* synthetic */ void E(j0 j0Var, int i5, int i11, Integer num, int i12) {
        if ((i12 & 4) != 0) {
            num = null;
        }
        j0Var.D(i5, i11, num, null);
    }

    public static Rect L(i2.r0 r0Var) {
        if (!(r0Var instanceof i2.j0) && !(r0Var instanceof i2.k0)) {
            return null;
        }
        h2.c cVarJ = r0Var.j();
        return new Rect((int) cVarJ.f59018a, (int) cVarJ.f59019b, (int) cVarJ.f59020c, (int) cVarJ.f59021d);
    }

    public static float[] M(i2.r0 r0Var) {
        if (!(r0Var instanceof i2.k0)) {
            return null;
        }
        h2.d dVar = ((i2.k0) r0Var).f61126b;
        long j11 = dVar.f59029h;
        long j12 = dVar.f59028g;
        long j13 = dVar.f59027f;
        long j14 = dVar.f59026e;
        return new float[]{Float.intBitsToFloat((int) (j14 >> 32)), Float.intBitsToFloat((int) (j14 & 4294967295L)), Float.intBitsToFloat((int) (j13 >> 32)), Float.intBitsToFloat((int) (j13 & 4294967295L)), Float.intBitsToFloat((int) (j12 >> 32)), Float.intBitsToFloat((int) (j12 & 4294967295L)), Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j11 & 4294967295L))};
    }

    public static Region N(i2.r0 r0Var) {
        if (!(r0Var instanceof i2.i0)) {
            return null;
        }
        i2.i0 i0Var = (i2.i0) r0Var;
        h2.c cVarJ = i0Var.j();
        Region region = new Region(new Rect((int) cVarJ.f59018a, (int) cVarJ.f59019b, (int) cVarJ.f59020c, (int) cVarJ.f59021d));
        Region region2 = new Region();
        i2.n0 n0Var = i0Var.f61123b;
        if (!(n0Var instanceof i2.h)) {
            throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
        }
        region2.setPath(((i2.h) n0Var).f61117a, region);
        return region2;
    }

    public static CharSequence O(CharSequence charSequence) {
        if (charSequence.length() != 0) {
            int i5 = 100000;
            if (charSequence.length() > 100000) {
                if (Character.isHighSurrogate(charSequence.charAt(99999)) && Character.isLowSurrogate(charSequence.charAt(100000))) {
                    i5 = 99999;
                }
                CharSequence charSequenceSubSequence = charSequence.subSequence(0, i5);
                Intrinsics.e(charSequenceSubSequence, "null cannot be cast to non-null type T of androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat.trimToSize");
                return charSequenceSubSequence;
            }
        }
        return charSequence;
    }

    public static String u(j3.q qVar) {
        m3.g gVar;
        if (qVar != null) {
            j3.k kVar = qVar.f68823d;
            z.o0 o0Var = kVar.f68812a;
            j3.a0 a0Var = j3.w.f68852a;
            if (o0Var.b(a0Var)) {
                return a4.b.b((List) kVar.d(a0Var), ",", null, 62);
            }
            j3.a0 a0Var2 = j3.w.E;
            if (o0Var.b(a0Var2)) {
                Object objD = o0Var.d(a0Var2);
                if (objD == null) {
                    objD = null;
                }
                m3.g gVar2 = (m3.g) objD;
                if (gVar2 != null) {
                    return gVar2.f75880b;
                }
            } else {
                Object objD2 = o0Var.d(j3.w.A);
                if (objD2 == null) {
                    objD2 = null;
                }
                List list = (List) objD2;
                if (list != null && (gVar = (m3.g) b70.g.Y0(list)) != null) {
                    return gVar.f75880b;
                }
            }
        }
        return null;
    }

    public static final boolean x(j3.i iVar, float f11) {
        Function0 function0 = iVar.f68786a;
        if (f11 >= 0.0f || ((Number) function0.invoke()).floatValue() <= 0.0f) {
            return f11 > 0.0f && ((Number) function0.invoke()).floatValue() < ((Number) iVar.f68787b.invoke()).floatValue();
        }
        return true;
    }

    public static final boolean y(j3.i iVar) {
        Function0 function0 = iVar.f68786a;
        if (((Number) function0.invoke()).floatValue() > 0.0f) {
            return true;
        }
        ((Number) function0.invoke()).floatValue();
        ((Number) iVar.f68787b.invoke()).floatValue();
        return false;
    }

    public static final boolean z(j3.i iVar) {
        Function0 function0 = iVar.f68786a;
        if (((Number) function0.invoke()).floatValue() < ((Number) iVar.f68787b.invoke()).floatValue()) {
            return true;
        }
        ((Number) function0.invoke()).floatValue();
        return false;
    }

    public final int A(int i5) {
        if (i5 == this.f19328d.getSemanticsOwner().a().f68826g) {
            return -1;
        }
        return i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0089  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void B(j3.q qVar, b3 b3Var) {
        int[] iArr = z.p.f97811a;
        z.d0 d0Var = new z.d0();
        List listJ = j3.q.j(4, qVar);
        LayoutNode layoutNode = qVar.f68822c;
        int size = listJ.size();
        for (int i5 = 0; i5 < size; i5++) {
            j3.q qVar2 = (j3.q) listJ.get(i5);
            z.m mVarT = t();
            int i11 = qVar2.f68826g;
            if (mVarT.a(i11)) {
                if (!b3Var.f19232b.a(i11)) {
                    w(layoutNode);
                    return;
                }
                d0Var.b(i11);
            }
        }
        z.d0 d0Var2 = b3Var.f19232b;
        int[] iArr2 = d0Var2.f97807b;
        long[] jArr = d0Var2.f97806a;
        int length = jArr.length - 2;
        if (length >= 0) {
            int i12 = 0;
            while (true) {
                long j11 = jArr[i12];
                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i13 = 8 - ((~(i12 - length)) >>> 31);
                    for (int i14 = 0; i14 < i13; i14++) {
                        if ((255 & j11) < 128 && !d0Var.a(iArr2[(i12 << 3) + i14])) {
                            w(layoutNode);
                            return;
                        }
                        j11 >>= 8;
                    }
                    if (i13 != 8) {
                        break;
                    } else if (i12 == length) {
                        break;
                    } else {
                        i12++;
                    }
                }
            }
        }
        List listJ2 = j3.q.j(4, qVar);
        int size2 = listJ2.size();
        for (int i15 = 0; i15 < size2; i15++) {
            j3.q qVar3 = (j3.q) listJ2.get(i15);
            b3 b3Var2 = (b3) this.K.b(qVar3.f68826g);
            if (b3Var2 != null && t().a(qVar3.f68826g)) {
                B(qVar3, b3Var2);
            }
        }
    }

    public final boolean C(AccessibilityEvent accessibilityEvent) {
        if (!v()) {
            return false;
        }
        if (accessibilityEvent.getEventType() == 2048 || accessibilityEvent.getEventType() == 32768) {
            this.f19341s = true;
        }
        try {
            return ((Boolean) this.f19330f.invoke(accessibilityEvent)).booleanValue();
        } finally {
            this.f19341s = false;
        }
    }

    public final boolean D(int i5, int i11, Integer num, List list) {
        if (i5 == Integer.MIN_VALUE || !v()) {
            return false;
        }
        AccessibilityEvent accessibilityEventO = o(i5, i11);
        if (num != null) {
            accessibilityEventO.setContentChangeTypes(num.intValue());
        }
        if (list != null) {
            accessibilityEventO.setContentDescription(a4.b.b(list, ",", null, 62));
        }
        return C(accessibilityEventO);
    }

    public final void F(int i5, int i11, String str) {
        AccessibilityEvent accessibilityEventO = o(A(i5), 32);
        accessibilityEventO.setContentChangeTypes(i11);
        if (str != null) {
            accessibilityEventO.getText().add(str);
        }
        C(accessibilityEventO);
    }

    public final void G(int i5) {
        g0 g0Var = this.C;
        if (g0Var != null) {
            if (i5 != g0Var.d().f68826g) {
                return;
            }
            if (SystemClock.uptimeMillis() - g0Var.f() <= 1000) {
                AccessibilityEvent accessibilityEventO = o(A(g0Var.d().f68826g), SQLiteDatabase.OPEN_SHAREDCACHE);
                accessibilityEventO.setFromIndex(g0Var.b());
                accessibilityEventO.setToIndex(g0Var.e());
                accessibilityEventO.setAction(g0Var.a());
                accessibilityEventO.setMovementGranularity(g0Var.c());
                accessibilityEventO.getText().add(u(g0Var.d()));
                C(accessibilityEventO);
            }
        }
        this.C = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:227:0x051a  */
    /* JADX WARN: Removed duplicated region for block: B:259:0x061a  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0114  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void H(z.m mVar) {
        Integer num;
        ArrayList arrayList;
        int[] iArr;
        long[] jArr;
        int i5;
        int i11;
        ArrayList arrayList2;
        int[] iArr2;
        long[] jArr2;
        int i12;
        int i13;
        int i14;
        Integer num2;
        j3.k kVar;
        j3.q qVar;
        int i15;
        boolean zJ;
        j3.k kVar2;
        int i16;
        int i17;
        int i18;
        int i19;
        int i21;
        j3.q qVar2;
        int i22;
        int i23;
        LayoutNode layoutNode;
        Integer num3;
        int i24;
        ArrayList arrayList3;
        j3.k kVar3;
        int i25;
        int i26;
        boolean z11;
        String str;
        int i27;
        int i28;
        j3.k kVar4;
        Integer num4;
        AccessibilityEvent accessibilityEventQ;
        Integer num5;
        LayoutNode layoutNode2;
        z.m mVar2 = mVar;
        ArrayList arrayList4 = this.P;
        ArrayList arrayList5 = new ArrayList(arrayList4);
        arrayList4.clear();
        int[] iArr3 = mVar2.f97795b;
        long[] jArr3 = mVar2.f97794a;
        int i29 = 2;
        int length = jArr3.length - 2;
        int i31 = 0;
        Integer num6 = 0;
        if (length < 0) {
            return;
        }
        int i32 = 0;
        while (true) {
            long j11 = jArr3[i32];
            int i33 = i29;
            int i34 = length;
            char c11 = 7;
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i35 = 8;
                int i36 = 8 - ((~(i32 - i34)) >>> 31);
                long j12 = j11;
                int i37 = i31;
                while (i37 < i36) {
                    if ((j12 & 255) < 128) {
                        int i38 = iArr3[(i32 << 3) + i37];
                        b3 b3Var = (b3) this.K.b(i38);
                        if (b3Var == null) {
                            i11 = i37;
                            arrayList2 = arrayList5;
                            iArr2 = iArr3;
                            jArr2 = jArr3;
                            i12 = i35;
                            i13 = i36;
                            i14 = i32;
                            num2 = num6;
                        } else {
                            j3.k kVar5 = b3Var.f19231a;
                            z.o0 o0Var = kVar5.f68812a;
                            j3.r rVar = (j3.r) mVar2.b(i38);
                            int i39 = i35;
                            j3.q qVarB = rVar != null ? rVar.b() : null;
                            if (qVarB == null) {
                                throw a2.c.r("no value for specified key");
                            }
                            LayoutNode layoutNode3 = qVarB.f68822c;
                            iArr2 = iArr3;
                            j3.k kVar6 = qVarB.f68823d;
                            jArr2 = jArr3;
                            int i40 = qVarB.f68826g;
                            i14 = i32;
                            z.o0 o0Var2 = kVar6.f68812a;
                            i13 = i36;
                            Object[] objArr = o0Var2.f97867b;
                            Object[] objArr2 = o0Var2.f97868c;
                            long[] jArr4 = o0Var2.f97866a;
                            char c12 = c11;
                            int length2 = jArr4.length - 2;
                            if (length2 >= 0) {
                                kVar = kVar5;
                                int i41 = 0;
                                zJ = false;
                                while (true) {
                                    LayoutNode layoutNode4 = layoutNode3;
                                    long j13 = jArr4[i41];
                                    j3.k kVar7 = kVar6;
                                    int i42 = i40;
                                    if ((((~j13) << c12) & j13 & (-9187201950435737472L)) != -9187201950435737472L) {
                                        int i43 = 8 - ((~(i41 - length2)) >>> 31);
                                        long j14 = j13;
                                        int i44 = 0;
                                        while (i44 < i43) {
                                            if ((j14 & 255) < 128) {
                                                int i45 = (i41 << 3) + i44;
                                                Object obj = objArr[i45];
                                                Object obj2 = objArr2[i45];
                                                j3.a0 a0Var = (j3.a0) obj;
                                                int i46 = length2;
                                                j3.a0 a0Var2 = j3.w.f68869t;
                                                i19 = i37;
                                                if (Intrinsics.b(a0Var, a0Var2) || Intrinsics.b(a0Var, j3.w.f68870u)) {
                                                    a3 a3VarF = io.sentry.config.a.F(arrayList5, i38);
                                                    if (a3VarF != null) {
                                                        z11 = false;
                                                    } else {
                                                        a3VarF = new a3(arrayList4, i38);
                                                        z11 = true;
                                                    }
                                                    arrayList4.add(a3VarF);
                                                } else {
                                                    z11 = false;
                                                }
                                                if (z11) {
                                                    j3.a0 a0Var3 = j3.w.f68855d;
                                                    if (Intrinsics.b(a0Var, a0Var3)) {
                                                        Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.String");
                                                        String str2 = (String) obj2;
                                                        if (o0Var.b(a0Var3)) {
                                                            F(i38, i39, str2);
                                                        }
                                                        Unit unit = Unit.f71706a;
                                                        num3 = num6;
                                                        i21 = i44;
                                                        qVar2 = qVarB;
                                                        i22 = i41;
                                                        layoutNode = layoutNode4;
                                                        i25 = i42;
                                                        i23 = 8;
                                                        i24 = i38;
                                                        arrayList3 = arrayList5;
                                                        kVar3 = kVar7;
                                                        i26 = i46;
                                                    } else if (Intrinsics.b(a0Var, j3.w.f68853b) || Intrinsics.b(a0Var, j3.w.I)) {
                                                        num3 = num6;
                                                        i21 = i44;
                                                        qVar2 = qVarB;
                                                        i22 = i41;
                                                        layoutNode = layoutNode4;
                                                        i25 = i42;
                                                        i24 = i38;
                                                        arrayList3 = arrayList5;
                                                        kVar3 = kVar7;
                                                        i26 = i46;
                                                        i23 = 8;
                                                        E(this, A(i24), 2048, 64, 8);
                                                        E(this, A(i24), 2048, num3, 8);
                                                    } else if (Intrinsics.b(a0Var, j3.w.f68854c)) {
                                                        i23 = 8;
                                                        E(this, A(i38), 2048, 64, 8);
                                                        E(this, A(i38), 2048, num6, 8);
                                                        num3 = num6;
                                                        i21 = i44;
                                                        qVar2 = qVarB;
                                                        i22 = i41;
                                                        layoutNode = layoutNode4;
                                                        i25 = i42;
                                                        i24 = i38;
                                                        arrayList3 = arrayList5;
                                                        kVar3 = kVar7;
                                                        i26 = i46;
                                                    } else {
                                                        j3.a0 a0Var4 = j3.w.H;
                                                        i21 = i44;
                                                        if (Intrinsics.b(a0Var, a0Var4)) {
                                                            Object objD = o0Var2.d(j3.w.f68873x);
                                                            if (objD == null) {
                                                                objD = null;
                                                            }
                                                            j3.h hVar = (j3.h) objD;
                                                            if (hVar != null && hVar.f68785a == 4) {
                                                                Object objD2 = o0Var2.d(a0Var4);
                                                                if (objD2 == null) {
                                                                    objD2 = null;
                                                                }
                                                                if (Intrinsics.b(objD2, Boolean.TRUE)) {
                                                                    AccessibilityEvent accessibilityEventO = o(A(i38), 4);
                                                                    LayoutNode layoutNode5 = layoutNode4;
                                                                    j3.k kVar8 = kVar7;
                                                                    arrayList3 = arrayList5;
                                                                    j3.q qVar3 = new j3.q(qVarB.f68820a, true, layoutNode5, kVar8);
                                                                    Object objD3 = qVar3.k().f68812a.d(j3.w.f68852a);
                                                                    if (objD3 == null) {
                                                                        objD3 = null;
                                                                    }
                                                                    List list = (List) objD3;
                                                                    layoutNode2 = layoutNode5;
                                                                    String strB = list != null ? a4.b.b(list, ",", null, 62) : null;
                                                                    Object objD4 = qVar3.k().f68812a.d(j3.w.A);
                                                                    if (objD4 == null) {
                                                                        objD4 = null;
                                                                    }
                                                                    List list2 = (List) objD4;
                                                                    kVar7 = kVar8;
                                                                    String strB2 = list2 != null ? a4.b.b(list2, ",", null, 62) : null;
                                                                    if (strB != null) {
                                                                        accessibilityEventO.setContentDescription(strB);
                                                                        Unit unit2 = Unit.f71706a;
                                                                    }
                                                                    if (strB2 != null) {
                                                                        accessibilityEventO.getText().add(strB2);
                                                                    }
                                                                    C(accessibilityEventO);
                                                                } else {
                                                                    layoutNode2 = layoutNode4;
                                                                    arrayList3 = arrayList5;
                                                                    E(this, A(i38), 2048, num6, 8);
                                                                }
                                                            } else {
                                                                layoutNode2 = layoutNode4;
                                                                arrayList3 = arrayList5;
                                                                E(this, A(i38), 2048, 64, 8);
                                                                E(this, A(i38), 2048, num6, 8);
                                                            }
                                                            num3 = num6;
                                                            qVar2 = qVarB;
                                                            i22 = i41;
                                                            kVar3 = kVar7;
                                                            i25 = i42;
                                                            layoutNode = layoutNode2;
                                                        } else {
                                                            layoutNode = layoutNode4;
                                                            arrayList3 = arrayList5;
                                                            kVar3 = kVar7;
                                                            if (Intrinsics.b(a0Var, j3.w.f68852a)) {
                                                                int iA = A(i38);
                                                                Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.collections.List<kotlin.String>");
                                                                D(iA, 2048, 4, (List) obj2);
                                                                num3 = num6;
                                                                qVar2 = qVarB;
                                                                i22 = i41;
                                                                i25 = i42;
                                                            } else {
                                                                j3.a0 a0Var5 = j3.w.E;
                                                                boolean zB = Intrinsics.b(a0Var, a0Var5);
                                                                String str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                                if (!zB) {
                                                                    Integer num7 = num6;
                                                                    qVar2 = qVarB;
                                                                    i22 = i41;
                                                                    j3.k kVar9 = kVar;
                                                                    i24 = i38;
                                                                    j3.a0 a0Var6 = j3.w.F;
                                                                    if (Intrinsics.b(a0Var, a0Var6)) {
                                                                        Object objD5 = o0Var2.d(a0Var5);
                                                                        if (objD5 == null) {
                                                                            objD5 = null;
                                                                        }
                                                                        m3.g gVar = (m3.g) objD5;
                                                                        if (gVar != null && (str = gVar.f75880b) != null) {
                                                                            str3 = str;
                                                                        }
                                                                        long j15 = ((m3.o0) kVar3.d(a0Var6)).f75946a;
                                                                        C(q(A(i24), Integer.valueOf((int) (j15 >> 32)), Integer.valueOf((int) (j15 & 4294967295L)), Integer.valueOf(str3.length()), O(str3)));
                                                                        i25 = i42;
                                                                        G(i25);
                                                                        Unit unit3 = Unit.f71706a;
                                                                        kVar = kVar9;
                                                                        num3 = num7;
                                                                        i26 = i46;
                                                                        i23 = 8;
                                                                    } else {
                                                                        kVar = kVar9;
                                                                        num3 = num7;
                                                                        i25 = i42;
                                                                        i26 = i46;
                                                                        if (Intrinsics.b(a0Var, a0Var2) || Intrinsics.b(a0Var, j3.w.f68870u)) {
                                                                            w(layoutNode);
                                                                            a3 a3VarF2 = io.sentry.config.a.F(arrayList4, i24);
                                                                            Intrinsics.d(a3VarF2);
                                                                            Object objD6 = o0Var2.d(a0Var2);
                                                                            if (objD6 == null) {
                                                                                objD6 = null;
                                                                            }
                                                                            a3VarF2.a((j3.i) objD6);
                                                                            Object objD7 = o0Var2.d(j3.w.f68870u);
                                                                            if (objD7 == null) {
                                                                                objD7 = null;
                                                                            }
                                                                            a3VarF2.b((j3.i) objD7);
                                                                            if (a3VarF2.isValidOwnerScope()) {
                                                                                this.f19328d.getSnapshotObserver().a(a3VarF2, this.Q, new b3.b1(7, a3VarF2, this));
                                                                            }
                                                                            Unit unit4 = Unit.f71706a;
                                                                        } else if (Intrinsics.b(a0Var, j3.w.f68862k)) {
                                                                            Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.Boolean");
                                                                            if (((Boolean) obj2).booleanValue()) {
                                                                                i23 = 8;
                                                                                C(o(A(i25), 8));
                                                                            } else {
                                                                                i23 = 8;
                                                                            }
                                                                            E(this, A(i25), 2048, num3, i23);
                                                                        } else {
                                                                            j3.a0 a0Var7 = j3.j.f68808w;
                                                                            if (Intrinsics.b(a0Var, a0Var7)) {
                                                                                List list3 = (List) kVar3.d(a0Var7);
                                                                                Object objD8 = o0Var.d(a0Var7);
                                                                                if (objD8 == null) {
                                                                                    objD8 = null;
                                                                                }
                                                                                List list4 = (List) objD8;
                                                                                if (list4 != null) {
                                                                                    LinkedHashSet linkedHashSet = new LinkedHashSet();
                                                                                    if (list3.size() > 0) {
                                                                                        b.c0.y(list3.get(0));
                                                                                        throw null;
                                                                                    }
                                                                                    LinkedHashSet linkedHashSet2 = new LinkedHashSet();
                                                                                    if (list4.size() > 0) {
                                                                                        b.c0.y(list4.get(0));
                                                                                        throw null;
                                                                                    }
                                                                                    zJ = (linkedHashSet.containsAll(linkedHashSet2) && linkedHashSet2.containsAll(linkedHashSet)) ? false : true;
                                                                                } else if (!list3.isEmpty()) {
                                                                                    zJ = true;
                                                                                }
                                                                                Unit unit5 = Unit.f71706a;
                                                                            } else if (obj2 instanceof j3.a) {
                                                                                j3.a aVar = (j3.a) obj2;
                                                                                Object objD9 = o0Var.d(a0Var);
                                                                                if (objD9 == null) {
                                                                                    objD9 = null;
                                                                                }
                                                                                zJ = !k0.a(aVar, objD9);
                                                                                Unit unit6 = Unit.f71706a;
                                                                            }
                                                                        }
                                                                        i23 = 8;
                                                                    }
                                                                } else if (o0Var2.b(j3.j.f68797j)) {
                                                                    Object objD10 = o0Var.d(a0Var5);
                                                                    if (objD10 == null) {
                                                                        objD10 = null;
                                                                    }
                                                                    m3.g gVar2 = (m3.g) objD10;
                                                                    if (gVar2 == null) {
                                                                        gVar2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                                    }
                                                                    Object objD11 = o0Var2.d(a0Var5);
                                                                    if (objD11 == null) {
                                                                        objD11 = null;
                                                                    }
                                                                    CharSequence charSequence = (m3.g) objD11;
                                                                    if (charSequence == null) {
                                                                        charSequence = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                                    }
                                                                    CharSequence charSequenceO = O(charSequence);
                                                                    int length3 = gVar2.length();
                                                                    Integer num8 = num6;
                                                                    int length4 = charSequence.length();
                                                                    if (length3 <= length4) {
                                                                        length4 = length3;
                                                                    }
                                                                    int i47 = 0;
                                                                    while (true) {
                                                                        i27 = length4;
                                                                        if (i47 >= length4) {
                                                                            qVar2 = qVarB;
                                                                            break;
                                                                        }
                                                                        qVar2 = qVarB;
                                                                        if (gVar2.charAt(i47) != charSequence.charAt(i47)) {
                                                                            break;
                                                                        }
                                                                        i47++;
                                                                        length4 = i27;
                                                                        qVarB = qVar2;
                                                                    }
                                                                    int i48 = 0;
                                                                    while (true) {
                                                                        if (i48 >= i27 - i47) {
                                                                            i28 = i48;
                                                                            break;
                                                                        }
                                                                        i28 = i48;
                                                                        if (gVar2.charAt((length3 - 1) - i48) != charSequence.charAt((length4 - 1) - i28)) {
                                                                            break;
                                                                        } else {
                                                                            i48 = i28 + 1;
                                                                        }
                                                                    }
                                                                    int i49 = (length3 - i28) - i47;
                                                                    int i51 = (length4 - i28) - i47;
                                                                    j3.a0 a0Var8 = j3.w.J;
                                                                    boolean zB2 = o0Var.b(a0Var8);
                                                                    boolean zB3 = o0Var2.b(a0Var8);
                                                                    boolean zB4 = o0Var.b(j3.w.E);
                                                                    boolean z12 = zB4 && !zB2 && zB3;
                                                                    boolean z13 = zB4 && zB2 && !zB3;
                                                                    if (z12 || z13) {
                                                                        i22 = i41;
                                                                        int iA2 = A(i38);
                                                                        Integer numValueOf = Integer.valueOf(length4);
                                                                        i24 = i38;
                                                                        kVar4 = kVar;
                                                                        num4 = num8;
                                                                        accessibilityEventQ = q(iA2, num4, num8, numValueOf, charSequenceO);
                                                                    } else {
                                                                        i22 = i41;
                                                                        AccessibilityEvent accessibilityEventO2 = o(A(i38), 16);
                                                                        accessibilityEventO2.setFromIndex(i47);
                                                                        accessibilityEventO2.setRemovedCount(i49);
                                                                        accessibilityEventO2.setAddedCount(i51);
                                                                        accessibilityEventO2.setBeforeText(gVar2);
                                                                        accessibilityEventO2.getText().add(charSequenceO);
                                                                        accessibilityEventQ = accessibilityEventO2;
                                                                        kVar4 = kVar;
                                                                        num4 = num8;
                                                                        i24 = i38;
                                                                    }
                                                                    accessibilityEventQ.setClassName("android.widget.EditText");
                                                                    C(accessibilityEventQ);
                                                                    if (z12 || z13) {
                                                                        long j16 = ((m3.o0) kVar3.d(j3.w.F)).f75946a;
                                                                        num5 = num4;
                                                                        accessibilityEventQ.setFromIndex((int) (j16 >> 32));
                                                                        accessibilityEventQ.setToIndex((int) (j16 & 4294967295L));
                                                                        C(accessibilityEventQ);
                                                                    } else {
                                                                        num5 = num4;
                                                                    }
                                                                    Unit unit7 = Unit.f71706a;
                                                                    kVar = kVar4;
                                                                    num3 = num5;
                                                                    i25 = i42;
                                                                    i26 = i46;
                                                                    i23 = 8;
                                                                } else {
                                                                    qVar2 = qVarB;
                                                                    i22 = i41;
                                                                    i24 = i38;
                                                                    i23 = 8;
                                                                    E(this, A(i24), 2048, Integer.valueOf(i33), 8);
                                                                    num3 = num6;
                                                                    i25 = i42;
                                                                    i26 = i46;
                                                                }
                                                            }
                                                        }
                                                        i23 = 8;
                                                        i24 = i38;
                                                        i26 = i46;
                                                    }
                                                } else {
                                                    Object objD12 = o0Var.d(a0Var);
                                                    if (objD12 == null) {
                                                        objD12 = null;
                                                    }
                                                    if (Intrinsics.b(obj2, objD12)) {
                                                        num3 = num6;
                                                        i21 = i44;
                                                        qVar2 = qVarB;
                                                        i22 = i41;
                                                        i23 = i39;
                                                    }
                                                    layoutNode = layoutNode4;
                                                    i25 = i42;
                                                    i24 = i38;
                                                    arrayList3 = arrayList5;
                                                    kVar3 = kVar7;
                                                    i26 = i46;
                                                }
                                            } else {
                                                i19 = i37;
                                                i21 = i44;
                                                qVar2 = qVarB;
                                                i22 = i41;
                                                i23 = i39;
                                                layoutNode = layoutNode4;
                                                num3 = num6;
                                                i24 = i38;
                                                arrayList3 = arrayList5;
                                                kVar3 = kVar7;
                                                i25 = i42;
                                                i26 = length2;
                                            }
                                            j14 >>= i23;
                                            i42 = i25;
                                            num6 = num3;
                                            i39 = i23;
                                            kVar7 = kVar3;
                                            arrayList5 = arrayList3;
                                            i37 = i19;
                                            i41 = i22;
                                            c12 = 7;
                                            layoutNode4 = layoutNode;
                                            i44 = i21 + 1;
                                            length2 = i26;
                                            i38 = i24;
                                            qVarB = qVar2;
                                        }
                                        i11 = i37;
                                        qVar = qVarB;
                                        int i52 = i41;
                                        layoutNode3 = layoutNode4;
                                        num2 = num6;
                                        i15 = i38;
                                        arrayList2 = arrayList5;
                                        kVar2 = kVar7;
                                        i16 = i42;
                                        i17 = length2;
                                        if (i43 != i39) {
                                            break;
                                        } else {
                                            i18 = i52;
                                        }
                                    } else {
                                        i11 = i37;
                                        qVar = qVarB;
                                        layoutNode3 = layoutNode4;
                                        num2 = num6;
                                        i15 = i38;
                                        arrayList2 = arrayList5;
                                        kVar2 = kVar7;
                                        i16 = i42;
                                        i17 = length2;
                                        i18 = i41;
                                    }
                                    if (i18 == i17) {
                                        break;
                                    }
                                    i41 = i18 + 1;
                                    i40 = i16;
                                    num6 = num2;
                                    length2 = i17;
                                    kVar6 = kVar2;
                                    i38 = i15;
                                    arrayList5 = arrayList2;
                                    i37 = i11;
                                    qVarB = qVar;
                                    i39 = 8;
                                    c12 = 7;
                                }
                            } else {
                                i11 = i37;
                                kVar = kVar5;
                                arrayList2 = arrayList5;
                                qVar = qVarB;
                                num2 = num6;
                                i15 = i38;
                                zJ = false;
                            }
                            if (!zJ) {
                                zJ = k0.j(qVar, kVar);
                            }
                            if (zJ) {
                                i12 = 8;
                                E(this, A(i15), 2048, num2, 8);
                            } else {
                                i12 = 8;
                            }
                        }
                    }
                    j12 >>= i12;
                    mVar2 = mVar;
                    num6 = num2;
                    i35 = i12;
                    iArr3 = iArr2;
                    jArr3 = jArr2;
                    i32 = i14;
                    i36 = i13;
                    arrayList5 = arrayList2;
                    i37 = i11 + 1;
                    c11 = 7;
                }
                num = num6;
                arrayList = arrayList5;
                iArr = iArr3;
                jArr = jArr3;
                int i53 = i32;
                if (i36 != i35) {
                    return;
                } else {
                    i5 = i53;
                }
            } else {
                num = num6;
                arrayList = arrayList5;
                iArr = iArr3;
                jArr = jArr3;
                i5 = i32;
            }
            if (i5 == i34) {
                return;
            }
            i32 = i5 + 1;
            mVar2 = mVar;
            length = i34;
            num6 = num;
            i29 = i33;
            iArr3 = iArr;
            jArr3 = jArr;
            arrayList5 = arrayList;
            i31 = 0;
        }
    }

    public final void I(LayoutNode layoutNode, z.d0 d0Var) {
        j3.k semanticsConfiguration;
        LayoutNode layoutNodeD;
        if (layoutNode.isAttached() && !this.f19328d.getAndroidViewsHandler$ui_release().f19378b.containsKey(layoutNode)) {
            if (!layoutNode.getNodes().m44hasH91voCI$ui_release(8)) {
                layoutNode = k0.d(layoutNode, v.f19447m);
            }
            if (layoutNode == null || (semanticsConfiguration = layoutNode.getSemanticsConfiguration()) == null) {
                return;
            }
            if (!semanticsConfiguration.f68814c && (layoutNodeD = k0.d(layoutNode, v.f19446l)) != null) {
                layoutNode = layoutNodeD;
            }
            int semanticsId = layoutNode.getSemanticsId();
            if (d0Var.b(semanticsId)) {
                E(this, A(semanticsId), 2048, 1, 8);
            }
        }
    }

    public final void J(LayoutNode layoutNode) {
        if (layoutNode.isAttached() && !this.f19328d.getAndroidViewsHandler$ui_release().f19378b.containsKey(layoutNode)) {
            int semanticsId = layoutNode.getSemanticsId();
            j3.i iVar = (j3.i) this.f19342t.b(semanticsId);
            j3.i iVar2 = (j3.i) this.f19343u.b(semanticsId);
            if (iVar == null && iVar2 == null) {
                return;
            }
            AccessibilityEvent accessibilityEventO = o(semanticsId, androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
            if (iVar != null) {
                accessibilityEventO.setScrollX((int) ((Number) iVar.f68786a.invoke()).floatValue());
                accessibilityEventO.setMaxScrollX((int) ((Number) iVar.f68787b.invoke()).floatValue());
            }
            if (iVar2 != null) {
                accessibilityEventO.setScrollY((int) ((Number) iVar2.f68786a.invoke()).floatValue());
                accessibilityEventO.setMaxScrollY((int) ((Number) iVar2.f68787b.invoke()).floatValue());
            }
            C(accessibilityEventO);
        }
    }

    public final boolean K(j3.q qVar, int i5, int i11, boolean z11) {
        String strU;
        j3.k kVar = qVar.f68823d;
        int i12 = qVar.f68826g;
        j3.a0 a0Var = j3.j.f68796i;
        if (kVar.f68812a.b(a0Var) && k0.b(qVar)) {
            Function3 function3 = (Function3) ((j3.a) kVar.d(a0Var)).f68765b;
            if (function3 != null) {
                return ((Boolean) function3.invoke(Integer.valueOf(i5), Integer.valueOf(i11), Boolean.valueOf(z11))).booleanValue();
            }
        } else if ((i5 != i11 || i11 != this.f19346x) && (strU = u(qVar)) != null) {
            if (i5 < 0 || i5 != i11 || i11 > strU.length()) {
                i5 = -1;
            }
            this.f19346x = i5;
            boolean z12 = strU.length() > 0;
            C(q(A(i12), z12 ? Integer.valueOf(this.f19346x) : null, z12 ? Integer.valueOf(this.f19346x) : null, z12 ? Integer.valueOf(strU.length()) : null, strU));
            G(i12);
            return true;
        }
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:52:0x0141, code lost:
    
        r28 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x014b, code lost:
    
        if (((r7 & ((~r7) << 6)) & r20) == 0) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x014d, code lost:
    
        r25 = -1;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0066  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void P() {
        long j11;
        long j12;
        long j13;
        char c11;
        long[] jArr;
        long[] jArr2;
        long j14;
        int i5;
        int i11;
        int iNumberOfTrailingZeros;
        char c12;
        z.d0 d0Var = new z.d0();
        z.d0 d0Var2 = this.E;
        int[] iArr = d0Var2.f97807b;
        long[] jArr3 = d0Var2.f97806a;
        int length = jArr3.length - 2;
        z.c0 c0Var = this.K;
        int i12 = 8;
        if (length >= 0) {
            int i13 = 0;
            j11 = 128;
            j12 = 255;
            while (true) {
                long j15 = jArr3[i13];
                char c13 = 7;
                j13 = -9187201950435737472L;
                if ((((~j15) << 7) & j15 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i14 = 8 - ((~(i13 - length)) >>> 31);
                    int i15 = 0;
                    while (i15 < i14) {
                        if ((j15 & 255) < 128) {
                            int i16 = iArr[(i13 << 3) + i15];
                            c12 = c13;
                            j3.r rVar = (j3.r) t().b(i16);
                            j3.q qVarB = rVar != null ? rVar.b() : null;
                            if (qVarB != null) {
                                if (!qVarB.f68823d.f68812a.b(j3.w.f68855d)) {
                                    d0Var.b(i16);
                                    b3 b3Var = (b3) c0Var.b(i16);
                                    if (b3Var != null) {
                                        Object objD = b3Var.f19231a.f68812a.d(j3.w.f68855d);
                                        str = objD != 0 ? objD : null;
                                    }
                                    F(i16, 32, str);
                                }
                            }
                        } else {
                            c12 = c13;
                        }
                        j15 >>= 8;
                        i15++;
                        c13 = c12;
                    }
                    c11 = c13;
                    if (i14 != 8) {
                        break;
                    }
                } else {
                    c11 = 7;
                }
                if (i13 == length) {
                    break;
                } else {
                    i13++;
                }
            }
        } else {
            j11 = 128;
            j12 = 255;
            j13 = -9187201950435737472L;
            c11 = 7;
        }
        int[] iArr2 = d0Var.f97807b;
        long[] jArr4 = d0Var.f97806a;
        int length2 = jArr4.length - 2;
        if (length2 >= 0) {
            int i17 = 0;
            while (true) {
                long j16 = jArr4[i17];
                if ((((~j16) << c11) & j16 & j13) != j13) {
                    int i18 = 8 - ((~(i17 - length2)) >>> 31);
                    int i19 = 0;
                    while (i19 < i18) {
                        if ((j16 & j12) < j11) {
                            int i21 = iArr2[(i17 << 3) + i19];
                            int iHashCode = Integer.hashCode(i21) * (-862048943);
                            int i22 = iHashCode ^ (iHashCode << 16);
                            int i23 = i22 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
                            int i24 = d0Var2.f97808c;
                            int i25 = (i22 >>> 7) & i24;
                            i5 = i12;
                            int i26 = 0;
                            while (true) {
                                long[] jArr5 = d0Var2.f97806a;
                                int i27 = i25 >> 3;
                                jArr2 = jArr4;
                                int i28 = (i25 & 7) << 3;
                                j14 = j16;
                                long j17 = (jArr5[i27] >>> i28) | ((jArr5[i27 + 1] << (64 - i28)) & ((-i28) >> 63));
                                int i29 = i24;
                                long j18 = (i23 * 72340172838076673L) ^ j17;
                                long j19 = (j18 - 72340172838076673L) & (~j18) & j13;
                                while (true) {
                                    if (j19 == 0) {
                                        break;
                                    }
                                    iNumberOfTrailingZeros = (i25 + (Long.numberOfTrailingZeros(j19) >> 3)) & i29;
                                    int i31 = i29;
                                    if (d0Var2.f97807b[iNumberOfTrailingZeros] == i21) {
                                        break;
                                    }
                                    j19 &= j19 - 1;
                                    i29 = i31;
                                }
                                i26 += 8;
                                i25 = (i25 + i26) & i11;
                                jArr4 = jArr2;
                                i24 = i11;
                                j16 = j14;
                            }
                            int i32 = iNumberOfTrailingZeros;
                            if (i32 >= 0) {
                                d0Var2.f(i32);
                            }
                        } else {
                            jArr2 = jArr4;
                            j14 = j16;
                            i5 = i12;
                        }
                        j16 = j14 >> i5;
                        i19++;
                        i12 = i5;
                        jArr4 = jArr2;
                    }
                    jArr = jArr4;
                    if (i18 != i12) {
                        break;
                    }
                } else {
                    jArr = jArr4;
                }
                if (i17 == length2) {
                    break;
                }
                i17++;
                jArr4 = jArr;
                i12 = 8;
            }
        }
        c0Var.c();
        z.m mVarT = t();
        int[] iArr3 = mVarT.f97795b;
        Object[] objArr = mVarT.f97796c;
        long[] jArr6 = mVarT.f97794a;
        int length3 = jArr6.length - 2;
        if (length3 >= 0) {
            int i33 = 0;
            while (true) {
                long j21 = jArr6[i33];
                if ((((~j21) << c11) & j21 & j13) != j13) {
                    int i34 = 8 - ((~(i33 - length3)) >>> 31);
                    for (int i35 = 0; i35 < i34; i35++) {
                        if ((j21 & j12) < j11) {
                            int i36 = (i33 << 3) + i35;
                            int i37 = iArr3[i36];
                            j3.r rVar2 = (j3.r) objArr[i36];
                            j3.k kVar = rVar2.b().f68823d;
                            j3.a0 a0Var = j3.w.f68855d;
                            if (kVar.f68812a.b(a0Var) && d0Var2.b(i37)) {
                                F(i37, 16, (String) rVar2.b().f68823d.d(a0Var));
                            }
                            c0Var.h(i37, new b3(rVar2.b(), t()));
                        }
                        j21 >>= 8;
                    }
                    if (i34 != 8) {
                        break;
                    }
                }
                if (i33 == length3) {
                    break;
                } else {
                    i33++;
                }
            }
        }
        this.L = new b3(this.f19328d.getSemanticsOwner().a(), t());
    }

    @Override // a5.b
    public final vm.c b(View view) {
        return this.n;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void j(int i5, b5.g gVar, String str, Bundle bundle) {
        j3.q qVarB;
        Region regionN;
        float[] fArrM;
        Rect rectL;
        RectF rectF;
        j3.r rVar = (j3.r) t().b(i5);
        if (rVar == null || (qVarB = rVar.b()) == null) {
            return;
        }
        j3.k kVar = qVarB.f68823d;
        z.o0 o0Var = kVar.f68812a;
        String strU = u(qVarB);
        if (Intrinsics.b(str, this.H)) {
            int iB = this.F.b(i5);
            if (iB != -1) {
                gVar.k().putInt(str, iB);
                return;
            }
            return;
        }
        if (Intrinsics.b(str, this.I)) {
            int iB2 = this.G.b(i5);
            if (iB2 != -1) {
                gVar.k().putInt(str, iB2);
                return;
            }
            return;
        }
        b3.t1 t1Var = null;
        if (o0Var.b(j3.j.f68788a) && bundle != null && Intrinsics.b(str, "android.view.accessibility.extra.DATA_TEXT_CHARACTER_LOCATION_KEY")) {
            int i11 = bundle.getInt("android.view.accessibility.extra.DATA_TEXT_CHARACTER_LOCATION_ARG_START_INDEX", -1);
            int i12 = bundle.getInt("android.view.accessibility.extra.DATA_TEXT_CHARACTER_LOCATION_ARG_LENGTH", -1);
            if (i12 > 0 && i11 >= 0) {
                if (i11 < (strU != null ? strU.length() : LayoutNode.NotPlacedPlaceOrder)) {
                    m3.l0 l0VarK = io.sentry.config.a.K(kVar);
                    if (l0VarK == null) {
                        return;
                    }
                    ArrayList arrayList = new ArrayList();
                    int i13 = 0;
                    while (i13 < i12) {
                        int i14 = i11 + i13;
                        if (i14 >= l0VarK.f75927a.f75914a.f75880b.length()) {
                            arrayList.add(t1Var);
                        } else {
                            h2.c cVarB = l0VarK.b(i14);
                            b3.t1 t1VarD = qVarB.d();
                            long jM = 0;
                            if (t1VarD != null) {
                                if (!t1VarD.isAttached()) {
                                    t1VarD = t1Var;
                                }
                                if (t1VarD != null) {
                                    jM = t1VarD.M(0L);
                                }
                            }
                            h2.c cVarJ = cVarB.j(jM);
                            h2.c cVarG = qVarB.g();
                            if ((cVarJ.h(cVarG) ? cVarJ.f(cVarG) : t1Var) != 0) {
                                AndroidComposeView androidComposeView = this.f19328d;
                                long jMo52localToScreenMKHz9U = androidComposeView.mo52localToScreenMKHz9U((Float.floatToRawIntBits(r9.f59019b) & 4294967295L) | (Float.floatToRawIntBits(r9.f59018a) << 32));
                                long jMo52localToScreenMKHz9U2 = androidComposeView.mo52localToScreenMKHz9U((Float.floatToRawIntBits(r9.f59020c) << 32) | (Float.floatToRawIntBits(r9.f59021d) & 4294967295L));
                                int i15 = (int) (jMo52localToScreenMKHz9U >> 32);
                                int i16 = (int) (jMo52localToScreenMKHz9U2 >> 32);
                                int i17 = (int) (jMo52localToScreenMKHz9U & 4294967295L);
                                int i18 = (int) (jMo52localToScreenMKHz9U2 & 4294967295L);
                                rectF = new RectF(Math.min(Float.intBitsToFloat(i15), Float.intBitsToFloat(i16)), Math.min(Float.intBitsToFloat(i17), Float.intBitsToFloat(i18)), Math.max(Float.intBitsToFloat(i15), Float.intBitsToFloat(i16)), Math.max(Float.intBitsToFloat(i17), Float.intBitsToFloat(i18)));
                            } else {
                                rectF = null;
                            }
                            arrayList.add(rectF);
                        }
                        i13++;
                        t1Var = null;
                    }
                    gVar.k().putParcelableArray(str, (Parcelable[]) arrayList.toArray(new RectF[0]));
                    return;
                }
            }
            Log.e("AccessibilityDelegate", "Invalid arguments for accessibility character locations");
            return;
        }
        j3.a0 a0Var = j3.w.f68874y;
        if (o0Var.b(a0Var) && bundle != null && Intrinsics.b(str, "androidx.compose.ui.semantics.testTag")) {
            Object objD = o0Var.d(a0Var);
            String str2 = (String) (objD == null ? null : objD);
            if (str2 != null) {
                gVar.k().putCharSequence(str, str2);
                return;
            }
            return;
        }
        if (Intrinsics.b(str, "androidx.compose.ui.semantics.id")) {
            gVar.k().putInt(str, qVarB.f68826g);
            return;
        }
        if (Intrinsics.b(str, "androidx.compose.ui.semantics.shapeType")) {
            Object objD2 = o0Var.d(j3.w.O);
            if (objD2 == null) {
                objD2 = null;
            }
            i2.v0 v0Var = (i2.v0) objD2;
            if (v0Var != null) {
                i2.r0 r0VarP = p(v0Var, qVarB);
                if (r0VarP instanceof i2.j0) {
                    gVar.k().putInt("androidx.compose.ui.semantics.shapeType", 0);
                    gVar.k().putParcelable("androidx.compose.ui.semantics.shapeRect", L(r0VarP));
                    return;
                } else if (r0VarP instanceof i2.k0) {
                    gVar.k().putInt("androidx.compose.ui.semantics.shapeType", 1);
                    gVar.k().putParcelable("androidx.compose.ui.semantics.shapeRect", L(r0VarP));
                    gVar.k().putFloatArray("androidx.compose.ui.semantics.shapeCorners", M(r0VarP));
                    return;
                } else {
                    if (!(r0VarP instanceof i2.i0)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    gVar.k().putInt("androidx.compose.ui.semantics.shapeType", 2);
                    gVar.k().putParcelable("androidx.compose.ui.semantics.shapeRegion", N(r0VarP));
                    return;
                }
            }
            return;
        }
        if (Intrinsics.b(str, "androidx.compose.ui.semantics.shapeRect")) {
            Object objD3 = o0Var.d(j3.w.O);
            if (objD3 == null) {
                objD3 = null;
            }
            i2.v0 v0Var2 = (i2.v0) objD3;
            if (v0Var2 == null || (rectL = L(p(v0Var2, qVarB))) == null) {
                return;
            }
            gVar.k().putParcelable("androidx.compose.ui.semantics.shapeRect", rectL);
            return;
        }
        if (Intrinsics.b(str, "androidx.compose.ui.semantics.shapeCorners")) {
            Object objD4 = o0Var.d(j3.w.O);
            i2.v0 v0Var3 = (i2.v0) (objD4 == null ? null : objD4);
            if (v0Var3 == null || (fArrM = M(p(v0Var3, qVarB))) == null) {
                return;
            }
            gVar.k().putFloatArray("androidx.compose.ui.semantics.shapeCorners", fArrM);
            return;
        }
        if (Intrinsics.b(str, "androidx.compose.ui.semantics.shapeRegion")) {
            Object objD5 = o0Var.d(j3.w.O);
            i2.v0 v0Var4 = (i2.v0) (objD5 == null ? null : objD5);
            if (v0Var4 == null || (regionN = N(p(v0Var4, qVarB))) == null) {
                return;
            }
            gVar.k().putParcelable("androidx.compose.ui.semantics.shapeRegion", regionN);
        }
    }

    public final Rect k(j3.r rVar) {
        y3.l lVarA = rVar.a();
        float fD = lVarA.d();
        float f11 = lVarA.f();
        long jFloatToRawIntBits = (Float.floatToRawIntBits(f11) & 4294967295L) | (Float.floatToRawIntBits(fD) << 32);
        AndroidComposeView androidComposeView = this.f19328d;
        long jMo52localToScreenMKHz9U = androidComposeView.mo52localToScreenMKHz9U(jFloatToRawIntBits);
        float fE = lVarA.e();
        float fA = lVarA.a();
        long jMo52localToScreenMKHz9U2 = androidComposeView.mo52localToScreenMKHz9U((Float.floatToRawIntBits(fE) << 32) | (Float.floatToRawIntBits(fA) & 4294967295L));
        int i5 = (int) (jMo52localToScreenMKHz9U >> 32);
        int i11 = (int) (jMo52localToScreenMKHz9U2 >> 32);
        int i12 = (int) (jMo52localToScreenMKHz9U & 4294967295L);
        int i13 = (int) (jMo52localToScreenMKHz9U2 & 4294967295L);
        return new Rect((int) Math.floor(Math.min(Float.intBitsToFloat(i5), Float.intBitsToFloat(i11))), (int) Math.floor(Math.min(Float.intBitsToFloat(i12), Float.intBitsToFloat(i13))), (int) Math.ceil(Math.max(Float.intBitsToFloat(i5), Float.intBitsToFloat(i11))), (int) Math.ceil(Math.max(Float.intBitsToFloat(i12), Float.intBitsToFloat(i13))));
    }

    /* JADX WARN: Code restructure failed: missing block: B:48:0x00f6, code lost:
    
        if (t70.t0.b(r5, r2) == r3) goto L49;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:26:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0079 A[Catch: all -> 0x0037, TryCatch #0 {all -> 0x0037, blocks: (B:13:0x0030, B:24:0x005d, B:28:0x0071, B:30:0x0079, B:32:0x0084, B:34:0x008a, B:35:0x0099, B:37:0x00a1, B:20:0x0047, B:23:0x004e), top: B:55:0x0026 }] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r4v8, types: [v70.n] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:48:0x00f6 -> B:50:0x00f9). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object l(Continuation continuation) throws Throwable {
        h0 h0Var;
        z.f fVar;
        z.d0 d0Var;
        v70.b bVar;
        z.d0 d0Var2;
        Object obj;
        int i5;
        long j11;
        Object objA;
        if (continuation instanceof h0) {
            h0Var = (h0) continuation;
            int i11 = h0Var.f19309x;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                h0Var.f19309x = i11 - Integer.MIN_VALUE;
            } else {
                h0Var = new h0(this, continuation);
            }
        }
        Object obj2 = h0Var.f19307v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = h0Var.f19309x;
        z.f fVar2 = this.f19348z;
        try {
            if (i12 == 0) {
                ResultKt.b(obj2);
                d0Var = new z.d0();
                v70.i iVar = this.A;
                iVar.getClass();
                bVar = new v70.b(iVar);
                h0Var.f19305t = d0Var;
                h0Var.f19306u = bVar;
                h0Var.f19309x = 1;
                v70.b bVar2 = bVar;
                objA = bVar2.a(h0Var);
                if (objA != coroutineSingletons) {
                }
            } else if (i12 == 1) {
                Object obj3 = h0Var.f19306u;
                d0Var2 = h0Var.f19305t;
                ResultKt.b(obj2);
                obj = obj3;
                if (((Boolean) obj2).booleanValue()) {
                }
            } else {
                if (i12 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ?? r42 = h0Var.f19306u;
                d0Var2 = h0Var.f19305t;
                ResultKt.b(obj2);
                char c11 = 2;
                fVar = fVar2;
                v70.b bVar3 = r42;
                d0Var = d0Var2;
                fVar2 = fVar;
                bVar = bVar3;
                h0Var.f19305t = d0Var;
                h0Var.f19306u = bVar;
                h0Var.f19309x = 1;
                v70.b bVar22 = bVar;
                objA = bVar22.a(h0Var);
                if (objA != coroutineSingletons) {
                    return coroutineSingletons;
                }
                d0Var2 = d0Var;
                obj2 = objA;
                obj = bVar22;
                if (((Boolean) obj2).booleanValue()) {
                    fVar2.clear();
                    return Unit.f71706a;
                }
                v70.b bVar4 = (v70.b) obj;
                bVar4.b();
                if (v()) {
                    int i13 = fVar2.f97766c;
                    for (int i14 = 0; i14 < i13; i14++) {
                        LayoutNode layoutNode = (LayoutNode) fVar2.f97765b[i14];
                        I(layoutNode, d0Var2);
                        J(layoutNode);
                    }
                    d0Var2.f97809d = 0;
                    long[] jArr = d0Var2.f97806a;
                    if (jArr != z.z0.f97875a) {
                        try {
                            u90.b.D(jArr, -9187201950435737472L);
                            long[] jArr2 = d0Var2.f97806a;
                            i5 = d0Var2.f97808c;
                            int i15 = i5 >> 3;
                            jArr2[i15] = ((~j11) & jArr2[i15]) | j11;
                        } catch (Throwable th2) {
                            th = th2;
                            fVar.clear();
                            throw th;
                        }
                        j11 = 255 << ((i5 & 7) << 3);
                        fVar = fVar2;
                    } else {
                        fVar = fVar2;
                    }
                    d0Var2.f97755e = z.z0.a(d0Var2.f97808c) - d0Var2.f97809d;
                    if (!this.M) {
                        this.M = true;
                        this.f19337m.post(this.O);
                    }
                } else {
                    fVar = fVar2;
                }
                fVar.clear();
                this.f19342t.c();
                this.f19343u.c();
                long j12 = this.f19333i;
                h0Var.f19305t = d0Var2;
                h0Var.f19306u = bVar4;
                c11 = 2;
                h0Var.f19309x = 2;
                bVar3 = bVar4;
            }
        } catch (Throwable th3) {
            th = th3;
            fVar = fVar2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00ba  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean m(long j11, int i5, boolean z11) {
        j3.a0 a0Var;
        if (!Intrinsics.b(Looper.getMainLooper().getThread(), Thread.currentThread())) {
            return false;
        }
        z.m mVarT = t();
        if (h2.b.b(j11, 9205357640488583168L) || (((9223372034707292159L & j11) + 36028792732385279L) & (-9223372034707292160L)) != 0) {
            return false;
        }
        if (z11) {
            a0Var = j3.w.f68870u;
        } else {
            if (z11) {
                throw new NoWhenBranchMatchedException();
            }
            a0Var = j3.w.f68869t;
        }
        Object[] objArr = mVarT.f97796c;
        long[] jArr = mVarT.f97794a;
        int length = jArr.length - 2;
        if (length < 0) {
            return false;
        }
        int i11 = 0;
        boolean z12 = false;
        while (true) {
            long j12 = jArr[i11];
            if ((((~j12) << 7) & j12 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i12 = 8 - ((~(i11 - length)) >>> 31);
                for (int i13 = 0; i13 < i12; i13++) {
                    if ((255 & j12) < 128) {
                        j3.r rVar = (j3.r) objArr[(i11 << 3) + i13];
                        if (p6.j.z(rVar.a()).a(j11)) {
                            Object objD = rVar.b().f68823d.f68812a.d(a0Var);
                            if (objD == null) {
                                objD = null;
                            }
                            j3.i iVar = (j3.i) objD;
                            if (iVar != null) {
                                Function0 function0 = iVar.f68786a;
                                if (i5 < 0) {
                                    if (((Number) function0.invoke()).floatValue() > 0.0f) {
                                        z12 = true;
                                    }
                                } else if (((Number) function0.invoke()).floatValue() < ((Number) iVar.f68787b.invoke()).floatValue()) {
                                }
                            }
                        }
                    }
                    j12 >>= 8;
                }
                if (i12 != 8) {
                    return z12;
                }
            }
            if (i11 == length) {
                return z12;
            }
            i11++;
        }
    }

    public final void n() {
        Trace.beginSection("sendAccessibilitySemanticsStructureChangeEvents");
        try {
            if (v()) {
                B(this.f19328d.getSemanticsOwner().a(), this.L);
            }
            Unit unit = Unit.f71706a;
            Trace.endSection();
            Trace.beginSection("sendSemanticsPropertyChangeEvents");
            try {
                H(t());
                Trace.endSection();
                Trace.beginSection("updateSemanticsNodesCopyAndPanes");
                try {
                    P();
                } finally {
                }
            } finally {
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final AccessibilityEvent o(int i5, int i11) {
        j3.r rVar;
        AccessibilityEvent accessibilityEventObtain = AccessibilityEvent.obtain(i11);
        accessibilityEventObtain.setEnabled(true);
        accessibilityEventObtain.setClassName("android.view.View");
        AndroidComposeView androidComposeView = this.f19328d;
        accessibilityEventObtain.setPackageName(androidComposeView.getContext().getPackageName());
        accessibilityEventObtain.setSource(androidComposeView, i5);
        if (v() && (rVar = (j3.r) t().b(i5)) != null) {
            accessibilityEventObtain.setPassword(rVar.b().f68823d.f68812a.b(j3.w.J));
            Object objD = rVar.b().f68823d.f68812a.d(j3.w.n);
            if (objD == null) {
                objD = null;
            }
            zg.a.W(accessibilityEventObtain, Intrinsics.b(objD, Boolean.TRUE));
        }
        return accessibilityEventObtain;
    }

    public final i2.r0 p(i2.v0 v0Var, j3.q qVar) {
        b3.t1 t1VarD = qVar.d();
        return v0Var.a(w20.e.t(t1VarD != null ? t1VarD.f98083c : 0L), qVar.f68822c.getLayoutDirection(), this.f19328d.getDensity());
    }

    public final AccessibilityEvent q(int i5, Integer num, Integer num2, Integer num3, CharSequence charSequence) {
        AccessibilityEvent accessibilityEventO = o(i5, UserMetadata.MAX_INTERNAL_KEY_SIZE);
        if (num != null) {
            accessibilityEventO.setFromIndex(num.intValue());
        }
        if (num2 != null) {
            accessibilityEventO.setToIndex(num2.intValue());
        }
        if (num3 != null) {
            accessibilityEventO.setItemCount(num3.intValue());
        }
        if (charSequence != null) {
            accessibilityEventO.getText().add(charSequence);
        }
        return accessibilityEventO;
    }

    public final int r(j3.q qVar) {
        j3.k kVar = qVar.f68823d;
        if (!kVar.f68812a.b(j3.w.f68852a)) {
            j3.a0 a0Var = j3.w.F;
            if (kVar.f68812a.b(a0Var)) {
                return (int) (((m3.o0) kVar.d(a0Var)).f75946a & 4294967295L);
            }
        }
        return this.f19346x;
    }

    public final int s(j3.q qVar) {
        j3.k kVar = qVar.f68823d;
        if (!kVar.f68812a.b(j3.w.f68852a)) {
            j3.a0 a0Var = j3.w.F;
            if (kVar.f68812a.b(a0Var)) {
                return (int) (((m3.o0) kVar.d(a0Var)).f75946a >> 32);
            }
        }
        return this.f19346x;
    }

    public final z.m t() {
        if (this.B) {
            this.B = false;
            AndroidComposeView androidComposeView = this.f19328d;
            this.D = j3.t.a(androidComposeView.getSemanticsOwner());
            if (v()) {
                k0.k(this.D, this.F, this.G, androidComposeView.getContext().getResources());
            }
        }
        return this.D;
    }

    public final boolean v() {
        if (this.f19332h) {
            return true;
        }
        return this.f19331g.isEnabled() && !this.f19336l.isEmpty();
    }

    public final void w(LayoutNode layoutNode) {
        if (this.f19348z.add(layoutNode)) {
            this.A.j(Unit.f71706a);
        }
    }
}
