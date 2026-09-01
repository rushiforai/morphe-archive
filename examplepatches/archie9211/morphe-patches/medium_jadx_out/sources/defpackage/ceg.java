package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import org.chromium.net.CronetException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ceg extends jq7 {
    public final x51 d;
    public final e21 e;

    public ceg(x51 x51Var) {
        this.d = x51Var;
        omf omfVar = pmf.b;
        this.e = new e21(1);
    }

    public final void F(sgg sggVar, mq7 mq7Var, CronetException cronetException) {
        mq7Var.B();
        this.d.resumeWith(new ajb(cronetException));
    }

    public final void G(sgg sggVar, mq7 mq7Var, ByteBuffer byteBuffer) {
        mq7Var.B();
        byteBuffer.flip();
        byte[] bArr = new byte[byteBuffer.remaining()];
        byteBuffer.get(bArr);
        this.e.write(bArr);
        byteBuffer.clear();
        sggVar.S(byteBuffer);
    }

    public final void H(sgg sggVar, mq7 mq7Var, String str) {
        mq7Var.B();
        sggVar.M();
    }

    public final void I(sgg sggVar, mq7 mq7Var) {
        mq7Var.B();
        sggVar.S(ByteBuffer.allocateDirect(ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID));
    }

    public final void J(sgg sggVar, mq7 mq7Var) {
        pmf pmfVarW;
        mq7Var.B();
        e21 e21Var = this.e;
        synchronized (e21Var) {
            try {
                int i = e21Var.e;
                byte[] bArr = e21Var.d;
                if (i >= bArr.length) {
                    e21Var.b.add(new omf(e21Var.d));
                    e21Var.d = e21.g;
                } else if (i > 0) {
                    e21Var.b.add(new omf(Arrays.copyOf(bArr, i)));
                }
                e21Var.c += e21Var.e;
                e21Var.e = 0;
                ArrayList arrayList = e21Var.b;
                int size = arrayList.size();
                pmfVarW = size == 0 ? pmf.b : pmf.w(arrayList.iterator(), size);
            } catch (Throwable th) {
                throw th;
            }
        }
        this.d.resumeWith(new aeg(mq7Var, pmfVarW.E()));
    }
}
