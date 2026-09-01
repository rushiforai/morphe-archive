package defpackage;

import android.content.Intent;
import android.content.IntentSender;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class uy1 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ int c;
    public final /* synthetic */ Object d;

    public /* synthetic */ uy1(Object obj, int i, Object obj2, int i2) {
        this.a = i2;
        this.b = obj;
        this.c = i;
        this.d = obj2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        Object obj = this.d;
        int i2 = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                vy1 vy1Var = (vy1) obj2;
                Object obj3 = ((e7) obj).a;
                String str = (String) vy1Var.a.get(Integer.valueOf(i2));
                if (str != null) {
                    o7 o7Var = (o7) vy1Var.e.get(str);
                    if ((o7Var != null ? o7Var.a : null) != null) {
                        d7 d7Var = o7Var.a;
                        if (vy1Var.d.remove(str)) {
                            d7Var.onActivityResult(obj3);
                        }
                    } else {
                        vy1Var.g.remove(str);
                        vy1Var.f.put(str, obj3);
                    }
                    break;
                }
                break;
            case 1:
                ((vy1) obj2).a(i2, 0, new Intent().setAction("androidx.activity.result.contract.action.INTENT_SENDER_REQUEST").putExtra("androidx.activity.result.contract.extra.SEND_INTENT_EXCEPTION", (IntentSender.SendIntentException) obj));
                break;
            default:
                ((u2a) ((i00) obj2).c).Q(i2, obj);
                break;
        }
    }
}
