package defpackage;

import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i04 extends k1 implements g04, Serializable {
    public final Enum[] a;

    public i04(Enum[] enumArr) {
        enumArr.getClass();
        this.a = enumArr;
    }

    private final void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization is supported via proxy only");
    }

    private final Object writeReplace() {
        return new j04(this.a);
    }

    @Override // defpackage.t0, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        if (!(obj instanceof Enum)) {
            return false;
        }
        Enum r3 = (Enum) obj;
        return ((Enum) k80.y0(r3.ordinal(), this.a)) == r3;
    }

    @Override // java.util.List
    public final Object get(int i) {
        g1 g1Var = k1.Companion;
        Enum[] enumArr = this.a;
        int length = enumArr.length;
        g1Var.getClass();
        g1.b(i, length);
        return enumArr[i];
    }

    @Override // defpackage.t0
    public final int getSize() {
        return this.a.length;
    }

    @Override // defpackage.k1, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Enum)) {
            return -1;
        }
        Enum r3 = (Enum) obj;
        int iOrdinal = r3.ordinal();
        if (((Enum) k80.y0(iOrdinal, this.a)) == r3) {
            return iOrdinal;
        }
        return -1;
    }

    @Override // defpackage.k1, java.util.List
    public final int lastIndexOf(Object obj) {
        if (!(obj instanceof Enum)) {
            return -1;
        }
        Enum r3 = (Enum) obj;
        int iOrdinal = r3.ordinal();
        if (((Enum) k80.y0(iOrdinal, this.a)) == r3) {
            return iOrdinal;
        }
        return -1;
    }
}
