package io.branch.search.internal;

import android.database.Cursor;
import java.io.IOException;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class Se extends Lambda implements Function1<C3336qb, C3095c7> {

    /* renamed from: a, reason: collision with root package name */
    public static final Se f63359a = new Se();

    public Se() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) throws IOException {
        C3095c7 c3095c7;
        C3336qb inReadTransaction = (C3336qb) obj;
        Intrinsics.g(inReadTransaction, "$this$inReadTransaction");
        Cursor cursorA = inReadTransaction.f65567a.o().f63459a.getReadableDatabase().a("SELECT * FROM tracking_status_history ORDER BY timestamp DESC LIMIT 1", new Object[0], new w4.d());
        try {
            if (cursorA.moveToFirst()) {
                c3095c7 = new C3095c7(cursorA.getLong(R4.a(cursorA, "timestamp")), cursorA.getInt(R4.a(cursorA, "status")));
            } else {
                c3095c7 = null;
            }
            cursorA.close();
            return c3095c7;
        } finally {
        }
    }
}
