package com.bytedance.sdk.component.sya.ycx;

import a2.c;
import android.os.SystemClock;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    long f24058dj;
    long fby;

    /* renamed from: lt, reason: collision with root package name */
    long f24059lt;
    long lud;
    long sya;

    /* renamed from: ul, reason: collision with root package name */
    long f24060ul;
    long ycx = SystemClock.elapsedRealtime();

    /* renamed from: zb, reason: collision with root package name */
    long f24061zb;

    public long dj() {
        return this.ycx;
    }

    public void ea() {
        this.f24060ul = SystemClock.elapsedRealtime();
    }

    public long fby() {
        return this.f24058dj;
    }

    public long jc() {
        return this.f24060ul;
    }

    public long jw() {
        return this.lud;
    }

    public long lt() {
        return this.f24059lt;
    }

    public void lud() {
        this.f24059lt = SystemClock.elapsedRealtime();
    }

    public long ok() {
        return this.fby;
    }

    public void ry() {
        this.fby = SystemClock.elapsedRealtime();
    }

    public void sya() {
        this.lud = SystemClock.elapsedRealtime();
    }

    public void syc() {
        this.f24061zb = SystemClock.elapsedRealtime();
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("RequestHttpTime{requestBuildTs=");
        sb2.append(this.ycx);
        sb2.append(", asyncCallExecTs=");
        sb2.append(this.f24061zb);
        sb2.append(", requestStartExecTs=");
        sb2.append(this.sya);
        sb2.append(", requestConnectStartTs=");
        sb2.append(this.f24058dj);
        sb2.append(", requestConnectFinishTs=");
        sb2.append(this.lud);
        sb2.append(", reqCallServerStartTs=");
        sb2.append(this.f24060ul);
        sb2.append(", reqCallServerFinishTs=");
        return c.n(sb2, this.fby, AbstractJsonLexerKt.END_OBJ);
    }

    public long ul() {
        return this.sya;
    }

    public long xkz() {
        return this.f24061zb;
    }

    public void ycx() {
        this.sya = SystemClock.elapsedRealtime();
    }

    public void zb() {
        this.f24058dj = SystemClock.elapsedRealtime();
    }
}
