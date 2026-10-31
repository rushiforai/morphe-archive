package androidx.fragment.app;

import android.util.Log;
import androidx.activity.result.ActivityResult;
import java.util.ArrayList;
import java.util.Map;

/* loaded from: classes.dex */
public final class x0 implements j.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14708a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h1 f14709b;

    public /* synthetic */ x0(h1 h1Var, int i5) {
        this.f14708a = i5;
        this.f14709b = h1Var;
    }

    @Override // j.a
    public final void onActivityResult(Object obj) {
        switch (this.f14708a) {
            case 0:
                Map map = (Map) obj;
                String[] strArr = (String[]) map.keySet().toArray(new String[0]);
                ArrayList arrayList = new ArrayList(map.values());
                int[] iArr = new int[arrayList.size()];
                for (int i5 = 0; i5 < arrayList.size(); i5++) {
                    iArr[i5] = ((Boolean) arrayList.get(i5)).booleanValue() ? 0 : -1;
                }
                h1 h1Var = this.f14709b;
                FragmentManager$LaunchedFragmentInfo fragmentManager$LaunchedFragmentInfo = (FragmentManager$LaunchedFragmentInfo) h1Var.G.pollFirst();
                if (fragmentManager$LaunchedFragmentInfo == null) {
                    Log.w("FragmentManager", "No permissions were requested for " + this);
                    break;
                } else {
                    String str = fragmentManager$LaunchedFragmentInfo.f14456a;
                    int i11 = fragmentManager$LaunchedFragmentInfo.f14457b;
                    h0 h0VarC = h1Var.f14571c.c(str);
                    if (h0VarC == null) {
                        Log.w("FragmentManager", "Permission request result delivered for unknown Fragment " + str);
                        break;
                    } else {
                        h0VarC.onRequestPermissionsResult(i11, strArr, iArr);
                        break;
                    }
                }
            case 1:
                ActivityResult activityResult = (ActivityResult) obj;
                h1 h1Var2 = this.f14709b;
                FragmentManager$LaunchedFragmentInfo fragmentManager$LaunchedFragmentInfo2 = (FragmentManager$LaunchedFragmentInfo) h1Var2.G.pollLast();
                if (fragmentManager$LaunchedFragmentInfo2 == null) {
                    Log.w("FragmentManager", "No Activities were started for result for " + this);
                    break;
                } else {
                    String str2 = fragmentManager$LaunchedFragmentInfo2.f14456a;
                    int i12 = fragmentManager$LaunchedFragmentInfo2.f14457b;
                    h0 h0VarC2 = h1Var2.f14571c.c(str2);
                    if (h0VarC2 == null) {
                        Log.w("FragmentManager", "Activity result delivered for unknown Fragment " + str2);
                        break;
                    } else {
                        h0VarC2.onActivityResult(i12, activityResult.f13597a, activityResult.f13598b);
                        break;
                    }
                }
            default:
                ActivityResult activityResult2 = (ActivityResult) obj;
                h1 h1Var3 = this.f14709b;
                FragmentManager$LaunchedFragmentInfo fragmentManager$LaunchedFragmentInfo3 = (FragmentManager$LaunchedFragmentInfo) h1Var3.G.pollFirst();
                if (fragmentManager$LaunchedFragmentInfo3 == null) {
                    Log.w("FragmentManager", "No IntentSenders were started for " + this);
                    break;
                } else {
                    String str3 = fragmentManager$LaunchedFragmentInfo3.f14456a;
                    int i13 = fragmentManager$LaunchedFragmentInfo3.f14457b;
                    h0 h0VarC3 = h1Var3.f14571c.c(str3);
                    if (h0VarC3 == null) {
                        Log.w("FragmentManager", "Intent Sender result delivered for unknown Fragment " + str3);
                        break;
                    } else {
                        h0VarC3.onActivityResult(i13, activityResult2.f13597a, activityResult2.f13598b);
                        break;
                    }
                }
        }
    }
}
