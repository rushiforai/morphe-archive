package defpackage;

import androidx.datastore.core.CorruptionException;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u0c implements i0c {
    public final e1c a;

    public u0c(e1c e1cVar) {
        e1cVar.getClass();
        this.a = e1cVar;
    }

    @Override // defpackage.i0c
    public final Object l() {
        return new t0c(this.a.a(null), null, null);
    }

    @Override // defpackage.i0c
    public final Object w(FileInputStream fileInputStream) throws CorruptionException {
        try {
            fb6 fb6Var = fb6.d;
            String str = new String(op8.i0(fileInputStream), wk1.a);
            fa4 fa4Var = fb6Var.b;
            return (t0c) fb6Var.a(t0c.Companion.serializer(), str);
        } catch (Exception e) {
            throw new CorruptionException("Cannot parse session data", e);
        }
    }

    @Override // defpackage.i0c
    public final void y(Object obj, jz0 jz0Var) throws IOException {
        byte[] bytes = fb6.d.b(t0c.Companion.serializer(), (t0c) obj).getBytes(wk1.a);
        bytes.getClass();
        ((FileOutputStream) jz0Var.b).write(bytes);
    }
}
