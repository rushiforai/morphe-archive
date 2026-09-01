package defpackage;

import com.drew.metadata.mp4.Mp4BoxTypes;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gg0 implements lm8 {
    public static final gg0 a = new gg0();
    public static final gf4 b = gf4.a("baseAddress");
    public static final gf4 c = gf4.a("size");
    public static final gf4 d = gf4.a("name");
    public static final gf4 e = gf4.a(Mp4BoxTypes.BOX_USER_DEFINED);

    @Override // defpackage.ty3
    public final void a(Object obj, Object obj2) {
        yc2 yc2Var = (yc2) obj;
        mm8 mm8Var = (mm8) obj2;
        mm8Var.g(b, ((ni0) yc2Var).a);
        ni0 ni0Var = (ni0) yc2Var;
        mm8Var.g(c, ni0Var.b);
        mm8Var.a(d, ni0Var.c);
        String str = ni0Var.d;
        mm8Var.a(e, str != null ? str.getBytes(pd2.a) : null);
    }
}
