package defpackage;

import android.content.Context;
import android.os.PowerManager;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hy2 {
    public final Context a;
    public final dm4 b;
    public final u3 c;
    public final w5d d = new w5d(new nh2(3, this));

    public hy2(Context context, dm4 dm4Var, u3 u3Var) {
        this.a = context;
        this.b = dm4Var;
        this.c = u3Var;
    }

    public final void a(String str, Throwable th, Map map) {
        str.getClass();
        map.getClass();
        LinkedHashMap linkedHashMapS = ei7.S(map, c());
        e87 e87Var = (e87) this.d.getValue();
        e87Var.getClass();
        e87.b(e87Var, 6, str, th, linkedHashMapS);
    }

    public final void b(String str, dh7 dh7Var) {
        LinkedHashMap linkedHashMapS = ei7.S(dh7Var, c());
        e87 e87Var = (e87) this.d.getValue();
        e87Var.getClass();
        e87.b(e87Var, 4, str, null, linkedHashMapS);
    }

    public final LinkedHashMap c() {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        String strD = this.c.d();
        if (strD != null) {
            linkedHashMap.put("user_id", strD);
        }
        g04<nl4> entries = nl4.getEntries();
        int iP = ei7.P(cu1.k0(entries, 10));
        if (iP < 16) {
            iP = 16;
        }
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(iP);
        for (nl4 nl4Var : entries) {
            linkedHashMap2.put(nl4Var.name(), Boolean.valueOf(this.b.b(nl4Var)));
        }
        linkedHashMap.put("flags", linkedHashMap2);
        PowerManager powerManager = (PowerManager) this.a.getSystemService(PowerManager.class);
        if (powerManager != null) {
            linkedHashMap.put("is_device_idle_mode", Boolean.valueOf(powerManager.isDeviceIdleMode()));
            linkedHashMap.put("is_power_save_mode", Boolean.valueOf(powerManager.isPowerSaveMode()));
        }
        return linkedHashMap;
    }
}
