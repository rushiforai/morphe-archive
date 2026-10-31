package io.branch.search.internal;

import android.database.Cursor;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: io.branch.search.internal.bb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3082bb implements InterfaceC3167gb<D, List<? extends D>> {

    /* renamed from: a, reason: collision with root package name */
    public final int f64029a;

    public C3082bb(int i5) {
        this.f64029a = i5;
    }

    @Override // io.branch.search.internal.InterfaceC3167gb
    public final Object a(Cursor cur, String sessionId) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(cur, "cur");
        if (cur.getColumnIndex("params") == -1) {
            return null;
        }
        String string = cur.getString(R4.a(cur, "params"));
        Intrinsics.f(string, "getString(checkColumnIndex(column))");
        int i5 = this.f64029a;
        Long lE = R4.e(cur, "timestamp");
        long jLongValue = lE != null ? lE.longValue() : System.currentTimeMillis();
        Long lE2 = R4.e(cur, "min_wait_time");
        long jLongValue2 = lE2 != null ? lE2.longValue() : 60000L;
        Long lE3 = R4.e(cur, "max_wait_time");
        return new D(string, i5, jLongValue, jLongValue2, lE3 != null ? lE3.longValue() : 86400000L, R4.c(cur, "initial_backoff_millis") != null ? Long.valueOf(r2.intValue()) : null, R4.c(cur, "back_off_type"), R4.d(cur, "only_on_wifi"), R4.d(cur, "must_not_have_low_battery"), R4.d(cur, "requires_connectivity"), R4.d(cur, "requires_charging"), R4.d(cur, "requires_storage_not_low"), R4.d(cur, "requires_idle_device"));
    }

    @Override // io.branch.search.internal.InterfaceC3167gb
    public final Object a(String sessionId, ArrayList pings) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(pings, "pings");
        return b70.g.U0(pings);
    }
}
