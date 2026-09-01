package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.android.audio.voiceselector.VoiceSelectionFragment;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.profile.ui.you.YouProfileFragment;
import com.medium.android.responses.ResponsesViewModel$WriteState$Highlight;
import com.medium.reader.R;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xre implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ xre(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        uob uobVar = w12.a;
        int i2 = 2;
        c1e c1eVar = c1e.a;
        Object obj3 = this.c;
        Object obj4 = this.b;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                dl7.j((qfe) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 1:
                wwe wweVar = (wwe) obj4;
                VoiceSelectionFragment voiceSelectionFragment = (VoiceSelectionFragment) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    Map map = (Map) guc.z(wweVar.c, p65Var, 0).getValue();
                    boolean zH = p65Var.h(wweVar);
                    Object objM = p65Var.M();
                    if (zH || objM == uobVar) {
                        objM = new f4e(7, wweVar);
                        p65Var.j0(objM);
                    }
                    b55 b55Var = (b55) objM;
                    boolean zH2 = p65Var.h(voiceSelectionFragment);
                    Object objM2 = p65Var.M();
                    if (zH2 || objM2 == uobVar) {
                        objM2 = new doc(29, voiceSelectionFragment);
                        p65Var.j0(objM2);
                    }
                    tp7.n(map, b55Var, (m45) objM2, p65Var, 0);
                }
                break;
            case 2:
                ((Integer) obj2).getClass();
                fo7.f((ResponsesViewModel$WriteState$Highlight) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 3:
                YouProfileFragment youProfileFragment = (YouProfileFragment) obj4;
                mbf mbfVar = (mbf) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    jt7.a(false, pxf.E(1690536990, new n2f(youProfileFragment, mbfVar, guc.z(((MainActivity) youProfileFragment.Q()).s(), p65Var2, 0), i2), p65Var2), p65Var2, 48, 1);
                }
                break;
            case 4:
                xbf xbfVar = (xbf) obj4;
                d2f d2fVar = (d2f) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(1 & iIntValue3, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    if (xbfVar instanceof ubf) {
                        p65Var3.Y(-808157425);
                        boolean zF = p65Var3.f(d2fVar) | p65Var3.f(xbfVar);
                        Object objM3 = p65Var3.M();
                        if (zF || objM3 == uobVar) {
                            objM3 = new qbf(0, d2fVar, xbfVar);
                            p65Var3.j0(objM3);
                        }
                        mq7.s((m45) objM3, null, null, 0L, 0L, null, p65Var3, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                    } else {
                        p65Var3.Y(-824734396);
                    }
                    p65Var3.p(false);
                }
                break;
            default:
                wdf wdfVar = (wdf) obj4;
                wdf wdfVar2 = (wdf) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    if (wdfVar == wdfVar2) {
                        p65Var4.Y(578480752);
                        qv5.b(vn7.J(R.drawable.ic_check_mark_filled_16, 0, p65Var4), vo7.R(p65Var4, R.string.content_description_selected), null, 0L, p65Var4, 8, 12);
                    } else {
                        p65Var4.Y(535282934);
                    }
                    p65Var4.p(false);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ xre(Object obj, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = obj;
        this.c = r28Var;
    }
}
