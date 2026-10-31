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
public class ycx extends sya {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23902dj;
    private final Context sya;
    protected List<String> ycx;

    public ycx(Context context, com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar) {
        super(context);
        this.ycx = new ArrayList();
        this.sya = context;
        this.f23902dj = ycxVar;
        if (ycxVar == null) {
            this.f23902dj = com.bytedance.sdk.component.lt.ycx.dj.zb.ycx.sya();
        }
    }

    public byte dj() {
        return (byte) 0;
    }

    public byte sya() {
        return (byte) 2;
    }

    public int ycx() {
        Cursor cursorYcx = null;
        int i5 = 0;
        try {
            cursorYcx = com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(lud(), zb(), new String[]{"count(1)"}, null, null, null, null, null);
            if (cursorYcx != null) {
                cursorYcx.moveToFirst();
                i5 = cursorYcx.getInt(0);
            }
        } catch (Exception unused) {
            if (cursorYcx != null) {
            }
        } catch (Throwable th2) {
            if (cursorYcx != null) {
                try {
                    cursorYcx.close();
                } catch (Exception unused2) {
                }
            }
            throw th2;
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
    public String zb() {
        com.bytedance.sdk.component.lt.ycx.ycx.lud ludVarSya = com.bytedance.sdk.component.lt.ycx.ul.lt().sya();
        if (ludVarSya != null) {
            return ludVarSya.zb();
        }
        return null;
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

    public List<com.bytedance.sdk.component.lt.ycx.dj.ycx> ycx(int i5, String str) {
        String str2;
        String[] strArr;
        String str3;
        byte b11;
        Cursor cursorYcx;
        long jYcx = com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx(i5, lud());
        zb();
        if (jYcx <= 0) {
            jYcx = 1;
        } else if (jYcx > 100) {
            jYcx = 100;
        }
        String str4 = str + " DESC limit " + jYcx;
        ArrayList arrayList = new ArrayList();
        this.ycx.clear();
        long jDy = com.bytedance.sdk.component.lt.ycx.ul.lt().dy();
        if (jDy > 0) {
            strArr = new String[]{String.valueOf(System.currentTimeMillis() - jDy)};
            str2 = "gen_time>?";
        } else {
            str2 = null;
            strArr = null;
        }
        if (com.bytedance.sdk.component.lt.ycx.sya.ycx.dj() && dj() == 3) {
            str3 = "id";
            b11 = 3;
            cursorYcx = com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(lud(), zb(), new String[]{"id", "value", "encrypt", "channel"}, str2, strArr, null, null, str4);
        } else {
            str3 = "id";
            b11 = 3;
            cursorYcx = com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(lud(), zb(), new String[]{str3, "value", "encrypt"}, str2, strArr, null, null, str4);
        }
        Cursor cursor = cursorYcx;
        if (cursor != null) {
            try {
                com.bytedance.sdk.component.lt.ycx.lud ludVarSyc = com.bytedance.sdk.component.lt.ycx.ul.lt().syc();
                while (cursor.moveToNext()) {
                    try {
                        String string = cursor.getString(cursor.getColumnIndex(str3));
                        String string2 = cursor.getString(cursor.getColumnIndex("value"));
                        int i11 = cursor.getInt(cursor.getColumnIndex("encrypt"));
                        int i12 = (com.bytedance.sdk.component.lt.ycx.sya.ycx.dj() && dj() == b11) ? cursor.getInt(cursor.getColumnIndex("channel")) : 0;
                        if (i11 == 1) {
                            try {
                                string2 = ludVarSyc.ycx(string2);
                            } catch (Throwable th2) {
                                th = th2;
                                th.getMessage();
                            }
                        }
                        if (TextUtils.isEmpty(string2)) {
                            this.ycx.add(string);
                        } else {
                            if (arrayList.size() > 100) {
                                break;
                            }
                            JSONObject jSONObject = new JSONObject(string2);
                            com.bytedance.sdk.component.lt.ycx.dj.ycx.ycx ycxVar = new com.bytedance.sdk.component.lt.ycx.dj.ycx.ycx(string, jSONObject);
                            ycxVar.zb(dj());
                            ycxVar.sya(sya());
                            if (com.bytedance.sdk.component.lt.ycx.sya.ycx.dj() && dj() == b11) {
                                ycxVar.ycx(i12);
                            }
                            com.bytedance.sdk.component.lt.ycx.sya.ycx.ycx(jSONObject, ycxVar);
                            arrayList.add(ycxVar);
                        }
                    } catch (Throwable th3) {
                        th = th3;
                    }
                }
            } finally {
                try {
                    cursor.close();
                    if (!this.ycx.isEmpty()) {
                        ycx(this.ycx);
                        this.ycx.clear();
                    }
                } catch (Exception unused) {
                }
            }
        }
        zb();
        arrayList.size();
        return arrayList;
    }

    private void zb(int i5, long j11) {
        if (j11 > 0 || i5 > 0) {
            com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(lud(), zb(), "gen_time <? OR retry >?", new String[]{String.valueOf(System.currentTimeMillis() - j11), String.valueOf(i5)});
            zb();
        }
    }

    public static String zb(String str) {
        return c0.l("CREATE TABLE IF NOT EXISTS ", str, " (_id INTEGER PRIMARY KEY AUTOINCREMENT,id TEXT UNIQUE,value TEXT ,gen_time TEXT , retry INTEGER default 0 , encrypt INTEGER default 0)");
    }

    public List<com.bytedance.sdk.component.lt.ycx.dj.ycx> ycx(String str) {
        com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar = this.f23902dj;
        if (ycxVar == null) {
            return new ArrayList();
        }
        return ycx(ycxVar.zb(), str);
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
        if (this.f23902dj == null) {
            return false;
        }
        int iYcx = ycx();
        int iYcx2 = this.f23902dj.ycx();
        zb();
        return (com.bytedance.sdk.component.lt.ycx.sya.ycx.sya() && (i5 == 1 || i5 == 2)) ? iYcx > 0 : iYcx >= iYcx2;
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
