package defpackage;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jq0 extends az0 {
    public final /* synthetic */ int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jq0(Context context, q7f q7fVar, int i) {
        super(context, q7fVar);
        this.g = i;
    }

    @Override // defpackage.q62
    public final Object c() {
        int i = this.g;
        Object obj = this.b;
        boolean z = true;
        switch (i) {
            case 0:
                Intent intentRegisterReceiver = ((Context) obj).registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
                if (intentRegisterReceiver == null) {
                    d87.h().f(kq0.a, "getInitialState - null intent received");
                    return Boolean.FALSE;
                }
                int intExtra = intentRegisterReceiver.getIntExtra("status", -1);
                if (intExtra != 2 && intExtra != 5) {
                    z = false;
                }
                return Boolean.valueOf(z);
            case 1:
                Intent intentRegisterReceiver2 = ((Context) obj).registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
                if (intentRegisterReceiver2 == null) {
                    d87.h().f(lq0.a, "getInitialState - null intent received");
                    return Boolean.FALSE;
                }
                float intExtra2 = intentRegisterReceiver2.getIntExtra("level", -1) / intentRegisterReceiver2.getIntExtra("scale", -1);
                if (intentRegisterReceiver2.getIntExtra("status", -1) != 1 && intExtra2 <= 0.15f) {
                    z = false;
                }
                return Boolean.valueOf(z);
            default:
                Intent intentRegisterReceiver3 = ((Context) obj).registerReceiver(null, g());
                if (intentRegisterReceiver3 != null && intentRegisterReceiver3.getAction() != null) {
                    String action = intentRegisterReceiver3.getAction();
                    if (action == null) {
                        z = false;
                    } else {
                        int iHashCode = action.hashCode();
                        if (iHashCode == -1181163412) {
                            action.equals("android.intent.action.DEVICE_STORAGE_LOW");
                        } else if (iHashCode != -730838620 || !action.equals("android.intent.action.DEVICE_STORAGE_OK")) {
                        }
                        z = false;
                    }
                }
                return Boolean.valueOf(z);
        }
    }

    @Override // defpackage.az0
    public final IntentFilter g() {
        switch (this.g) {
            case 0:
                IntentFilter intentFilter = new IntentFilter();
                intentFilter.addAction("android.os.action.CHARGING");
                intentFilter.addAction("android.os.action.DISCHARGING");
                return intentFilter;
            case 1:
                IntentFilter intentFilter2 = new IntentFilter();
                intentFilter2.addAction("android.intent.action.BATTERY_OKAY");
                intentFilter2.addAction("android.intent.action.BATTERY_LOW");
                return intentFilter2;
            default:
                IntentFilter intentFilter3 = new IntentFilter();
                intentFilter3.addAction("android.intent.action.DEVICE_STORAGE_OK");
                intentFilter3.addAction("android.intent.action.DEVICE_STORAGE_LOW");
                return intentFilter3;
        }
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    @Override // defpackage.az0
    public final void h(Intent intent) {
        switch (this.g) {
            case 0:
                String action = intent.getAction();
                if (action != null) {
                    d87.h().d(kq0.a, "Received ".concat(action));
                    switch (action.hashCode()) {
                        case -1886648615:
                            if (action.equals("android.intent.action.ACTION_POWER_DISCONNECTED")) {
                                d(Boolean.FALSE);
                                break;
                            }
                            break;
                        case -54942926:
                            if (action.equals("android.os.action.DISCHARGING")) {
                                d(Boolean.FALSE);
                                break;
                            }
                            break;
                        case 948344062:
                            if (action.equals("android.os.action.CHARGING")) {
                                d(Boolean.TRUE);
                                break;
                            }
                            break;
                        case 1019184907:
                            if (action.equals("android.intent.action.ACTION_POWER_CONNECTED")) {
                                d(Boolean.TRUE);
                                break;
                            }
                            break;
                    }
                }
                break;
            case 1:
                if (intent.getAction() != null) {
                    d87.h().d(lq0.a, "Received " + intent.getAction());
                    String action2 = intent.getAction();
                    if (action2 != null) {
                        int iHashCode = action2.hashCode();
                        if (iHashCode != -1980154005) {
                            if (iHashCode == 490310653 && action2.equals("android.intent.action.BATTERY_LOW")) {
                                d(Boolean.FALSE);
                            }
                            break;
                        } else if (action2.equals("android.intent.action.BATTERY_OKAY")) {
                            d(Boolean.TRUE);
                            break;
                        }
                    }
                }
                break;
            default:
                if (intent.getAction() != null) {
                    d87.h().d(csc.a, "Received " + intent.getAction());
                    String action3 = intent.getAction();
                    if (action3 != null) {
                        int iHashCode2 = action3.hashCode();
                        if (iHashCode2 != -1181163412) {
                            if (iHashCode2 == -730838620 && action3.equals("android.intent.action.DEVICE_STORAGE_OK")) {
                                d(Boolean.TRUE);
                            }
                            break;
                        } else if (action3.equals("android.intent.action.DEVICE_STORAGE_LOW")) {
                            d(Boolean.FALSE);
                            break;
                        }
                    }
                }
                break;
        }
    }
}
