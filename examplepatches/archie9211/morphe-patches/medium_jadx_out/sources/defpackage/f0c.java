package defpackage;

import java.io.Externalizable;
import java.io.IOException;
import java.io.InvalidObjectException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class f0c implements Externalizable {
    public dh7 a;

    private final Object readResolve() {
        return this.a;
    }

    @Override // java.io.Externalizable
    public final void readExternal(ObjectInput objectInput) throws IOException {
        objectInput.getClass();
        byte b = objectInput.readByte();
        if (b != 0) {
            throw new InvalidObjectException(b09.w(b, "Unsupported flags value: "));
        }
        int i = objectInput.readInt();
        if (i < 0) {
            throw new InvalidObjectException(ev6.u("Illegal size value: ", i, '.'));
        }
        dh7 dh7Var = new dh7(i);
        for (int i2 = 0; i2 < i; i2++) {
            dh7Var.put(objectInput.readObject(), objectInput.readObject());
        }
        this.a = dh7Var.b();
    }

    @Override // java.io.Externalizable
    public final void writeExternal(ObjectOutput objectOutput) throws IOException {
        objectOutput.getClass();
        objectOutput.writeByte(0);
        objectOutput.writeInt(this.a.i);
        for (Map.Entry entry : (eh7) this.a.entrySet()) {
            objectOutput.writeObject(entry.getKey());
            objectOutput.writeObject(entry.getValue());
        }
    }
}
