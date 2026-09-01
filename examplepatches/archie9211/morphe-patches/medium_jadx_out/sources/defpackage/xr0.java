package defpackage;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.VectorDrawable;
import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xr0 implements cf4 {
    public final /* synthetic */ int a;
    public final ew8 b;
    public final Object c;

    public /* synthetic */ xr0(Object obj, ew8 ew8Var, int i) {
        this.a = i;
        this.c = obj;
        this.b = ew8Var;
    }

    @Override // defpackage.cf4
    public final Object a(n92 n92Var) {
        int i = this.a;
        Object obj = this.c;
        ew8 ew8Var = this.b;
        switch (i) {
            case 0:
                return new zw5(dm2.y(new BitmapDrawable(ew8Var.a.getResources(), (Bitmap) obj)), false, st2.MEMORY);
            case 1:
                kz0 kz0Var = new kz0();
                byte[] bArr = (byte[]) obj;
                bArr.getClass();
                kz0Var.write(bArr, 0, bArr.length);
                return new kkc(gx1.x(kz0Var, ew8Var.f), null, st2.MEMORY);
            case 2:
                ByteBuffer byteBuffer = (ByteBuffer) obj;
                return new kkc(new lkc(new yua(new s11(byteBuffer)), ew8Var.f, new t11(byteBuffer)), null, st2.MEMORY);
            default:
                Drawable bitmapDrawable = (Drawable) obj;
                Bitmap.Config[] configArr = spe.a;
                boolean z = (bitmapDrawable instanceof VectorDrawable) || (bitmapDrawable instanceof cre);
                if (z) {
                    bitmapDrawable = new BitmapDrawable(ew8Var.a.getResources(), sgg.I(bitmapDrawable, wx5.a(ew8Var), ew8Var.b, ew8Var.c, ew8Var.d == ux9.INEXACT));
                }
                return new zw5(dm2.y(bitmapDrawable), z, st2.MEMORY);
        }
    }
}
