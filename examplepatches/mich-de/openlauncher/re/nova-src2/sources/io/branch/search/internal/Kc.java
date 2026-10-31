package io.branch.search.internal;

import android.database.Cursor;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Kc {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f62797a = new a();

    public static final class a implements InterfaceC3167gb<Boolean, Boolean> {
        @Override // io.branch.search.internal.InterfaceC3167gb
        public final Object a(Cursor cur, String sessionId) {
            Intrinsics.g(sessionId, "sessionId");
            Intrinsics.g(cur, "cur");
            return Boolean.valueOf(cur.getInt(0) == 1);
        }

        @Override // io.branch.search.internal.InterfaceC3167gb
        public final Object a(String sessionId, ArrayList queryResults) {
            Intrinsics.g(sessionId, "sessionId");
            Intrinsics.g(queryResults, "queryResults");
            return (Boolean) queryResults.get(0);
        }
    }
}
