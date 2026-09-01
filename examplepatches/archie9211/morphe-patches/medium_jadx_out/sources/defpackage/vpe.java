package defpackage;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vpe implements Externalizable {
    public long a;
    public long b;

    private final Object readResolve() {
        long j = this.a;
        long j2 = this.b;
        return (j == 0 && j2 == 0) ? tpe.c : new tpe(j, j2);
    }

    @Override // java.io.Externalizable
    public final void readExternal(ObjectInput objectInput) {
        objectInput.getClass();
        this.a = objectInput.readLong();
        this.b = objectInput.readLong();
    }

    @Override // java.io.Externalizable
    public final void writeExternal(ObjectOutput objectOutput) throws IOException {
        objectOutput.getClass();
        objectOutput.writeLong(this.a);
        objectOutput.writeLong(this.b);
    }
}
