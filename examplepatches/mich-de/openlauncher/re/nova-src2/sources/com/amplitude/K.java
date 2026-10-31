package com.amplitude;

import android.view.View;
import androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifier;
import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.text.input.ImeOptions;
import com.amplitude.android.sessionreplay.config.MaskLevel;
import com.amplitude.android.sessionreplay.config.PrivacyConfig;
import com.amplitude.common.Logger;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import kotlin.Lazy;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.sequences.Sequence;
import kotlin.sequences.SequencesKt;

/* loaded from: classes2.dex */
public final class K {

    /* renamed from: d, reason: collision with root package name */
    public static final Set f20294d = kotlin.collections.c.f1(new String[]{"SharedBoundsNode", "HazeEffectNode", "HazeSourceNode", "MarqueeModifierNode"});

    /* renamed from: a, reason: collision with root package name */
    public final K3 f20295a;

    /* renamed from: b, reason: collision with root package name */
    public final u4 f20296b;

    /* renamed from: c, reason: collision with root package name */
    public final M f20297c;

    public K(K3 logger, u4 viewCache, M nodeCache) {
        Intrinsics.g(logger, "logger");
        Intrinsics.g(viewCache, "viewCache");
        Intrinsics.g(nodeCache, "nodeCache");
        this.f20295a = logger;
        this.f20296b = viewCache;
        this.f20297c = nodeCache;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:132:0x0289 A[LOOP:1: B:130:0x0283->B:132:0x0289, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:135:0x02a1  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x02a4  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x02a8  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x02ad  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x02b8  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x02bb  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x02bf  */
    /* JADX WARN: Removed duplicated region for block: B:212:0x0464  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00ec  */
    /* JADX WARN: Type inference failed for: r5v17, types: [kotlin.collections.EmptyList] */
    /* JADX WARN: Type inference failed for: r5v18, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r5v19, types: [java.util.ArrayList] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Pair a(L hierarchyNode) {
        Object obj;
        Modifier$Node modifier$Node;
        boolean z11;
        r3.o oVar;
        long j11;
        Object children;
        boolean z12;
        int i5;
        Field field;
        String str;
        K3 k32;
        i2.s0 s0Var;
        String nameFallback;
        m3.g gVar;
        e0.a2 a2Var;
        Intrinsics.g(hierarchyNode, "hierarchyNode");
        z2.a0 a0Var = hierarchyNode.f20307a;
        String str2 = "<this>";
        Intrinsics.g(a0Var, "<this>");
        if (!a0Var.isAttached() || !a0Var.isPlaced() || a0Var.getWidth() <= 0 || a0Var.getHeight() <= 0) {
            return K0.f20298a;
        }
        u4 u4Var = this.f20296b;
        u4Var.getClass();
        Map map = (Map) u4Var.f20785g.getValue();
        Integer numValueOf = Integer.valueOf(System.identityHashCode(a0Var));
        Object objValueOf = map.get(numValueOf);
        if (objValueOf == null) {
            objValueOf = Integer.valueOf(AbstractC0484n1.a());
            map.put(numValueOf, objValueOf);
        }
        int iIntValue = ((Number) objValueOf).intValue();
        C0436f2 c0436f2 = hierarchyNode.f20308b;
        List<z2.y0> modifierInfo = a0Var.getModifierInfo();
        h2.c cVarD = z2.r1.d(a0Var.getCoordinates());
        z2.y0 y0Var = (z2.y0) b70.g.Y0(modifierInfo);
        h2.c cVarD2 = y0Var != null ? z2.r1.d(y0Var.f98179b) : cVarD;
        long jF = h2.b.f(cVarD.d(), cVarD2.d());
        if (!modifierInfo.isEmpty()) {
            cVarD = cVarD2;
        }
        h2.c cVarJ = cVarD.j(hierarchyNode.f20310d);
        float fH = c0436f2.h();
        K3 k33 = this.f20295a;
        ArrayList arrayList = new ArrayList(modifierInfo.size());
        r1.e eVar = null;
        float f11 = fH;
        String str3 = null;
        String str4 = null;
        r3.o oVar2 = null;
        int i11 = 0;
        int i12 = 0;
        boolean z13 = false;
        for (z2.y0 y0Var2 : modifierInfo) {
            b2.t tVar = y0Var2.f98178a;
            c3.o2 o2Var = tVar instanceof c3.o2 ? (c3.o2) tVar : null;
            String str5 = str3;
            int iHashCode = tVar.hashCode();
            int i13 = iIntValue;
            if (str4 == null && (tVar instanceof W0)) {
                str4 = ((W0) tVar).f20418a;
            }
            if (o2Var == null || (nameFallback = o2Var.getNameFallback()) == null) {
                str = str2;
                k32 = k33;
                s0Var = null;
            } else {
                switch (nameFallback.hashCode()) {
                    case -1655159396:
                        str = str2;
                        k32 = k33;
                        if (nameFallback.equals("layoutInScroll")) {
                            Sequence<c3.g3> inspectableElements = o2Var.getInspectableElements();
                            LinkedHashMap linkedHashMap = new LinkedHashMap();
                            for (c3.g3 g3Var : inspectableElements) {
                                linkedHashMap.put(g3Var.f19302a, g3Var.f19303b);
                            }
                            Object obj2 = linkedHashMap.get("isVertical");
                            Boolean bool = !(obj2 instanceof Boolean) ? (Boolean) obj2 : null;
                            boolean zBooleanValue = bool == null ? bool.booleanValue() : false;
                            Object obj3 = linkedHashMap.get("state");
                            a2Var = !(obj3 instanceof e0.a2) ? (e0.a2) obj3 : null;
                            if (a2Var != null) {
                                int iH = a2Var.h();
                                if (zBooleanValue) {
                                    i12 = iH;
                                } else {
                                    i11 = iH;
                                }
                            }
                        }
                        s0Var = null;
                        break;
                    case -1291263515:
                        str = str2;
                        k32 = k33;
                        if (!nameFallback.equals("layoutId")) {
                            s0Var = null;
                            break;
                        } else {
                            Object valueOverride = o2Var.getValueOverride();
                            if (!(valueOverride instanceof String)) {
                                s0Var = null;
                                str5 = null;
                                break;
                            } else {
                                str5 = (String) valueOverride;
                                s0Var = null;
                            }
                        }
                    case -1016587898:
                        if (nameFallback.equals("graphicsLayer")) {
                            Sequence inspectableElements2 = o2Var.getInspectableElements();
                            LinkedHashMap linkedHashMap2 = new LinkedHashMap();
                            Iterator f71970a = inspectableElements2.getF71970a();
                            while (f71970a.hasNext()) {
                                String str6 = str2;
                                c3.g3 g3Var2 = (c3.g3) f71970a.next();
                                linkedHashMap2.put(g3Var2.f19302a, g3Var2.f19303b);
                                f71970a = f71970a;
                                str2 = str6;
                            }
                            str = str2;
                            Object obj4 = linkedHashMap2.get("block");
                            Function1 function1 = TypeIntrinsics.f(1, obj4) ? (Function1) obj4 : null;
                            if (function1 != null) {
                                int i14 = i2.b0.f61099b;
                                s0Var = new i2.s0();
                                function1.invoke(s0Var);
                                k32 = k33;
                                break;
                            } else {
                                int i15 = i2.b0.f61099b;
                                s0Var = new i2.s0();
                                Object obj5 = linkedHashMap2.get("alpha");
                                k32 = k33;
                                Float f12 = obj5 instanceof Float ? (Float) obj5 : null;
                                s0Var.a(f12 != null ? f12.floatValue() : 1.0f);
                                Object obj6 = linkedHashMap2.get("translationX");
                                Float f13 = obj6 instanceof Float ? (Float) obj6 : null;
                                s0Var.q(f13 != null ? f13.floatValue() : 0.0f);
                                Object obj7 = linkedHashMap2.get("translationY");
                                Float f14 = obj7 instanceof Float ? (Float) obj7 : null;
                                s0Var.t(f14 != null ? f14.floatValue() : 0.0f);
                                break;
                            }
                        }
                        str = str2;
                        k32 = k33;
                        s0Var = null;
                        break;
                    case -932820115:
                        if (nameFallback.equals("semantics") && oVar2 == null) {
                            j3.m mVar = o2Var instanceof j3.m ? (j3.m) o2Var : null;
                            j3.k semanticsConfiguration = mVar != null ? mVar.getSemanticsConfiguration() : null;
                            if (semanticsConfiguration != null) {
                                Object objD = semanticsConfiguration.f68812a.d(j3.w.E);
                                if (objD == null) {
                                    objD = null;
                                }
                                gVar = (m3.g) objD;
                            } else {
                                gVar = null;
                            }
                            if (gVar != null) {
                                str = str2;
                                oVar2 = new r3.o(0);
                            }
                            k32 = k33;
                            s0Var = null;
                            break;
                        }
                        break;
                    case -907680051:
                        if (nameFallback.equals("scroll")) {
                            str = str2;
                            k32 = k33;
                            Sequence<c3.g3> inspectableElements3 = o2Var.getInspectableElements();
                            LinkedHashMap linkedHashMap3 = new LinkedHashMap();
                            while (r3.hasNext()) {
                            }
                            Object obj22 = linkedHashMap3.get("isVertical");
                            if (!(obj22 instanceof Boolean)) {
                            }
                            if (bool == null) {
                            }
                            Object obj32 = linkedHashMap3.get("state");
                            if (!(obj32 instanceof e0.a2)) {
                            }
                            if (a2Var != null) {
                            }
                            s0Var = null;
                            break;
                        }
                        str = str2;
                        k32 = k33;
                        s0Var = null;
                        break;
                    case 1074836940:
                        if (nameFallback.equals("TextStringSimpleElement")) {
                            str = str2;
                            k32 = k33;
                            s0Var = null;
                            z13 = true;
                            break;
                        }
                        str = str2;
                        k32 = k33;
                        s0Var = null;
                        break;
                    case 1333397558:
                        if (nameFallback.equals("CoreTextFieldSemanticsModifier")) {
                            b2.t tVar2 = y0Var2.f98178a;
                            Intrinsics.g(tVar2, str2);
                            CoreTextFieldSemanticsModifier coreTextFieldSemanticsModifier = tVar2 instanceof CoreTextFieldSemanticsModifier ? (CoreTextFieldSemanticsModifier) tVar2 : null;
                            ImeOptions imeOptionsD = coreTextFieldSemanticsModifier != null ? coreTextFieldSemanticsModifier.getImeOptions() : null;
                            if (imeOptionsD != null) {
                                str = str2;
                                k32 = k33;
                                oVar2 = new r3.o(imeOptionsD.getKeyboardType());
                                s0Var = null;
                                break;
                            } else {
                                k33.getClass();
                                Logger logger = k33.f20306a;
                                if (logger != null) {
                                    logger.warn("Unable to extract ImeOptions from CoreTextFieldSemanticsModifier");
                                }
                            }
                        }
                        str = str2;
                        k32 = k33;
                        s0Var = null;
                }
            }
            arrayList.add(new C0362a1(y0Var2, iHashCode, o2Var, s0Var));
            if (s0Var != null) {
                f11 *= s0Var.f61152d;
            }
            k33 = k32;
            str3 = str5;
            iIntValue = i13;
            str2 = str;
        }
        String str7 = str3;
        int i16 = iIntValue;
        String str8 = str7 == null ? "unknown" : str7;
        String strO = c0436f2.o();
        if (str4 == null) {
            str4 = strO;
        }
        boolean zB = Intrinsics.b(str4, "amp-block");
        b3.y yVar = a0Var instanceof b3.y ? (b3.y) a0Var : null;
        View interopView = yVar != null ? yVar.getInteropView() : null;
        float f15 = cVarJ.f59018a;
        float f16 = cVarJ.f59019b;
        String str9 = str4;
        View view = interopView;
        C0436f2 c0436f22 = new C0436f2(i16, str8, zB, null, (int) f15, (int) f16, 0.0f, (int) (cVarJ.f59020c - f15), (int) (cVarJ.f59021d - f16), i11, i12, null, str9, null, false, null, c0436f2.h(), f11, 435675436);
        c0436f2.a(c0436f22);
        if (c0436f22.C()) {
            Pair pair = K0.f20298a;
            return new Pair(c0436f22, EmptyList.f71733a);
        }
        if (view != null) {
            Pair pair2 = K0.f20298a;
            return new Pair(c0436f22, ul.b.P(new C0519u(view, c0436f22)));
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        int size = arrayList.size();
        int i17 = 0;
        while (i17 < size) {
            Object obj8 = arrayList.get(i17);
            i17++;
            arrayList2.add(Integer.valueOf(((C0362a1) obj8).f20465b));
        }
        M m11 = this.f20297c;
        m11.getClass();
        WeakHashMap weakHashMap = m11.f20322a;
        Object obj9 = weakHashMap.get(a0Var);
        if (obj9 == null) {
            obj9 = EmptyList.f71733a;
            weakHashMap.put(a0Var, obj9);
        }
        Intrinsics.f(obj9, "getOrPut(...)");
        List list = (List) obj9;
        boolean zEquals = list.equals(arrayList2);
        if (!zEquals && this.f20295a.a(Logger.LogMode.DEBUG)) {
            int size2 = list.size();
            for (int i18 = 0; i18 < size2; i18++) {
                if (i18 >= arrayList2.size() || ((Number) list.get(i18)).intValue() != ((Number) arrayList2.get(i18)).intValue()) {
                    K3 k34 = this.f20295a;
                    ArrayList arrayList3 = new ArrayList(b70.c.u0(modifierInfo, 10));
                    Iterator it = modifierInfo.iterator();
                    while (it.hasNext()) {
                        arrayList3.add(((z2.y0) it.next()).f98178a);
                    }
                    k34.debug("Modifier hash changed for node: " + i16 + ", layoutInfo: " + a0Var + ", modifiers: " + arrayList3 + " ");
                }
            }
        }
        if (!zEquals) {
            M m12 = this.f20297c;
            m12.getClass();
            m12.f20322a.put(a0Var, arrayList2);
        }
        Lazy lazy = AbstractC0472l1.f20656a;
        try {
            field = (Field) V0.f20403c.getValue();
        } catch (Throwable unused) {
        }
        Object obj10 = field != null ? field.get(a0Var) : null;
        if (obj10 != null) {
            try {
                Field field2 = (Field) AbstractC0472l1.f20657b.getValue();
                obj = field2 != null ? field2.get(obj10) : null;
            } catch (Throwable unused2) {
            }
            modifier$Node = obj instanceof Modifier$Node ? (Modifier$Node) obj : null;
        }
        List listA0 = SequencesKt.A0(q70.d.p0(modifier$Node, C0447h1.f20593a));
        Iterator it2 = arrayList.iterator();
        Iterator it3 = listA0.iterator();
        ArrayList arrayList4 = new ArrayList(Math.min(b70.c.u0(arrayList, 10), b70.c.u0(listA0, 10)));
        boolean z14 = false;
        while (it2.hasNext() && it3.hasNext()) {
            C0362a1 c0362a1 = (C0362a1) it2.next();
            b3.q qVarA = a((Modifier$Node) it3.next());
            if (qVarA != null) {
                z14 = true;
            }
            arrayList4.add(new C0387b1(c0362a1, qVarA));
        }
        r3.o oVar3 = oVar2 == null ? hierarchyNode.f20311e : oVar2;
        PrivacyConfig isNodeMasked = this.f20296b.f20779a;
        Intrinsics.g(isNodeMasked, "$this$isNodeMasked");
        if (Intrinsics.b(str9, "amp-unmask")) {
            z11 = false;
        } else {
            if (Intrinsics.b(str9, "amp-mask")) {
                z12 = true;
            } else {
                MaskLevel maskLevel = isNodeMasked.getMaskLevel();
                int i19 = maskLevel == null ? -1 : N.f20332a[maskLevel.ordinal()];
                if (i19 != -1) {
                    z12 = true;
                    if (i19 != 1) {
                        if (i19 != 2) {
                            if (i19 != 3) {
                                throw new NoWhenBranchMatchedException();
                            }
                            if (oVar3 != null || z13) {
                            }
                        } else if (oVar3 == null || z13) {
                        }
                    } else if (oVar3 == null || (((i5 = oVar3.f85453a) != 4 && i5 != 7 && i5 != 8 && i5 != 6) || z13)) {
                    }
                }
                z11 = false;
            }
            z11 = z12;
        }
        if (z14) {
            Y3 y3X = c0436f22.x();
            u4 u4Var2 = this.f20296b;
            int iQ = c0436f22.q();
            String strY = c0436f22.y();
            int iZ = c0436f22.z();
            int iJ = c0436f22.j();
            Q q5 = new Q(strY, iZ, iJ, a0Var.getDensity(), a0Var.getLayoutDirection(), cVarD2.d(), arrayList4, c0436f2.h(), z11);
            u4Var2.getClass();
            Object objC = u4Var2.f20781c.c(Integer.valueOf(iQ));
            J j12 = objC instanceof J ? (J) objC : null;
            if (j12 == null || j12.f20282b != iZ || j12.f20283c != iJ || !zEquals) {
                j12 = new J(q5, u4Var2.f20780b);
                u4Var2.f20781c.d(Integer.valueOf(iQ), j12);
            }
            y3X.f20448a = j12;
        }
        try {
            Lazy lazy2 = V0.f20401a;
            List listF = ((LayoutNode) a0Var).getZSortedChildren().f();
            children = new ArrayList(b70.c.u0(listF, 10));
            Iterator it4 = ((r1.b) listF).iterator();
            while (it4.hasNext()) {
                oVar = oVar3;
                j11 = jF;
                try {
                    children.add(new L((z2.a0) it4.next(), c0436f22, hierarchyNode.f20309c, j11, oVar));
                    jF = j11;
                    oVar3 = oVar;
                } catch (Throwable unused3) {
                    try {
                        Field field3 = (Field) V0.f20402b.getValue();
                        Object obj11 = field3 != null ? field3.get(a0Var) : null;
                        if (obj11 instanceof r1.e) {
                            eVar = (r1.e) obj11;
                        }
                    } catch (Throwable unused4) {
                    }
                    if (eVar != null) {
                        List listF2 = eVar.f();
                        children = new ArrayList(b70.c.u0(listF2, 10));
                        Iterator it5 = ((r1.b) listF2).iterator();
                        while (it5.hasNext()) {
                            children.add(new L((z2.a0) it5.next(), c0436f22, hierarchyNode.f20309c, j11, oVar));
                        }
                    } else {
                        children = EmptyList.f71733a;
                    }
                    Pair pair3 = K0.f20298a;
                    Intrinsics.g(children, "children");
                    return new Pair(c0436f22, children);
                }
            }
        } catch (Throwable unused5) {
            oVar = oVar3;
            j11 = jF;
        }
        Pair pair32 = K0.f20298a;
        Intrinsics.g(children, "children");
        return new Pair(c0436f22, children);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0066  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static b3.q a(Modifier$Node modifier$Node) {
        Object obj;
        Modifier$Node delegate$ui;
        b3.q qVar;
        Object obj2;
        Integer numValueOf;
        if (modifier$Node instanceof b3.q) {
            b3.q qVar2 = (b3.q) modifier$Node;
            String simpleName = qVar2.getNode().getClass().getSimpleName();
            if (f20294d.contains(simpleName)) {
                qVar = null;
            } else {
                qVar = modifier$Node;
                if (simpleName.equals("BackwardsCompatNode")) {
                    try {
                        Lazy lazy = AbstractC0429e1.f20552a;
                        Modifier$Node node = qVar2.getNode();
                        Intrinsics.g(node, "<this>");
                        numValueOf = Integer.valueOf(node.getKindSet$ui());
                    } catch (Throwable unused) {
                        Lazy lazy2 = AbstractC0429e1.f20552a;
                        Modifier$Node node2 = qVar2.getNode();
                        Intrinsics.g(node2, "<this>");
                        try {
                            Field field = (Field) AbstractC0429e1.f20552a.getValue();
                            obj2 = field != null ? field.get(node2) : null;
                        } catch (Throwable unused2) {
                        }
                        numValueOf = obj2 instanceof Integer ? (Integer) obj2 : null;
                    }
                    if (numValueOf != null) {
                        qVar = modifier$Node;
                        if (numValueOf.intValue() != 4) {
                        }
                    }
                }
            }
            return qVar;
        }
        if (!(modifier$Node instanceof DelegatingNode)) {
            return null;
        }
        try {
            Lazy lazy3 = AbstractC0429e1.f20552a;
            delegate$ui = ((DelegatingNode) modifier$Node).getDelegate$ui();
        } catch (Throwable unused3) {
            DelegatingNode delegatingNode = (DelegatingNode) modifier$Node;
            try {
                Field field2 = (Field) AbstractC0429e1.f20553b.getValue();
                obj = field2 != null ? field2.get(delegatingNode) : null;
            } catch (Throwable unused4) {
            }
            delegate$ui = obj instanceof Modifier$Node ? (Modifier$Node) obj : null;
        }
        if (delegate$ui != null) {
            return a(delegate$ui);
        }
        return null;
    }
}
