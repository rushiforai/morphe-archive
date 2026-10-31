package sx;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import com.bykv.vk.openvk.preload.falconx.statistic.StatisticData;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Unit;
import kotlin.io.CloseableKt;
import o9.x2;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final x2 f87745a;

    public a(Context context) {
        this.f87745a = new x2(context.getApplicationContext(), "ad_mediation.db", null, 3, 1);
    }

    public final void a() {
        try {
            this.f87745a.getWritableDatabase().delete("ad_observations", null, null);
        } catch (Exception e3) {
            mc0.d.f76206a.f(e3, "Failed to clear data", new Object[0]);
        }
    }

    public final k b(String str, String str2, o oVar) {
        return e(str2, "base_ad_unit_id = ? AND network = ? AND tier = ?", StatisticData.ERROR_CODE_NOT_FOUND, new String[]{str, oVar.f87816a, str2});
    }

    public final int c(String str, String str2, o oVar) {
        Exception exc;
        int i5;
        try {
            Cursor cursorQuery = this.f87745a.getWritableDatabase().query("ad_observations", new String[]{"filled"}, "base_ad_unit_id = ? AND network = ? AND tier = ?", new String[]{str, oVar.f87816a, str2}, null, null, "id DESC", "20");
            i5 = 0;
            while (cursorQuery.moveToNext() && cursorQuery.getInt(cursorQuery.getColumnIndexOrThrow("filled")) != 1) {
                try {
                    try {
                        i5++;
                    } finally {
                    }
                } catch (Exception e3) {
                    exc = e3;
                    mc0.d.f76206a.f(exc, "Failed to get consecutive failures", new Object[0]);
                    return i5;
                }
            }
            Unit unit = Unit.f71706a;
            CloseableKt.a(cursorQuery, null);
            return i5;
        } catch (Exception e11) {
            exc = e11;
            i5 = 0;
        }
    }

    public final LinkedHashMap d(String str) {
        i70.a aVar = o.f87815f;
        int iD0 = b70.k.d0(b70.c.u0(aVar, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        b70.a aVar2 = new b70.a(aVar);
        while (aVar2.hasNext()) {
            Object next = aVar2.next();
            String str2 = ((o) next).f87816a;
            linkedHashMap.put(next, e(str2, "base_ad_unit_id = ? AND network = ?", "200", new String[]{str, str2}));
        }
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            k kVar = (k) entry.getValue();
            if (kVar.f87797b > 0 || kVar.f87799d > 0.0d) {
                linkedHashMap2.put(entry.getKey(), entry.getValue());
            }
        }
        return linkedHashMap2;
    }

    public final k e(String str, String str2, String str3, String[] strArr) throws IOException {
        double d5;
        double d11;
        double d12;
        int i5;
        double d13;
        double d14;
        String str4;
        boolean z11;
        double dPow;
        String str5 = "cpm";
        String str6 = "filled";
        long jCurrentTimeMillis = System.currentTimeMillis();
        try {
            Cursor cursorQuery = this.f87745a.getWritableDatabase().query("ad_observations", new String[]{"timestamp", "filled", "cpm"}, str2, strArr, null, null, "timestamp DESC", str3);
            double d15 = 0.0d;
            double d16 = 0.0d;
            i5 = 0;
            d12 = 0.0d;
            while (cursorQuery.moveToNext()) {
                try {
                    try {
                        long j11 = cursorQuery.getLong(cursorQuery.getColumnIndexOrThrow("timestamp"));
                        int i11 = cursorQuery.getInt(cursorQuery.getColumnIndexOrThrow(str6));
                        String str7 = str6;
                        boolean z12 = true;
                        if (i11 != 1) {
                            z12 = false;
                        }
                        double d17 = cursorQuery.getDouble(cursorQuery.getColumnIndexOrThrow(str5));
                        double d18 = (jCurrentTimeMillis - j11) / 3600000.0d;
                        if (d18 <= 0.0d) {
                            dPow = 1.0d;
                            str4 = str5;
                            z11 = z12;
                        } else {
                            str4 = str5;
                            z11 = z12;
                            dPow = Math.pow(0.5d, d18 / 24.0d);
                        }
                        i5++;
                        d16 += dPow;
                        if (z11) {
                            d15 += dPow;
                            d12 = (d17 * dPow) + d12;
                        }
                        str5 = str4;
                        str6 = str7;
                    } finally {
                    }
                } catch (Exception e3) {
                    e = e3;
                    d11 = d15;
                    d5 = d16;
                    mc0.d.f76206a.f(e, "Failed to query stats", new Object[0]);
                    d13 = d11;
                    d14 = d5;
                    return new k(str, i5, d13, d14, d12);
                }
            }
            Unit unit = Unit.f71706a;
            cursorQuery.close();
            d13 = d15;
            d14 = d16;
        } catch (Exception e11) {
            e = e11;
            d5 = 0.0d;
            d11 = 0.0d;
            d12 = 0.0d;
            i5 = 0;
        }
        return new k(str, i5, d13, d14, d12);
    }

    public final void f(String str, o oVar, String str2, boolean z11, double d5) {
        try {
            ContentValues contentValues = new ContentValues();
            contentValues.put("timestamp", Long.valueOf(System.currentTimeMillis()));
            contentValues.put("base_ad_unit_id", str);
            contentValues.put("network", oVar.f87816a);
            contentValues.put("tier", str2);
            contentValues.put("filled", Integer.valueOf(z11 ? 1 : 0));
            if (!z11) {
                d5 = 0.0d;
            }
            contentValues.put("cpm", Double.valueOf(d5));
            this.f87745a.getWritableDatabase().insert("ad_observations", null, contentValues);
        } catch (Exception e3) {
            mc0.d.f76206a.f(e3, "Failed to record observation", new Object[0]);
        }
    }
}
