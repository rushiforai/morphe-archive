package defpackage;

import com.google.firebase.encoders.EncodingException;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a8a implements fqe {
    public boolean a = false;
    public boolean b = false;
    public gf4 c;
    public final y7a d;

    public a8a(y7a y7aVar) {
        this.d = y7aVar;
    }

    @Override // defpackage.fqe
    public final fqe b(String str) throws IOException {
        if (this.a) {
            throw new EncodingException("Cannot encode a second value in the ValueEncoderContext");
        }
        this.a = true;
        this.d.i(this.c, str, this.b);
        return this;
    }

    @Override // defpackage.fqe
    public final fqe c(boolean z) throws IOException {
        if (this.a) {
            throw new EncodingException("Cannot encode a second value in the ValueEncoderContext");
        }
        this.a = true;
        this.d.c(this.c, z ? 1 : 0, this.b);
        return this;
    }
}
