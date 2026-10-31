package com.bytedance.sdk.openadsdk.dj;

/* loaded from: classes2.dex */
public class dj {
    public static String ycx() {
        return "CREATE TABLE IF NOT EXISTS adevent (_id INTEGER PRIMARY KEY AUTOINCREMENT,id TEXT UNIQUE,value TEXT ,gen_time TEXT , retry INTEGER default 0 , encrypt INTEGER default 0 , channel INTEGER default 0)";
    }

    public static String zb() {
        return "ALTER TABLE adevent ADD COLUMN encrypt INTEGER default 0";
    }
}
