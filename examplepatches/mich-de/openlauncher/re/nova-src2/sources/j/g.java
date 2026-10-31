package j;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.random.Random;

/* loaded from: classes.dex */
public final class g extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public static final g f68426j = new g(0);

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        Random.f71890a.getClass();
        return Integer.valueOf(Random.f71891b.f(2147418112) + SQLiteDatabase.OPEN_FULLMUTEX);
    }
}
