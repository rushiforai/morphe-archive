package zk;

import java.io.Closeable;
import java.util.ArrayDeque;
import vk.z;

/* loaded from: classes3.dex */
public final class j implements Closeable {

    /* renamed from: d, reason: collision with root package name */
    public static final i f98556d;

    /* renamed from: a, reason: collision with root package name */
    public final i f98557a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayDeque f98558b = new ArrayDeque(4);

    /* renamed from: c, reason: collision with root package name */
    public Throwable f98559c;

    static {
        i fVar;
        try {
            fVar = new y90.f(Throwable.class.getMethod("addSuppressed", Throwable.class));
        } catch (Throwable unused) {
            fVar = null;
        }
        if (fVar == null) {
            fVar = h.f98555a;
        }
        f98556d = fVar;
    }

    public j(i iVar) {
        iVar.getClass();
        this.f98557a = iVar;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        Throwable th2 = this.f98559c;
        while (true) {
            ArrayDeque arrayDeque = this.f98558b;
            if (arrayDeque.isEmpty()) {
                break;
            }
            Closeable closeable = (Closeable) arrayDeque.removeFirst();
            try {
                closeable.close();
            } catch (Throwable th3) {
                if (th2 == null) {
                    th2 = th3;
                } else {
                    this.f98557a.a(closeable, th2, th3);
                }
            }
        }
        if (this.f98559c != null || th2 == null) {
            return;
        }
        z.a(th2);
        throw new AssertionError(th2);
    }
}
