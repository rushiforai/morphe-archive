package fi;

import ab.z;
import com.google.android.gms.tasks.Task;
import java.util.concurrent.Executor;

/* loaded from: classes3.dex */
public final class o implements q {

    /* renamed from: a, reason: collision with root package name */
    public final Executor f55149a;

    /* renamed from: b, reason: collision with root package name */
    public final c f55150b;

    /* renamed from: c, reason: collision with root package name */
    public final t f55151c;

    public o(Executor executor, c cVar, t tVar) {
        this.f55149a = executor;
        this.f55150b = cVar;
        this.f55151c = tVar;
    }

    @Override // fi.q
    public final void a(Task task) {
        this.f55149a.execute(new z(20, this, task));
    }
}
