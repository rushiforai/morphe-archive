package defpackage;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.admin.admininternalstatus.AdminInternalStatusFragment;
import com.medium.android.admin.admintools.AdminToolsFragment;
import com.medium.android.admin.designsystem.DesignSystem3Fragment;
import com.medium.android.admin.designsystem.DesignSystemFragment;
import com.medium.android.admin.payments.PaymentsDebuggerFragment;
import com.medium.android.admin.userdismissableflags.UserDismissableFlagsFragment;
import com.medium.reader.R;
import com.medium.refinerecommendations.following.seeall.writers.AllFollowedWritersFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class x8 extends x55 implements m45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ x8(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        int i2 = 2;
        int i3 = 0;
        int i4 = 1;
        int i5 = 3;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        Object[] objArr4 = 0;
        Object[] objArr5 = 0;
        Object[] objArr6 = 0;
        Object[] objArr7 = 0;
        Object[] objArr8 = 0;
        Object[] objArr9 = 0;
        Object[] objArr10 = 0;
        Object[] objArr11 = 0;
        Object[] objArr12 = 0;
        Object[] objArr13 = 0;
        Object[] objArr14 = 0;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                r9 r9Var = ((c9) this.receiver).b;
                vx0.c0(f76.F(r9Var), null, null, new o9((Object) r9Var, (n92) (objArr == true ? 1 : 0), i3), 3);
                break;
            case 1:
                kp7.l((ComposeView) ((c9) this.receiver).a.b).f();
                break;
            case 2:
                ua uaVar = ((x9) this.receiver).b;
                uaVar.getClass();
                vx0.c0(f76.F(uaVar), null, null, new j0(uaVar, objArr2 == true ? 1 : 0, i5), 3);
                break;
            case 3:
                ua uaVar2 = ((x9) this.receiver).b;
                uaVar2.getClass();
                vx0.c0(f76.F(uaVar2), null, null, new m1(uaVar2, objArr3 == true ? 1 : 0, i4), 3);
                break;
            case 4:
                k40.X(((x9) this.receiver).a).f();
                break;
            case 5:
                oc ocVar = ((gc) this.receiver).a;
                vx0.c0(f76.F(ocVar), ocVar.l, null, new mc(ocVar, objArr4 == true ? 1 : 0, i5), 2);
                break;
            case 6:
                oc ocVar2 = ((gc) this.receiver).a;
                vx0.c0(f76.F(ocVar2), ocVar2.l, null, new mc(ocVar2, objArr5 == true ? 1 : 0, i3), 2);
                break;
            case 7:
                lig ligVar = ((gc) this.receiver).b;
                ((AdminToolsFragment) ligVar.b).Z();
                Context context = (Context) ligVar.c;
                Bundle bundle = new Bundle();
                bundle.putParcelable("bundle_info", new AdminInternalStatusFragment.BundleInfo("admin_tools"));
                m4.w(context, R.id.adminInternalStatusFragment, bundle, null, 12);
                break;
            case 8:
                lig ligVar2 = ((gc) this.receiver).b;
                ((AdminToolsFragment) ligVar2.b).Z();
                Context context2 = (Context) ligVar2.c;
                Bundle bundle2 = new Bundle();
                bundle2.putParcelable("bundle_info", new DesignSystemFragment.BundleInfo("admin_tools"));
                m4.w(context2, R.id.designSystemFragment, bundle2, null, 12);
                break;
            case 9:
                lig ligVar3 = ((gc) this.receiver).b;
                ((AdminToolsFragment) ligVar3.b).Z();
                Context context3 = (Context) ligVar3.c;
                Bundle bundle3 = new Bundle();
                bundle3.putParcelable("bundle_info", new DesignSystem3Fragment.BundleInfo("admin_tools"));
                m4.w(context3, R.id.designSystem3Fragment, bundle3, null, 12);
                break;
            case 10:
                oc ocVar3 = ((gc) this.receiver).a;
                vx0.c0(f76.F(ocVar3), null, null, new mc(ocVar3, objArr6 == true ? 1 : 0, 4), 3);
                break;
            case 11:
                lig ligVar4 = ((gc) this.receiver).b;
                ((AdminToolsFragment) ligVar4.b).Z();
                Context context4 = (Context) ligVar4.c;
                Bundle bundle4 = new Bundle();
                bundle4.putParcelable("bundle_info", new PaymentsDebuggerFragment.BundleInfo("admin_tools"));
                m4.w(context4, R.id.paymentsDebuggerFragment, bundle4, null, 12);
                break;
            case 12:
                lig ligVar5 = ((gc) this.receiver).b;
                ((p13) ((AdminToolsFragment) ligVar5.b).Z()).H((Context) ligVar5.c, "admin_tools");
                break;
            case 13:
                lig ligVar6 = ((gc) this.receiver).b;
                ((AdminToolsFragment) ligVar6.b).Z();
                Context context5 = (Context) ligVar6.c;
                Bundle bundle5 = new Bundle();
                bundle5.putParcelable("bundle_info", new UserDismissableFlagsFragment.BundleInfo("admin_tools"));
                m4.w(context5, R.id.userDismissableFlagsFragment, bundle5, null, 12);
                break;
            case 14:
                oc ocVar4 = ((gc) this.receiver).a;
                vx0.c0(f76.F(ocVar4), null, null, new mc(ocVar4, objArr7 == true ? 1 : 0, i4), 3);
                break;
            case 15:
                oc ocVar5 = ((gc) this.receiver).a;
                vx0.c0(f76.F(ocVar5), null, null, new mc(ocVar5, objArr8 == true ? 1 : 0, i2), 3);
                break;
            case 16:
                lig ligVar7 = ((gc) this.receiver).b;
                ((p13) ((AdminToolsFragment) ligVar7.b).Z()).o((Context) ligVar7.c, "admin_tools", null);
                break;
            case 17:
                AdminToolsFragment adminToolsFragment = (AdminToolsFragment) ((gc) this.receiver).b.b;
                ((p13) adminToolsFragment.Z()).o0(adminToolsFragment.S(), "admin_tools");
                break;
            case 18:
                oc ocVar6 = ((gc) this.receiver).a;
                vx0.c0(f76.F(ocVar6), null, null, new mc(ocVar6, objArr9 == true ? 1 : 0, 6), 3);
                break;
            case 19:
                oc ocVar7 = ((gc) this.receiver).a;
                vx0.c0(f76.F(ocVar7), null, null, new mc(ocVar7, objArr10 == true ? 1 : 0, 7), 3);
                break;
            case 20:
                oc ocVar8 = ((gc) this.receiver).a;
                vx0.c0(f76.F(ocVar8), null, null, new mc(ocVar8, objArr11 == true ? 1 : 0, 5), 3);
                break;
            case 21:
                ((AdminToolsFragment) ((gc) this.receiver).b.b).Q().getOnBackPressedDispatcher().d();
                break;
            case 22:
                lig ligVar8 = ((gc) this.receiver).b;
                Context context6 = (Context) ligVar8.c;
                Intent launchIntentForPackage = context6.getPackageManager().getLaunchIntentForPackage(context6.getPackageName());
                ComponentName component = launchIntentForPackage != null ? launchIntentForPackage.getComponent() : null;
                if (component == null) {
                    ay0.e("Required value was null.");
                } else {
                    ((AdminToolsFragment) ligVar8.b).X(Intent.makeRestartActivityTask(component));
                    Runtime.getRuntime().exit(0);
                }
                break;
            case 23:
                ze zeVar = (ze) this.receiver;
                zeVar.getClass();
                vx0.c0(f76.F(zeVar), null, null, new m1(zeVar, objArr12 == true ? 1 : 0, i2), 3);
                break;
            case 24:
                ze zeVar2 = (ze) this.receiver;
                if (!zeVar2.i) {
                    zeVar2.i = true;
                    zeVar2.h.j(zeVar2.b, gp7.u(zeVar2.l), zeVar2.k);
                }
                break;
            case 25:
                qf qfVar = (qf) this.receiver;
                qfVar.getClass();
                vx0.c0(f76.F(qfVar), null, null, new of(qfVar, objArr13 == true ? 1 : 0, i4), 3);
                break;
            case 26:
                qf qfVar2 = (qf) this.receiver;
                qfVar2.getClass();
                vx0.c0(f76.F(qfVar2), null, null, new of(qfVar2, objArr14 == true ? 1 : 0, i3), 3);
                break;
            case 27:
                qf qfVar3 = (qf) this.receiver;
                if (!qfVar3.i) {
                    qfVar3.i = true;
                    qfVar3.h.j(qfVar3.b, gp7.u(qfVar3.l), qfVar3.k);
                }
                break;
            case 28:
                ((AllFollowedWritersFragment) ((tf) this.receiver).b.b).Q().getOnBackPressedDispatcher().d();
                break;
            default:
                ((tf) this.receiver).a();
                break;
        }
        return c1eVar;
    }
}
