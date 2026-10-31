package com.fyber.inneractive.sdk.network;

import java.io.FilterInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Map;

/* loaded from: classes.dex */
public class l {

    /* renamed from: a, reason: collision with root package name */
    public int f28733a;

    /* renamed from: b, reason: collision with root package name */
    public final String f28734b;

    /* renamed from: c, reason: collision with root package name */
    public InputStream f28735c;

    /* renamed from: d, reason: collision with root package name */
    public Map f28736d;

    /* renamed from: e, reason: collision with root package name */
    public String f28737e;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f28738f = new ArrayList();

    public l() {
    }

    public void a() {
        InputStream inputStream = this.f28735c;
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (Throwable unused) {
            }
        }
    }

    public l(FilterInputStream filterInputStream, int i5, String str, Map map, String str2) {
        this.f28735c = filterInputStream;
        this.f28733a = i5;
        this.f28734b = str;
        this.f28736d = map;
        this.f28737e = str2;
    }
}
