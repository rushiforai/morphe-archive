package g20;

import b.u4;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;
import r10.q1;
import z.c1;

/* loaded from: classes4.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final ct.v f56933a = new ct.v();

    public static ArrayList a(q9.p pVar, String str) {
        String strSubstring;
        String lowerCase = str.toLowerCase(Locale.getDefault());
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        String strI = u4.i("\\s", lowerCase, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        boolean zK0 = r70.k.K0(strI, ".", false);
        c1 c1Var = new c1(0);
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (ga.a aVar : pVar.f83863c) {
            arrayList2.add(aVar);
        }
        Iterator it = arrayList2.iterator();
        int i5 = 0;
        while (it.hasNext()) {
            Object next = it.next();
            ga.a aVar2 = (ga.a) next;
            boolean z11 = true;
            int iC = q1.c(aVar2.f57300l, strI, true);
            if (iC == 0 && zK0) {
                String packageName = aVar2.f57279y.getPackageName();
                if (strI.charAt(0) == '.') {
                    strSubstring = strI.substring(1);
                    Intrinsics.f(strSubstring, "substring(...)");
                } else {
                    strSubstring = strI;
                }
                iC = q1.c(packageName, strSubstring, false);
            }
            if (iC > 0) {
                if (iC > i5) {
                    i5 = iC;
                }
                c1Var.put(aVar2, Integer.valueOf(iC));
            } else {
                z11 = false;
            }
            if (z11) {
                arrayList.add(next);
            }
        }
        int i11 = c1Var.f97753c;
        for (int i12 = 0; i12 < i11; i12++) {
            if (((Number) c1Var.j(i12)).intValue() < i5 / 2) {
                arrayList.remove(c1Var.f(i12));
            }
        }
        ct.v vVar = f56933a;
        vVar.f47897c = c1Var;
        Collections.sort(arrayList, vVar);
        vVar.f47897c = null;
        return arrayList;
    }
}
