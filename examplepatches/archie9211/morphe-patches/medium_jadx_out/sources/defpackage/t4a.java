package defpackage;

import com.adobe.internal.xmp.XMPException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t4a extends cw8 {
    public int b;

    public t4a() {
        this.b = -1;
    }

    @Override // defpackage.cw8
    public final void a(int i) throws XMPException {
        if ((i & 256) > 0 && (i & 512) > 0) {
            ywb.e(103, "IsStruct and IsArray options are mutually exclusive");
        } else {
            if ((i & 2) <= 0 || (i & 768) <= 0) {
                return;
            }
            ywb.e(103, "Structs and arrays can't have \"value\" options");
        }
    }

    @Override // defpackage.cw8
    public final int d() {
        return -1610604558;
    }

    public final boolean f() {
        return (this.a & 768) > 0;
    }

    public final void g(boolean z) {
        e(256, z);
    }

    public t4a(int i) {
        super(i);
        this.b = -1;
    }
}
