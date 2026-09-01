package defpackage;

import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class k2e implements vq6, Serializable {
    public m45 a;
    public Object b;

    private final void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization is supported via proxy only");
    }

    private final Object writeReplace() {
        return new t16(getValue());
    }

    @Override // defpackage.vq6
    public final Object getValue() {
        Object obj = this.b;
        if (obj != h1c.k) {
            return obj;
        }
        m45 m45Var = this.a;
        m45Var.getClass();
        Object objInvoke = m45Var.invoke();
        this.b = objInvoke;
        this.a = null;
        return objInvoke;
    }

    public final String toString() {
        return this.b != h1c.k ? String.valueOf(getValue()) : "Lazy value not initialized yet.";
    }
}
