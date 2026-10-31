package n10;

import ads_mobile_sdk.w13;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.UserManager;
import com.teslacoilsw.launcher.NovaLauncher;
import db0.c0;
import db0.l;
import db0.m;
import db0.n0;
import db0.y;
import java.util.function.Consumer;
import kotlin.jvm.internal.Intrinsics;
import o7.r;
import o9.j2;
import o9.l2;
import o9.n1;
import v7.i;

/* loaded from: classes.dex */
public final class a extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77680a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f77681b;

    public /* synthetic */ a(Object obj, int i5) {
        this.f77680a = i5;
        this.f77681b = obj;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) throws Throwable {
        int i5 = this.f77680a;
        Object obj = this.f77681b;
        switch (i5) {
            case 0:
                n0 n0Var = (n0) obj;
                String action = intent.getAction();
                if (action != null) {
                    int iHashCode = action.hashCode();
                    if (iHashCode == -1530327060) {
                        if (action.equals("android.bluetooth.adapter.action.STATE_CHANGED")) {
                            int intExtra = intent.getIntExtra("android.bluetooth.adapter.extra.STATE", Integer.MIN_VALUE);
                            if (intExtra == 10) {
                                m mVar = c0.Companion;
                                long jCurrentTimeMillis = System.currentTimeMillis();
                                mVar.getClass();
                                n0Var.invoke(new l(false, jCurrentTimeMillis));
                                break;
                            } else if (intExtra == 12) {
                                m mVar2 = c0.Companion;
                                long jCurrentTimeMillis2 = System.currentTimeMillis();
                                mVar2.getClass();
                                n0Var.invoke(new l(true, jCurrentTimeMillis2));
                                break;
                            }
                        }
                    } else if (iHashCode == -301431627) {
                        if (action.equals("android.bluetooth.device.action.ACL_CONNECTED")) {
                            BluetoothDevice bluetoothDevice = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                            if (bluetoothDevice == null) {
                                n0Var.invoke(m.a(c0.Companion, true, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, -1, -1));
                                break;
                            } else {
                                n0Var.invoke(m.a(c0.Companion, true, bluetoothDevice.getName(), bluetoothDevice.getAddress(), bluetoothDevice.getType(), bluetoothDevice.getBluetoothClass().getDeviceClass()));
                                break;
                            }
                        }
                    } else if (iHashCode == 1821585647 && action.equals("android.bluetooth.device.action.ACL_DISCONNECTED")) {
                        BluetoothDevice bluetoothDevice2 = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                        if (bluetoothDevice2 == null) {
                            n0Var.invoke(m.a(c0.Companion, false, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, -1, -1));
                            break;
                        } else {
                            n0Var.invoke(m.a(c0.Companion, false, bluetoothDevice2.getName(), bluetoothDevice2.getAddress(), -1, -1));
                            break;
                        }
                    }
                }
                break;
            case 1:
                w13 w13Var = (w13) obj;
                if (!intent.getAction().equals("android.intent.action.SCREEN_OFF")) {
                    if (intent.getAction().equals("android.intent.action.SCREEN_ON")) {
                        w13Var.a(false, w13Var.f10996c);
                        w13Var.f10995b = false;
                        break;
                    }
                } else {
                    w13Var.a(true, w13Var.f10996c);
                    w13Var.f10995b = true;
                    break;
                }
                break;
            case 2:
                ((e) obj).d((UserManager) context.getSystemService(UserManager.class));
                break;
            case 3:
                n0 n0Var2 = (n0) obj;
                if (Intrinsics.b(intent.getAction(), "android.net.wifi.WIFI_STATE_CHANGED")) {
                    int intExtra2 = intent.getIntExtra("wifi_state", -1);
                    if (intExtra2 == 1) {
                        m mVar3 = c0.Companion;
                        long jCurrentTimeMillis3 = System.currentTimeMillis();
                        mVar3.getClass();
                        n0Var2.invoke(new y(false, jCurrentTimeMillis3));
                        break;
                    } else if (intExtra2 == 3) {
                        m mVar4 = c0.Companion;
                        long jCurrentTimeMillis4 = System.currentTimeMillis();
                        mVar4.getClass();
                        n0Var2.invoke(new y(true, jCurrentTimeMillis4));
                        break;
                    }
                }
                break;
            case 4:
                NovaLauncher novaLauncher = (NovaLauncher) ((n1) obj);
                if (novaLauncher.f80010k0 == null) {
                    j2 j2Var = l2.f79974m;
                    novaLauncher.t0(j2Var);
                    novaLauncher.M.i(j2Var, false);
                }
                if (novaLauncher.f80010k0 == null) {
                    if (Intrinsics.b((ra.a) novaLauncher.M.f85765g, l2.f79974m)) {
                        novaLauncher.V.q(false);
                    }
                    novaLauncher.n1(false);
                    break;
                }
                break;
            case 5:
                Intrinsics.g(context, "context");
                Intrinsics.g(intent, "intent");
                v7.a aVar = (v7.a) obj;
                switch (aVar.f92123g) {
                    case 0:
                        String action2 = intent.getAction();
                        if (action2 != null) {
                            r rVarC = r.c();
                            String str = v7.b.f92124a;
                            rVarC.getClass();
                            switch (action2.hashCode()) {
                                case -1886648615:
                                    if (action2.equals("android.intent.action.ACTION_POWER_DISCONNECTED")) {
                                        aVar.b(Boolean.FALSE);
                                        break;
                                    }
                                    break;
                                case -54942926:
                                    if (action2.equals("android.os.action.DISCHARGING")) {
                                        aVar.b(Boolean.FALSE);
                                        break;
                                    }
                                    break;
                                case 948344062:
                                    if (action2.equals("android.os.action.CHARGING")) {
                                        aVar.b(Boolean.TRUE);
                                        break;
                                    }
                                    break;
                                case 1019184907:
                                    if (action2.equals("android.intent.action.ACTION_POWER_CONNECTED")) {
                                        aVar.b(Boolean.TRUE);
                                        break;
                                    }
                                    break;
                            }
                        }
                        break;
                    case 1:
                        if (intent.getAction() != null) {
                            r rVarC2 = r.c();
                            String str2 = v7.c.f92125a;
                            intent.getAction();
                            rVarC2.getClass();
                            String action3 = intent.getAction();
                            if (action3 != null) {
                                int iHashCode2 = action3.hashCode();
                                if (iHashCode2 == -1980154005) {
                                    if (action3.equals("android.intent.action.BATTERY_OKAY")) {
                                        aVar.b(Boolean.TRUE);
                                        break;
                                    }
                                } else if (iHashCode2 == 490310653 && action3.equals("android.intent.action.BATTERY_LOW")) {
                                    aVar.b(Boolean.FALSE);
                                    break;
                                }
                            }
                        }
                        break;
                    default:
                        if (intent.getAction() != null) {
                            r rVarC3 = r.c();
                            int i11 = i.f92136a;
                            intent.getAction();
                            rVarC3.getClass();
                            String action4 = intent.getAction();
                            if (action4 != null) {
                                int iHashCode3 = action4.hashCode();
                                if (iHashCode3 == -1181163412) {
                                    if (action4.equals("android.intent.action.DEVICE_STORAGE_LOW")) {
                                        aVar.b(Boolean.FALSE);
                                        break;
                                    }
                                } else if (iHashCode3 == -730838620 && action4.equals("android.intent.action.DEVICE_STORAGE_OK")) {
                                    aVar.b(Boolean.TRUE);
                                    break;
                                }
                            }
                        }
                        break;
                }
            case 6:
                ((Consumer) obj).accept(intent);
                break;
            default:
                z9.h hVar = (z9.h) obj;
                String action5 = intent.getAction();
                if (!"android.intent.action.SCREEN_OFF".equals(action5)) {
                    if ("android.intent.action.USER_PRESENT".equals(action5)) {
                        hVar.f98400p = false;
                        break;
                    }
                } else {
                    hVar.f98400p = true;
                    break;
                }
                break;
        }
    }

    public a() {
        this.f77680a = 1;
        this.f77681b = w13.f10993d;
    }

    public a(Consumer consumer) {
        this.f77680a = 6;
        this.f77681b = consumer;
    }
}
