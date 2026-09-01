package defpackage;

import android.os.SystemClock;
import android.view.MotionEvent;
import java.util.ArrayList;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bn extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ mn b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ bn(mn mnVar, int i) {
        super(0);
        this.a = i;
        this.b = mnVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int actionMasked;
        int i = this.a;
        mn mnVar = this.b;
        switch (i) {
            case 0:
                Boolean bool = (Boolean) mnVar.q.getValue();
                bool.getClass();
                return bool;
            case 1:
                i67 i67VarH = t40.H(mnVar.getConfiguration());
                if (i67VarH.a.isEmpty()) {
                    i67VarH = i67.c();
                }
                k67 k67Var = i67VarH.a;
                int size = k67Var.size();
                ArrayList arrayList = new ArrayList(size);
                for (int i2 = 0; i2 < size; i2++) {
                    Locale locale = k67Var.get(i2);
                    locale.getClass();
                    arrayList.add(new f67(locale));
                }
                return new h67(arrayList);
            case 2:
                MotionEvent motionEvent = mnVar.L0;
                if (motionEvent != null && ((actionMasked = motionEvent.getActionMasked()) == 7 || actionMasked == 9)) {
                    mnVar.M0 = SystemClock.uptimeMillis();
                    mnVar.post(mnVar.R0);
                }
                return c1e.a;
            default:
                mnVar.get_viewTreeOwners();
                return null;
        }
    }
}
