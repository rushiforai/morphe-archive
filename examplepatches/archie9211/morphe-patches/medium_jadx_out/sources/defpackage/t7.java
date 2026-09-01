package defpackage;

import com.medium.android.donkey.main.MainActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class t7 implements d7 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ t7(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.d7
    public final void onActivityResult(Object obj) {
        int i = this.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                ((x45) ((l78) obj2).getValue()).invoke(obj);
                break;
            case 1:
                ((jr) obj2).invoke((c7) obj);
                break;
            default:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                int i2 = MainActivity.H;
                pkf pkfVar = ((MainActivity) obj2).v().n;
                pkfVar.getClass();
                uld uldVar = wld.a;
                km4.I(uldVar, null, "Set push notification permission requested", new Object[0], "Set push notification permission requested");
                zpa zpaVar = (zpa) pkfVar.a;
                long jCurrentTimeMillis = System.currentTimeMillis();
                vr7 vr7Var = zpaVar.b;
                vr7Var.getClass();
                vr7Var.B(ek6.NOTIFICATIONS_PERMISSION_RATIONALE_TIMESTAMP, jCurrentTimeMillis);
                if (!zBooleanValue) {
                    uldVar.m("User hasn't granted permission for push notifications.", new Object[0]);
                } else {
                    uldVar.a("User granted permission for push notifications.", new Object[0]);
                }
                break;
        }
    }
}
