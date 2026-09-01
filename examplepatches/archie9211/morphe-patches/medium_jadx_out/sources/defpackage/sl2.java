package defpackage;

import com.medium.proto.event.AppIconName;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lsl2;", "Lque;", "pl2", "ml2", "lp2", "settings_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class sl2 extends que {
    public static final Set i;
    public final String b;
    public final ax2 c;
    public final cx2 d;
    public final String e;
    public final String f;
    public boolean g;
    public final wua h;

    static {
        f09 f09Var;
        f09 f09Var2;
        g04<AppIconName> entries = AppIconName.getEntries();
        ArrayList arrayList = new ArrayList();
        for (AppIconName appIconName : entries) {
            switch (ql2.a[appIconName.ordinal()]) {
                case 1:
                    f09Var = new f09(2, new ml2("com.medium.android.donkey.launcher.LauncherActivity", R.mipmap.ic_launcher, R.string.custom_app_icon_name_black, appIconName, false));
                    f09Var2 = f09Var;
                    break;
                case 2:
                    f09Var = new f09(3, new ml2("com.medium.android.donkey.start.SplashActivityWhite", R.mipmap.ic_launcher_white, R.string.custom_app_icon_name_white, appIconName, false));
                    f09Var2 = f09Var;
                    break;
                case 3:
                    f09Var = new f09(0, new ml2("com.medium.android.donkey.start.SplashActivityWordmark", R.mipmap.ic_launcher_wordmark, R.string.custom_app_icon_name_wordmark_black, appIconName, true));
                    f09Var2 = f09Var;
                    break;
                case 4:
                    f09Var = new f09(1, new ml2("com.medium.android.donkey.start.SplashActivityWordmarkWhite", R.mipmap.ic_launcher_wordmark_white, R.string.custom_app_icon_name_wordmark_white, appIconName, false));
                    f09Var2 = f09Var;
                    break;
                case 5:
                    f09Var = new f09(4, new ml2("com.medium.android.donkey.start.SplashActivityFriendTier", R.mipmap.ic_launcher_friend_tier, R.string.custom_app_icon_name_friend_tier, appIconName, false));
                    f09Var2 = f09Var;
                    break;
                case 6:
                    f09Var = new f09(5, new ml2("com.medium.android.donkey.start.SplashActivityThrowback2012", R.mipmap.ic_launcher_throwback_2012, R.string.custom_app_icon_name_throwback_2012, appIconName, false));
                    f09Var2 = f09Var;
                    break;
                case 7:
                    f09Var = new f09(6, new ml2("com.medium.android.donkey.start.SplashActivityThrowback2015", R.mipmap.ic_launcher_throwback_2015, R.string.custom_app_icon_name_throwback_2015, appIconName, false));
                    f09Var2 = f09Var;
                    break;
                case 8:
                    f09Var = new f09(7, new ml2("com.medium.android.donkey.start.SplashActivityThrowback2017", R.mipmap.ic_launcher_throwback_2017, R.string.custom_app_icon_name_throwback_2017, appIconName, false));
                    f09Var2 = f09Var;
                    break;
                case 9:
                    f09Var = new f09(8, new ml2("com.medium.android.donkey.start.SplashActivityPostagePaid", R.mipmap.ic_launcher_postage_paid, R.string.custom_app_icon_name_postage_paid, appIconName, false));
                    f09Var2 = f09Var;
                    break;
                case 10:
                    f09Var = new f09(9, new ml2("com.medium.android.donkey.start.SplashActivityDailyEdition", R.mipmap.ic_launcher_daily_edition, R.string.custom_app_icon_name_daily_edition, appIconName, false));
                    f09Var2 = f09Var;
                    break;
                case 11:
                    f09Var = new f09(10, new ml2("com.medium.android.donkey.start.SplashActivityPublisherMark", R.mipmap.ic_launcher_publisher_mark, R.string.custom_app_icon_name_publisher_mark, appIconName, false));
                    f09Var2 = f09Var;
                    break;
                case 12:
                    f09Var = new f09(11, new ml2("com.medium.android.donkey.start.SplashActivityPride", R.mipmap.ic_launcher_pride, R.string.custom_app_icon_name_pride, appIconName, false));
                    f09Var2 = f09Var;
                    break;
                default:
                    wld.a.m("AppIconName " + appIconName + " not handled", new Object[0]);
                    f09Var2 = null;
                    break;
            }
            if (f09Var2 != null) {
                arrayList.add(f09Var2);
            }
        }
        List listF1 = bu1.f1(arrayList, new js4(15));
        ArrayList arrayList2 = new ArrayList(cu1.k0(listF1, 10));
        Iterator it2 = listF1.iterator();
        while (it2.hasNext()) {
            arrayList2.add((ml2) ((f09) it2.next()).b);
        }
        i = bu1.q1(arrayList2);
    }

    public sl2(String str, ax2 ax2Var, cx2 cx2Var, mya myaVar, bye byeVar, kb2 kb2Var) {
        str.getClass();
        this.b = str;
        this.c = ax2Var;
        this.d = cx2Var;
        this.e = "alternate_icon_selector";
        this.f = gp7.u(new SourceParameter("alternate_icon_selector", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null));
        int i2 = 0;
        this.h = bo.e0(w2g.r(new sp4(mya.w(myaVar, null, 7), byeVar.a(), new rl2(this, null, i2), i2), kb2Var), f76.F(this), l7c.b, nl2.a);
    }
}
