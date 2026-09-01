package defpackage;

import com.medium.android.data.preferences.DarkMode;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lph3;", "Lque;", "rp2", "lh3", "kh3", "postpage_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ph3 extends que {
    public final String b;
    public final String c;
    public final eh3 d;
    public final l2c e;
    public final ax2 f;
    public final wua g;
    public final r6c h;
    public final uua i;
    public final String j;
    public final String k;

    public ph3(String str, String str2, eh3 eh3Var, l2c l2cVar, ax2 ax2Var) {
        str.getClass();
        str2.getClass();
        this.b = str;
        this.c = str2;
        this.d = eh3Var;
        this.e = l2cVar;
        this.f = ax2Var;
        pu7 pu7Var = eh3Var.a;
        pu7Var.getClass();
        zz zzVar = new zz(pu7Var.L(ek6.SETTINGS_TEXT_SIZE, null), 11);
        pu7Var.getClass();
        zz zzVar2 = new zz(pu7Var.L(ek6.SETTINGS_FONT_FAMILY, null), 9);
        pu7Var.getClass();
        pc1 pc1VarS = k40.S(zzVar, zzVar2, pu7Var.I(ek6.SETTINGS_HIGHLIGHTS_FROM_OTHERS, true), l2cVar.e(), new oh3(5, 0, null));
        gp1 gp1VarF = f76.F(this);
        dne dneVar = dne.NORMAL;
        zy4 zy4Var = zy4.DEFAULT;
        DarkMode.Companion.getClass();
        this.g = bo.e0(pc1VarS, gp1VarF, l7c.b, new lh3(true, true, dneVar, zy4Var, bt2.a(), null));
        r6c r6cVarX = k40.x(0, 7, null);
        this.h = r6cVarX;
        this.i = bo.z(r6cVarX);
        this.j = "display_settings";
        this.k = gp7.u(new SourceParameter("display_settings", null, null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -34, 8191, null));
    }
}
