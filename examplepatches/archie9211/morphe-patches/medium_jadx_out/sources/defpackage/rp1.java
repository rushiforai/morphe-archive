package defpackage;

import android.graphics.Bitmap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class rp1 implements x45 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ l78 b;
    public final /* synthetic */ x45 c;

    public /* synthetic */ rp1(x45 x45Var, l78 l78Var) {
        this.c = x45Var;
        this.b = l78Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        Bitmap bitmap;
        int i = this.a;
        c1e c1eVar = c1e.a;
        x45 x45Var = this.c;
        l78 l78Var = this.b;
        switch (i) {
            case 0:
                uid uidVar = (uid) obj;
                uidVar.getClass();
                String str = uidVar.a.b;
                if (str.length() <= 6) {
                    int i2 = 0;
                    while (true) {
                        if (i2 >= str.length()) {
                            l78Var.setValue(uidVar);
                            x45Var.invoke(str);
                        } else if (Character.isDigit(str.charAt(i2))) {
                            i2++;
                        }
                    }
                }
                break;
            default:
                if (((Boolean) obj).booleanValue() && (bitmap = (Bitmap) l78Var.getValue()) != null) {
                    x45Var.invoke(bitmap);
                    l78Var.setValue(null);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ rp1(l78 l78Var, x45 x45Var) {
        this.b = l78Var;
        this.c = x45Var;
    }
}
