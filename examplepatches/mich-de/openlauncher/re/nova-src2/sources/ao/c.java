package ao;

import ab.e0;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.net.Uri;
import android.text.TextUtils;
import b.t2;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.teslacoilsw.launcher.NovaLauncher;
import e10.a3;
import e10.g2;
import kotlin.jvm.internal.Intrinsics;
import mx.g0;
import py.f;
import qx.q;
import xn.j;

/* loaded from: classes.dex */
public final class c extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15361a;

    public /* synthetic */ c(int i5) {
        this.f15361a = i5;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(final Context context, Intent intent) {
        switch (this.f15361a) {
            case 0:
                if (intent.getAction() == "android.media.action.HDMI_AUDIO_PLUG") {
                    int intExtra = intent.getIntExtra("android.media.extra.AUDIO_PLUG_STATE", -1);
                    if (intExtra == 0) {
                        ul.b.f91313a = 1;
                        return;
                    } else {
                        if (intExtra == 1) {
                            ul.b.f91313a = 2;
                            return;
                        }
                        return;
                    }
                }
                return;
            case 1:
                if (intent.getAction() == "android.media.action.HDMI_AUDIO_PLUG") {
                    int intExtra2 = intent.getIntExtra("android.media.extra.AUDIO_PLUG_STATE", -1);
                    if (intExtra2 == 0) {
                        t2.f15991h = 1;
                        return;
                    } else {
                        if (intExtra2 == 1) {
                            t2.f15991h = 2;
                            return;
                        }
                        return;
                    }
                }
                return;
            case 2:
                String action = intent.getAction();
                final boolean zEquals = "android.intent.action.PACKAGE_ADDED".equals(action);
                final boolean zEquals2 = "android.intent.action.PACKAGE_REMOVED".equals(action);
                Uri data = intent.getData();
                Intrinsics.d(data);
                String schemeSpecificPart = data.getSchemeSpecificPart();
                if (TextUtils.isEmpty(schemeSpecificPart) || "com.teslacoilsw.launcher".equals(schemeSpecificPart)) {
                    return;
                }
                if ("com.teslacoilsw.launcher.prime".equals(schemeSpecificPart)) {
                    g0.f77095h.post(new Runnable() { // from class: mx.g1
                        @Override // java.lang.Runnable
                        public final void run() throws PackageManager.NameNotFoundException {
                            Context context2 = context;
                            PackageManager packageManager = context2.getApplicationContext().getPackageManager();
                            if (!zEquals) {
                                if (zEquals2) {
                                    h1.f77108b = false;
                                    h1.f77107a = Long.MIN_VALUE;
                                    o30.b bVar = h1.f77111e;
                                    if (bVar != null) {
                                        bVar.onDestroy();
                                    }
                                    h1.f77111e = null;
                                    h1.c(context2);
                                    return;
                                }
                                return;
                            }
                            try {
                                PackageInfo packageInfo = packageManager.getPackageInfo("com.teslacoilsw.launcher.prime", 64);
                                Intrinsics.d(packageInfo);
                                Signature[] signatureArr = packageInfo.signatures;
                                Intrinsics.d(signatureArr);
                                int iHashCode = signatureArr[0].hashCode();
                                boolean z11 = h1.f77108b;
                                h1.f77109c = packageInfo.firstInstallTime > System.currentTimeMillis() - ((long) 172800000);
                                if (iHashCode == -1577060375 || iHashCode == 763259628) {
                                    h1.f77108b = true;
                                }
                            } catch (PackageManager.NameNotFoundException unused) {
                            }
                            if (h1.f77108b) {
                                o30.b bVar2 = h1.f77111e;
                                if (bVar2 != null) {
                                    bVar2.onDestroy();
                                }
                                h1.f77111e = null;
                                g2 g2Var = a3.f51435a;
                                g2Var.f51552h = true;
                                SharedPreferences.Editor editorEdit = g2Var.f51545a.edit();
                                editorEdit.putInt("1", EventBridgeChannel.QUEUE_CAPACITY);
                                editorEdit.putBoolean("nova_prime", true);
                                editorEdit.apply();
                                g2Var.f51552h = true;
                                g2Var.f51547c = true;
                                g2Var.onSharedPreferenceChanged(g2Var.f51545a, "_all");
                                ComponentName componentName = NovaLauncher.f45646r1;
                                ab.e0.O();
                                lh.i iVar = g0.f77095h;
                                aa.o oVar = h1.f77114h;
                                iVar.removeCallbacks(oVar);
                                iVar.postDelayed(oVar, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c);
                            }
                        }
                    });
                    return;
                }
                if ("com.teslacoilsw.launcherclientproxy".equals(schemeSpecificPart)) {
                    if (zEquals) {
                        System.exit(0);
                        throw new RuntimeException("System.exit returned normally, while it was supposed to halt JVM.");
                    }
                    ComponentName componentName = NovaLauncher.f45646r1;
                    e0.O();
                    return;
                }
                return;
            case 3:
                py.c.f83128b.getClass();
                py.c.c();
                f.f83151d.f83149f = Long.MIN_VALUE;
                py.c.a();
                return;
            case 4:
                String action2 = intent.getAction();
                if (action2 != null) {
                    int iHashCode = action2.hashCode();
                    if (iHashCode == -2128145023) {
                        if (action2.equals("android.intent.action.SCREEN_OFF")) {
                            q qVar = q.f84576a;
                            q.f84580e = false;
                            return;
                        }
                        return;
                    }
                    if (iHashCode == -1454123155 && action2.equals("android.intent.action.SCREEN_ON")) {
                        q qVar2 = q.f84576a;
                        boolean z11 = q.f84580e;
                        q.f84580e = true;
                        if (z11) {
                            return;
                        }
                        q.a();
                        return;
                    }
                    return;
                }
                return;
            default:
                j jVar = j.f96197d;
                if (intent.getAction().equals("android.intent.action.SCREEN_OFF")) {
                    jVar.a(true, jVar.f96200c);
                    jVar.f96199b = true;
                    return;
                } else {
                    if (intent.getAction().equals("android.intent.action.SCREEN_ON")) {
                        jVar.a(false, jVar.f96200c);
                        jVar.f96199b = false;
                        return;
                    }
                    return;
                }
        }
    }
}
