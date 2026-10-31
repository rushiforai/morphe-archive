package com.bytedance.sdk.component.lud.zb.sya;

import com.bytedance.sdk.component.lud.ea;
import java.util.Map;

/* loaded from: classes2.dex */
public class dj<T> implements ea {

    /* renamed from: dj, reason: collision with root package name */
    private T f23969dj;

    /* renamed from: ea, reason: collision with root package name */
    private int f23970ea;
    private boolean fby;

    /* renamed from: jc, reason: collision with root package name */
    private com.bytedance.sdk.component.lud.ul f23971jc;

    /* renamed from: jw, reason: collision with root package name */
    private boolean f23972jw;

    /* renamed from: lt, reason: collision with root package name */
    private int f23973lt;
    private int lud;
    private T sya;

    /* renamed from: ul, reason: collision with root package name */
    private Map<String, String> f23974ul;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f23975zb;

    @Override // com.bytedance.sdk.component.lud.ea
    public Map<String, String> dj() {
        return this.f23974ul;
    }

    @Override // com.bytedance.sdk.component.lud.ea
    public boolean lt() {
        return this.f23972jw;
    }

    @Override // com.bytedance.sdk.component.lud.ea
    public boolean lud() {
        return this.fby;
    }

    @Override // com.bytedance.sdk.component.lud.ea
    public T sya() {
        return this.f23969dj;
    }

    @Override // com.bytedance.sdk.component.lud.ea
    public int ul() {
        return this.f23970ea;
    }

    public dj ycx(sya syaVar, T t6) {
        this.sya = t6;
        this.ycx = syaVar.fby();
        this.f23975zb = syaVar.ycx();
        this.lud = syaVar.zb();
        this.f23973lt = syaVar.sya();
        this.f23972jw = syaVar.ok();
        this.f23971jc = syaVar.xkz();
        this.f23970ea = syaVar.syc();
        return this;
    }

    @Override // com.bytedance.sdk.component.lud.ea
    public T zb() {
        return this.sya;
    }

    public dj ycx(sya syaVar, T t6, Map<String, String> map, boolean z11) {
        this.f23974ul = map;
        this.fby = z11;
        return ycx(syaVar, t6);
    }

    @Override // com.bytedance.sdk.component.lud.ea
    public String ycx() {
        return this.f23975zb;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bytedance.sdk.component.lud.ea
    public void ycx(Object obj) {
        this.f23969dj = this.sya;
        this.sya = obj;
    }
}
