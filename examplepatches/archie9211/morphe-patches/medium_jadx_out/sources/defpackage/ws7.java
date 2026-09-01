package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ws7 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ c55 b;

    public /* synthetic */ ws7(c55 c55Var, int i) {
        this.a = i;
        this.b = c55Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        pwe pweVar = pwe.d;
        pwe pweVar2 = pwe.b;
        c55 c55Var = this.b;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                h52Var.getClass();
                q52 q52Var = h52Var.d;
                i52 i52Var = h52Var.c;
                wgd.k(q52Var, i52Var.c, 12.0f, 4);
                h52.b(h52Var, i52Var.d, i52Var.f, 0.0f, 0.0f, 0.0f, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                if (c55Var != null) {
                    pweVar = pweVar2;
                }
                h52Var.e(pweVar);
                break;
            case 1:
                h52 h52Var2 = (h52) obj;
                h52Var2.getClass();
                q52 q52Var2 = h52Var2.f;
                i52 i52Var2 = h52Var2.c;
                wgd.k(q52Var2, i52Var2.e, 12.0f, 4);
                h52.b(h52Var2, i52Var2.d, i52Var2.f, 0.0f, 0.0f, 0.0f, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                if (c55Var != null) {
                    pweVar = pweVar2;
                }
                h52Var2.e(pweVar);
                break;
            case 2:
                h52 h52Var3 = (h52) obj;
                h52Var3.getClass();
                q52 q52Var3 = h52Var3.d;
                i52 i52Var3 = h52Var3.c;
                wgd.k(q52Var3, i52Var3.c, 12.0f, 4);
                h52.b(h52Var3, i52Var3.d, i52Var3.f, 0.0f, 0.0f, 0.0f, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                if (c55Var != null) {
                    pweVar = pweVar2;
                }
                h52Var3.e(pweVar);
                break;
            default:
                h52 h52Var4 = (h52) obj;
                h52Var4.getClass();
                q52 q52Var4 = h52Var4.f;
                i52 i52Var4 = h52Var4.c;
                wgd.k(q52Var4, i52Var4.e, 12.0f, 4);
                h52.b(h52Var4, i52Var4.d, i52Var4.f, 0.0f, 0.0f, 0.0f, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                if (c55Var != null) {
                    pweVar = pweVar2;
                }
                h52Var4.e(pweVar);
                break;
        }
        return c1eVar;
    }
}
