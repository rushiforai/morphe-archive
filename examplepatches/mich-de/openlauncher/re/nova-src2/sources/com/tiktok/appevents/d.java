package com.tiktok.appevents;

import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Handler;
import com.teslacoilsw.launcher.homereset.HomeReset;
import com.tiktok.util.TTConst;
import e10.a3;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import m.o;
import m.p;
import m.s;
import n4.f;
import yx.e;
import yx.h;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f46541a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f46542b;

    public /* synthetic */ d(Context context, int i5) {
        this.f46541a = i5;
        this.f46542b = context;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = this.f46541a;
        Context context = this.f46542b;
        switch (i5) {
            case 0:
                TTIdentifierFactory.lambda$updateAdIdInfo$0(context);
                break;
            case 1:
                if (Build.VERSION.SDK_INT >= 33) {
                    ComponentName componentName = new ComponentName(context, "androidx.appcompat.app.AppLocalesMetadataHolderService");
                    if (context.getPackageManager().getComponentEnabledSetting(componentName) != 1) {
                        if (s.g().d()) {
                            String strG = f.g(context);
                            Object systemService = context.getSystemService("locale");
                            if (systemService != null) {
                                p.b(systemService, o.a(strG));
                            }
                        }
                        context.getPackageManager().setComponentEnabledSetting(componentName, 1, 1);
                    }
                }
                s.f75343f = true;
                break;
            default:
                SharedPreferences sharedPreferences = a3.f51435a.f51545a;
                if (sharedPreferences.getLong("launcher_chooser_opened_at", 0L) != 0) {
                    String string = sharedPreferences.getString("launcher_chooser_type", "role_manager");
                    String str = string != null ? string : "role_manager";
                    String string2 = sharedPreferences.getString("launcher_chooser_location", "home");
                    String str2 = string2 != null ? string2 : "home";
                    int i11 = sharedPreferences.getInt("launcher_default_retry_count", 0);
                    sharedPreferences.edit().remove("launcher_chooser_opened_at").remove("launcher_chooser_location").remove("launcher_chooser_type").apply();
                    if (!HomeReset.c(context)) {
                        zy.c cVar = zy.c.f98823a;
                        zy.c.i("launcher_default_fail", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, str), new Pair("location", str2), new Pair("retry", Boolean.valueOf(i11 > 0))));
                        sharedPreferences.edit().putInt("launcher_default_retry_count", i11 + 1).apply();
                        break;
                    } else {
                        zy.c cVar2 = zy.c.f98823a;
                        zy.c.i("launcher_default_success", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, str), new Pair("location", str2)));
                        h hVar = h.f97704a;
                        h.g("launcher_default_success", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, str), new Pair("location", str2)));
                        sharedPreferences.edit().putInt("launcher_default_retry_count", 0).apply();
                        Handler handler = yx.f.f97697a;
                        yx.f.e(e.f97693b);
                        break;
                    }
                }
                break;
        }
    }
}
