package com.bytedance.sdk.openadsdk.core.model;

import com.bytedance.sdk.openadsdk.utils.dwi;

/* loaded from: classes2.dex */
public class aeu {

    /* renamed from: ea, reason: collision with root package name */
    private int f25588ea;
    private long fby;

    /* renamed from: jc, reason: collision with root package name */
    private long f25589jc;

    /* renamed from: jw, reason: collision with root package name */
    private long f25590jw;

    /* renamed from: lt, reason: collision with root package name */
    private long f25591lt;
    private long lud;

    /* renamed from: ok, reason: collision with root package name */
    private long f25592ok;

    /* renamed from: ry, reason: collision with root package name */
    private int f25593ry;

    /* renamed from: ul, reason: collision with root package name */
    private long f25594ul;
    public boolean ycx;

    /* renamed from: zb, reason: collision with root package name */
    public long f25595zb;
    private dwi sya = dwi.sya();

    /* renamed from: dj, reason: collision with root package name */
    private dwi f25587dj = dwi.sya();

    public long dj() {
        return this.f25594ul;
    }

    public int fby() {
        return this.f25588ea;
    }

    public synchronized int jc() {
        return this.f25593ry;
    }

    public long jw() {
        return this.f25592ok;
    }

    public long lt() {
        return this.f25590jw;
    }

    public long lud() {
        return this.fby;
    }

    public long sya() {
        return this.f25591lt;
    }

    public long ul() {
        return this.f25589jc;
    }

    public void ycx(dwi dwiVar, dwi dwiVar2, int i5, dwi dwiVar3) {
        this.lud = dwiVar.ycx(this.sya);
        this.f25591lt = dwiVar2.ycx(dwiVar);
        this.f25594ul = i5;
        this.fby = dwiVar3.ycx(dwiVar2);
    }

    public void zb(dwi dwiVar) {
        this.f25587dj = dwiVar;
        this.f25590jw = dwiVar.ycx(this.sya);
    }

    public long zb() {
        return this.lud;
    }

    public void zb(long j11) {
        this.f25592ok = j11;
    }

    public void ycx(dwi dwiVar) {
        this.sya = dwiVar;
    }

    public synchronized void zb(int i5) {
        this.f25593ry = i5;
    }

    public dwi ycx() {
        return this.sya;
    }

    public void ycx(long j11) {
        this.f25589jc = j11;
    }

    public void ycx(int i5) {
        this.f25588ea = i5;
    }
}
