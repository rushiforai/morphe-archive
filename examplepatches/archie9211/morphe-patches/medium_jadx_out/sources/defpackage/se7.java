package defpackage;

import android.os.Bundle;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.home.ui.home.HomeFragment;
import com.medium.android.profile.ui.you.YouProfileFragment;
import com.medium.android.profile.ui.you.YouProfileTab;
import com.medium.android.yourlibrary.c;
import com.medium.reader.R;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class se7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ MainActivity b;
    public final /* synthetic */ db8 c;

    public /* synthetic */ se7(MainActivity mainActivity, db8 db8Var, int i) {
        this.a = i;
        this.b = mainActivity;
        this.c = db8Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        Bundle bundle;
        va8 va8VarG;
        f25 f25VarH;
        int i = this.a;
        obj = null;
        Object obj3 = null;
        c1e c1eVar = c1e.a;
        int i2 = 1;
        int i3 = 0;
        db8 db8Var = this.c;
        MainActivity mainActivity = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                int i4 = MainActivity.H;
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    l78 l78VarZ = guc.z(mainActivity.v().J, p65Var, 0);
                    l78 l78VarZ2 = guc.z((xpc) mainActivity.A.getValue(), p65Var, 0);
                    lv0 lv0VarB = ((fg7) l78VarZ.getValue()).b();
                    fg7 fg7Var = (fg7) l78VarZ.getValue();
                    eg7 eg7Var = fg7Var instanceof eg7 ? (eg7) fg7Var : null;
                    String str = eg7Var != null ? eg7Var.a : null;
                    fg7 fg7Var2 = (fg7) l78VarZ.getValue();
                    eg7 eg7Var2 = fg7Var2 instanceof eg7 ? (eg7) fg7Var2 : null;
                    zw7 zw7Var = eg7Var2 != null ? eg7Var2.b : null;
                    if (((Boolean) l78VarZ2.getValue()).booleanValue()) {
                        p65Var.Y(1435879968);
                        List listA = ((fg7) l78VarZ.getValue()).a();
                        boolean zH = p65Var.h(mainActivity) | p65Var.h(db8Var);
                        Object objM = p65Var.M();
                        if (zH || objM == w12.a) {
                            objM = new se7(mainActivity, db8Var, i2);
                            p65Var.j0(objM);
                        }
                        b55 b55Var = (b55) objM;
                        fg7 fg7Var3 = (fg7) l78VarZ.getValue();
                        eg7 eg7Var3 = fg7Var3 instanceof eg7 ? (eg7) fg7Var3 : null;
                        m40.e(listA, lv0VarB, b55Var, str, zw7Var, eg7Var3 != null ? eg7Var3.c : false, null, p65Var, 0);
                    } else {
                        p65Var.Y(1415999451);
                    }
                    p65Var.p(false);
                }
                break;
            case 1:
                ka8 ka8Var = db8Var.b;
                lv0 lv0Var = (lv0) obj;
                boolean zBooleanValue = ((Boolean) obj2).booleanValue();
                int i5 = MainActivity.H;
                lv0Var.getClass();
                mainActivity.v().e(lv0Var);
                xpc xpcVar = mainActivity.v().F;
                Boolean bool = Boolean.FALSE;
                xpcVar.getClass();
                xpcVar.m(null, bool);
                if (zBooleanValue && (va8VarG = ka8Var.g()) != null && va8VarG.b.c == lv0Var.getItemId()) {
                    j15 j15Var = mainActivity.m().y;
                    if (j15Var != null && (f25VarH = j15Var.h()) != null) {
                        obj3 = f25VarH.y;
                    }
                    if (obj3 instanceof bsb) {
                        ((bsb) obj3).b();
                    }
                } else {
                    int itemId = lv0Var.getItemId();
                    if (itemId == R.id.homeFragment) {
                        bundle = new Bundle();
                        bundle.putParcelable("bundle_info", new HomeFragment.BundleInfo(""));
                    } else if (itemId == R.id.youProfileFragment) {
                        YouProfileTab.Posts posts = YouProfileTab.Posts.INSTANCE;
                        posts.getClass();
                        Bundle bundle2 = new Bundle();
                        bundle2.putParcelable("bundle_info", new YouProfileFragment.BundleInfo(posts, ""));
                        bundle = bundle2;
                    } else if (itemId == R.id.exploreFragment) {
                        bundle = new Bundle();
                        bundle.putParcelable("bundle_info", new AbstractMediumFragment.BundleInfo(""));
                    } else if (itemId == R.id.yourLibraryFragment) {
                        bundle = c.b("", null, 6);
                    } else if (itemId == R.id.yourFollowingFeedFragment) {
                        bundle = new Bundle();
                        bundle.putParcelable("bundle_info", new AbstractMediumFragment.BundleInfo(""));
                    } else {
                        bundle = new Bundle();
                    }
                    db8Var.c(itemId, bundle, new ob8(true, false, ka8Var.h().g.c, false, false, -1, -1, -1, -1), null);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                int i6 = MainActivity.H;
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    jt7.a(false, pxf.E(-1580487097, new se7(mainActivity, db8Var, i3), p65Var2), p65Var2, 48, 1);
                }
                break;
        }
        return c1eVar;
    }
}
