package defpackage;

import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rnb implements vq6, Serializable {
    public static final AtomicReferenceFieldUpdater c = AtomicReferenceFieldUpdater.newUpdater(rnb.class, Object.class, "b");
    public volatile m45 a;
    public volatile Object b;

    private final void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization is supported via proxy only");
    }

    private final Object writeReplace() {
        return new t16(getValue());
    }

    @Override // defpackage.vq6
    public final Object getValue() {
        Object obj = this.b;
        h1c h1cVar = h1c.k;
        if (obj != h1cVar) {
            return obj;
        }
        m45 m45Var = this.a;
        if (m45Var != null) {
            Object objInvoke = m45Var.invoke();
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = c;
            while (!atomicReferenceFieldUpdater.compareAndSet(this, h1cVar, objInvoke)) {
                if (atomicReferenceFieldUpdater.get(this) != h1cVar) {
                }
            }
            this.a = null;
            return objInvoke;
        }
        return this.b;
    }

    public final String toString() {
        return this.b != h1c.k ? String.valueOf(getValue()) : "Lazy value not initialized yet.";
    }
}
