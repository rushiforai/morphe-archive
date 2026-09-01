package defpackage;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import androidx.work.Worker;
import androidx.work.impl.WorkDatabase;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.onboarding.ui.welcome.WelcomeFragment;
import com.medium.android.profile.ui.you.YouProfileFragment;
import com.medium.android.profile.ui.you.YouProfileTab;
import com.medium.android.profile.ui.you.posts.withdrawsubmission.WithdrawSubmissionConfirmationDialogFragment;
import com.medium.android.yourfollowingfeed.ui.YourFollowingFeedFragment;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class l2f implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ l2f(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                Parcelable parcelable = (Parcelable) ht2.r0(dm2.F((WelcomeFragment) obj), "bundle_info", WelcomeFragment.BundleInfo.class);
                if (parcelable != null) {
                    return (WelcomeFragment.BundleInfo) parcelable;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 1:
                Parcelable parcelable2 = (Parcelable) ht2.r0(dm2.F((WithdrawSubmissionConfirmationDialogFragment) obj), "bundle_info", WithdrawSubmissionConfirmationDialogFragment.BundleInfo.class);
                if (parcelable2 != null) {
                    return (WithdrawSubmissionConfirmationDialogFragment.BundleInfo) parcelable2;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 2:
                fz3.a((b7f) obj);
                return c1eVar;
            case 3:
                m7f m7fVar = (m7f) obj;
                WorkDatabase workDatabase = m7fVar.c;
                Context context = m7fVar.a;
                String str = z6d.f;
                if (Build.VERSION.SDK_INT >= 34) {
                    ya6.a(context).cancelAll();
                }
                JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
                ArrayList arrayListF = z6d.f(context, jobScheduler);
                if (arrayListF != null && !arrayListF.isEmpty()) {
                    Iterator it2 = arrayListF.iterator();
                    while (it2.hasNext()) {
                        z6d.a(jobScheduler, ((JobInfo) it2.next()).getId());
                    }
                }
                ((Number) n01.c0(workDatabase.x().a, false, true, new f8f(2))).intValue();
                zqb.b(m7fVar.b, workDatabase, m7fVar.e);
                return c1eVar;
            case 4:
                return ((Worker) obj).b();
            case 5:
                YouProfileFragment youProfileFragment = (YouProfileFragment) obj;
                Bundle bundle = youProfileFragment.f;
                fy3 fy3Var = fy3.a;
                if (bundle == null) {
                    Bundle bundle2 = new Bundle();
                    bundle2.putParcelable("bundle_info", new YouProfileFragment.BundleInfo(YouProfileTab.Posts.INSTANCE, ""));
                    youProfileFragment.V(bundle2);
                    IllegalStateException illegalStateException = new IllegalStateException("Arguments are null in YouProfileFragment");
                    wld.a.e(illegalStateException, "YouProfileFragment: arguments were null; applied default bundle_info", new Object[0]);
                    hy2 hy2Var = g01.y;
                    if (hy2Var != null) {
                        hy2Var.a("YouProfileFragment: arguments were null; applied default bundle_info", illegalStateException, fy3Var);
                    }
                }
                Parcelable parcelable3 = (Parcelable) ht2.r0(dm2.F(youProfileFragment), "bundle_info", Parcelable.class);
                if (!(parcelable3 instanceof YouProfileFragment.BundleInfo)) {
                    Bundle bundle3 = new Bundle();
                    bundle3.putParcelable("bundle_info", new YouProfileFragment.BundleInfo(YouProfileTab.Posts.INSTANCE, ""));
                    youProfileFragment.V(bundle3);
                    IllegalStateException illegalStateException2 = new IllegalStateException("bundle_info is missing or not YouProfileFragment.BundleInfo (value=" + parcelable3 + ")");
                    wld.a.e(illegalStateException2, "YouProfileFragment: bundle_info missing or wrong type; applied default", new Object[0]);
                    hy2 hy2Var2 = g01.y;
                    if (hy2Var2 != null) {
                        hy2Var2.a("YouProfileFragment: bundle_info missing or wrong type; applied default", illegalStateException2, fy3Var);
                    }
                }
                Parcelable parcelable4 = (Parcelable) ht2.r0(dm2.F(youProfileFragment), "bundle_info", YouProfileFragment.BundleInfo.class);
                if (parcelable4 != null) {
                    return (YouProfileFragment.BundleInfo) parcelable4;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 6:
                xbf xbfVar = (xbf) obj;
                ubf ubfVar = xbfVar instanceof ubf ? (ubf) xbfVar : null;
                return Boolean.valueOf(ubfVar != null && ubfVar.l);
            case 7:
                Parcelable parcelable5 = (Parcelable) ht2.r0(dm2.F((YourFollowingFeedFragment) obj), "bundle_info", AbstractMediumFragment.BundleInfo.class);
                if (parcelable5 != null) {
                    return (AbstractMediumFragment.BundleInfo) parcelable5;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            default:
                zef zefVar = (zef) obj;
                zefVar.getClass();
                zefVar.a.m("reading_list_tab");
                return c1eVar;
        }
    }
}
