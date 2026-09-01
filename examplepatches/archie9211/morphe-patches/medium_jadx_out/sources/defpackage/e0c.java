package defpackage;

import java.io.Externalizable;
import java.io.IOException;
import java.io.InvalidObjectException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.AbstractCollection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e0c implements Externalizable {
    public AbstractCollection a;
    public final int b;

    public e0c(AbstractCollection abstractCollection, int i) {
        this.a = abstractCollection;
        this.b = i;
    }

    private final Object readResolve() {
        return this.a;
    }

    @Override // java.io.Externalizable
    public final void readExternal(ObjectInput objectInput) throws IOException {
        AbstractCollection abstractCollectionW;
        objectInput.getClass();
        byte b = objectInput.readByte();
        int i = b & 1;
        if ((b & (-2)) != 0) {
            throw new InvalidObjectException(ev6.u("Unsupported flags value: ", b, '.'));
        }
        int i2 = objectInput.readInt();
        if (i2 < 0) {
            throw new InvalidObjectException(ev6.u("Illegal size value: ", i2, '.'));
        }
        int i3 = 0;
        if (i == 0) {
            f17 f17Var = new f17(i2);
            while (i3 < i2) {
                f17Var.add(objectInput.readObject());
                i3++;
            }
            abstractCollectionW = d46.w(f17Var);
        } else {
            if (i != 1) {
                throw new InvalidObjectException(ev6.u("Unsupported collection type tag: ", i, '.'));
            }
            p1c p1cVar = new p1c(i2);
            while (i3 < i2) {
                p1cVar.add(objectInput.readObject());
                i3++;
            }
            abstractCollectionW = qo7.k(p1cVar);
        }
        this.a = abstractCollectionW;
    }

    @Override // java.io.Externalizable
    public final void writeExternal(ObjectOutput objectOutput) throws IOException {
        objectOutput.getClass();
        objectOutput.writeByte(this.b);
        objectOutput.writeInt(this.a.size());
        Iterator it2 = this.a.iterator();
        while (it2.hasNext()) {
            objectOutput.writeObject(it2.next());
        }
    }
}
