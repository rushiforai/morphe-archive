package defpackage;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q80 implements bf4 {
    public final /* synthetic */ int a;

    public /* synthetic */ q80(int i) {
        this.a = i;
    }

    @Override // defpackage.bf4
    public final cf4 a(Object obj, ew8 ew8Var, kva kvaVar) {
        int i = 0;
        int i2 = 1;
        int i3 = 2;
        int i4 = 3;
        switch (this.a) {
            case 0:
                d7e d7eVar = (d7e) obj;
                Bitmap.Config[] configArr = spe.a;
                if (g76.L(d7eVar.c, "file") && g76.L(bu1.z0(gq7.z(d7eVar)), "android_asset")) {
                    return new r80(d7eVar, ew8Var, i);
                }
                return null;
            case 1:
                return new xr0((Bitmap) obj, ew8Var, i);
            case 2:
                return new xr0((byte[]) obj, ew8Var, i2);
            case 3:
                return new xr0((ByteBuffer) obj, ew8Var, i3);
            case 4:
                d7e d7eVar2 = (d7e) obj;
                if (g76.L(d7eVar2.c, "content")) {
                    return new a92(d7eVar2, ew8Var);
                }
                return null;
            case 5:
                d7e d7eVar3 = (d7e) obj;
                if (g76.L(d7eVar3.c, "data")) {
                    return new r80(d7eVar3, ew8Var, i2);
                }
                return null;
            case 6:
                return new xr0((Drawable) obj, ew8Var, i4);
            case 7:
                d7e d7eVar4 = (d7e) obj;
                String str = d7eVar4.c;
                if ((str != null && !str.equals("file")) || d7eVar4.e == null) {
                    return null;
                }
                Bitmap.Config[] configArr2 = spe.a;
                if (g76.L(d7eVar4.c, "file") && g76.L(bu1.z0(gq7.z(d7eVar4)), "android_asset")) {
                    return null;
                }
                return new r80(d7eVar4, ew8Var, i3);
            case 8:
                d7e d7eVar5 = (d7e) obj;
                if (g76.L(d7eVar5.c, "jar:file")) {
                    return new r80(d7eVar5, ew8Var, i4);
                }
                return null;
            default:
                d7e d7eVar6 = (d7e) obj;
                if (g76.L(d7eVar6.c, "android.resource")) {
                    return new r80(d7eVar6, ew8Var, 4);
                }
                return null;
        }
    }
}
