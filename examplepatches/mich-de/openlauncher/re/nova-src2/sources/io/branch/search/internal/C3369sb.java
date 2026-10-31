package io.branch.search.internal;

import android.database.Cursor;
import java.io.IOException;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.sb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3369sb extends Lambda implements Function1<C3336qb, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3352rb f65769a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3369sb(C3352rb c3352rb) {
        super(1);
        this.f65769a = c3352rb;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) throws IOException {
        C3336qb inReadTransaction = (C3336qb) obj;
        Intrinsics.g(inReadTransaction, "$this$inReadTransaction");
        Cursor cursorA = ((C3178h5) this.f65769a.f65631a.q()).a();
        do {
            try {
            } finally {
            }
        } while (cursorA.moveToNext());
        Unit unit = Unit.f71706a;
        cursorA.close();
        return unit;
    }
}
