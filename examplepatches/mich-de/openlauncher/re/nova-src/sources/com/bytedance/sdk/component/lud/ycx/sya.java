package com.bytedance.sdk.component.lud.ycx;

import com.bytedance.sdk.component.lud.lt;
import com.bytedance.sdk.component.lud.ul;
import java.util.Map;

/* loaded from: classes2.dex */
public class sya<T> implements lt {

    /* renamed from: dj, reason: collision with root package name */
    private String f23965dj;
    private ul lud;
    private T sya;
    Map<String, String> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f23966zb;

    public sya(int i5, T t6, String str) {
        this.f23966zb = i5;
        this.sya = t6;
        this.f23965dj = str;
    }

    @Override // com.bytedance.sdk.component.lud.lt
    public String sya() {
        return this.f23965dj;
    }

    public void ycx(ul ulVar) {
        this.lud = ulVar;
    }

    @Override // com.bytedance.sdk.component.lud.lt
    public T zb() {
        return this.sya;
    }

    @Override // com.bytedance.sdk.component.lud.lt
    public int ycx() {
        return this.f23966zb;
    }

    public sya(int i5, T t6, String str, Map<String, String> map) {
        this(i5, t6, str);
        this.ycx = map;
    }
}
