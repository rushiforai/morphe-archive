package defpackage;

import com.adobe.internal.xmp.XMPException;
import com.drew.lang.RandomAccessStreamReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d0c extends cw8 {
    public int b;
    public String c;
    public String d;

    public final Object clone() {
        try {
            d0c d0cVar = new d0c(this.a);
            d0cVar.b = RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH;
            d0cVar.c = "\n";
            d0cVar.d = "  ";
            d0cVar.d = this.d;
            d0cVar.c = this.c;
            d0cVar.b = this.b;
            return d0cVar;
        } catch (XMPException unused) {
            return null;
        }
    }

    @Override // defpackage.cw8
    public final int d() {
        return 14192;
    }
}
