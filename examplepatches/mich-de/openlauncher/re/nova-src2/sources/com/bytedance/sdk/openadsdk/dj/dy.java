package com.bytedance.sdk.openadsdk.dj;

/* loaded from: classes2.dex */
public class dy {
    public static String ycx() {
        return "CREATE TABLE IF NOT EXISTS logstats (_id INTEGER PRIMARY KEY AUTOINCREMENT,id TEXT UNIQUE,value TEXT ,gen_time TEXT , encrypt INTEGER default 0 , retry INTEGER default 0)";
    }

    public static String zb() {
        return "ALTER TABLE logstats ADD COLUMN encrypt INTEGER default 0";
    }
}
