package defpackage;

import android.os.Build;
import android.view.View;
import com.medium.android.susi.ui.apple.AppleAuthFragment;
import com.medium.android.susi.ui.apple.AppleAuthResult;
import com.medium.android.susi.ui.apple.a;
import com.medium.refinerecommendations.muted.seeall.writers.AllMutedWritersFragment;
import com.medium.refinerecommendations.suggestions.seeall.friends.AllSuggestionsFriendsFragment;
import com.medium.refinerecommendations.suggestions.seeall.tags.AllSuggestedTagsFragment;
import com.medium.refinerecommendations.suggestions.seeall.writers.AllSuggestedWritersFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vf extends x55 implements m45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ vf(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        int i2 = 0;
        n92 n92Var = null;
        int i3 = 3;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((tf) this.receiver).a();
                break;
            case 1:
                eg egVar = ((tf) this.receiver).a;
                vx0.c0(f76.F(egVar), null, null, new cg(egVar, n92Var, i2), 3);
                break;
            case 2:
                ((ig) this.receiver).a();
                break;
            case 3:
                ((ig) this.receiver).b.a.Q().getOnBackPressedDispatcher().d();
                break;
            case 4:
                ((ig) this.receiver).a();
                break;
            case 5:
                ug ugVar = ((ig) this.receiver).a;
                vx0.c0(f76.F(ugVar), null, null, new rg(ugVar, n92Var, i2), 3);
                break;
            case 6:
                ((AllMutedWritersFragment) ((wg) this.receiver).b.b).Q().getOnBackPressedDispatcher().d();
                break;
            case 7:
                ((wg) this.receiver).a();
                break;
            case 8:
                ((wg) this.receiver).a();
                break;
            case 9:
                gh ghVar = ((wg) this.receiver).a;
                vx0.c0(f76.F(ghVar), null, null, new fh(ghVar, n92Var, i2), 3);
                break;
            case 10:
                ((oh) this.receiver).a();
                break;
            case 11:
                ((AllSuggestionsFriendsFragment) ((oh) this.receiver).b.b).Q().getOnBackPressedDispatcher().d();
                break;
            case 12:
                ((oh) this.receiver).a();
                break;
            case 13:
                bi biVar = ((oh) this.receiver).a;
                vx0.c0(f76.F(biVar), null, null, new wh(biVar, n92Var, i2), 3);
                break;
            case 14:
                ((di) ((hi) this.receiver).b).a.Q().getOnBackPressedDispatcher().d();
                break;
            case 15:
                ((hi) this.receiver).a();
                break;
            case 16:
                si siVar = ((hi) this.receiver).a;
                vx0.c0(f76.F(siVar), null, null, new qi(siVar, n92Var, i2), 3);
                break;
            case 17:
                ((hi) this.receiver).a();
                break;
            case 18:
                ((AllSuggestedTagsFragment) ((ti) this.receiver).b.b).Q().getOnBackPressedDispatcher().d();
                break;
            case 19:
                ((ti) this.receiver).a();
                break;
            case 20:
                ((ti) this.receiver).a();
                break;
            case 21:
                ej ejVar = ((ti) this.receiver).a;
                vx0.c0(f76.F(ejVar), null, null, new dj(ejVar, n92Var, i2), 3);
                break;
            case 22:
                ((AllSuggestedWritersFragment) ((fj) this.receiver).b.b).Q().getOnBackPressedDispatcher().d();
                break;
            case 23:
                ((fj) this.receiver).a();
                break;
            case 24:
                ((fj) this.receiver).a();
                break;
            case 25:
                rj rjVar = ((fj) this.receiver).a;
                vx0.c0(f76.F(rjVar), null, null, new oj(rjVar, n92Var, i2), 3);
                break;
            case 26:
                View view = (View) this.receiver;
                int i4 = Build.VERSION.SDK_INT;
                if (i4 >= 30) {
                    u4.n(view);
                }
                if (i4 >= 29 && (r0 = nm.n(view)) != null) {
                    break;
                }
                break;
            case 27:
                AppleAuthFragment appleAuthFragment = ((a) ((o60) this.receiver)).a;
                appleAuthFragment.c0(AppleAuthResult.Canceled.INSTANCE);
                k40.X(appleAuthFragment).f();
                break;
            case 28:
                lb0 lb0Var = ((cb0) this.receiver).a;
                vx0.c0(f76.F(lb0Var), null, null, new m1(lb0Var, n92Var, i3), 3);
                break;
            default:
                lb0 lb0Var2 = ((cb0) this.receiver).a;
                vx0.c0(f76.F(lb0Var2), null, null, new m1(lb0Var2, n92Var, i3), 3);
                break;
        }
        return c1eVar;
    }
}
