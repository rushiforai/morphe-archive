package p1;

import androidx.compose.runtime.ComposeRuntimeError;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public abstract class u {

    /* renamed from: a, reason: collision with root package name */
    public static final h1 f81587a = new h1("provider");

    /* renamed from: b, reason: collision with root package name */
    public static final h1 f81588b = new h1("provider");

    /* renamed from: c, reason: collision with root package name */
    public static final h1 f81589c = new h1("compositionLocalMap");

    /* renamed from: d, reason: collision with root package name */
    public static final h1 f81590d = new h1("providers");

    /* renamed from: e, reason: collision with root package name */
    public static final h1 f81591e = new h1("reference");

    /* renamed from: f, reason: collision with root package name */
    public static final b3.h0 f81592f = new b3.h0(10);

    public static final void a(int i5, int i11, List list) {
        int iE = e(i5, list);
        if (iE < 0) {
            iE = -(iE + 1);
        }
        while (iE < list.size() && ((t0) list.get(iE)).f81578b < i11) {
        }
    }

    public static final void b(f2 f2Var, ArrayList arrayList, int i5) {
        boolean zL = f2Var.l(i5);
        int[] iArr = f2Var.f81410b;
        if (zL) {
            arrayList.add(f2Var.n(i5));
            return;
        }
        int i11 = iArr[(i5 * 5) + 3] + i5;
        for (int i12 = i5 + 1; i12 < i11; i12 += iArr[(i12 * 5) + 3]) {
            b(f2Var, arrayList, i12);
        }
    }

    public static final void c(@NotNull String str) {
        throw new ComposeRuntimeError(b.c0.l("Compose Runtime internal error. Unexpected or incorrect use of the Compose internal runtime API (", str, "). Please report to Google or use https://goo.gle/compose-feedback"));
    }

    @NotNull
    public static final Void d(@NotNull String str) {
        throw new ComposeRuntimeError(b.c0.l("Compose Runtime internal error. Unexpected or incorrect use of the Compose internal runtime API (", str, "). Please report to Google or use https://goo.gle/compose-feedback"));
    }

    public static final int e(int i5, List list) {
        int size = list.size() - 1;
        int i11 = 0;
        while (i11 <= size) {
            int i12 = (i11 + size) >>> 1;
            int iH = Intrinsics.h(((t0) list.get(i12)).f81578b, i5);
            if (iH < 0) {
                i11 = i12 + 1;
            } else {
                if (iH <= 0) {
                    return i12;
                }
                size = i12 - 1;
            }
        }
        return -(i11 + 1);
    }

    public static final void f(k2 k2Var, int i5, Object obj) {
        int iH = k2Var.h(i5);
        Object[] objArr = k2Var.f81467c;
        Object obj2 = objArr[iH];
        objArr[iH] = n.f81514a;
        if (obj == obj2) {
            return;
        }
        c("Slot table is out of sync (expected " + obj + ", got " + obj2 + ')');
    }
}
