package com.bytedance.sdk.component.lt.ycx.lt;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.text.TextUtils;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.LinkedList;
import java.util.List;

/* loaded from: classes2.dex */
public class lt implements lud {
    private Context ycx;

    public lt(Context context) {
        this.ycx = context;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lt.lud
    public void sya(dj djVar) {
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(this.ycx, "trackurl", "id=?", new String[]{djVar.ycx()});
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lt.lud
    public List<dj> ycx() {
        LinkedList linkedList = new LinkedList();
        Cursor cursorYcx = com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(this.ycx, "trackurl", null, null, null, null, null, null);
        if (cursorYcx != null) {
            while (cursorYcx.moveToNext()) {
                try {
                    try {
                        String string = cursorYcx.getString(cursorYcx.getColumnIndex("id"));
                        String string2 = cursorYcx.getString(cursorYcx.getColumnIndex(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL));
                        boolean z11 = cursorYcx.getInt(cursorYcx.getColumnIndex("replaceholder")) > 0;
                        int i5 = cursorYcx.getInt(cursorYcx.getColumnIndex("retry"));
                        int i11 = cursorYcx.getInt(cursorYcx.getColumnIndex("url_type"));
                        String string3 = cursorYcx.getString(cursorYcx.getColumnIndex("ad_id"));
                        String string4 = cursorYcx.getString(cursorYcx.getColumnIndex("error_code"));
                        String string5 = cursorYcx.getString(cursorYcx.getColumnIndex("error_msg"));
                        dj djVar = new dj(string, string2, z11, i11, string3);
                        djVar.ycx(i5);
                        if (!TextUtils.isEmpty(string4)) {
                            djVar.ycx(string4);
                        }
                        if (!TextUtils.isEmpty(string5)) {
                            djVar.zb(string5);
                        }
                        linkedList.add(djVar);
                    } catch (Throwable unused) {
                    }
                } finally {
                    cursorYcx.close();
                }
            }
            return linkedList;
        }
        return linkedList;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lt.lud
    public void zb(dj djVar) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("id", djVar.ycx());
        contentValues.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, djVar.zb());
        contentValues.put("replaceholder", Integer.valueOf(djVar.sya() ? 1 : 0));
        contentValues.put("retry", Integer.valueOf(djVar.dj()));
        contentValues.put("error_code", djVar.ul());
        contentValues.put("error_msg", djVar.jw());
        contentValues.put("url_type", Integer.valueOf(djVar.lud()));
        contentValues.put("ad_id", djVar.lt());
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(this.ycx, "trackurl", contentValues, "id=?", new String[]{djVar.ycx()});
    }

    public static String zb() {
        return "CREATE TABLE IF NOT EXISTS trackurl (_id INTEGER PRIMARY KEY AUTOINCREMENT,id TEXT UNIQUE,url TEXT ,replaceholder INTEGER default 0, retry INTEGER default 0)";
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lt.lud
    public dj ycx(String str) {
        Cursor cursorYcx = com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(this.ycx, "trackurl", null, "id=?", new String[]{str}, null, null, null);
        if (cursorYcx != null && cursorYcx.moveToFirst()) {
            try {
                String string = cursorYcx.getString(cursorYcx.getColumnIndex("id"));
                String string2 = cursorYcx.getString(cursorYcx.getColumnIndex(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL));
                boolean z11 = cursorYcx.getInt(cursorYcx.getColumnIndex("replaceholder")) > 0;
                int i5 = cursorYcx.getInt(cursorYcx.getColumnIndex("retry"));
                int i11 = cursorYcx.getInt(cursorYcx.getColumnIndex("url_type"));
                String string3 = cursorYcx.getString(cursorYcx.getColumnIndex("ad_id"));
                String string4 = cursorYcx.getString(cursorYcx.getColumnIndex("error_code"));
                String string5 = cursorYcx.getString(cursorYcx.getColumnIndex("error_msg"));
                dj djVar = new dj(string, string2, z11, i11, string3);
                djVar.ycx(i5);
                if (!TextUtils.isEmpty(string4)) {
                    djVar.ycx(string4);
                }
                if (!TextUtils.isEmpty(string5)) {
                    djVar.zb(string5);
                }
                return djVar;
            } catch (Throwable th2) {
                try {
                    th2.getMessage();
                    cursorYcx.close();
                    cursorYcx = null;
                } finally {
                    cursorYcx.close();
                }
            }
        }
        if (cursorYcx != null) {
        }
        return null;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lt.lud
    public void ycx(dj djVar) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("id", djVar.ycx());
        contentValues.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, djVar.zb());
        contentValues.put("replaceholder", Integer.valueOf(djVar.sya() ? 1 : 0));
        contentValues.put("retry", Integer.valueOf(djVar.dj()));
        contentValues.put("url_type", Integer.valueOf(djVar.lud()));
        contentValues.put("ad_id", djVar.lt());
        contentValues.put("error_code", djVar.ul());
        contentValues.put("error_msg", djVar.jw());
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(this.ycx, "trackurl", contentValues);
    }
}
