package p7;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final br.a f82316a;

    public b(br.a clock) {
        Intrinsics.g(clock, "clock");
        this.f82316a = clock;
    }

    public final void a(d7.a db2) {
        Intrinsics.g(db2, "db");
        db2.beginTransaction();
        try {
            StringBuilder sb2 = new StringBuilder("DELETE FROM workspec WHERE state IN (2, 3, 5) AND (last_enqueue_time + minimum_retention_duration) < ");
            this.f82316a.getClass();
            sb2.append(br.a.r() - o.f82364a);
            sb2.append(" AND (SELECT COUNT(*)=0 FROM dependency WHERE     prerequisite_id=id AND     work_spec_id NOT IN         (SELECT id FROM workspec WHERE state IN (2, 3, 5)))");
            db2.execSQL(sb2.toString());
            db2.setTransactionSuccessful();
        } finally {
            db2.endTransaction();
        }
    }
}
