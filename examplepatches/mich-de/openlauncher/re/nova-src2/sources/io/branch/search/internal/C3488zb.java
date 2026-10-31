package io.branch.search.internal;

import android.database.Cursor;
import io.branch.search.internal.AbstractC3393u1;
import java.io.IOException;
import java.util.ArrayList;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.zb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3488zb {
    public static final Object a(@NotNull InterfaceC3365s7 interfaceC3365s7, @NotNull String sessionId, @NotNull String query, @Nullable String str, @NotNull AbstractC3393u1.c binder, @NotNull InterfaceC3167gb accum, @Nullable w4.d dVar) throws IOException {
        Intrinsics.g(interfaceC3365s7, "<this>");
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(query, "query");
        Intrinsics.g(binder, "binder");
        Intrinsics.g(accum, "accum");
        ArrayList arrayList = new ArrayList();
        String[] strArrB = binder.b(str);
        if (dVar == null) {
            dVar = new w4.d();
        }
        Cursor cursorA = interfaceC3365s7.a(query, strArrB, dVar);
        while (cursorA.moveToNext()) {
            try {
                Object objA = accum.a(cursorA, sessionId);
                if (objA != null) {
                    arrayList.add(objA);
                }
            } finally {
            }
        }
        Unit unit = Unit.f71706a;
        cursorA.close();
        return accum.a(sessionId, arrayList);
    }
}
