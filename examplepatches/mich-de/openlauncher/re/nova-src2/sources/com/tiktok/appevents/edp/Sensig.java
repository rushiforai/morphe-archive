package com.tiktok.appevents.edp;

import android.text.TextUtils;

/* loaded from: classes4.dex */
public class Sensig {
    public String regexList;
    public int version;

    public Sensig(int i5, String str) {
        this.version = i5;
        this.regexList = str;
        if (TextUtils.isEmpty(str)) {
            this.regexList = EDPConfig.DEFAULT_SENSIG_FILTERING_REGEX_LIST;
        }
    }

    public String getRegexList() {
        return this.regexList;
    }

    public int getVersion() {
        return this.version;
    }

    public void setRegexList(String str) {
        this.regexList = str;
    }

    public void setVersion(int i5) {
        this.version = i5;
    }
}
