package defpackage;

import android.graphics.ImageDecoder;
import android.graphics.ImageDecoder$OnHeaderDecodedListener;
import android.util.Size;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sv implements ImageDecoder$OnHeaderDecodedListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ nya b;
    public final /* synthetic */ lw2 c;

    public /* synthetic */ sv(lw2 lw2Var, nya nyaVar, int i) {
        this.a = i;
        this.c = lw2Var;
        this.b = nyaVar;
    }

    public final void onHeaderDecoded(ImageDecoder imageDecoder, ImageDecoder.ImageInfo imageInfo, ImageDecoder.Source source) {
        int i = this.a;
        nya nyaVar = this.b;
        lw2 lw2Var = this.c;
        switch (i) {
            case 0:
                Size size = imageInfo.getSize();
                int width = size.getWidth();
                int height = size.getHeight();
                ew8 ew8Var = ((vv) lw2Var).b;
                long jK0 = nk7.k0(width, height, ew8Var.b, ew8Var.c, (cfc) k40.c0(ew8Var, tx5.b));
                int i2 = (int) (jK0 >> 32);
                int i3 = (int) (jK0 & 4294967295L);
                if (width > 0 && height > 0 && (width != i2 || height != i3)) {
                    double dL0 = nk7.l0(width, height, i2, i3, ((vv) lw2Var).b.c);
                    boolean z = dL0 < 1.0d;
                    nyaVar.a = z;
                    if (z || ((vv) lw2Var).b.d == ux9.EXACT) {
                        imageDecoder.setTargetSize(nk7.v0(((double) width) * dL0), nk7.v0(dL0 * ((double) height)));
                    }
                }
                ew8 ew8Var2 = ((vv) lw2Var).b;
                imageDecoder.setAllocator(u36.n(wx5.a(ew8Var2)) ? 3 : 1);
                imageDecoder.setMemorySizePolicy(!((Boolean) k40.c0(ew8Var2, wx5.g)).booleanValue() ? 1 : 0);
                q84 q84Var = wx5.c;
                if (z10.b(k40.c0(ew8Var2, q84Var)) != null) {
                    imageDecoder.setTargetColorSpace(z10.b(k40.c0(ew8Var2, q84Var)));
                }
                if (k40.c0(ew8Var2, guc.k) != null) {
                    rd6.m();
                } else {
                    imageDecoder.setPostProcessor(null);
                }
                break;
            default:
                Size size2 = imageInfo.getSize();
                int width2 = size2.getWidth();
                int height2 = size2.getHeight();
                ew8 ew8Var3 = ((jqc) lw2Var).c;
                long jK02 = nk7.k0(width2, height2, ew8Var3.b, ew8Var3.c, (cfc) k40.c0(ew8Var3, tx5.b));
                int i4 = (int) (jK02 >> 32);
                int i5 = (int) (jK02 & 4294967295L);
                if (width2 > 0 && height2 > 0 && (width2 != i4 || height2 != i5)) {
                    double dL02 = nk7.l0(width2, height2, i4, i5, ((jqc) lw2Var).c.c);
                    boolean z2 = dL02 < 1.0d;
                    nyaVar.a = z2;
                    if (z2 || ((jqc) lw2Var).c.d == ux9.EXACT) {
                        imageDecoder.setTargetSize(nk7.v0(((double) width2) * dL02), nk7.v0(dL02 * ((double) height2)));
                    }
                }
                imageDecoder.setOnPartialImageListener(new gqc());
                ew8 ew8Var4 = ((jqc) lw2Var).c;
                imageDecoder.setAllocator(u36.n(wx5.a(ew8Var4)) ? 3 : 1);
                imageDecoder.setMemorySizePolicy(!((Boolean) k40.c0(ew8Var4, wx5.g)).booleanValue() ? 1 : 0);
                q84 q84Var2 = wx5.c;
                if (z10.b(k40.c0(ew8Var4, q84Var2)) != null) {
                    imageDecoder.setTargetColorSpace(z10.b(k40.c0(ew8Var4, q84Var2)));
                }
                imageDecoder.setUnpremultipliedRequired(!((Boolean) k40.c0(ew8Var4, wx5.d)).booleanValue());
                break;
        }
    }
}
