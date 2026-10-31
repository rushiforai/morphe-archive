package com.tiktok.appevents;

/* loaded from: classes4.dex */
public class ErrorData {
    public static final int TT_DDL_CODE_HTTP_ERROR = -2;
    public static final int TT_DDL_CODE_NOT_INIT = -1;
    public static final String TT_DDL_MSG_HTTP_ERROR = "HTTP error";
    public static final String TT_DDL_MSG_NOT_INIT = "SDK not initialized";
    private int code;
    private String msg;

    public ErrorData(int i5, String str) {
        this.code = i5;
        this.msg = str;
    }

    public int getCode() {
        return this.code;
    }

    public String getMsg() {
        return this.msg;
    }

    public void setCode(int i5) {
        this.code = i5;
    }

    public void setMsg(String str) {
        this.msg = str;
    }
}
