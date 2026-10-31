package zk;

import java.io.Closeable;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public final class h implements i {

    /* renamed from: a, reason: collision with root package name */
    public static final h f98555a = new h();

    @Override // zk.i
    public final void a(Closeable closeable, Throwable th2, Throwable th3) {
        g.f98554a.log(Level.WARNING, "Suppressing exception thrown when closing " + closeable, th3);
    }
}
