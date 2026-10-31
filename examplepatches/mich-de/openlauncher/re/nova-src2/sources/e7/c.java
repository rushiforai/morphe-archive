package e7;

import android.database.sqlite.SQLiteCursor;
import android.database.sqlite.SQLiteCursorDriver;
import android.database.sqlite.SQLiteQuery;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class c extends Lambda implements Function4 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ d7.f f52215j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(d7.f fVar) {
        super(4);
        this.f52215j = fVar;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        SQLiteQuery sQLiteQuery = (SQLiteQuery) obj4;
        Intrinsics.d(sQLiteQuery);
        this.f52215j.b(new j(sQLiteQuery));
        return new SQLiteCursor((SQLiteCursorDriver) obj2, (String) obj3, sQLiteQuery);
    }
}
