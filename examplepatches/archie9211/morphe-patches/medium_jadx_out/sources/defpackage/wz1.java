package defpackage;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class wz1 implements e55 {
    public final /* synthetic */ int a;

    public /* synthetic */ wz1(int i) {
        this.a = i;
    }

    @Override // defpackage.e55
    public final Object s(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                khd khdVar = (khd) obj;
                ygd ygdVar = (ygd) obj2;
                m45 m45Var = (m45) obj3;
                x12 x12Var = (x12) obj4;
                int iIntValue = ((Integer) obj5).intValue();
                int i2 = (iIntValue & 6) == 0 ? iIntValue | ((iIntValue & 8) == 0 ? ((p65) x12Var).f(khdVar) : ((p65) x12Var).h(khdVar) ? 4 : 2) : iIntValue;
                if ((iIntValue & 48) == 0) {
                    i2 |= (iIntValue & 64) == 0 ? ((p65) x12Var).f(ygdVar) : ((p65) x12Var).h(ygdVar) ? 32 : 16;
                }
                if ((iIntValue & 384) == 0) {
                    i2 |= ((p65) x12Var).h(m45Var) ? 256 : 128;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
                    p65Var.S();
                } else {
                    n23.c(khdVar, ygdVar, m45Var, p65Var, i2 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
                }
                break;
            case 1:
                khd khdVar2 = (khd) obj;
                ygd ygdVar2 = (ygd) obj2;
                m45 m45Var2 = (m45) obj3;
                x12 x12Var2 = (x12) obj4;
                int iIntValue2 = ((Integer) obj5).intValue();
                int i3 = (iIntValue2 & 6) == 0 ? iIntValue2 | ((iIntValue2 & 8) == 0 ? ((p65) x12Var2).f(khdVar2) : ((p65) x12Var2).h(khdVar2) ? 4 : 2) : iIntValue2;
                if ((iIntValue2 & 48) == 0) {
                    i3 |= (iIntValue2 & 64) == 0 ? ((p65) x12Var2).f(ygdVar2) : ((p65) x12Var2).h(ygdVar2) ? 32 : 16;
                }
                if ((iIntValue2 & 384) == 0) {
                    i3 |= ((p65) x12Var2).h(m45Var2) ? 256 : 128;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
                    p65Var2.S();
                } else {
                    n23.c(khdVar2, ygdVar2, m45Var2, p65Var2, i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
                }
                break;
            default:
                boolean zBooleanValue = ((Boolean) obj3).booleanValue();
                long j = ((bkd) obj5).a;
                String string = ((CharSequence) obj4).subSequence(bkd.f(j), bkd.e(j)).toString();
                Intent intentPutExtra = new Intent().setAction("android.intent.action.PROCESS_TEXT").setType("text/plain").putExtra("android.intent.extra.PROCESS_TEXT_READONLY", zBooleanValue);
                ActivityInfo activityInfo = ((ResolveInfo) obj2).activityInfo;
                Intent className = intentPutExtra.setClassName(activityInfo.packageName, activityInfo.name);
                className.putExtra("android.intent.extra.PROCESS_TEXT", string);
                ((Context) obj).startActivity(className);
                break;
        }
        return c1eVar;
    }
}
