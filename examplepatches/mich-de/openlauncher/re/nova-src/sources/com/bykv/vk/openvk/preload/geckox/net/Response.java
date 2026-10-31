package com.bykv.vk.openvk.preload.geckox.net;

import java.util.Map;

/* loaded from: classes2.dex */
public class Response {
    public final String body;
    public final int code;
    public final Map<String, String> headers;
    public final String msg;

    public Response(Map<String, String> map, String str, int i5, String str2) {
        this.headers = map;
        this.body = str;
        this.code = i5;
        this.msg = str2;
    }
}
