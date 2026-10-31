package com.bytedance.sdk.component.ul;

import com.bytedance.sdk.component.zb.ycx.jc;
import java.io.File;
import java.util.Map;

/* loaded from: classes2.dex */
public class zb {

    /* renamed from: dj, reason: collision with root package name */
    final String f24075dj;
    private File fby = null;

    /* renamed from: jc, reason: collision with root package name */
    private byte[] f24076jc = null;

    /* renamed from: jw, reason: collision with root package name */
    private final boolean f24077jw;

    /* renamed from: lt, reason: collision with root package name */
    final long f24078lt;
    final long lud;
    final Map<String, String> sya;

    /* renamed from: ul, reason: collision with root package name */
    jc f24079ul;
    final int ycx;

    /* renamed from: zb, reason: collision with root package name */
    final String f24080zb;

    public zb(boolean z11, int i5, String str, Map<String, String> map, String str2, long j11, long j12) {
        this.f24077jw = z11;
        this.ycx = i5;
        this.f24080zb = str;
        this.sya = map;
        this.f24075dj = str2;
        this.lud = j11;
        this.f24078lt = j12;
    }

    public String dj() {
        return this.f24075dj;
    }

    public boolean lt() {
        return this.f24077jw;
    }

    public File lud() {
        return this.fby;
    }

    public Map<String, String> sya() {
        return this.sya;
    }

    public jc ul() {
        return this.f24079ul;
    }

    public int ycx() {
        return this.ycx;
    }

    public String zb() {
        return this.f24080zb;
    }

    public void ycx(File file) {
        this.fby = file;
    }

    public void ycx(byte[] bArr) {
        this.f24076jc = bArr;
    }

    public void ycx(jc jcVar) {
        this.f24079ul = jcVar;
    }
}
