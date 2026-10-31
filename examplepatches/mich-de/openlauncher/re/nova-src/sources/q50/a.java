package q50;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final char f83673a;

    /* renamed from: b, reason: collision with root package name */
    public final List f83674b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f83675c;

    public a(char c11, List exact, ArrayList arrayList) {
        Intrinsics.g(exact, "exact");
        this.f83673a = c11;
        this.f83674b = exact;
        this.f83675c = arrayList;
        a[] aVarArr = new a[256];
        for (int i5 = 0; i5 < 256; i5++) {
            Iterator it = this.f83675c.iterator();
            Object obj = null;
            boolean z11 = false;
            Object obj2 = null;
            while (true) {
                if (it.hasNext()) {
                    Object next = it.next();
                    if (((a) next).f83673a == i5) {
                        if (z11) {
                            break;
                        }
                        z11 = true;
                        obj2 = next;
                    }
                } else if (z11) {
                    obj = obj2;
                }
            }
            aVarArr[i5] = obj;
        }
    }
}
