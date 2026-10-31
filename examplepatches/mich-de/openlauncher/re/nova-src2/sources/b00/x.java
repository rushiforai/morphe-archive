package b00;

import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.Typeface;
import android.os.SystemClock;
import android.text.Html;
import android.view.View;
import b.z9;
import c0.c2;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;
import k0.h2;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import p1.v1;

/* loaded from: classes.dex */
public final /* synthetic */ class x implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16485a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f16486b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f16487c;

    public /* synthetic */ x(int i5, Object obj, Object obj2) {
        this.f16485a = i5;
        this.f16486b = obj;
        this.f16487c = obj2;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    /* JADX WARN: Removed duplicated region for block: B:204:0x03f0  */
    /* JADX WARN: Removed duplicated region for block: B:205:0x03fa  */
    /* JADX WARN: Removed duplicated region for block: B:207:0x041c  */
    /* JADX WARN: Removed duplicated region for block: B:222:0x0451  */
    /* JADX WARN: Removed duplicated region for block: B:223:0x0453  */
    /* JADX WARN: Removed duplicated region for block: B:225:0x045b A[ORIG_RETURN, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0088  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        q3.b0 b0Var;
        Function1 function1;
        int i5;
        List list;
        q3.b0 b0Var2;
        Continuation continuation;
        Object n0Var;
        Typeface typefaceR;
        Object o0Var;
        String str;
        String string;
        switch (this.f16485a) {
            case 0:
                h6.a0 a0Var = (h6.a0) this.f16486b;
                int i11 = 0;
                a0 a0Var2 = new a0((p1.e1) this.f16487c, i11);
                a0Var.getLifecycle().a(a0Var2);
                return new g0(i11, a0Var, a0Var2);
            case 1:
                c2 c2Var = (c2) this.f16486b;
                c2 c2Var2 = (c2) this.f16487c;
                c2Var.f18739j.add(c2Var2);
                return new g0(3, c2Var, c2Var2);
            case 2:
                k0.j1 j1Var = (k0.j1) this.f16486b;
                z2.i1 i1Var = (z2.i1) this.f16487c;
                z2.h1 h1Var = (z2.h1) obj;
                if (j1Var.f70653c) {
                    z2.h1.m(h1Var, i1Var, h1Var.mo96roundToPx0680j_4(j1Var.f70651a), h1Var.mo96roundToPx0680j_4(j1Var.f70652b));
                } else {
                    h1Var.i(i1Var, h1Var.mo96roundToPx0680j_4(j1Var.f70651a), h1Var.mo96roundToPx0680j_4(j1Var.f70652b), 0.0f);
                }
                return Unit.f71706a;
            case 3:
                k0.k1 k1Var = (k0.k1) this.f16486b;
                z2.i1 i1Var2 = (z2.i1) this.f16487c;
                z2.h1 h1Var2 = (z2.h1) obj;
                long j11 = ((y3.k) k1Var.f70662a.invoke(h1Var2)).f96605a;
                if (k1Var.f70663b) {
                    z2.h1.n(h1Var2, i1Var2, (int) (j11 >> 32), (int) (4294967295L & j11));
                } else {
                    z2.h1.t(h1Var2, i1Var2, (int) (j11 >> 32), (int) (4294967295L & j11), null, 12);
                }
                return Unit.f71706a;
            case 4:
                k0.n1 n1Var = (k0.n1) this.f16486b;
                z2.i1 i1Var3 = (z2.i1) this.f16487c;
                z2.h1 h1Var3 = (z2.h1) obj;
                if (n1Var.f70689e) {
                    z2.h1.m(h1Var3, i1Var3, h1Var3.mo96roundToPx0680j_4(n1Var.f70685a), h1Var3.mo96roundToPx0680j_4(n1Var.f70686b));
                } else {
                    h1Var3.i(i1Var3, h1Var3.mo96roundToPx0680j_4(n1Var.f70685a), h1Var3.mo96roundToPx0680j_4(n1Var.f70686b), 0.0f);
                }
                return Unit.f71706a;
            case 5:
                h2 h2Var = (h2) this.f16486b;
                View view = (View) this.f16487c;
                k0.w0 w0Var = h2Var.f70636u;
                if (h2Var.f70635t == 0) {
                    WeakHashMap weakHashMap = a5.a1.f250a;
                    a5.s0.l(view, w0Var);
                    if (view.isAttachedToWindow()) {
                        view.requestApplyInsets();
                    }
                    view.addOnAttachStateChangeListener(w0Var);
                    a5.a1.n(view, w0Var);
                }
                h2Var.f70635t++;
                return new g0(10, h2Var, view);
            case 6:
                n0.y0 y0Var = (n0.y0) this.f16486b;
                Object obj2 = this.f16487c;
                y0Var.f77535c.i(obj2);
                return new g0(11, y0Var, obj2);
            case 7:
                p1.g0 g0Var = (p1.g0) this.f16486b;
                z.p0 p0Var = (z.p0) this.f16487c;
                ((p1.z) g0Var).A(obj);
                if (p0Var != null) {
                    p0Var.d(obj);
                }
                return Unit.f71706a;
            case 8:
                q3.q qVar = (q3.q) this.f16486b;
                q3.m0 m0Var = (q3.m0) this.f16487c;
                Function1 function12 = (Function1) obj;
                q3.u uVar = qVar.f83592d;
                jx.v vVar = qVar.f83589a;
                v1 v1Var = qVar.f83594f;
                uVar.getClass();
                q3.p pVar = m0Var.f83578a;
                int i12 = m0Var.f83580c;
                q3.b0 b0Var3 = m0Var.f83579b;
                if (pVar instanceof q3.s) {
                    List list2 = ((q3.s) pVar).f83597d;
                    ArrayList arrayList = new ArrayList(list2.size());
                    List list3 = list2;
                    int size = list3.size();
                    int i13 = 0;
                    while (i13 < size) {
                        Object obj3 = list2.get(i13);
                        q3.n nVar = (q3.n) obj3;
                        int i14 = i13;
                        if (Intrinsics.b(nVar.a(), b0Var3) && nVar.c() == i12) {
                            arrayList.add(obj3);
                        }
                        i13 = i14 + 1;
                    }
                    if (arrayList.isEmpty()) {
                        ArrayList arrayList2 = new ArrayList(list2.size());
                        int size2 = list3.size();
                        for (int i15 = 0; i15 < size2; i15++) {
                            Object obj4 = list2.get(i15);
                            if (((q3.n) obj4).c() == i12) {
                                arrayList2.add(obj4);
                            }
                        }
                        if (!arrayList2.isEmpty()) {
                            list2 = arrayList2;
                        }
                        List list4 = list2;
                        int iCompareTo = b0Var3.compareTo(q3.b0.f83528b);
                        int i16 = b0Var3.f83539a;
                        if (iCompareTo < 0) {
                            List list5 = list4;
                            int size3 = list5.size();
                            q3.b0 b0Var4 = null;
                            int i17 = 0;
                            q3.b0 b0Var5 = null;
                            while (true) {
                                if (i17 < size3) {
                                    int i18 = size3;
                                    q3.b0 b0VarA = ((q3.n) list4.get(i17)).a();
                                    int i19 = i17;
                                    int i21 = b0VarA.f83539a;
                                    if (Intrinsics.h(i21, i16) < 0) {
                                        if (b0Var5 == null || Intrinsics.h(i21, b0Var5.f83539a) > 0) {
                                            b0Var5 = b0VarA;
                                        }
                                    } else if (Intrinsics.h(i21, i16) <= 0) {
                                        b0Var4 = b0VarA;
                                        b0Var5 = b0Var4;
                                    } else if (b0Var4 == null || Intrinsics.h(i21, b0Var4.f83539a) < 0) {
                                        b0Var4 = b0VarA;
                                    }
                                    i17 = i19 + 1;
                                    size3 = i18;
                                }
                            }
                            if (b0Var5 != null) {
                                b0Var4 = b0Var5;
                            }
                            arrayList = new ArrayList(list4.size());
                            int size4 = list5.size();
                            int i22 = 0;
                            while (i22 < size4) {
                                Object obj5 = list4.get(i22);
                                int i23 = size4;
                                if (Intrinsics.b(((q3.n) obj5).a(), b0Var4)) {
                                    arrayList.add(obj5);
                                }
                                i22++;
                                size4 = i23;
                            }
                            b0Var = b0Var3;
                            function1 = function12;
                            Pair pairI = ps.c.i(arrayList, m0Var, uVar.f83599a, vVar, v1Var);
                            list = (List) pairI.f71683a;
                            Object obj6 = pairI.f71684b;
                            if (list != null) {
                            }
                        } else {
                            q3.b0 b0Var6 = q3.b0.f83529c;
                            if (b0Var3.compareTo(b0Var6) > 0) {
                                List list6 = list4;
                                int size5 = list6.size();
                                q3.b0 b0Var7 = null;
                                int i24 = 0;
                                q3.b0 b0Var8 = null;
                                while (true) {
                                    if (i24 < size5) {
                                        int i25 = size5;
                                        q3.b0 b0VarA2 = ((q3.n) list4.get(i24)).a();
                                        b0Var = b0Var3;
                                        int i26 = b0VarA2.f83539a;
                                        if (Intrinsics.h(i26, i16) < 0) {
                                            if (b0Var8 == null || Intrinsics.h(i26, b0Var8.f83539a) > 0) {
                                                b0Var8 = b0VarA2;
                                            }
                                        } else if (Intrinsics.h(i26, i16) <= 0) {
                                            b0Var7 = b0VarA2;
                                            b0Var8 = b0Var7;
                                        } else if (b0Var7 == null || Intrinsics.h(i26, b0Var7.f83539a) < 0) {
                                            b0Var7 = b0VarA2;
                                        }
                                        i24++;
                                        b0Var3 = b0Var;
                                        size5 = i25;
                                    } else {
                                        b0Var = b0Var3;
                                    }
                                }
                                if (b0Var7 == null) {
                                    b0Var7 = b0Var8;
                                }
                                arrayList = new ArrayList(list4.size());
                                int size6 = list6.size();
                                for (int i27 = 0; i27 < size6; i27++) {
                                    Object obj7 = list4.get(i27);
                                    if (Intrinsics.b(((q3.n) obj7).a(), b0Var7)) {
                                        arrayList.add(obj7);
                                    }
                                }
                                function1 = function12;
                                Pair pairI2 = ps.c.i(arrayList, m0Var, uVar.f83599a, vVar, v1Var);
                                list = (List) pairI2.f71683a;
                                Object obj62 = pairI2.f71684b;
                                if (list != null) {
                                }
                            } else {
                                b0Var = b0Var3;
                                List list7 = list4;
                                int size7 = list7.size();
                                q3.b0 b0Var9 = null;
                                int i28 = 0;
                                q3.b0 b0Var10 = null;
                                while (true) {
                                    if (i28 < size7) {
                                        int i29 = size7;
                                        q3.b0 b0VarA3 = ((q3.n) list4.get(i28)).a();
                                        int i31 = i28;
                                        function1 = function12;
                                        if (Intrinsics.h(b0VarA3.f83539a, b0Var6.f83539a) <= 0) {
                                            int i32 = b0VarA3.f83539a;
                                            if (Intrinsics.h(i32, i16) < 0) {
                                                if (b0Var10 == null || Intrinsics.h(i32, b0Var10.f83539a) > 0) {
                                                    b0Var10 = b0VarA3;
                                                }
                                            } else if (Intrinsics.h(i32, i16) <= 0) {
                                                b0Var9 = b0VarA3;
                                                b0Var10 = b0Var9;
                                            } else if (b0Var9 == null || Intrinsics.h(i32, b0Var9.f83539a) < 0) {
                                                b0Var9 = b0VarA3;
                                            }
                                        }
                                        i28 = i31 + 1;
                                        size7 = i29;
                                        function12 = function1;
                                    } else {
                                        function1 = function12;
                                    }
                                }
                                if (b0Var9 == null) {
                                    b0Var9 = b0Var10;
                                }
                                arrayList = new ArrayList(list4.size());
                                int size8 = list7.size();
                                for (int i33 = 0; i33 < size8; i33++) {
                                    Object obj8 = list4.get(i33);
                                    if (Intrinsics.b(((q3.n) obj8).a(), b0Var9)) {
                                        arrayList.add(obj8);
                                    }
                                }
                                if (arrayList.isEmpty()) {
                                    q3.b0 b0Var11 = q3.b0.f83529c;
                                    int size9 = list7.size();
                                    int i34 = 0;
                                    q3.b0 b0Var12 = null;
                                    q3.b0 b0Var13 = null;
                                    while (true) {
                                        if (i34 < size9) {
                                            q3.b0 b0VarA4 = ((q3.n) list4.get(i34)).a();
                                            int i35 = size9;
                                            if (b0Var11 != null) {
                                                i5 = i34;
                                                if (Intrinsics.h(b0VarA4.f83539a, b0Var11.f83539a) < 0) {
                                                    continue;
                                                }
                                                i34 = i5 + 1;
                                                size9 = i35;
                                            } else {
                                                i5 = i34;
                                            }
                                            int i36 = b0VarA4.f83539a;
                                            if (Intrinsics.h(i36, i16) < 0) {
                                                if (b0Var12 == null || Intrinsics.h(i36, b0Var12.f83539a) > 0) {
                                                    b0Var12 = b0VarA4;
                                                }
                                            } else if (Intrinsics.h(i36, i16) <= 0) {
                                                b0Var12 = b0VarA4;
                                                b0Var13 = b0Var12;
                                            } else if (b0Var13 == null || Intrinsics.h(i36, b0Var13.f83539a) < 0) {
                                                b0Var13 = b0VarA4;
                                            }
                                            i34 = i5 + 1;
                                            size9 = i35;
                                        }
                                    }
                                    if (b0Var13 != null) {
                                        b0Var12 = b0Var13;
                                    }
                                    ArrayList arrayList3 = new ArrayList(list4.size());
                                    int size10 = list7.size();
                                    for (int i37 = 0; i37 < size10; i37++) {
                                        Object obj9 = list4.get(i37);
                                        if (Intrinsics.b(((q3.n) obj9).a(), b0Var12)) {
                                            arrayList3.add(obj9);
                                        }
                                    }
                                    arrayList = arrayList3;
                                }
                                Pair pairI22 = ps.c.i(arrayList, m0Var, uVar.f83599a, vVar, v1Var);
                                list = (List) pairI22.f71683a;
                                Object obj622 = pairI22.f71684b;
                                if (list != null) {
                                }
                            }
                        }
                    } else {
                        b0Var = b0Var3;
                        function1 = function12;
                        Pair pairI222 = ps.c.i(arrayList, m0Var, uVar.f83599a, vVar, v1Var);
                        list = (List) pairI222.f71683a;
                        Object obj6222 = pairI222.f71684b;
                        if (list != null) {
                            n0Var = new q3.o0(obj6222, true);
                            b0Var2 = b0Var;
                        } else {
                            b0Var2 = b0Var;
                            q3.h hVar = new q3.h(list, obj6222, m0Var, uVar.f83599a, function1, vVar);
                            continuation = null;
                            t70.m0.t(uVar.f83600b, null, t70.l0.f88816d, new mx.e0(hVar, continuation, 17), 1);
                            n0Var = new q3.n0(hVar);
                        }
                    }
                    if (n0Var == null) {
                        return n0Var;
                    }
                    q3.i0 i0Var = (q3.i0) qVar.f83593e.f92857b;
                    if (pVar == null || (pVar instanceof q3.l)) {
                        typefaceR = i0Var.r(b0Var2, i12);
                    } else if (pVar instanceof q3.d0) {
                        typefaceR = i0Var.j((q3.d0) pVar, b0Var2, i12);
                    } else {
                        if (!(pVar instanceof q3.e0)) {
                            o0Var = continuation;
                            if (o0Var == null) {
                                return o0Var;
                            }
                            throw new IllegalStateException("Could not load font");
                        }
                        typefaceR = ((q3.e0) pVar).c().s();
                    }
                    o0Var = new q3.o0(typefaceR, true);
                    if (o0Var == null) {
                    }
                } else {
                    b0Var2 = b0Var3;
                    n0Var = null;
                }
                continuation = null;
                if (n0Var == null) {
                }
                break;
            case 9:
                x7.l lVar = (x7.l) this.f16486b;
                q3.m0 m0Var2 = (q3.m0) this.f16487c;
                q3.p0 p0Var2 = (q3.p0) obj;
                synchronized (((o7.a) lVar.f95145a)) {
                    try {
                        if (p0Var2.b()) {
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return Unit.f71706a;
            case 10:
                return new g0(16, (p1.e1) this.f16487c, (i0.i) this.f16486b);
            default:
                w20.l lVar2 = (w20.l) this.f16486b;
                Function0 function0 = (Function0) this.f16487c;
                Boolean bool = (Boolean) obj;
                if (!bool.booleanValue() && SystemClock.uptimeMillis() - lVar2.f93688c < 150) {
                    Context context = (Context) function0.invoke();
                    String str2 = lVar2.f93686a;
                    PackageManager packageManager = context.getApplicationContext().getPackageManager();
                    switch (str2.hashCode()) {
                        case -1925850455:
                            if (str2.equals("android.permission.POST_NOTIFICATIONS")) {
                                str = "android.permission-group.NOTIFICATIONS";
                                break;
                            } else {
                                str = null;
                                break;
                            }
                        case -1888586689:
                            if (str2.equals("android.permission.ACCESS_FINE_LOCATION")) {
                                str = "android.permission-group.LOCATION";
                                break;
                            }
                            break;
                        case -406040016:
                            if (str2.equals("android.permission.READ_EXTERNAL_STORAGE")) {
                                str = "android.permission-group.STORAGE";
                                break;
                            }
                            break;
                        case -63024214:
                            if (!str2.equals("android.permission.ACCESS_COARSE_LOCATION")) {
                            }
                            break;
                        case 112197485:
                            if (str2.equals("android.permission.CALL_PHONE")) {
                                str = "android.permission-group.PHONE";
                                break;
                            }
                            break;
                        case 1365911975:
                            if (!str2.equals("android.permission.WRITE_EXTERNAL_STORAGE")) {
                            }
                            break;
                        case 2024715147:
                            if (!str2.equals("android.permission.ACCESS_BACKGROUND_LOCATION")) {
                            }
                            break;
                    }
                    if (str != null) {
                        try {
                            string = packageManager.getPermissionGroupInfo(str, 0).loadLabel(packageManager).toString();
                        } catch (PackageManager.NameNotFoundException unused) {
                        }
                        m.j jVar = new m.j(context);
                        jVar.b(2132019102);
                        jVar.a(Html.fromHtml(context.getString(2132019103, b.c0.l("<b>", string, "</b>")), 0));
                        jVar.setPositiveButton(2132018246, new z9(context, 7)).setNegativeButton(2132017603, new sr.n(1)).c();
                    } else {
                        string = r70.j.G0(str2, "android.permission.", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                        m.j jVar2 = new m.j(context);
                        jVar2.b(2132019102);
                        jVar2.a(Html.fromHtml(context.getString(2132019103, b.c0.l("<b>", string, "</b>")), 0));
                        jVar2.setPositiveButton(2132018246, new z9(context, 7)).setNegativeButton(2132017603, new sr.n(1)).c();
                    }
                }
                lVar2.f93687b.invoke(bool);
                return Unit.f71706a;
        }
    }

    public /* synthetic */ x(p1.e1 e1Var, i0.i iVar) {
        this.f16485a = 10;
        this.f16487c = e1Var;
        this.f16486b = iVar;
    }
}
