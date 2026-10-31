package com.bytedance.sdk.component.lt.ycx.lt;

import android.text.TextUtils;
import java.util.Map;

/* loaded from: classes2.dex */
public class dj {

    /* renamed from: ea, reason: collision with root package name */
    private boolean f23835ea;
    private String fby;

    /* renamed from: lt, reason: collision with root package name */
    private final String f23838lt;
    private final int lud;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f23839ok;
    private final boolean sya;

    /* renamed from: ul, reason: collision with root package name */
    private String f23840ul;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final String f23841zb;

    /* renamed from: dj, reason: collision with root package name */
    private int f23834dj = -1;

    /* renamed from: jw, reason: collision with root package name */
    private int f23837jw = 0;

    /* renamed from: jc, reason: collision with root package name */
    private String f23836jc = null;

    public dj(String str, String str2, boolean z11, int i5, String str3) {
        this.ycx = str;
        this.f23841zb = str2;
        this.sya = z11;
        this.lud = i5;
        this.f23838lt = str3;
    }

    public int dj() {
        return this.f23834dj;
    }

    public boolean ea() {
        return this.f23834dj == -1;
    }

    public int fby() {
        return this.f23837jw;
    }

    public boolean jc() {
        return this.f23835ea;
    }

    public String jw() {
        return this.fby;
    }

    public String lt() {
        return this.f23838lt;
    }

    public int lud() {
        return this.lud;
    }

    public boolean ok() {
        return this.f23839ok;
    }

    public boolean sya() {
        return this.sya;
    }

    public String ul() {
        return this.f23840ul;
    }

    public String ycx() {
        return this.ycx;
    }

    public String zb() {
        return this.f23841zb;
    }

    public void sya(String str) {
        this.f23836jc = str;
        if (TextUtils.isEmpty(str)) {
            return;
        }
        if (TextUtils.isEmpty(this.fby)) {
            this.fby = String.valueOf(this.f23836jc);
            return;
        }
        this.fby += "," + this.f23836jc;
    }

    public void ycx(int i5) {
        this.f23834dj = i5;
    }

    public void zb(int i5) {
        this.f23837jw = i5;
        if (i5 == 0) {
            return;
        }
        if (TextUtils.isEmpty(this.f23840ul)) {
            this.f23840ul = String.valueOf(this.f23837jw);
            return;
        }
        this.f23840ul += "," + this.f23837jw;
    }

    public void ycx(String str) {
        this.f23840ul = str;
    }

    public void ycx(boolean z11) {
        this.f23835ea = z11;
    }

    public Runnable ycx(String str, Map<String, String> map) {
        return ycx.ycx().ycx(this, str, map);
    }

    public void zb(String str) {
        this.fby = str;
    }

    public void zb(boolean z11) {
        this.f23839ok = z11;
    }
}
