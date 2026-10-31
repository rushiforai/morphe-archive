package v7;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import o7.r;

/* loaded from: classes.dex */
public final class a extends e {

    /* renamed from: f, reason: collision with root package name */
    public final n10.a f92122f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f92123g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(Context context, a8.c cVar, int i5) {
        super(context, cVar);
        this.f92123g = i5;
        this.f92122f = new n10.a(this, 5);
    }

    @Override // v7.e
    public final Object a() {
        switch (this.f92123g) {
            case 0:
                Intent intentRegisterReceiver = this.f92128b.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
                if (intentRegisterReceiver == null) {
                    r.c().a(b.f92124a, "getInitialState - null intent received");
                    return Boolean.FALSE;
                }
                int intExtra = intentRegisterReceiver.getIntExtra("status", -1);
                return Boolean.valueOf(intExtra == 2 || intExtra == 5);
            case 1:
                Intent intentRegisterReceiver2 = this.f92128b.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
                if (intentRegisterReceiver2 == null) {
                    r.c().a(c.f92125a, "getInitialState - null intent received");
                    return Boolean.FALSE;
                }
                int intExtra2 = intentRegisterReceiver2.getIntExtra("status", -1);
                float intExtra3 = intentRegisterReceiver2.getIntExtra("level", -1) / intentRegisterReceiver2.getIntExtra("scale", -1);
                boolean z11 = true;
                if (intExtra2 != 1 && intExtra3 <= 0.15f) {
                    z11 = false;
                }
                return Boolean.valueOf(z11);
            default:
                Intent intentRegisterReceiver3 = this.f92128b.registerReceiver(null, e());
                boolean z12 = true;
                if (intentRegisterReceiver3 != null && intentRegisterReceiver3.getAction() != null) {
                    String action = intentRegisterReceiver3.getAction();
                    if (action == null) {
                        z12 = false;
                    } else {
                        int iHashCode = action.hashCode();
                        if (iHashCode == -1181163412) {
                            action.equals("android.intent.action.DEVICE_STORAGE_LOW");
                        } else if (iHashCode != -730838620 || !action.equals("android.intent.action.DEVICE_STORAGE_OK")) {
                        }
                        z12 = false;
                    }
                }
                return Boolean.valueOf(z12);
        }
    }

    @Override // v7.e
    public final void c() {
        r rVarC = r.c();
        int i5 = d.f92126a;
        rVarC.getClass();
        this.f92128b.registerReceiver(this.f92122f, e());
    }

    @Override // v7.e
    public final void d() {
        r rVarC = r.c();
        int i5 = d.f92126a;
        rVarC.getClass();
        this.f92128b.unregisterReceiver(this.f92122f);
    }

    public final IntentFilter e() {
        switch (this.f92123g) {
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
}
