package defpackage;

import android.os.CancellationSignal;
import androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController;
import androidx.credentials.playservices.controllers.identityauth.createpassword.CredentialProviderCreatePasswordController;
import androidx.credentials.playservices.controllers.identityauth.createpublickeycredential.CredentialProviderCreatePublicKeyCredentialController;
import androidx.credentials.playservices.controllers.identityauth.getsigninintent.CredentialProviderGetSignInIntentController;
import androidx.credentials.playservices.controllers.identitycredentials.createdigitalcredential.CreateDigitalCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.createpasswordcredential.CreatePasswordCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.createpublickeycredential.CreatePublicKeyCredentialController;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class v02 implements b55 {
    public final /* synthetic */ int a;

    public /* synthetic */ v02(int i) {
        this.a = 29;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        ew1 ew1Var;
        int i = this.a;
        o28 o28Var = o28.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    qv5.b(vn7.J(R.drawable.ic_share_24, 0, p65Var), vo7.R(p65Var, R.string.common_share), null, 0L, p65Var, 8, 12);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    qv5.b(vn7.J(R.drawable.ic_more_24, 0, p65Var2), vo7.R(p65Var2, R.string.common_show_more), null, 0L, p65Var2, 8, 12);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    jjd.b(vo7.R(p65Var3, R.string.common_mute_user), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var3, 0, 0, 262142);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    jjd.b(vo7.R(p65Var4, R.string.common_unmute_user), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var4, 0, 0, 262142);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    jjd.b(vo7.R(p65Var5, R.string.common_block_user), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var5, 0, 0, 262142);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 5:
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    jjd.b(vo7.R(p65Var6, R.string.common_unblock_user), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var6, 0, 0, 262142);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 6:
                x12 x12Var7 = (x12) obj;
                int iIntValue7 = ((Integer) obj2).intValue();
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    jjd.b(vo7.R(p65Var7, R.string.common_report_user), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var7, 0, 0, 262142);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 7:
                x12 x12Var8 = (x12) obj;
                int iIntValue8 = ((Integer) obj2).intValue();
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                    jjd.b(vo7.R(p65Var8, R.string.common_views_stats_user), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var8, 0, 0, 262142);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 8:
                x12 x12Var9 = (x12) obj;
                int iIntValue9 = ((Integer) obj2).intValue();
                p65 p65Var9 = (p65) x12Var9;
                if (p65Var9.P(iIntValue9 & 1, (iIntValue9 & 3) != 2)) {
                    jjd.b(vo7.R(p65Var9, R.string.edit_post_discard_updates_title), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var9.j(jt7.c)).d, p65Var9, 0, 0, 131070);
                } else {
                    p65Var9.S();
                }
                return c1eVar;
            case 9:
                x12 x12Var10 = (x12) obj;
                int iIntValue10 = ((Integer) obj2).intValue();
                p65 p65Var10 = (p65) x12Var10;
                if (p65Var10.P(iIntValue10 & 1, (iIntValue10 & 3) != 2)) {
                    jjd.b(vo7.R(p65Var10, R.string.edit_post_discard_updates), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var10.j(jt7.c)).n, p65Var10, 0, 0, 131070);
                } else {
                    p65Var10.S();
                }
                return c1eVar;
            case 10:
                x12 x12Var11 = (x12) obj;
                int iIntValue11 = ((Integer) obj2).intValue();
                p65 p65Var11 = (p65) x12Var11;
                if (p65Var11.P(iIntValue11 & 1, (iIntValue11 & 3) != 2)) {
                    nk7.h0(null, p65Var11, 0);
                } else {
                    p65Var11.S();
                }
                return c1eVar;
            case 11:
                x12 x12Var12 = (x12) obj;
                int iIntValue12 = ((Integer) obj2).intValue();
                p65 p65Var12 = (p65) x12Var12;
                if (!p65Var12.P(iIntValue12 & 1, (iIntValue12 & 3) != 2)) {
                    p65Var12.S();
                }
                return c1eVar;
            case 12:
                x12 x12Var13 = (x12) obj;
                int iIntValue13 = ((Integer) obj2).intValue();
                p65 p65Var13 = (p65) x12Var13;
                if (p65Var13.P(iIntValue13 & 1, (iIntValue13 & 3) != 2)) {
                    qv5.b(vn7.J(R.drawable.ic_arrow_up_24, 0, p65Var13), vo7.R(p65Var13, R.string.response_write_send), w2g.C(o28Var, 7.0f), ((zo7) p65Var13.j(kt7.b)).p, p65Var13, 392, 0);
                } else {
                    p65Var13.S();
                }
                return c1eVar;
            case 13:
                x12 x12Var14 = (x12) obj;
                int iIntValue14 = ((Integer) obj2).intValue();
                p65 p65Var14 = (p65) x12Var14;
                if (p65Var14.P(iIntValue14 & 1, (iIntValue14 & 3) != 2)) {
                    qv5.b(vn7.J(R.drawable.ic_settings_24, 0, p65Var14), vo7.R(p65Var14, R.string.cd_new_story_button), null, ((zo7) p65Var14.j(kt7.b)).o, p65Var14, 8, 4);
                } else {
                    p65Var14.S();
                }
                return c1eVar;
            case 14:
                x12 x12Var15 = (x12) obj;
                int iIntValue15 = ((Integer) obj2).intValue();
                p65 p65Var15 = (p65) x12Var15;
                if (p65Var15.P(1 & iIntValue15, (iIntValue15 & 3) != 2)) {
                    qv5.b(vn7.J(2131230842, 0, p65Var15), null, bgf.N(o28Var, "illustration"), ((zo7) p65Var15.j(kt7.b)).n, p65Var15, 440, 0);
                } else {
                    p65Var15.S();
                }
                return c1eVar;
            case 15:
                x12 x12Var16 = (x12) obj;
                int iIntValue16 = ((Integer) obj2).intValue();
                p65 p65Var16 = (p65) x12Var16;
                if (p65Var16.P(1 & iIntValue16, (iIntValue16 & 3) != 2)) {
                    qv5.b(vn7.J(2131230842, 0, p65Var16), null, bgf.N(o28Var, "illustration"), ((zo7) p65Var16.j(kt7.b)).n, p65Var16, 440, 0);
                } else {
                    p65Var16.S();
                }
                return c1eVar;
            case 16:
                ib2 ib2Var = (ib2) obj;
                gb2 gb2Var = (gb2) obj2;
                ib2Var.getClass();
                gb2Var.getClass();
                ib2 ib2VarT = ib2Var.T(gb2Var.getKey());
                zx3 zx3Var = zx3.a;
                if (ib2VarT == zx3Var) {
                    return gb2Var;
                }
                wz7 wz7Var = wz7.d;
                kb2 kb2Var = (kb2) ib2VarT.o0(wz7Var);
                if (kb2Var == null) {
                    ew1Var = new ew1(gb2Var, ib2VarT);
                } else {
                    ib2 ib2VarT2 = ib2VarT.T(wz7Var);
                    if (ib2VarT2 == zx3Var) {
                        return new ew1(kb2Var, gb2Var);
                    }
                    ew1Var = new ew1(kb2Var, new ew1(gb2Var, ib2VarT2));
                }
                return ew1Var;
            case 17:
                return Boolean.valueOf(((Boolean) obj).booleanValue());
            case 18:
                return ((ib2) obj).j0((gb2) obj2);
            case 19:
                return ((ib2) obj).j0((gb2) obj2);
            case 20:
                return CreateDigitalCredentialController.handleResponse$lambda$0((CancellationSignal) obj, (m45) obj2);
            case 21:
                return CreatePasswordCredentialController.handleResponse$lambda$0((CancellationSignal) obj, (m45) obj2);
            case 22:
                return CreatePublicKeyCredentialController.handleResponse$lambda$0((CancellationSignal) obj, (m45) obj2);
            case 23:
                return CredentialProviderBeginSignInController.handleResponse$lambda$0((CancellationSignal) obj, (m45) obj2);
            case 24:
                return CredentialProviderCreatePasswordController.handleResponse$lambda$0((CancellationSignal) obj, (m45) obj2);
            case 25:
                return CredentialProviderCreatePublicKeyCredentialController.handleResponse$lambda$0((CancellationSignal) obj, (m45) obj2);
            case 26:
                return CredentialProviderGetSignInIntentController.handleResponse$lambda$0((CancellationSignal) obj, (m45) obj2);
            case 27:
                d13 d13Var = (d13) obj2;
                return d46.R(Integer.valueOf(d13Var.k()), Float.valueOf(iq7.u(d13Var.l(), -0.5f, 0.5f)), Integer.valueOf(d13Var.o()));
            case 28:
                return (pm3) ((om3) obj2).a.g.getValue();
            default:
                ((Integer) obj2).getClass();
                bgf.r((x12) obj, tr7.y(1));
                return c1eVar;
        }
    }

    public /* synthetic */ v02(int i, byte b) {
        this.a = i;
    }
}
