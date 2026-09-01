package defpackage;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cuc extends ByteArrayOutputStream {
    public final /* synthetic */ duc a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cuc(duc ducVar, int i) {
        super(i);
        this.a = ducVar;
    }

    @Override // java.io.ByteArrayOutputStream
    public final String toString() {
        int i = ((ByteArrayOutputStream) this).count;
        if (i > 0) {
            int i2 = i - 1;
            if (((ByteArrayOutputStream) this).buf[i2] == 13) {
                i = i2;
            }
        }
        try {
            return new String(((ByteArrayOutputStream) this).buf, 0, i, this.a.b.name());
        } catch (UnsupportedEncodingException e) {
            ay0.d(e);
            return null;
        }
    }
}
