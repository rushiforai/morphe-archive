package io.branch.search.internal;

import android.database.Cursor;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.qe, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3339qe implements InterfaceC3167gb<u40.d, Collection<? extends u40.d>> {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final C3339qe f65580a = new C3339qe();

    @Override // io.branch.search.internal.InterfaceC3167gb
    public final Object a(Cursor cur, String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(cur, "cur");
        try {
            String string = cur.getString(R4.a(cur, "package_name"));
            Intrinsics.f(string, "getString(checkColumnIndex(column))");
            String strF = R4.f(cur, "component");
            String string2 = cur.getString(R4.a(cur, "match_alias"));
            Intrinsics.f(string2, "getString(checkColumnIndex(column))");
            return new u40.d(string, strF, string2, R4.f(cur, "display_override"), cur.getLong(R4.a(cur, "source_priority")));
        } catch (Exception unused) {
            return null;
        }
    }

    @Override // io.branch.search.internal.InterfaceC3167gb
    public final Object a(String sessionId, ArrayList queryResults) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(queryResults, "queryResults");
        ArrayList arrayList = new ArrayList();
        Iterator it = queryResults.iterator();
        while (it.hasNext()) {
            u40.d dVar = (u40.d) it.next();
            if (dVar != null) {
                arrayList.add(dVar);
            }
        }
        return arrayList;
    }
}
