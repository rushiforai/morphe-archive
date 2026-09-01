package defpackage;

import android.util.Log;
import java.util.ArrayList;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u15 implements d7 {
    public final /* synthetic */ int a;
    public final /* synthetic */ f25 b;

    public /* synthetic */ u15(f25 f25Var, int i) {
        this.a = i;
        this.b = f25Var;
    }

    @Override // defpackage.d7
    public final void onActivityResult(Object obj) {
        int i = this.a;
        f25 f25Var = this.b;
        switch (i) {
            case 0:
                Map map = (Map) obj;
                ArrayList arrayList = new ArrayList(map.values());
                int[] iArr = new int[arrayList.size()];
                for (int i2 = 0; i2 < arrayList.size(); i2++) {
                    iArr[i2] = ((Boolean) arrayList.get(i2)).booleanValue() ? 0 : -1;
                }
                a25 a25Var = (a25) f25Var.E.pollFirst();
                if (a25Var == null) {
                    Log.w("FragmentManager", "No permissions were requested for " + this);
                } else {
                    String str = a25Var.a;
                    if (f25Var.c.G(str) == null) {
                        Log.w("FragmentManager", "Permission request result delivered for unknown Fragment " + str);
                    }
                }
                break;
            case 1:
                c7 c7Var = (c7) obj;
                a25 a25Var2 = (a25) f25Var.E.pollLast();
                if (a25Var2 == null) {
                    Log.w("FragmentManager", "No Activities were started for result for " + this);
                } else {
                    String str2 = a25Var2.a;
                    int i3 = a25Var2.b;
                    j15 j15VarG = f25Var.c.G(str2);
                    if (j15VarG == null) {
                        Log.w("FragmentManager", "Activity result delivered for unknown Fragment " + str2);
                    } else {
                        j15VarG.x(i3, c7Var.a, c7Var.b);
                    }
                }
                break;
            default:
                c7 c7Var2 = (c7) obj;
                a25 a25Var3 = (a25) f25Var.E.pollFirst();
                if (a25Var3 == null) {
                    Log.w("FragmentManager", "No IntentSenders were started for " + this);
                } else {
                    String str3 = a25Var3.a;
                    int i4 = a25Var3.b;
                    j15 j15VarG2 = f25Var.c.G(str3);
                    if (j15VarG2 == null) {
                        Log.w("FragmentManager", "Intent Sender result delivered for unknown Fragment " + str3);
                    } else {
                        j15VarG2.x(i4, c7Var2.a, c7Var2.b);
                    }
                }
                break;
        }
    }
}
