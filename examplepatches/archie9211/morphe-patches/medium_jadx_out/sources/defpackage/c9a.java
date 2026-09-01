package defpackage;

import android.os.Build;
import com.medium.android.publication.ui.archive.PublicationArchiveFragment;
import com.medium.android.publication.ui.editors.PublicationEditorsFragment;
import com.medium.android.publication.ui.writers.PublicationWritersFragment;
import com.medium.android.pushnotifications.ui.requestpermission.PushNotificationPermissionRequestDialogFragment;
import com.medium.android.pushnotificationsettings.ui.PushNotificationSettingsFragment;
import com.medium.stats.ui.pub.PubStatsFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class c9a extends x55 implements m45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c9a(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        int i2 = 8;
        int i3 = 0;
        int i4 = 1;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((PubStatsFragment) ((e9a) this.receiver).a.a).Q().getOnBackPressedDispatcher().d();
                break;
            case 1:
                lca lcaVar = ((nba) this.receiver).b;
                vx0.c0(f76.F(lcaVar), null, null, new xi7(lcaVar, n92Var, 7), 3);
                break;
            case 2:
                ((PublicationArchiveFragment) ((nba) this.receiver).a.b).Q().getOnBackPressedDispatcher().d();
                break;
            case 3:
                ((m45) this.receiver).invoke();
                break;
            case 4:
                dda ddaVar = ((qca) this.receiver).b;
                vx0.c0(f76.F(ddaVar), null, null, new xca(ddaVar, n92Var, i4), 3);
                break;
            case 5:
                dda ddaVar2 = ((qca) this.receiver).b;
                vx0.c0(f76.F(ddaVar2), null, null, new xca(ddaVar2, n92Var, i3), 3);
                break;
            case 6:
                k40.X((PublicationEditorsFragment) ((qca) this.receiver).a.a).f();
                break;
            case 7:
                db8 db8Var = ((sda) this.receiver).b.c;
                db8Var.getClass();
                db8.d(db8Var, "image_selection_route");
                break;
            case 8:
                fha fhaVar = ((sda) this.receiver).a;
                fhaVar.getClass();
                vx0.c0(f76.F(fhaVar), null, null, new xga(fhaVar, n92Var, i4), 3);
                break;
            case 9:
                ((wda) this.receiver).e.invoke();
                break;
            case 10:
                ((jha) this.receiver).t();
                break;
            case 11:
                ((jha) this.receiver).t();
                break;
            case 12:
                ((jha) this.receiver).a();
                break;
            case 13:
                zha zhaVar = ((lha) this.receiver).b;
                vx0.c0(f76.F(zhaVar), null, null, new uha(zhaVar, n92Var, i3), 3);
                break;
            case 14:
                rja rjaVar = ((qia) this.receiver).a;
                vx0.c0(f76.F(rjaVar), null, null, new xi7(rjaVar, n92Var, i2), 3);
                break;
            case 15:
                rja rjaVar2 = ((qia) this.receiver).a;
                vx0.c0(f76.F(rjaVar2), null, null, new xi7(rjaVar2, n92Var, i2), 3);
                break;
            case 16:
                pka pkaVar = ((xja) this.receiver).a;
                vx0.c0(f76.F(pkaVar), null, null, new xi7(pkaVar, n92Var, 9), 3);
                break;
            case 17:
                k40.X(((kia) ((nla) this.receiver).a).a).f();
                break;
            case 18:
                eoa eoaVar = ((sna) this.receiver).b;
                vx0.c0(f76.F(eoaVar), null, null, new zna(eoaVar, n92Var, i4), 3);
                break;
            case 19:
                eoa eoaVar2 = ((sna) this.receiver).b;
                vx0.c0(f76.F(eoaVar2), null, null, new zna(eoaVar2, n92Var, i3), 3);
                break;
            case 20:
                k40.X((PublicationWritersFragment) ((sna) this.receiver).a.a).f();
                break;
            case 21:
                k40.X(((spa) this.receiver).a).f();
                break;
            case 22:
                PushNotificationPermissionRequestDialogFragment pushNotificationPermissionRequestDialogFragment = ((spa) this.receiver).a;
                if (Build.VERSION.SDK_INT >= 33) {
                    pushNotificationPermissionRequestDialogFragment.C0.a("android.permission.POST_NOTIFICATIONS", null);
                }
                k40.X(pushNotificationPermissionRequestDialogFragment).f();
                break;
            case 23:
                k40.X((PushNotificationSettingsFragment) ((cqa) this.receiver).a.b).e();
                break;
            case 24:
                cqa cqaVar = (cqa) this.receiver;
                if (Build.VERSION.SDK_INT < 33) {
                    cqaVar.getClass();
                } else {
                    cqaVar.b.a("android.permission.POST_NOTIFICATIONS", null);
                }
                break;
            case 25:
                PushNotificationSettingsFragment pushNotificationSettingsFragment = (PushNotificationSettingsFragment) ((cqa) this.receiver).a.b;
                ((p13) pushNotificationSettingsFragment.Z()).b0(pushNotificationSettingsFragment.S());
                break;
            case 26:
                nqa nqaVar = ((cqa) this.receiver).c;
                vx0.c0(f76.F(nqaVar), null, null, new lqa(nqaVar, n92Var, i4), 3);
                break;
            case 27:
                ((vta) this.receiver).b.i();
                break;
            case 28:
                ((vta) this.receiver).a();
                break;
            default:
                ((nua) this.receiver).e();
                break;
        }
        return c1eVar;
    }
}
