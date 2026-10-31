package io.branch.search.internal;

import android.database.Cursor;
import io.branch.search.internal.EnumC3234kb;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: io.branch.search.internal.f, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3138f implements InterfaceC3167gb<Kd, Pair<? extends List<? extends Kd>, ? extends List<? extends Kd>>> {
    @Override // io.branch.search.internal.InterfaceC3167gb
    public final Object a(Cursor cur, String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(cur, "cur");
        String strA = C3053a.a("phase", "column", cur, "phase", "getString(checkColumnIndex(column))");
        int i5 = cur.getInt(R4.a(cur, "position"));
        String strA2 = C3053a.a("query", "column", cur, "query", "getString(checkColumnIndex(column))");
        String strA3 = C3053a.a("binds", "column", cur, "binds", "getString(checkColumnIndex(column))");
        int i11 = cur.getInt(R4.a(cur, "repeat_binds"));
        EnumC3234kb.Companion.getClass();
        return new Kd(EnumC3234kb.a.a(strA), i5, strA2, strA3, i11 == 1, null);
    }

    @Override // io.branch.search.internal.InterfaceC3167gb
    public final Object a(String sessionId, ArrayList results) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(results, "results");
        ArrayList arrayList = new ArrayList();
        Iterator it = results.iterator();
        while (it.hasNext()) {
            Object next = it.next();
            if (((Kd) next).f62798a == EnumC3234kb.SETUP) {
                arrayList.add(next);
            }
        }
        List listD1 = b70.g.D1(new C3104d(), arrayList);
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = results.iterator();
        while (it2.hasNext()) {
            Object next2 = it2.next();
            if (((Kd) next2).f62798a == EnumC3234kb.TEARDOWN) {
                arrayList2.add(next2);
            }
        }
        return new Pair(listD1, b70.g.D1(new C3121e(), arrayList2));
    }
}
