package defpackage;

import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.net.Uri;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ll2 implements m45 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ Context b;
    public final /* synthetic */ l78 c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    public /* synthetic */ ll2(l78 l78Var, x45 x45Var, ml2 ml2Var, pl2 pl2Var, PackageManager packageManager, Context context, l78 l78Var2) {
        this.c = l78Var;
        this.e = x45Var;
        this.f = ml2Var;
        this.g = pl2Var;
        this.h = packageManager;
        this.b = context;
        this.d = l78Var2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj = this.h;
        Object obj2 = this.g;
        Object obj3 = this.f;
        l78 l78Var = this.c;
        Object obj4 = this.e;
        Context context = this.b;
        Object obj5 = this.d;
        n92 n92Var = null;
        switch (i) {
            case 0:
                ml2 ml2Var = (ml2) obj3;
                PackageManager packageManager = (PackageManager) obj;
                l78Var.setValue(null);
                ((x45) obj4).invoke(ml2Var.d);
                ((l78) obj5).setValue(ml2Var);
                Set set = ((ol2) ((pl2) obj2)).a;
                ArrayList arrayList = new ArrayList();
                for (Object obj6 : set) {
                    if (!g76.L((ml2) obj6, ml2Var)) {
                        arrayList.add(obj6);
                    }
                }
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    packageManager.setComponentEnabledSetting(new ComponentName(context, ((ml2) it2.next()).a), 2, 1);
                }
                packageManager.setComponentEnabledSetting(new ComponentName(context, ml2Var.a), 1, 1);
                break;
            default:
                String str = (String) obj5;
                sb2 sb2Var = (sb2) obj4;
                ResolveInfo resolveInfo = (ResolveInfo) obj3;
                nhc nhcVar = (nhc) obj2;
                Resources resources = (Resources) obj;
                l78Var.setValue(Boolean.FALSE);
                try {
                    Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(str));
                    intent.addFlags(268435456);
                    intent.setPackage(resolveInfo.activityInfo.packageName);
                    context.startActivity(intent);
                } catch (ActivityNotFoundException e) {
                    wld.a.n(e, "Failed to open URL in browser resolved for external web view", new Object[0]);
                    vx0.c0(sb2Var, null, null, new q91(nhcVar, resources, n92Var, 5), 3);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ll2(String str, Context context, sb2 sb2Var, l78 l78Var, ResolveInfo resolveInfo, nhc nhcVar, Resources resources) {
        this.d = str;
        this.b = context;
        this.e = sb2Var;
        this.c = l78Var;
        this.f = resolveInfo;
        this.g = nhcVar;
        this.h = resources;
    }
}
