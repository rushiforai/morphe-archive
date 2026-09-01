package defpackage;

import android.app.PendingIntent;
import android.os.Bundle;
import com.medium.android.onboarding.ui.starterpacks.StarterPacksFragment;
import com.medium.android.onboarding.ui.topics.TopicsFragment;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ks8 {
    public final j15 a;
    public final p13 b;
    public final py2 c;
    public final zxc d;
    public final vq6 e;

    public ks8(j15 j15Var, p13 p13Var, py2 py2Var, zxc zxcVar) {
        j15Var.getClass();
        this.a = j15Var;
        this.b = p13Var;
        this.c = py2Var;
        this.d = zxcVar;
        this.e = vx0.d0(yw6.NONE, is8.a);
    }

    public final Object a(String str, p4d p4dVar) throws PendingIntent.CanceledException {
        db8 db8VarX = k40.X(this.a);
        va8 va8VarG = db8VarX.b.g();
        Integer num = va8VarG != null ? new Integer(va8VarG.b.c) : null;
        vq6 vq6Var = this.e;
        c1e c1eVar = c1e.a;
        if (num != null && num.intValue() == R.id.welcomeFragment) {
            Bundle bundleA = ho2.A(str);
            bundleA.putParcelable("bundle_info", new TopicsFragment.BundleInfo(str));
            db8VarX.c(R.id.topicsFragment, bundleA, (ob8) vq6Var.getValue(), null);
            return c1eVar;
        }
        if (num != null && num.intValue() == R.id.topicsFragment) {
            Bundle bundleA2 = ho2.A(str);
            bundleA2.putParcelable("bundle_info", new StarterPacksFragment.BundleInfo(str));
            db8VarX.c(R.id.starterPacksFragment, bundleA2, (ob8) vq6Var.getValue(), null);
            return c1eVar;
        }
        if (num != null && num.intValue() == R.id.starterPacksFragment) {
            Object objB = b(str, p4dVar);
            return objB == tb2.COROUTINE_SUSPENDED ? objB : c1eVar;
        }
        wld.a.n(null, ho2.G("Current destination not handled: ", num, " when navigating to next screen"), new Object[0]);
        return c1eVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.lang.String r18, defpackage.p92 r19) throws android.app.PendingIntent.CanceledException {
        /*
            Method dump skipped, instruction units count: 238
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ks8.b(java.lang.String, p92):java.lang.Object");
    }
}
