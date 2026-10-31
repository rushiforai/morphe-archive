package com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx;

import android.content.Context;
import android.database.Cursor;
import android.text.TextUtils;
import b.c0;
import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ul extends sya {
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx sya;
    protected List<String> ycx;

    public ul(Context context, com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar) {
        super(context);
        this.ycx = new ArrayList();
        this.sya = ycxVar;
        if (ycxVar == null) {
            this.sya = com.bytedance.sdk.component.lt.ycx.dj.zb.ycx.sya();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0023 A[EXC_TOP_SPLITTER, PHI: r0 r1
      0x0023: PHI (r0v2 int) = (r0v0 int), (r0v6 int) binds: [B:10:0x0028, B:6:0x0021] A[DONT_GENERATE, DONT_INLINE]
      0x0023: PHI (r1v2 android.database.Cursor) = (r1v1 android.database.Cursor), (r1v4 android.database.Cursor) binds: [B:10:0x0028, B:6:0x0021] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public int dj() {
        Cursor cursorYcx;
        int i5 = 0;
        try {
            cursorYcx = com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(lud(), zb(), new String[]{"count(1)"}, null, null, null, null, null);
            if (cursorYcx != null) {
                try {
                    cursorYcx.moveToFirst();
                    i5 = cursorYcx.getInt(0);
                } catch (Throwable unused) {
                    if (cursorYcx != null) {
                    }
                    return i5;
                }
            }
        } catch (Throwable unused2) {
            cursorYcx = null;
        }
        if (cursorYcx != null) {
            try {
                cursorYcx.close();
            } catch (Exception unused3) {
            }
        }
        return i5;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.sya
    public long lt() {
        return com.bytedance.sdk.component.lt.ycx.ul.ycx.zb();
    }

    public byte sya() {
        return (byte) 2;
    }

    public byte ycx() {
        return (byte) 1;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.sya
    public String zb() {
        return com.bytedance.sdk.component.lt.ycx.ul.lt().sya().dj();
    }

    public static String sya(String str) {
        return c0.l("CREATE TABLE IF NOT EXISTS ", str, " (_id INTEGER PRIMARY KEY AUTOINCREMENT,id TEXT UNIQUE,value TEXT ,gen_time TEXT , retry INTEGER default 0 , encrypt INTEGER default 0)");
    }

    public List<com.bytedance.sdk.component.lt.ycx.dj.ycx> ycx(int i5, String str) {
        long jYcx = com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx(i5, lud());
        if (jYcx <= 0) {
            jYcx = 1;
        } else if (jYcx > 100) {
            jYcx = 100;
        }
        ArrayList arrayList = new ArrayList();
        this.ycx.clear();
        Cursor cursorYcx = com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(lud(), zb(), new String[]{"id", "value", "encrypt"}, null, null, null, null, str + " DESC limit " + jYcx);
        if (cursorYcx != null) {
            while (cursorYcx.moveToNext()) {
                try {
                    try {
                        String string = cursorYcx.getString(cursorYcx.getColumnIndex("id"));
                        String string2 = cursorYcx.getString(cursorYcx.getColumnIndex("value"));
                        if (cursorYcx.getInt(cursorYcx.getColumnIndex("encrypt")) == 1) {
                            string2 = com.bytedance.sdk.component.lt.ycx.ul.lt().syc().ycx(string2);
                        }
                        if (TextUtils.isEmpty(string2)) {
                            this.ycx.add(string);
                        } else {
                            if (arrayList.size() > 100) {
                                break;
                            }
                            com.bytedance.sdk.component.lt.ycx.dj.ycx.ycx ycxVar = new com.bytedance.sdk.component.lt.ycx.dj.ycx.ycx(string, new JSONObject(string2));
                            ycxVar.sya(sya());
                            ycxVar.zb(ycx());
                            arrayList.add(ycxVar);
                        }
                    } catch (Throwable unused) {
                    }
                } finally {
                }
            }
            try {
                cursorYcx.close();
                if (!this.ycx.isEmpty()) {
                    ycx(this.ycx);
                    this.ycx.clear();
                }
            } catch (Exception unused2) {
            }
        }
        return arrayList;
    }

    public List<com.bytedance.sdk.component.lt.ycx.dj.ycx> zb(String str) {
        com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar = this.sya;
        return ycxVar == null ? new ArrayList() : ycx(ycxVar.zb(), str);
    }

    public void zb(List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list) {
        if (list == null || list.size() == 0) {
            return;
        }
        LinkedList linkedList = new LinkedList();
        for (com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar : list) {
            linkedList.add(ycxVar.sya());
            com.bytedance.sdk.component.lt.ycx.sya.ycx.jc(ycxVar);
        }
        zb();
        linkedList.size();
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(lud(), "DELETE FROM " + zb() + " WHERE " + ycx("id", linkedList, 1000, true));
        sya(linkedList);
    }

    private void zb(int i5, long j11) {
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(lud(), zb(), "gen_time <? AND retry >?", new String[]{String.valueOf(System.currentTimeMillis() - j11), String.valueOf(i5)});
    }

    public void ycx(List<String> list) {
        zb();
        list.size();
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(lud(), "DELETE FROM " + zb() + " WHERE " + ycx("id", list, 1000, true));
        com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.lv(), list.size());
        sya(list);
    }

    public void ycx(int i5, long j11) {
        zb(i5, j11);
    }

    public boolean ycx(int i5) {
        return this.sya != null && dj() >= this.sya.ycx();
    }

    private static String ycx(String str, List<?> list, int i5, boolean z11) {
        int i11;
        String str2 = z11 ? " IN " : " NOT IN ";
        String str3 = z11 ? " OR " : " AND ";
        int iMin = Math.min(i5, 1000);
        int size = list.size();
        if (size % iMin == 0) {
            i11 = size / iMin;
        } else {
            i11 = (size / iMin) + 1;
        }
        StringBuilder sb2 = new StringBuilder();
        for (int i12 = 0; i12 < i11; i12++) {
            int i13 = i12 * iMin;
            String strYcx = ycx(TextUtils.join("','", list.subList(i13, Math.min(i13 + iMin, size))), b.f42142b);
            if (i12 != 0) {
                sb2.append(str3);
            }
            c0.D(sb2, str, str2, "('", strYcx);
            sb2.append("')");
        }
        return ycx(sb2.toString(), u4.m(str, str2, "('')"));
    }

    private static String ycx(String str, String str2) {
        return !TextUtils.isEmpty(str) ? str : str2;
    }
}
