package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@rc8("activity")
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0017\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lx6;", "Lsc8;", "Lv6;", "w6", "navigation-runtime_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
public class x6 extends sc8 {
    public final Context c;
    public final Activity d;

    public x6(Context context) {
        Object next;
        context.getClass();
        this.c = context;
        Iterator it2 = szb.K0(context, new b5(2)).iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            } else {
                next = it2.next();
                if (((Context) next) instanceof Activity) {
                    break;
                }
            }
        }
        this.d = (Activity) next;
    }

    @Override // defpackage.sc8
    public final va8 a() {
        return new v6(this);
    }

    @Override // defpackage.sc8
    public final va8 c(va8 va8Var, Bundle bundle, ob8 ob8Var, w6 w6Var) {
        z6 z6Var;
        Intent intent;
        int intExtra;
        v6 v6Var = (v6) va8Var;
        ym6 ym6Var = v6Var.b;
        if (v6Var.g == null) {
            lg8.i(ho2.H(new StringBuilder("Destination "), ym6Var.c, " does not have an Intent set."));
            return null;
        }
        Intent intent2 = new Intent(v6Var.g);
        if (bundle != null) {
            intent2.putExtras(bundle);
            String str = v6Var.h;
            if (str != null && str.length() != 0) {
                StringBuffer stringBuffer = new StringBuffer();
                Matcher matcher = Pattern.compile("\\{(.+?)\\}").matcher(str);
                while (matcher.find()) {
                    String strGroup = matcher.group(1);
                    strGroup.getClass();
                    if (!bundle.containsKey(strGroup)) {
                        throw new IllegalArgumentException(("Could not find " + strGroup + " in " + bundle + " to fill data pattern " + str).toString());
                    }
                    matcher.appendReplacement(stringBuffer, "");
                    aa8 aa8Var = (aa8) v6Var.q().get(strGroup);
                    wb8 wb8Var = aa8Var != null ? aa8Var.a : null;
                    stringBuffer.append(wb8Var != null ? wb8Var.f(wb8Var.a(strGroup, bundle)) : Uri.encode(String.valueOf(bundle.get(strGroup))));
                }
                matcher.appendTail(stringBuffer);
                intent2.setData(Uri.parse(stringBuffer.toString()));
            }
        }
        boolean z = w6Var instanceof w6;
        if (z) {
            intent2.addFlags(w6Var.a);
        }
        Activity activity = this.d;
        if (activity == null) {
            intent2.addFlags(268435456);
        }
        if (ob8Var != null && ob8Var.a) {
            intent2.addFlags(536870912);
        }
        if (activity != null && (intent = activity.getIntent()) != null && (intExtra = intent.getIntExtra("android-support-navigation:ActivityNavigator:current", 0)) != 0) {
            intent2.putExtra("android-support-navigation:ActivityNavigator:source", intExtra);
        }
        intent2.putExtra("android-support-navigation:ActivityNavigator:current", ym6Var.c);
        Context context = this.c;
        Resources resources = context.getResources();
        if (ob8Var != null) {
            int i = ob8Var.h;
            int i2 = ob8Var.i;
            if ((i <= 0 || !g76.L(resources.getResourceTypeName(i), "animator")) && (i2 <= 0 || !g76.L(resources.getResourceTypeName(i2), "animator"))) {
                intent2.putExtra("android-support-navigation:ActivityNavigator:popEnterAnim", i);
                intent2.putExtra("android-support-navigation:ActivityNavigator:popExitAnim", i2).getClass();
            } else {
                Log.w("ActivityNavigator", "Activity destinations do not support Animator resource. Ignoring popEnter resource " + resources.getResourceName(i) + " and popExit resource " + resources.getResourceName(i2) + " when launching " + v6Var);
            }
        }
        if (!z || (z6Var = w6Var.b) == null) {
            context.startActivity(intent2);
        } else {
            context.startActivity(intent2, ((y6) z6Var).a.toBundle());
        }
        if (ob8Var != null && activity != null) {
            int i3 = ob8Var.f;
            int i4 = ob8Var.g;
            if ((i3 > 0 && g76.L(resources.getResourceTypeName(i3), "animator")) || (i4 > 0 && g76.L(resources.getResourceTypeName(i4), "animator"))) {
                Log.w("ActivityNavigator", "Activity destinations do not support Animator resource. Ignoring enter resource " + resources.getResourceName(i3) + " and exit resource " + resources.getResourceName(i4) + "when launching " + v6Var);
                return null;
            }
            if (i3 >= 0 || i4 >= 0) {
                if (i3 < 0) {
                    i3 = 0;
                }
                activity.overridePendingTransition(i3, i4 >= 0 ? i4 : 0);
            }
        }
        return null;
    }

    @Override // defpackage.sc8
    public final boolean j() {
        Activity activity = this.d;
        if (activity == null) {
            return false;
        }
        activity.finish();
        return true;
    }
}
