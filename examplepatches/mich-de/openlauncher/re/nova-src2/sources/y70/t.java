package y70;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import kotlin.coroutines.CoroutineContext;
import t70.e2;

/* loaded from: classes.dex */
public abstract class t extends c implements e2 {

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f96825d = AtomicIntegerFieldUpdater.newUpdater(t.class, "cleanedAndPointers$volatile");

    /* renamed from: c, reason: collision with root package name */
    public final long f96826c;
    private volatile /* synthetic */ int cleanedAndPointers$volatile;

    public t(long j11, t tVar, int i5) {
        super(tVar);
        this.f96826c = j11;
        this.cleanedAndPointers$volatile = i5 << 16;
    }

    @Override // y70.c
    public final boolean d() {
        return f96825d.get(this) == g() && c() != null;
    }

    public final boolean f() {
        return f96825d.addAndGet(this, -65536) == g() && c() != null;
    }

    public abstract int g();

    public abstract void h(int i5, CoroutineContext coroutineContext);

    public final void i() {
        if (f96825d.incrementAndGet(this) == g()) {
            e();
        }
    }

    public final boolean j() {
        AtomicIntegerFieldUpdater atomicIntegerFieldUpdater;
        int i5;
        do {
            atomicIntegerFieldUpdater = f96825d;
            i5 = atomicIntegerFieldUpdater.get(this);
            if (i5 == g() && c() != null) {
                return false;
            }
        } while (!atomicIntegerFieldUpdater.compareAndSet(this, i5, SQLiteDatabase.OPEN_FULLMUTEX + i5));
        return true;
    }
}
